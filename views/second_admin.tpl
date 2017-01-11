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
        <div class="btn-group">
          <a href="{{.baseurl}}/superadmin/editAdmin.do" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-list"></i>新增管理员</a>
        </div>
      </div>
      <ul id="tree" class="nav bs-sidenav ztree"></ul>
       <ul class="pager">
            <li class="previous"><a onclick="gopage(false);" href="javascript:;">&larr; 上一页</a></li>
            <li class="next"><a onclick="gopage(true);" href="javascript:;">下一页 &rarr;</a></li>
          </ul>
          <div id="historybox">
            <table class="table table-striped table-hover table-bordered">
              <thead>
                <tr>
                  <th style="text-align:center;background-color:#ECF0F1;" width="120">姓名</th>
                  <th style="text-align:center;background-color:#ECF0F1;" width="120">用户名</th>
                  <th style="text-align:center;background-color:#ECF0F1;" width="200">操作</th>
                </tr>
              </thead>
              <tbody>
                 {{range .list}}
                    <tr>
                      <td style="text-align:center;" >{{.RealName}}</td>
                      <td style="text-align:center;" >{{.UserName}}</td>
                      <td style="text-align:center;" >
                      <p><a onclick="detail({{.Id}})" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="del({{.Id}})" href="javascript:;"><i class="glyphicon glyphicon-remove-circle"></i> 删除</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="show({{.Departs}})" href="javascript:;"><i class="glyphicon glyphicon-edit"></i>预览</a>
&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="set({{.Id}})" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 设置</a>
                      </p>
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
    <script type="text/javascript" src="{{.baseurl}}/static/js/ztree/jquery.ztree.all-3.5.min.js"></script>
  <script>
    var page="{{.page}}";
    function gopage(t){
      if(t==true){
        page++;
      }else{
        page--;
      }
      if(page<=1) page=1;
      location.href='{{.baseurl}}/superadmin/manager.do?page='+page;
    }
    function detail(cid){
      location.href='{{.baseurl}}/superadmin/editAdmin.do?id='+cid;
    }
    function del(cid){
      if(confirm("确认删除该管理员？")){
        location.href='{{.baseurl}}/superadmin/delAdmin.do?id='+cid;
      }
    }
     $(function (){
     var setting = {
             check:{
                enable:true, 
                chkboxType:{"Y":"","N":""},
             },
              view: {
                selectedMulti: true
              },
              async:{
                type:"get",
                enable: true,
                url:'{{.baseurl}}/depart/gettree2.do'
              },
              callback:{
                onClick:function(e,tid,tnode){
                }
              }
            };
        $.fn.zTree.init($("#tree"), setting);

      })

     function show(ids){
      if(ids!=""){
       var zTree = $.fn.zTree.getZTreeObj("tree");
        var idArray=ids.split(",");
        for(var i=0;i<idArray.length;i++){
          var node=zTree.getNodeByParam("pId",idArray[i]);
          zTree.checkNode(node,true);
        }
       }
     }

     function set(id){
       var zTree = $.fn.zTree.getZTreeObj("tree");
       var nodes = zTree.getCheckedNodes(true);
       var chooseIds="";
       for(var i=0;i<nodes.length;i++){
          //获取当前的子集
          chooseIds+=nodes[i].pId+","
       }
       if(chooseIds){
          chooseIds=chooseIds.substr(0,chooseIds.length-1);
       }
       if(chooseIds!=""){
            location.href='{{.baseurl}}/superadmin/setDeparts.do?id='+id+'&did='+chooseIds;
       }
     }
  </script>
</html>