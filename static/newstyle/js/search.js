$(function(){
	// 光标自动定位到输入框右边
	$('#query').focus();
	var text = $('#query').val();
	$('#query').val("");
	$('#query').val(text);
	
	// 设置分类
	var columns = '';
	$('#column option').each(function(){
		if(columns !== ''){
			columns += ',' + $(this).val();
		}else{
			columns = $(this).val();
		}
	});
	$('#columns').val(columns);
	
	// 如果是点击提交按钮或者输入回车符
	$('#query').keypress(function(e){
		if(e.which==13){
			$("#searchForm").submit();
		}
	});

	$('.Fix li a').click(function(){
		$('.tcc').hide();
	});
	$(document).click(function(e){
		$('.tcc').hide();
	});
	$('.pl').click(function(e){
		e.stopPropagation();
		$('.tcc').toggle();
		
	});
	
	//在结果中查找
	$('#showsearch2').click(function(){
		$('#searchForm2').toggle();
		if($('#searchForm2').css('display') == 'none'){
			$('#query').focus();
		}else{
			$('#q2').focus();
		}
	});
	
	$("#search2").click(function(){
		var query = $('#query').val();
		if($('#q_all').val() != ''){
			query += "@" + $('#q_all').val();
		}
		$("#query").val(query);
		$("#searchForm").submit();
	});
	
	// 检索文件类型
	 $(".gjss_top2 ul li").each(function(){
		 if($(this).hasClass('chthis')){
			 $('#fileType').val($(this).attr('filetype'));
		 }
	 });
	
    $(".gjss_top2 ul li").click(function () {
        $("li[class='chthis']").removeAttr("class");
        $(this).addClass('chthis'); 
        $('#fileType').val($(this).attr('filetype'));
        $("#searchForm").submit();
    });
    
    // 检索排序
    $("ul.paixu li").click(function(){
    	if(!$(this).hasClass('hover')){
    		$("ul.paixu li").removeClass('hover');
    		$(this).addClass('hover');
    		$('#order').val($(this).attr('order'));
    	}
    	$("#searchForm").submit();
    });

});

function clearSet(){
	//使用初始值
	// $('#order').val('') ;
	// $('#timeScope').val('') ;
	$('#searchForm').submit();
}

// 选择系统
function chooseSys(value, obj){
	$('#siteId').val('');
	$('#siteName').val('');
	$('#sysId').val(value);
	$('#sysName').val($(obj).text());
	$('#searchForm').submit();
}

// 选择网站
function chooseSite(value, obj){
	$('#siteId').val(value);
	$('#siteName').val($(obj).text());
	$('#searchForm').submit();
}

// 选择栏目
function setColumn(value){
	$('#column').val(value);
	$('#searchForm').submit();
}

// 设置搜索资源类型
function chooseFileType(value){
	$(":radio[value='+ value +']").prop("checked", true);
	$("#searchForm").submit();
}

// 按时间搜索
function setTimeScope(value){
	$('#timeScope').val(value);
	$('#searchForm').submit();
}

// 设置搜索范围
function setObj(value){
	$('#obj').val(value) ;
	$('#searchForm').submit();
}

//将输入拼接后提交
function search(){
	var query = $('#query').val();
	if($('#q_all').val() != ''){
		query += "@" + $('#q_all').val();
	}
	if($("#q_not").val() != ''){
		if($('#q_all').val() == ''){
			query += "@";
		}
		query += "@" + $("#q_not").val();
	}
	
	$('#query').val(query);
	$('#searchForm').submit();
}