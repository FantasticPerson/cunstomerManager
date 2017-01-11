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
      <div class="btn-group">
        客户名：{{.cname}}
        <div class="btn-group">
          <a href="{{.baseurl}}/superadmin/editVersion.do" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-list"></i>新增版本</a>
        </div>
      </div>
      
       <ul class="pager">
            <li class="previous"><a onclick="gopage(false);" href="javascript:;">&larr; 上一页</a></li>
            <li class="next"><a onclick="gopage(true);" href="javascript:;">下一页 &rarr;</a></li>
          </ul>
          <div id="historybox">
            <table class="table table-striped table-hover table-bordered">
              <thead>
                <tr>
                  <th style="text-align:center;background-color:#ECF0F1;" width="120">版本名称</th>
                  <th style="text-align:center;background-color:#ECF0F1;" width="120">创建时间</th>
                  <th style="text-align:center;background-color:#ECF0F1;" width="120">更新次数</th>
                  <th style="text-align:center;background-color:#ECF0F1;" width="200">操作</th>
                </tr>
              </thead>
              <tbody>
                 {{range .list}}
                    <tr>
                      <td style="text-align:center;" >{{.VersionName}}</td>
                      <td style="text-align:center;" >{{.VersionCreatetime}}</td>
                      <td style="text-align:center;" >{{.VersionUptimes}}</td>
                      <td style="text-align:center;" >
                      <p><a onclick="detail({{.VersionId}})" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="del({{.VersionId}})" href="javascript:;"><i class="glyphicon glyphicon-remove-circle"></i> 删除</a></p>
                      </td>
                    </tr>
                {{end}}
              </tbody>
            </table>
          </div>
          <ul class="pager">
            <li class="previous"><a onclick="gopage(false);" href="javascript:;">&larr; 上一页</a></li>
            <li class="next"><a onclick="gopage(true);" href="javascript:;">下一页 &rarr;</a></li>
          </ul>
    </div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
  <script>
    var page="{{.page}}";
    function gopage(t){
      if(t==true){
        page++;
      }else{
        page--;
      }
      if(page<=1) page=1;
      location.href='{{.baseurl}}/superadmin/main.do?page='+page;
    }
    function detail(cid){
      location.href='{{.baseurl}}/superadmin/editVersion.do?vid='+cid;
    }
    function del(cid){
      if(confirm("确认删除该版本信息？")){
        location.href='{{.baseurl}}/superadmin/del.do?vid='+cid;
      }
    }
  </script>
</html>