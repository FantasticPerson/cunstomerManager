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
          <form id="dataform" name="dataform" class="form-horizontal" role="form" enctype="multipart/form-data" method="post" action="{{.baseurl}}/im/add.do">
            <div class="panel panel-default">
              <div class="panel-heading">IM用户添加</div>
              <div class="panel-body">
                  <div class="form-group">
                <span style="color:red">{{.error}}<span>
              </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">手机号</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="UserUsername" name="UserUsername" value="{{.data.UserUsername}}">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">真实姓名</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="UserRealname" name="UserRealname" value="{{.data.UserRealname}}">
                  </div>
                </div>
              </div>
            </div>
               <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-floppy-disk"></i> 保 存</button>
              </div>
            </div>
          </form>
        </div>
    </div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
</html>
