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
  </head>
  <body>
    <header class="navbar navbar-inverse navbar-fixed-top bs-docs-nav" role="banner">
      <div class="container">
        <div class="navbar-header">
          <a href="{{.baseurl}}" class="navbar-brand" id="logo"><i class="fa fa-cloud"></i> TrueIM Cloud</a>
        </div>
        <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
          <ul class="nav navbar-nav">
            <li>
                <a class="active" href="{{.baseurl}}/superadmin/main.do"><i class="fa fa-bar-chart-o"></i>统计信息</a>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li>
              <a href="{{.baseurl}}/sign/checkout.do"><i class="fa fa-power-off"></i> 退出</a>
            </li>
          </ul>
        </nav>
      </div>
    </header>
    <div class="container bs-docs-container">
      <div class="btn-group">
        <div class="btn-group">
          <a href="{{.baseurl}}/superadmin/main.do" type="button" class="btn btn-primary"><i class="fa fa-chevron-left"></i> 返回</a>
        </div>
      </div>
      <form id="dataform" name="dataform" class="form-horizontal" role="form" enctype="multipart/form-data" method="post" action="{{.baseurl}}/superadmin/saveVersion.do">
        <div class="panel panel-default">
          <div class="panel-heading">版本信息</div>
          <div class="panel-body">
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">版本名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="vname" name="VersionName" value="{{.data.VersionName}}">
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">创建时间</label>
              <div class="col-sm-10">
                <input type="datetime" class="form-control" id="vctime" value="{{.data.VersionCreatetime}}" readonly>
              </div>
            </div>
             <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">版本类别</label>
              <div class="col-sm-10">
                    <select class="form-control" id="VersionType" name="VersionType">
                      <option value="4">excel导入</option>
                       <option value="5">excel导入(无通讯)</option>
                      <option value="1">第三方导入</option>
                    </select>
                  </div>
            </div>
                <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">管理员用户名</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="uname" value="{{.data.AdminUsername}}">
              </div>
            </div>
           <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">管理员密码</label>
              <div class="col-sm-10">
                <input type="password" class="form-control" name="pwd" value="{{.data.AdminPassword}}">
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">第三方接口URL</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="url" value="{{.data.ThirdUrl}}">
              </div>
            </div>
                  <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">用户前缀</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="prefix" value="{{.data.PrefixUser}}">
              </div>
            </div>
          </div>
        </div>      

        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-floppy-disk"></i> 保 存</button>
          </div>
        </div>
        <input type="hidden" id="vid" name="VersionId" value="{{.data.VersionId}}">
        <input type="hidden" name="oAdminPassword" value="{{.data.AdminPassword}}">
      </form>
    </div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="{{.baseurl}}/static/js/common.js"></script>
  <script>
    if("{{.data.VersionUpdatetime}}"==""){
      var date=new Date();
      $('#vctime').val(date.pattern("yyyy-MM-dd HH:mm:ss"));
    }
   $('#VersionType').val({{.data.VersionType}});
  </script>
</html>
