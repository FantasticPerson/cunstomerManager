<!DOCTYPE html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>中威通讯管理系统</title>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/jquery.form.js"></script>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/true.validate.js"></script>
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
		<form id="userForm"  method="post">
			<fieldset>
		 		<legend class="legend">基本信息</legend>
		  		<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" class="contentTable">
		       		<tr>
		         		<td width="30%" height="35" align="right">原密码： </td>
		         		<td width="20%"><input id="oldpassword" name="oldpassword" maxlength="100" onmousedown="changeClass('oldpasswordTip')" class="textInput width_205" type="password" /></td>	
		         		<td width="50%" id="oldpasswordTip">
		         			<span style="color: red;">*</span>
                 		</td>
		      		</tr>
		      		<tr>
		         		<td height="35" align="right"> 新密码： </td>
		         		<td> <input name="newPassword" id="newPassword" maxlength="50" onmousedown="changeClass('newPasswordTip')" class="textInput width_205" type="password" /> </td>	
		         		<td id="newPasswordTip">
		         			<span style="color: red;">*</span>
                 		</td>
		      		</tr>
		      		<tr>
		         		<td height="35" align="right"> 再次输入新密码： </td>
		         		<td> <input name="newPasswordTwo" maxlength="50" id="newPasswordTwo" onmousedown="changeClass('newPasswordTwoTip')" class="textInput width_205" type="password" /> </td>	
		         		<td id="newPasswordTwoTip">
		         			<span style="color: red;">*</span>
                 		</td>
		      		</tr>
		      	</table>
		      </fieldset>
		 </form>
	</div>
	<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" /> <input type="submit"
			onclick="saveUser();" value="保存" class="confirmBtn" />
	</div>
</body>
<script type="text/javascript">
function saveUser(){
	var flag=true;
	if (!checkError("oldpassword","oldpasswordTip","原密码",0)) flag=false;
	if (!checkError("newPassword","newPasswordTip","新密码",0)) flag=false;
	if (!checkError("newPasswordTwo","newPasswordTwoTip","确认密码",0)) flag=false;
	var oldPassword=$('#oldpassword').val();
	var newPassword=$('#newPassword').val();
	var newPasswordTwo=$('#newPasswordTwo').val();
	if(newPassword!=newPasswordTwo){
		alert('两次输入的新密码不一致');
		return;
	}
	if(flag){
		$.post('{{.baseurl}}/versions/change_pass.do?username={{.uName}}&oldpass='+oldPassword+'&newpass='+newPassword,"{}",function(data){
			var res = eval("("+data+")");
				if(res.success == "true"){
					alert("修改密码成功");
					parent.dialog.close();
				}else{
					alert(res.message);
				}
		});
	}
}
function changeClass(id){
	$('#'+id).removeClass("formTip");
	$('#'+id)[0].innerHTML = '<span style="color: red;">*</span>';
}
</script>
</html>