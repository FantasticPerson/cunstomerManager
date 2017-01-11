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
    <style>
      table thead th{background-color:#ECF0F1;}
    </style>
  </head>
  <body>
    {{template "header.tpl"}}
    <div class="row">
    <div class="container bs-docs-container">
      
        <div class="col-md-3">
          <div class="bs-sidebar hidden-print affix" role="complementary">
            <div class="btn-group">
              <a href="{{.baseurl}}/depart/index.do" type="button" class="btn btn-primary">新建部门</a>
              <a href="{{.baseurl}}/depart/edit.do" type="button" class="btn btn-primary">新建联系人</a>
            </div>
            <ul id="tree" class="nav bs-sidenav ztree">
            </ul>
          </div>
        </div>
        <div class="col-md-9" role="main">
          <div class="row pull-right">
            <div class="btn-group">
                <a href="{{.baseurl}}/depart/into.do?id={{.VersionId}}" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-circle-arrow-left"></i> 导入数据</a>
              </div>
              <div class="btn-group">
                <a href="{{.baseurl}}/depart/export_excel.do" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-cloud-download"></i> 导出数据</a>
                <a onclick="clearAll()" href="javascript:;" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-cloud-upload"></i>  清空数据</a>
              </div>
          </div>
          <div class="row">
            <div class="col-md-8 col-md-offset-1">
              <br />
              <div class="input-group">
    <input id="keywords" type="text" class="form-control" value="{{.keywords}}" onkeydown="entersearch()"  placeholder="输入姓名,拼音首字母,手机号查询">
                <div class="input-group-btn">
                  <button onclick="searchFn();" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><i class="fa fa-search"></i> 搜索</button>
                </div>
                <div class="input-group-btn">
                  <div class="col-md-offset-2"><a type="button" class="btn btn-primary"   href="javascript:;" onclick="allSet()">统一设置</a></div>
                </div>
              </div>
            </div>
          </div>
         <!--
            <select class="form-control" id="permission">
              {{range .roles}}
                            <option value="{{.RoleId}}">{{.RoleName}}</option>
              {{end}}
            </select>
         -->
          <div class="col-md-offset-1">

            <div id="historybox"></div>
          </div>
          
        </div>
      </div>
    </div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="{{.baseurl}}/static/js/juicer.min.js"></script>
  <script type="text/javascript" src="{{.baseurl}}/static/js/ztree/jquery.ztree.core-3.5.js"></script>
  <script id="htpl" type="text/template">
    <br />
    <table class="table table-striped table-condensed table-bordered">
      <thead>
        <th width="80">选择</th>
        <th width="120">姓名</th>
        <th width="80">职务</th>
        <th width="120">所在角色</th>
        <th width="200">操作</th>
      </thead>
      <tbody>
        {@each data as it,index}
            <tr>
             <td style="text-align:center;"><input type="checkbox" name="idcheck" value="${it.Id}"></td>
              <td style="text-align:center;">${it.Name}</td>
              <td style="text-align:center;">${it.Job}</td>
              <td style="text-align:center;">${it.RoleName}</td>
              <td style="text-align:center;" >
           <p><a onclick="edit(${it.Id})" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 编辑</a></p>
              </td>
            </tr>
        {@/each}
      </tbody>
    </table>
  </script>
  <script>
    var ids=""
    var htpl = document.getElementById('htpl').innerHTML;
    function initContacts(id,keywords){
      q={"id":id,"kwords":keywords}
      $.post('{{.baseurl}}/depart/getcontacts.do',q,function(data){
          $('#historybox').html(juicer(htpl, {"data":data}));
      });
    }
   (function(){
     initContacts('-1','');
      var setting = {
            view: {
              selectedMulti: false
            },
            async:{
              type:"get",
              enable: true,
              url:'{{.baseurl}}/depart/gettree.do?id={{.VersionId}}'
            },
            callback:{
              onClick:function(e,tid,tnode){
                if(tnode.type=='0'){
                    initContacts(tnode.pId,'');
                }
              }
            }
          };
      $.fn.zTree.init($("#tree"), setting);
    })();

        function clearAll(){
          if(confirm("确认要清空吗？")){
            location.href='{{.baseurl}}/depart/clear.do?vid={{.VersionId}}';
          }
        }

    function searchFn(){
      keywords=$('#keywords').val();
      if(keywords!=''){
        initContacts('-1',keywords);
      }else{
        initContacts('-1','');
      }
    }

     function entersearch(){
       var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13)
        {
            searchFn();
        }
     }


       //全选
    function allCheck(){
        $("input[name='idcheck']").attr("checked",true);
    }

    //反选
    function allUnCheck(){
      var arrChk=$("input[name='idcheck']");
      $(arrChk).each(function(){
        $(this).attr("checked",!this.checked);              
     });
    }

     function checkDelete(){
     var arrChk=$("input[name='idcheck']:checked");
     if (arrChk.length==0){
      alert("请先选择联系人");
      return
     }
      ids=""
      $(arrChk).each(function(){
           ids=ids+this.value+","
     });
      if(confirm("确认删除这些联系人？")){
        location.href='{{.baseurl}}/depart/delChecked.do?ids='+ids;
      }
    }

     /**
   *赋予权限
   */
    function givePermission(){
      var arrChk=$("input[name='idcheck']:checked");
     if (arrChk.length==0){
      alert("请先选择联系人");
      return
     }

      $(arrChk).each(function(){
           ids=ids+this.value+",";
     });
 if(window.ActiveXObject){
          var obj=new Object();
          var permissonVal=window.showModalDialog('{{.baseurl}}/depart/permission.do',obj,"dialogWidth=400px;dialogHeight=300px");
          if(permissonVal){
              if(confirm("确认要设置这些联系人的权限吗？")){
                location.href='{{.baseurl}}/depart/setPermission.do?ids='+ids+'&level='+permissonVal;
              }  
          }
      }else{
          window.open('{{.baseurl}}/depart/permission.do','newwindow',"height=300;width=400,top=150,left=300");
      }
      // var obj=new Object();
      // var permissonVal=  showModalDialog('{{.baseurl}}/contacts/permission.do',obj,"dialogWidth=400px;dialogHeight=300px");
      // if(permissonVal){
      //   if(confirm("确认要设置这些联系人的权限吗？")){
      //     location.href='{{.baseurl}}/depart/setPermission.do?ids='+ids+'&level='+permissonVal;
      //   }  
      // }
    }

function getReturnValue(permissonVal){

    if(permissonVal){
        if(confirm("确认要设置这些联系人的权限吗？")){
          location.href='{{.baseurl}}/depart/setPermission.do?ids='+ids+'&level='+permissonVal;
        }  
      }
}
    /*
     *统一设置
     */
    function allSet(){

            var rid=$('#permission').val();
            if(confirm("确认要赋予这些人角色吗？")){
             location.href='{{.baseurl}}/depart/allSet.do?rid='+rid;
        }
    }

    /**
     * 编辑处理
     */
    function edit(cid){
      location.href='{{.baseurl}}/depart/edit.do?id='+cid;
    }

    /**
     * 部门单位管理
     */
    function departManager(){
      
    }
  </script>
</html>
