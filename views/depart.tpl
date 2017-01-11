<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="{{.baseurl}}/static/js/ztree/jquery.ztree.all-3.5.min.js"></script>
	<link rel="stylesheet" href="{{.baseurl}}/static/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
  </head>
  <body>
<div class="releasecontainer" style="min-width:1100px;" id="organize_list_opr">
	<div class="sitecontent fl" style="width: 24%;">
		<div class="sitehead">
			<h3>部门信息</h3>
		</div>
		<div class="opwrap">
			<div class="siteoperate">
				{{if eq .s_level "1"}}
				<div class="siteoperate-left">
					<a class="icon_opts add_opt" id="bmxx-add" 
						href="javascript:toAdd_dept_list();"> <span>添加</span>
					</a> 
					<a class="icon_opts modify_opt" id="bmxx-update"
						href="javascript:toUpdate_dept_list();">
						<span>修改</span>
					</a> 
					<a class="icon_opts delete_opt" id="bmxx-delete"
						href="javascript:toDelete_dept_list();">
						<span> 删除 </span>
					</a>
				</div>
				{{end}}
			</div>

			<div class="cb"></div>
			<ul id="tree" class="nav bs-sidenav ztree" {{if eq .s_level "1"}} {{else}}style="padding-top:40px;"{{end}}></ul>
		</div>
	</div>
	<div class="sitecol fr" style="width: 74%;">
		<div class="sitehead">
			<h3>人员信息</h3>
		</div>
		<div class="opwrap">
			<div class="siteoperate">
				<div class="siteoperate-left">
				{{if eq .s_level "1"}}
					<a class="icon_opts add_opt" id="ryxx-add"
						href="javascript:addUser_dept_list();"> <span>添加</span>
					</a> 
					{{end}}
					<a class="icon_opts modify_opt" id="ryxx-update"
						href="javascript:updateUser_dept_list();"> <span>修改</span>
					</a>
					<!--<a class="icon_opts delete_opt" id="ryxx-delete"
						href="javascript:toDeleteUser_dept_list();"> <span> </span>
					</a> -->
					<div class="more_opt_div" id="ryxx-delete" style="">
						<a class="icon_opts delete_opt zw-dropdown"
							href="javascript:void(0);" > <span> 删除 </span>

						</a>
						<ul class="moreopt" id="more_del" style="width:67px;">
							<li style="width:67px;"><a href="javascript:;" onclick="toDeleteUser_dept_list()">删除已选</a></li> 
							<li style="width:67px;"><a href="javascript:;" onclick="toResigning_dept_list()">人员离职</a></li> 
							{{if eq .s_level "1"}}
							<li style="width:67px;"><a href="javascript:;" onclick="clearAll()">清空全部</a></li>
							{{end}}
						</ul>
					</div>
					{{if eq .s_level "1"}}
					<!--<a class="icon_opts sq_opt" id="ryxx-zy"
						href="javascript:grantRole_dept_list();"> <span> 授权</span>
					</a> -->
					<div class="more_opt_div" id="ryxx-zy" style="">
						<a class="icon_opts sq_opt zw-dropdown"
							href="javascript:void(0);"> <span> 授权 </span>

						</a>
						<ul class="moreopt" id="more_grant" style="width:67px;">
							<li style="width:67px;"><a href="javascript:;" onclick="grantRole_dept_list()">授权已选</a></li> 
							<li style="width:67px;"><a href="javascript:;" onclick="givePermissionAll()">授权全部</a></li>
						</ul>
					</div>
					<a class="icon_opts excelin_opt" id="ryxx-zdlmqx"
						href="javascript:excelimport_dept_list();">
						<span> 从excel导入 </span>
					</a>
					<a class="icon_opts excelout_opt" id="ryxx-zdlmqx"
						href="javascript:excelexport_dept_list();">
						<span> 导出为excel </span>
					</a>
					<a class="icon_opts exceldown_opt" id="ryxx-zdlmqx"
						href="{{.baseurl}}/static/upload/31_无通讯.xlsx">
						<span> excel模板下载 </span>
					</a>
					{{end}}
					<div class="more_opt_div" id="gdcz" style="">
						<a class="icon_opts jssx_opt zw-dropdown"
							href="javascript:void(0);"> <span> 更多操作 </span>

						</a>
						<ul class="moreopt" id="more_role">
							{{range .roles}}<li style="width:106px;"><a href="javascript:;" onclick="selectRole({{.RoleId}})">{{.RoleName}}</a></li>{{end}}  
						</ul>
					</div>
					
				</div>
				<div class="sitesearch">
					<input value="" maxlength="50"
						onkeypress="if(event.keyCode==13){searUser_dept_list();}"
						class="ipt_search" name="name" id="username_dept_list"
						placeholder="请输入用户名称" /> <a class="magnify-link"
						href="javascript:searUser_dept_list();"></a>
				</div>
			</div>
		</div>
		<div class="sitedetail">
			<div class="dpt_tb_wrap" id="emps_dept_list" layoutH="79">
				<table class="table site_tb" width="100%">
					
				</table>
			</div>
		</div>
  </body>
	</div>
</div>

  <script type="text/javascript">
	var currentDeptName = "";
	var currentDeptId = "";
	var currentDeptIndex = "";
	var currentLevel = "";
	var empids = null;
	$(document).click(function(e){
		var target = $(e.target);
		if(target.attr("class") && (target.attr("class").indexOf("delete_opt")!=-1
			|| target.attr("class").indexOf("sq_opt")!=-1
				|| target.attr("class").indexOf("jssx_opt")!=-1)) return;
		if($("#more_role").is(":visible") || $("#more_grant").is(":visible") || $("#more_del").is(":visible")){
			$(".moreopt#more_del").slideUp();
			$(".moreopt#more_grant").slideUp();
			$(".moreopt#more_role").slideUp();
		}
	})
	$(".jssx_opt").click(function(){
            $(".moreopt#more_role").slideToggle();
        });
		$(".delete_opt").click(function(){
            $(".moreopt#more_del").slideToggle();
        });
		$(".sq_opt").click(function(){
            $(".moreopt#more_grant").slideToggle();
        });
 $(function (){

        var setting = {
              view: {
                selectedMulti: false
              },
              async:{
                type:"get",
                enable: true,
                url:'{{.baseurl}}/depart/gettree2.do'
              },
              callback:{
                onClick:function(e,tid,tnode){

                  if(tnode.type=='0'){
					currentDeptName = tnode.name;
					currentDeptId = tnode.pId;
					currentDeptIndex = tnode.index;
					$("#emps_dept_list").load("{{.baseurl}}/depart/emps.do?id="+tnode.pId);
                  }
                }
              }
            };
        $.fn.zTree.init($("#tree"), setting);
		$("#emps_dept_list").load("{{.baseurl}}/depart/emps.do?id=-1");
    });
	
	function toAdd_dept_list(){
		dialog=null;
		dialog= show_by_url('新建部门','{{.baseurl}}/depart/toAdd.do?pid='+currentDeptId+'&pname='+currentDeptName,'500','250');
	}
	
	function toUpdate_dept_list(){
		if(currentDeptId == ""){
			alert("请选则修改部门");
			return;
		}
		dialog=null;
		dialog= show_by_url('修改部门','{{.baseurl}}/depart/toUpdate.do?deptid='+currentDeptId+'&deptname='+currentDeptName+'&deptindex='+currentDeptIndex,'500','220');
	}
	
	function toDelete_dept_list(){
		if(currentDeptId == ""){
			alert("请选则删除部门");
			return;
		}
		if(confirm('确认要删除这个部门？')){
            var zTree = $.fn.zTree.getZTreeObj('tree');
			var nodes = zTree.getSelectedNodes();
            var url = '{{.baseurl}}/depart/create.do?model='+2+'&pid='+currentDeptId;
                  
          $.get(url, '', function (data){
            
                    if (data.indexOf('对不起') != -1) {
                      alert('对不起，必须先删除子部门');
                    } else {
            var zTree = $.fn.zTree.getZTreeObj('tree');
                      var nodes = zTree.getSelectedNodes();
                      for(var i=0,l=nodes.length;i<l;i++){
                          zTree.removeNode(nodes[i]);
                      }
                    }
                  });
              };
	}
	
	function addUser_dept_list(){
		dialog=null;
		dialog= show_by_url('新建联系人','{{.baseurl}}/depart/toAddEmp.do?deptid='+currentDeptId+'&deptname='+currentDeptName+'&deptindex='+currentDeptIndex,'500','720');
	}
	
	function excelimport_dept_list(){
		dialog=null;
		dialog= show_by_url('从excel导入','{{.baseurl}}/depart/into.do?id={{.VersionId}}','500','300');
	}
	
	function excelexport_dept_list(){
		dialog=null;
		dialog= show_by_url('从excel导出','{{.baseurl}}/depart/export_excel.do','500','200');
	}
	
	function updateUser_dept_list(){
		if(empids == null || empids == ""){
			alert("请选择需要修改的联系人！");
			return;
		}
		if(empids.indexOf(',')>0){
			alert("请选择一个联系人修改！");
			return;
		}
		dialog=null;
		dialog= show_by_url('修改联系人','{{.baseurl}}/depart/edit.do?id='+empids,'500','720');
	}
	
	function searUser_dept_list(){
		var keywords = $('#username_dept_list').val();
		if(keywords==""){
			alert("请输入搜索关键字！");
			return false;
		}   
		var keywords2 = $('#username_dept_list').val();
		keywords = keywords2 && keywords2.length ? keywords2 : "";
		$("#emps_dept_list").load("{{.baseurl}}/depart/emps.do?id=-1&keyword="+keywords);
	}
	
	function selectRole(level){
		currentLevel = level;
		var keywords = $('#username_dept_list').val();
		var deptid = currentDeptId && currentDeptId.length ? currentDeptId : "-1";
		$("#emps_dept_list").load("{{.baseurl}}/depart/emps.do?id="+deptid+"&keyword="+keywords+"&level="+level);
		$(".moreopt#more_role").hide();
	}
	
	function grantRole_dept_list(){
		if(empids == null || empids == ""){
			alert("请选择需要授权的联系人！");
			$(".moreopt#more_grant").hide();
			return;
		}
		dialog=null;
		dialog= show_by_url('授权联系人','{{.baseurl}}/depart/permission.do','500','220');
		$(".moreopt#more_grant").hide();
	}
	
	function givePermissionAll () {
        dialog=null;
		dialog= show_by_url('授权全部','{{.baseurl}}/depart/permission.do?option=2','500','220');
		$(".moreopt#more_grant").hide();
    }
	
	function grant_emps(roleid){
		
		var url = '{{.baseurl}}/depart/setPermission.do?ids='+empids+'&level='+roleid;
		var keywords = $('#username_dept_list').val();
		var deptid = currentDeptId && currentDeptId.length ? currentDeptId : "-1";
        $.get(url, '', function(data){
            $("#emps_dept_list").load("{{.baseurl}}/depart/emps.do?id="+deptid+"&keyword="+keywords+"&level="+currentLevel);
			if(dialog!=null){
				dialog.close();
			}
        });
		
	}
	
	function grant_all(roleid){
		
		var url = '{{.baseurl}}/depart/allSet.do?rid='+roleid;
		var keywords = $('#username_dept_list').val();
		var deptid = currentDeptId && currentDeptId.length ? currentDeptId : "-1";
        $.get(url, '', function(data){
            $("#emps_dept_list").load("{{.baseurl}}/depart/emps.do?id="+deptid+"&keyword="+keywords+"&level="+currentLevel);
			if(dialog!=null){
				dialog.close();
			}
        });
		
	}
	
	function toDeleteUser_dept_list(){
        if(empids == null || empids == ""){
			alert("请选择需要删除的联系人！");
			$(".moreopt#more_del").hide();
			return;
		}
        if(confirm('确认删除这些联系人?')){
			var keywords = $('#username_dept_list').val();
			var deptid = currentDeptId && currentDeptId.length ? currentDeptId : "-1";
			var url = '{{.baseurl}}/depart/delChecked.do?ids='+empids; 
			$.get(url, '', function (data){
				$("#emps_dept_list").load("{{.baseurl}}/depart/emps.do?id="+deptid+"&keyword="+keywords+"&level="+currentLevel);
			});
        };
		$(".moreopt#more_del").hide();
    }
	
	function toResigning_dept_list(){
        if(empids == null || empids == ""){
			alert("请选择离职人员！");
			$(".moreopt#more_del").hide();
			return;
		}
        if(confirm('确认设置为离职人员?')){
			var keywords = $('#username_dept_list').val();
			var deptid = currentDeptId && currentDeptId.length ? currentDeptId : "-1";
			var url = '{{.baseurl}}/contacts/addResigning.do?id='+empids; 
			$.post(url, '', function (data){
				$("#emps_dept_list").load("{{.baseurl}}/depart/emps.do?id="+deptid+"&keyword="+keywords+"&level="+currentLevel);
			});
        };
		$(".moreopt#more_del").hide();
    }
	
	function clearAll(){
      if(confirm("确认要清空吗？")){
        location.href='{{.baseurl}}/depart/clear.do?vid={{.VersionId}}';
      }
	  $(".moreopt#more_del").hide();
    }
  </script>
</html>
