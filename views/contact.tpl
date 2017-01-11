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

    <div class="container bs-docs-container">
       <div class="col-md-3">
          <div class="bs-sidebar hidden-print affix" role="complementary">
            <div class="btn-group">
              <a href="{{.baseurl}}/contacts/edit.do" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-user"></i> 新增联系人</a>
            </div>
            <ul id="tree" class="nav bs-sidenav ztree">
            </ul>
          </div>
        </div>
        <div class="col-md-9" role="main">
          <!-- Getting started -->
          <div class="btn-group">

            <div class="btn-group"><a href="{{.baseurl}}/depart/into.do?id={{.VersionId}}" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-circle-arrow-left"></i> 导入数据</a></div>
            <div class="btn-group">
              <a href="{{.baseurl}}/depart/export_excel.do" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-cloud-download"></i> 导出数据</a>
              <a onclick="clearAll()" href="javascript:;" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-cloud-upload"></i>  清空数据</a>
            </div>
          </div>
          <div class="col-lg-5">
            <div class="input-group">
  <input id="keywords" type="text" class="form-control" value="{{.keywords}}" onkeydown="entersearch()"  placeholder="输入姓名,拼音首字母,手机号查询">
              <div class="input-group-btn">
                <button onclick="searchFn();" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><i class="fa fa-search"></i> 搜索</button>
              </div>
            </div>
          </div>
         <h5>  默认排序</h5>
         <select class="form-control"id="sortSelect" onchange="sortChange(this)">

               <option value="1">按拼音</option>
               <option value="0">按部门</option>
        </select>
        <h5>角色设置 </h5>
      </select>
         <select class="form-control" id="permission">
        {{range .roles}}
                      <option value="{{.RoleId}}">{{.RoleName}}</option>
        {{end}}
      </select>
      <a type="button" class="btn btn-primary"   href="javascript:;" onclick="allSet()">统一设置</a>   
          <!-- Getting started ================================================== -->
<!--           <ul class="pager">
            <li class="previous"><a onclick="gopage(false);" href="javascript:;">&larr; 上一页</a></li>
            <li class="next"><a onclick="gopage(true);" href="javascript:;">下一页 &rarr;</a></li>
          </ul><ul class="pager">
            <li class="previous"><a onclick="gopage(false);" href="javascript:;">&larr; 上一页</a></li>
            <li class="next"><a onclick="gopage(true);" href="javascript:;">下一页 &rarr;</a></li>
          </ul> -->
          <div id="historybox"></div>
          
        </div>
    </div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="{{.baseurl}}/static/js/juicer.min.js"></script>
  <script type="text/javascript" src="{{.baseurl}}/static/js/ztree/jquery.ztree.core-3.5.js"></script>
  <script id="htpl" type="text/template">
    <table class="table table-striped table-hover table-bordered">
      <thead>
        <tr>
          <th style="text-align:center;background-color:#ECF0F1;" width="80">选择</th>
          <th style="text-align:center;background-color:#ECF0F1;" width="120">姓名</th>
          <th style="text-align:center;background-color:#ECF0F1;" width="80">职务</th>
          <th style="text-align:center;background-color:#ECF0F1;" width="120">所在分组</th>
          <th style="text-align:center;background-color:#ECF0F1;" width="120">所在部门</th>
          <th style="text-align:center;background-color:#ECF0F1;" width="120">所在处室</th>
           <th style="text-align:center;background-color:#ECF0F1;" width="120">所在角色</th>
          <th style="text-align:center;background-color:#ECF0F1;" width="200">操作</th>
        </tr>
      </thead>
      <tbody>
        {@each data as it,index}
            <tr>
             <td style="text-align:center;"><input type="checkbox" name="idcheck" value="${it.ContactsId}"></td>
              <td style="text-align:center;">${it.ContactsRealname}</td>
              <td style="text-align:center;" >${it.ContactsPosition}</td>
              <td style="text-align:center;" >${it.ContactsArea}</td>
              <td style="text-align:center;" >${it.ContactsUnit}</td>
              <td style="text-align:center;" >${it.ContactsDepartment}</td>
              <td style="text-align:center;" >${it.RoleName}</td>
              <td style="text-align:center;" >
              <p><a onclick="edit(${it.ContactsId})" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="del(${it.ContactsId})" href="javascript:;"><i class="glyphicon glyphicon-remove-circle"></i> 删除</a></p>
              </td>
            </tr>
        {@/each}
      </tbody>
    </table>
    <div class="btn-group">
    	<button type="button"  class="btn btn-primary" onclick="allCheck()">全选</button>
        <button type="button" class="btn btn-primary" onclick="allUnCheck()">反选</button>
        <button type="button" class="btn btn-primary" onclick="checkDelete()">删除</button>
        <button type="button" class="btn btn-primary" onclick="givePermission()">设置权限</button>    
    </div>
  </script>
  <script>

  var sortKey="{{.sort}}"

  if(sortKey==1){
    $("#sortSelect option").eq(0).attr('selected','true');
  }else{
    $("#sortSelect option").eq(1).attr('selected','true');
  }
    var ids=""
    var id="{{.VersionId}}",keywords="{{.keywords}}",page=1,where="{{.where}}";
    var htpl = document.getElementById('htpl').innerHTML;
    initContacts(id,'',1,'');
    function initContacts(id,kw,p,s){
      if(p<0){
            q={"id":id,"keywords":kw,"where":s}
      }else{
            q={"id":id,"keywords":kw,"page":p,"where":s}
      }

      $.post('{{.baseurl}}/contacts/getcontacts.do',q,function(data){
        $('#historybox').html(juicer(htpl, {"data":data}));
      });
    }
    function searchFn(){
      keywords=$('#keywords').val();
      if(keywords!=''){
        initContacts(id,keywords,1,'');
      }else{
        initContacts(id,'',1,'');
      }
    }
    function gopage(t){
      if(t==true){
        page++;
      }else{
        page--;
      }
      if(page<=1) page=1;
      initContacts(id,keywords,page,where);
    }
    function edit(cid){
      location.href='{{.baseurl}}/contacts/edit.do?id='+cid;
    }
    function del(cid){
      if(confirm("确认删除该联系人信息？")){
        location.href='{{.baseurl}}/contacts/del.do?id='+cid;
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
      ids="";
      $(arrChk).each(function(){
           ids=ids+this.value+","
     });
      if(confirm("确认删除这些联系人？")){
        alert(ids);
        location.href='{{.baseurl}}/contacts/delChecked.do?ids='+ids;
      }
    }

    function entersearch(){
       var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13)
        {
            searchFn();
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
   ids="";
      $(arrChk).each(function(){
           ids=ids+this.value+",";
     });
      if(window.ActiveXObject){
          var obj=new Object();
          var permissonVal=window.showModalDialog('{{.baseurl}}/contacts/permission.do',obj,"dialogWidth=400px;dialogHeight=300px");
          if(permissonVal){
              if(confirm("确认要设置这些联系人的权限吗？")){
                location.href='{{.baseurl}}/contacts/setPermission.do?ids='+ids+'&level='+permissonVal;
              }  
          }
      }else{
          window.open('{{.baseurl}}/contacts/permission.do','newwindow',"height=300;width=400,top=150,left=300");
      }
    }

/*
 *统一设置
 */
function allSet(){
        var rid=$('#permission').val();

        if(confirm("确认要赋予这些人角色吗？")){
         location.href='{{.baseurl}}/contacts/allSet.do?rid='+rid;
    }
}

function clearAll(){
        if(confirm("确认要删除吗？")){
         location.href='{{.baseurl}}/depart/clear.do';
    }
}

function sortChange(t){
  //这边调用ajax
   $.post('{{.baseurl}}/contacts/setSort.do?sortKey='+t.value,"{}",function(data){
     if(data==1){
     if(t.value==1){
        $("#sortSelect option").eq(0).attr('selected','true');
      }else{
        $("#sortSelect option").eq(1).attr('selected','true');
      }
        }
    });
}

  /**
   *剥夺权限
   */
  //   function removePermission(){
  // var arrChk=$("input[name='idcheck']:checked");
  //    if (arrChk.length==0){
  //     alert("请先选择联系人");
  //     return
  //    }
  //    var ids=""
  //     $(arrChk).each(function(){
  //          ids=ids+this.value+",";
  //    });
  //     if(confirm("确认要取消这些联系人的权限吗？")){
  //       location.href='{{.baseurl}}/contacts/removePermission.do?ids='+ids+'&level='+0;
  //     }
  //   }

function getReturnValue(permissonVal){

    if(permissonVal){
        if(confirm("确认要设置这些联系人的权限吗？")){
          location.href='{{.baseurl}}/contacts/setPermission.do?ids='+ids+'&level='+permissonVal;
        }  
      }
}
    (function(){
      var setting = {
            view: {
              selectedMulti: false
            },
            async:{
              type:"get",
              enable: true,
              url:'{{.baseurl}}/contacts/gettree.do?id={{.VersionId}}'
            },
            callback:{
              onClick:function(e,tid,tnode){
                var where ='';
                if(!!tnode.type){
                  where+=getWhere(tnode.type,tnode.name);
                }
                var p=tnode.getParentNode();
                if(!!p){
                  if(!!p.type) where+=getWhere(p.type,p.name);
                  var pp=p.getParentNode();
                  if(!!pp){
                    if(!!pp.type) where+=getWhere(pp.type,pp.name);
                  }
                }
                //alert(where);
                initContacts(id,'',-1,where);
              }
            }
          };
      $.fn.zTree.init($("#tree"), setting);
    })();
    function getWhere(t,c){
      var where='';
      switch(t){
        case 'a':
        where+=' AND contacts_area="'+c+'"'
        break;
        case 'u':
        where+=' AND contacts_unit="'+c+'"'
        break;
        case 'd':
        where+=' AND contacts_department="'+c+'"'
        break;
      }
      return where;
    }
  </script>
</html>
