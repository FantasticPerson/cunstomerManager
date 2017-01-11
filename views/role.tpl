<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>中威通讯管理系统</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
<div class="releasecontainer" id="role_list_opr">
<div class="sitecontent fl" style="width: 48%;">
<div class="sitehead">
    <h3>
        角色信息
    </h3>
</div>
<div class="opwrap">
<div class="siteoperate">
    <div class="siteoperate-left">
        <a class="icon_opts add_opt" id="jsxx-add" href="javascript:toAdd_role_list();">
            <span>添加</span>
        </a>
        <a class="icon_opts modify_opt" id="jsxx-update" href="javascript:toUpdate_role_list();">
            <span>修改</span>
        </a>
        <a class="icon_opts delete_opt" id="jsxx-delete" href="javascript:deleteRole_role_list();">
            <span>删除</span>
        </a>
		<a class="icon_opts sz_opt" id="jsxx-delete" href="javascript:configRole_role_list();">
            <span>配置</span>
        </a>
    </div>
</div>
<div class="cb"></div>
</div>
<div class="sitedetail">
<div class="dpt_tb_wrap">
<table class="table site_tb"  width="100%" layoutH="118">
    <thead>
    <tr>
       
            <th>
           		<div>
               		 <span>角色名称</span>
           		 </div>
            </th>
    </tr>
    </thead>
    <tbody>
       	 	
            {{range .list}}
                  <tr onclick="clickRole_role_list({{.RoleId}})">
                    <td class="text-center" >{{.RoleName}}</td>
                  </tr>
              {{end}}
    </tbody>
</table>
</div>
</div>
</div>
{{if eq .s_level "1"}}
<div class="sitecol fr"  style="width:50%;">
    <div class="sitehead">
        <h3>
            管理角色信息
        </h3>
    </div>
   <div class="opwrap">
<div class="siteoperate">
    <div class="siteoperate-left">
        <a class="icon_opts add_opt" id="jsxx-tjry" href="javascript:toaddAdmin_role_list();">
            <span>添加</span>
        </a>
		<a class="icon_opts modify_opt" id="jsxx-update" href="javascript:toUpdateAdmin_role_list();">
            <span>修改</span>
        </a>
        <a class="icon_opts delete_opt" id="jsxx-deleteUser" href="javascript:deleteAdmin_role_list();">
            <span>删除</span>
        </a>
		<a class="icon_opts sz_opt" id="jsxx-deleteUser" href="javascript:configAdmin_role_list();">
            <span>配置</span>
        </a>
		<a class="icon_opts look_opt" id="jsxx-deleteUser" href="javascript:previewAdmin_role_list();">
            <span>预览</span>
        </a>
    </div>
</div>
</div>
 <div class="sitedetail">
<div class="dpt_tb_wrap" id="table_role_list"  layoutH="79" >
<table class="table site_tb">
	<thead>
		<tr>
			<th  width="50%">
				<div>
					<span> 角色名 </span>
				</div>
			</th>
			<th  width="50%">
				<div>
					<span> 用户名 </span>
				</div>
			</th>
		</tr>
	</thead>
	<tbody id="adminTbody">
    </tbody>
</table>
</div>
</div>
</div>
{{end}}
</div>
<script type="text/javascript" >
var roleid = "";
var adminroleid = "";
window.__cache__ = {};

$(function(){
	$("#table_role_list").load("{{.baseurl}}/superadmin/rolelist.do");
});


function toAdd_role_list(){
	dialog=null;
	dialog= show_by_url('新建角色','{{.baseurl}}/role/add.do','500','250');
}

function toUpdate_role_list(){
	if(roleid == ''){
		alert("请选择更新角色");
		return;
	}
	dialog=null;
	dialog= show_by_url('修改角色','{{.baseurl}}/role/edit.do?rid='+roleid,'500','250');
}
function clickRole_role_list(id){
	roleid = id;
}

function deleteRole_role_list(){
	if(roleid == ''){
		alert("请选择删除角色");
		return;
	}
	$.get('{{.baseurl}}/role/del.do?rid='+roleid, '', function (data){
		navTab.reload('{{.baseurl}}/role/main.do',null,"GET");
	});
}

function configRole_role_list(){
	if(roleid == ''){
		alert("请选择配置角色");
		return;
	}
	dialog=null;
	dialog= show_by_url('配置角色','{{.baseurl}}/role/config.do?rid='+roleid,'500','250');
}

function toaddAdmin_role_list(){
	dialog=null;
	dialog= show_by_url('新建管理角色','{{.baseurl}}/superadmin/toAdd.do','500','250');
}

function toUpdateAdmin_role_list(){
	if(adminroleid == ''){
		alert("请选择管理角色进行修改");
		return;
	}
	dialog=null;
	dialog= show_by_url('修改管理角色','{{.baseurl}}/superadmin/toEdit.do?vid='+adminroleid,'500','250');
}

function deleteAdmin_role_list(){
	if(adminroleid == ''){
		alert("请选择删除管理角色");
		return;
	}
	$.get('{{.baseurl}}/superadmin/delAdmin.do?id='+adminroleid, '', function (data){
		navTab.reload('{{.baseurl}}/role/main.do',null,"GET");
	});
}

function configAdmin_role_list(){
	if(adminroleid == ''){
		alert("请选择配置管理角色");
		return;
	}
	dialog=null;
	dialog= show_by_url('配置管理范围','{{.baseurl}}/superadmin/toConfig.do?vid='+adminroleid,'300','430');
}

function previewAdmin_role_list(){
	if(adminroleid == ''){
		alert("请选择预览管理角色");
		return;
	}
	dialog=null;
	dialog= show_by_url('查看管理范围','{{.baseurl}}/superadmin/toPreview.do?vid='+adminroleid,'300','430');
}
</script>
</body>
</html>
