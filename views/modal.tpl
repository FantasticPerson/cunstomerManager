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
		<form id="dataform" name="dataform" enctype="multipart/form-data" method="post" action="">
			<input type="hidden" id="pid" name="pid" value="{{.pid}}">
			<fieldset>
				<legend class="legend">授权联系人</legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<tr>
						<td width="40%" height="35" align="right">请选择权限角色：</td>
						<td width="60%">
							<select class="form-control" id="selectedPermission">
								{{range .roles}}
									<option value="{{.RoleId}}">{{.RoleName}}</option>
								{{end}}
							</select>
						</td>
						<td></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" /> <input type="submit"
			onclick="doConfirm();" value="确定" class="confirmBtn" />
	</div>
</body>

<script type="text/javascript">
function doConfirm(){
	var roleid = $("#selectedPermission").val();
	if({{.option}}){
		parent.grant_all(roleid);
	}else{
		parent.grant_emps(roleid);
	}	
}
</script>
</html>

