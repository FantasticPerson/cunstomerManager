<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/zTree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/jquery.form.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/tipwindown/tip.js"></script>
	<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/css/dialog.css">
	<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/themes/default/style.css">
  </head>
  <body>
	<div class="contentBox">
		<form id="dataform" name="dataform" enctype="multipart/form-data" method="post" action="">
			<input type="hidden" id="pid" name="pid" value="{{.pid}}">
			<fieldset>
				<legend class="legend">版本信息</legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<tr>
						<td width="40%" height="35" align="right">版本名称：</td>
						<td width="60%">
							<input type="text" class="form-control" id="vname" name="VersionName" value="{{.VersionName}}" readonly>
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="40%" height="35" align="right">选择文件：</td>
						<td width="60%">
							<input type="file" class="form-control" id="ExcelFile" name="ExcelFile" onchange="fileSelected();">
						</td>
						<td></td>
					</tr>
				</table>
				<div class="form-group">
	                  <label for="inputEmail3" class="col-md-2 control-label"></label>
	                  <div class="col-md-8">
	                      <p><div id="fileName"></div></p>
						  <p><div id="fileSize"></div></p>
	                      <p><div id="fileType"></div></p>
	                      <p><div id="progressNumber"></div></p>	
	                  </div>
	                </div>
			</fieldset>
		</form>
	</div>
	<div class="buttonBar">
		<input type="submit" onclick="uploadClose();"
			value="关闭" class="cancelBtn" /><input type="submit"
			onclick="uploadFile();" value="导入" class="confirmBtn" />
	</div>
  </body>  
  <script>
      function fileSelected() {
        var file = document.getElementById('ExcelFile').files[0];
		document.getElementById('fileName').innerHTML = '';
        document.getElementById('fileSize').innerHTML = '';
	document.getElementById('fileType').innerHTML = '';
        document.getElementById('progressNumber').innerHTML = '';
        if (file) {
          var fileSize = 0;
          if (file.size > 1024 * 1024)
            fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
          else
            fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';

          document.getElementById('fileName').innerHTML = '文件名称: ' + file.name;
          document.getElementById('fileSize').innerHTML = '文件大小: ' + fileSize;
		  var strRegex = "(.xls|.xlsx)$";
		  var re=new RegExp(strRegex);
		  if(re.test(file.name.toLowerCase())){	    
			$('#btnUpload').removeAttr('disabled');
		    return true;
			
		  }
		  else{
		   alert("只能选择“.xlsx”后缀的文件！");
		   $('#btnUpload').attr('disabled', 'disabled');
		   document.getElementById('ExcelFile').files[0] = null;
		   return false;
		  }
		  
          //document.getElementById('fileType').innerHTML = '文件类型: ' + file.type;
        }
      }

	 function log(s){
		console && console.log(s);
	 }
	 
     function uploadFile() {
		if (!document.getElementById('ExcelFile').files[0]){
			alert('请选择Excel文件！');
			return false;
		} else {
			var fd = new FormData();
			fd.append("ExcelFile", document.getElementById('ExcelFile').files[0]);
			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener("progress", uploadProgress, false);
			xhr.addEventListener("load", uploadComplete, false);
			xhr.addEventListener("error", uploadFailed, false);
			xhr.addEventListener("abort", uploadCanceled, false);
			xhr.open("POST", "{{.baseurl}}/depart/import_excel.do");
			xhr.send(fd);
		}
        
      }

        function uploadProgress(evt) {
       if (evt.lengthComputable) {
		  console.log(evt);
          var percentComplete = Math.round(evt.loaded * 100 / evt.total);
          document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';
		  if(percentComplete == 100){
			alert('导入成功，请等待上传');
		  }
        }
        else {
          document.getElementById('progressNumber').innerHTML = 'unable to compute';
        }
      }

      function uploadComplete(evt) {
        //This event is raised when the server send back a response 
        document.getElementById('fileType').innerHTML = '导入进度: ' + evt.target.responseText;
        alert(evt.target.responseText);
      }

      function uploadFailed(evt) {
        alert("There was an error attempting to upload the file.");
      }

      function uploadCanceled(evt) {
        alert("The upload has been canceled by the user or the browser dropped the connection.");
      }
	  
	  function uploadClose(){
			parent.navTab.reload('{{.baseurl}}/depart/show.do',null,"GET");
			parent.dialog.close();
	  }

  </script>
</html>
