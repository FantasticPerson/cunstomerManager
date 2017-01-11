<!DOCTYPE html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>中威通讯管理系统</title>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/jquery.form.js"></script>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/tipwindown/tip.js"></script>
<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/css/dialog.css">
<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/themes/default/style.css">
	<style type="text/css">
		#sync_a, #buildSiteIndex{
			margin-left:10px;
		}
	</style>
</head>
<body>
	<div class="contentBox">
		<form id="dataform" name="dataform" enctype="multipart/form-data" method="post" action="{{.baseurl}}/role/save.do">
			<fieldset>
				<legend class="legend">角色名：<label class="label label-info">{{.roleName}}</label></legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<thead>
						<tr>
							<th style="text-align:center;background-color:#ECF0F1;" width="120">操作</th>
							<th style="text-align:center;background-color:#ECF0F1;" width="120">角色名称</th>
						</tr>
					</thead>
					<tbody>
					{{range .list}}
                      <tr>
                        <td style="text-align:center;">
                          {{if .Orole}}
                                <input type="checkbox" name="idcheck" value="{{.RoleId}}" checked=checked></td>
                          {{else}}
                                <input type="checkbox" name="idcheck" value="{{.RoleId}}"></td>
                          {{end}}
                        <td style="text-align:center;" >{{.RoleName}}</td>
                      </tr>
					{{end}}
					</tbody>
				</table>
			</fieldset>
		</form>
	</div>
	<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" /> <input type="submit"
			onclick="saveRoleConfig();" value="保存" class="confirmBtn" />
	</div>
</body>
<script type="text/javascript">
function saveRoleConfig(){
    var arrChk=$("input[name='idcheck']:checked"),
        ids="",
        url = '{{.baseurl}}/role/saveConfig.do?mid='+{{.roleId}};
    
    $(arrChk).each(function(index, value){
        if (index) ids += ",";
        ids += this.value;
    });

    if (ids !== "") url += '&ids=' + ids;

    $.get(url, '', function (data){
		
    });
	alert("配置成功");
	parent.dialog.close();
  }
</script>
</html>