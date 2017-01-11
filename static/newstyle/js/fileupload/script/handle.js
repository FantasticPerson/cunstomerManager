Jsr.debug = true;

/** 检测Flash版本* */
function hasFlashVersion(rv) {
	var pv = flashVersion(), v = rv.split(".");
	v[0] = parseInt(v[0], 10);
	v[1] = parseInt(v[1], 10);
	v[2] = parseInt(v[2], 10);
	return (pv[0] > v[0] || (pv[0] == v[0] && pv[1] > v[1]) || (pv[0] == v[0] && pv[1] == v[1] && pv[2] >= v[2])) ? true
			: false;
}

function flashVersion() {
	var version = [ 0, 0, 0 ], win = window, nav = navigator;

	if (typeof nav.plugins != "undefined" && typeof nav.plugins["Shockwave Flash"] == "object") {
		d = nav.plugins["Shockwave Flash"].description;
		if (d) {
			d = d.replace(/^.*\s+(\S+\s+\S+$)/, "$1");
			version[0] = parseInt(d.replace(/^(.*)\..*$/, "$1"), 10);
			version[1] = parseInt(d.replace(/^.*\.(.*)\s.*$/, "$1"), 10);
			version[2] = /r/.test(d) ? parseInt(d.replace(/^.*r(.*)$/, "$1"), 10) : 0;
		}
	} else if (typeof win.ActiveXObject != "undefined") {
		var a = null, fp6Crash = false;
		try {
			a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
		} catch (e) {
			try {
				a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
				version = [ 6, 0, 21 ];
				a.AllowScriptAccess = "always"; // Introduced in fp6.0.47
			} catch (e) {
				if (version[0] == 6) {
					fp6Crash = true;
				}
			}
			if (!fp6Crash) {
				try {
					a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
				} catch (e) {
				}
			}
		}
		if (!fp6Crash && a) { // a will return null when ActiveX is disabled
			try {
				d = a.GetVariable("$version"); // Will crash fp6.0.21/23/29
				if (d) {
					d = d.split(" ")[1].split(",");
					version = [ parseInt(d[0], 10), parseInt(d[1], 10), parseInt(d[2], 10) ];
				}
			} catch (e) {
			}
		}
	}
	return version;
}
if (!hasFlashVersion('10.0.0')) {
	alert("您使用的Flash版本较低，可能无法正常上传，请先升级！");
}
/** 检测Flash版本* */

var swfu_totalSize = 0; // 上传文件总大小
var swfu_totalComplete = 0; // 总完成数
var swfu_fileCount = 1; // 当前文件索引
var swfu_uploadDig; // 上传对话框
var swfu_currentFile; // 当前文件
var swfu_ignoreBtn; // 跳过按钮
var swfu_stopBtn; // 停止按钮
var swfu_msg = ""; // 返回信息
var swfu_fileArray = new Array(); // 加入队列成功的文件
var swfu_skiperror = true; // 是否跳过有问题的文件继续提交
var swfu_overfreightmsg = false;// 超大提示是否出现过
var swfu_nameerror = false;
var swfu_stop = false;
var swfu_ignoreArray = new Array();
var swfu_uploadparam = ""; // 上传时自定义参数
var swfu_btn = '../js/fileupload/images/btn.gif'; // 按钮路径

var swfu_alertDig;
var swfu_finishBtn;
var swfu_cancelBtn;

var doOverEvent = function() {
};

function resetQueue() {
	var queue = swfu.getStats().files_queued;
	if (queue > 0) {
		for ( var i = 0; i < queue; i++)
			swfu.cancelUpload(null, false);
	}
}

function fileQueued(file) {
	if (file.name.indexOf('&') > -1) {
		alert('文件' + file.name + '名称不合法，请修改后再上传！');
		swfu_nameerror = true;
		return;
	}
	swfu_fileArray.push(file.name);
	swfu_totalSize += file.size;
}

function fileDialogStart() {
	swfu_fileArray = null;
	swfu_fileArray = new Array();
	swfu_totalSize = 0;
	swfu_totalComplete = 0;
	swfu_overfreightmsg = false;
	swfu_nameerror = false;
	swfu_stop = false;
	swfu_msg = '';
	resetQueue();
}

function fileDialogComplete(numFilesSelected, numFilesQueued) {
	if (swfu_nameerror)
		return;
	if (numFilesQueued > 0) {
		$('#filearea').empty();
		var fileArea = '<table class="progress" cellpadding="0" cellspacing="0" align="center"><tr><td>上传进度 (<span id="currentIndex">1</span>/'
				+ numFilesQueued
				+ ')</td><td id="percentTotal" class="percent"></td></tr><tr><td id="progressboxTotal" class="progressbox" colspan="2"><div id="progressTotal" class="progressbar"></div></td></tr>';
		fileArea += '<tr><td>&nbsp;</td></tr><tr><td id="fileCurrent"></td><td id="percentCurrent" class="percent"></td></tr><tr><td id="progressboxCurrent" class="progressbox" colspan="2"><div id="progressCurrent" class="progressbar"></div></td></tr>';
		fileArea += '<tr><td colspan="2" height="50" align="center" valign="bottom"><div style="width:205px;"><button id="swfu_ignoreBtn"></button><button id="swfu_stopBtn"></button></div></td></tr></table>';
		$('#filearea').append(fileArea);

		swfu_fileCount = 1;

		$('#attach').val(swfu_fileArray.join(','));// 表单文件名控件赋值

		swfu_uploadDig = new UI.Dialog({
			caption : "文件上传中...",
			width : 350,
			height : 200
		});
		swfu_uploadDig.setPanel($('#filearea')[0]);
		swfu_uploadDig.onClose(function() {
			cancelQueue(swfu);
		});

		swfu_ignoreBtn = new UI.Button({
			id : "swfu_ignoreBtn",
			caption : "跳过当前文件",
			width : 100
		});
		swfu_ignoreBtn.bind(function() {
			if (swfu_totalSize > 1) {
				swfu.cancelUpload(swfu_currentFile.id, false);
				swfu_totalSize--;
				swfu_ignoreArray.push(swfu_currentFile.name);
			}
			swfu_msg += '<tr><td class="upload_ico1">文件 ' + swfu_currentFile.name
					+ ' 已被跳过.</td></tr>';
		});
		swfu_stopBtn = new UI.Button({
			id : "swfu_stopBtn",
			caption : "终止上传"
		});
		swfu_stopBtn.bind(function() {
			swfu_stop = true;
			swfu_uploadDig.hide();
			cancelQueue(swfu);
			$('#attach').val('');
		});
	}
}

function uploadProgress(file, complete, total) {
	swfu_currentFile = file;

	var percentTotal = Math.ceil((swfu_totalComplete / swfu_totalSize) * 100);
	$('#progressTotal').width(percentTotal + '%');
	$('#percentTotal').html(percentTotal + '%');

	var percent = Math.ceil((complete / total) * 100);
	$('#fileCurrent').html(file.name);
	$('#progressCurrent').width(percent + '%');
	$('#percentCurrent').html(percent + '%');
}

function fileQueueError(file, errorCode, message) {
	switch (errorCode) {
	case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
		alert('选择文件太多，一次最多可以上传' + message + '个文件.');
		$("#attach").val('');
		break;
	case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
		if (!swfu_overfreightmsg) {
			swfu_overfreightmsg = true;
			alert('只允许上传大小在 ' + swfu_fileSizeLimit + ' 以内的文件.');
			$("#attach").val('');
		}
		break;
	case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
		alert(file.name + ' 文件大小为0，将被跳过.');
		break;
	case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
		alert(file.name + ' 类型不正确，只允许上传 ' + swfu_fileTypes + ' 类型的文件,该文件将被跳过.');
		break;
	default:
		alert(message);
		break;
	}
	return;
}

function cancelQueue(instance) {
	instance.stopUpload();
	var stats;

	do {
		stats = instance.getStats();
		instance.cancelUpload();
	} while (stats.files_queued !== 0);
}

function uploadComplete(file) {
	if (swfu_stop) {
		var tmp_div = document.getElementById("div_tip");
		if( tmp_div )
			document.body.removeChild(tmp_div);
		if(typeof $("#editbutton").attr("disabled") != "undefined"){
			if($("#editbutton").attr("disabled") != "undefined"){
				$("#editbutton").removeAttr("disabled");
			}
		}
		cancelQueue(swfu);
		return;
	}
	swfu_totalComplete += file.size;
	if (this.getStats().files_queued === 0) {
		$('#progressTotal').width('100%');
		$('#percentTotal').html('100%');
		$('#currentIndex').html(swfu_fileCount++);
		swfu_ignoreBtn.disable(true);
		swfu_stopBtn.disable(true);
		swfu_msg = $.trim(swfu_msg);
		$('#__defineGetter__-tag-4').css("z-index", "0");
		setTimeout('swfu_uploadDig.hide();', 600);
		if (swfu_msg.length > 0) {
			if (swfu_ignoreArray.length > 0) {
				var tempArray = new Array();
				for ( var i = 0; i < swfu_fileArray.length; i++) {
					var ignoreItem = false;
					var item = swfu_fileArray[i];
					for ( var j = 0; j < swfu_ignoreArray.length; j++) {
						if (item == swfu_ignoreArray[j]) {
							ignoreItem = true;
							break;
						}
					}
					if (!ignoreItem)
						tempArray.push(item);
				}
				swfu_fileArray = tempArray;
				$('#attach').val(swfu_fileArray.join(','));
				swfu_ignoreArray = null;
				swfu_ignoreArray = new Array();
			}
			$('#swfu_errormsg').html(swfu_msg);
			$('#swfu_errormsg tr:odd').css('background-color', '#F5F9FF');
			swfu_alertDig.setPanel($('#swfu_msg')[0]);
			setTimeout('swfu_alertDig.show();', 600);
			reloadSWFUpload();
		} else
			goOnSubmit();
		return;
	} else {
		this.startUpload();
		$('#currentIndex').html(swfu_fileCount++);
	}
}

function goOnSubmit() {
	if (swfu_skiperror || (!swfu_skiperror && swfu_msg.trim().length == 0))
		$('form[name=' + swfu_form + ']').submit();
	doOverEvent();// 上传结束事件
}

function uploadError(file, errorCode, message) {
	swfu_msg += '<tr><td class="upload_ico2">文件 ' + file.name + ' 上传失败.</td></tr>';
	swfu_ignoreArray.push(file.name);
}

function doSubmitEvent(e) {
//	e = e || window.event;
//	if (e.stopPropagation) {
//		e.stopPropagation();
//	}
//	e.cancelBubble = true;
	if (validateForm() && swfu.getStats().files_queued > 0) {
		if(navigator.userAgent.indexOf("MSIE") > 0){ //IE下
			$('form[name=' + swfu_form + ']').attr('enctype', 'multipart/form-data');
		}
		swfu_uploadDig.show();
		swfu.startUpload();
	} else {
		return false;
	}
}

var swfu;
$(function() {
	swfu = new SWFUpload({
		upload_url : swfu_uploadUrl,
		flash_url : swfu_flashUrl,

		file_types : swfu_fileTypes,
		file_size_limit : swfu_fileSizeLimit,
		file_upload_limit : swfu_fileUploadLimit,

		button_placeholder_id : 'spanSWFUploadButton',
		button_width : 72,
		button_height : 20,
		button_text : '<span class="theFont">浏 览</span>',
		button_image_url : swfu_btn,
		button_text_style : '.theFont{color:#3B5165;text-align:center;width:72px;height:20px;}',
		button_cursor : SWFUpload.CURSOR.HAND,
		button_window_mode : SWFUpload.WINDOW_MODE.TRANSPARENT,

		file_dialog_start_handler : fileDialogStart,
		file_dialog_complete_handler : fileDialogComplete,
		file_queued_handler : fileQueued,
		upload_start_handler : uploadStart,
		upload_complete_handler : uploadComplete,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		file_queue_error_handler : fileQueueError
	});
	
	swfu_alertDig = new UI.Dialog({
		caption : "文件上传提示",
		width : 350
	});
	swfu_alertDig.onClose(function() {
		goOnSubmit();
	});

	swfu_finishBtn = new UI.Button({
		id : "swfu_finishBtn",
		caption : "确 定"
	});
	swfu_finishBtn.bind(function() {
		swfu_alertDig.hide();
	});
});

function uploadStart(file) {
	var jSessionId = $.cookie('JSESSIONID');
	if(jSessionId){
		jSessionId = jSessionId.replace(/^(0000)(.*?)(:-1)$/, '$2'); /* 处理websphere */
	}
	var url = swfu_uploadUrl + "?filename=" + encodeURI(file.name) + "&" + swfu_uploadparam;
	url += '&JSESSIONID='+jSessionId;
	swfu.setUploadURL(url);
}

function reloadSWFUpload() {
	var settings = {
		upload_url : swfu_uploadUrl,
		flash_url : swfu_flashUrl,

		file_types : swfu_fileTypes,
		file_size_limit : swfu_fileSizeLimit,
		file_upload_limit : swfu_fileUploadLimit,

		button_placeholder_id : 'spanSWFUploadButton',
		button_width : 72,
		button_height : 20,
		button_text : '<span class="theFont">浏 览</span>',
		button_image_url : swfu_btn,
		button_text_style : '.theFont{color:#3B5165;text-align:center;width:72px;height:20px;}',
		button_cursor : SWFUpload.CURSOR.HAND,
		button_window_mode : SWFUpload.WINDOW_MODE.TRANSPARENT,

		file_dialog_start_handler : fileDialogStart,
		file_dialog_complete_handler : fileDialogComplete,
		file_queued_handler : fileQueued,
		upload_start_handler : uploadStart,
		upload_complete_handler : uploadComplete,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler : uploadSuccess,
		file_queue_error_handler : fileQueueError
	};

	var movie = swfu.getMovieElement();

	var placeHolder = document.createElement("span");
	placeHolder.id = "spanSWFUploadButton";
	movie.parentNode.replaceChild(placeHolder, movie);

	swfu.destroy();

	swfu = new SWFUpload(settings);
}