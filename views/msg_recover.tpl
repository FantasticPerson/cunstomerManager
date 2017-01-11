<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap.min.css">
  	<link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/lib/font-awesome/css/font-awesome.min.css">
  	<link rel="stylesheet" href="{{.baseurl}}/static/css/app.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
  </head>
  <body>
    {{template "header.tpl" .}}
    <div class="container bs-docs-container">
        <div role="main">
          <div class="btn-group"><a href="{{.baseurl}}/im/main.do" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-circle-arrow-left"></i> 返回</a></div>
          <!-- Getting started ================================================== -->
          <form id="dataform" name="dataform" class="form-horizontal" role="form" enctype="multipart/form-data" method="post" action="{{.baseurl}}/mongo/update.do">
            <div class="panel panel-default">
              <div class="panel-heading">数据恢复</div>
              <div class="panel-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">原ID</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="oldID" name="oldID">
                  </div>
                </br></br>
                  <label for="inputEmail3" class="col-sm-2 control-label">现ID</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="newID" name="newID" value="{{.newID}}" readonly>
                  </div>
                </div>
                <!--
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">选择文件</label>
                  <div class="col-sm-10">
                    <input type="file" class="form-control" id="ExcelFile" name="ExcelFile" onchange="fileSelected();">
                  </div>

                  <div id="fileName"></div>
                  <div id="fileSize"></div>
                  <div id="fileType"></div>
                  <div id="progressNumber"></div>
                </div>
              -->
              <div class="col-sm-offset-2 col-sm-10">
                 <button onclick="updateMsg()" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-floppy-disk"></i> 更 新</button>
              </div>
              </div>
            </div>      
  <!--
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button onclick="uploadFile()" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-floppy-disk"></i> 导 入</button>
              </div>
            </div>
          -->
            <input type="hidden" id="vid" name="VersionId" value="{{.VersionId}}">
            <input type="hidden" id="cid" name="CustomerId" value="{{.CustomerId}}">
            <br/><br/><br/>
          </form>
        </div>
    </div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
  <script>
      function fileSelected() {
        var file = document.getElementById('ExcelFile').files[0];
        if (file) {
          var fileSize = 0;
          if (file.size > 1024 * 1024)
            fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
          else
            fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';

          document.getElementById('fileName').innerHTML = '文件名称: ' + file.name;
          document.getElementById('fileSize').innerHTML = '文件大小: ' + fileSize;
          //document.getElementById('fileType').innerHTML = '文件类型: ' + file.type;
        }
      }

      function uploadFile() {
        var fd = new FormData();
        fd.append("VersionId", $('#vid').val());
        fd.append("CustomerId", $('#cid').val());
        fd.append("ExcelFile", document.getElementById('ExcelFile').files[0]);
        var xhr = new XMLHttpRequest();
        xhr.upload.addEventListener("progress", uploadProgress, false);
        xhr.addEventListener("load", uploadComplete, false);
        xhr.addEventListener("error", uploadFailed, false);
        xhr.addEventListener("abort", uploadCanceled, false);
        xhr.open("POST", "{{.baseurl}}/contacts/saveXLSX.do");
        xhr.send(fd);
      }

      function uploadProgress(evt) {
        if (evt.lengthComputable) {
          var percentComplete = Math.round(evt.loaded * 100 / evt.total);
          document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';
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
      function updateMsg(){
      if(confirm("请慎重，这一步可能会引起数据丢失，确定要更新么？")){
        document.getElementById('dataform').submit();
      }
      }
  </script>
</html>
