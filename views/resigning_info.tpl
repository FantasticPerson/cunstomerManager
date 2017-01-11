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
			<fieldset>
				<legend class="legend">离职人员信息</legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<tr>
						<td width="20%" height="35" align="right">IM用户名:</td>
						<td width="30%"><input type="text" class="textInput width_205" id="Uname" name="Uname" value="{{.data.Uname}}" readonly="readonly"></td>
						<td></td>
					</tr>
					<tr>
						<td width="20%" height="35" align="right">姓名：</td>
						<td width="30%"><input type="text" class="textInput width_205" id="Name" name="Name" value="{{.data.Name}}" placeholder="  --姓名必填" readonly="readonly"></td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">部门：</td>
						<td><input type="text" class="textInput width_205" id="Depart" name="Depart" value="{{.dname}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">职位：</td>
						<td><input type="text" class="textInput width_205" id="Job" name="Job" value="{{.data.Job}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">邮箱：</td>
						<td><input type="text" class="textInput width_205" id="Mail" name="Mail" value="{{.data.Mail}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">手机号码1：</td>
						<td><input type="text" class="textInput width_205" id="Mobile1" name="Mobile1" value="{{.data.Mobile1}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">短号1：</td>
						<td><input type="text" class="textInput width_205" id="ShortMobile1" name="ShortMobile1" value="{{.data.ShortMobile1}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">手机号码2：</td>
						<td><input type="text" class="textInput width_205" id="Mobile2" name="Mobile2" value="{{.data.Mobile2}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">短号2：</td>
						<td><input type="text" class="textInput width_205" id="ShortMobile2" name="ShortMobile2" value="{{.data.ShortMobile2}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">手机号码3：</td>
						<td><input type="text" class="textInput width_205" id="Mobile3" name="Mobile3" value="{{.data.Mobile3}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">短号3：</td>
						<td><input type="text" class="textInput width_205" id="ShortMobile3" name="ShortMobile3" value="{{.data.ShortMobile3}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">办公室电话：</td>
						<td><input type="text" class="textInput width_205" id="Officetel" name="Officetel" value="{{.data.Officetel}}" placeholder="区号-电话号码(-分机号)" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">部门内排序：</td>
						<td><input type="text" class="textInput width_205" id="Userindex" name="Userindex" value="{{.data.Userindex}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">家庭电话：</td>
						<td><input type="text" class="textInput width_205" id="Hometel" name="Hometel" value="{{.data.Hometel}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">传真：</td>
						<td><input type="text" class="textInput width_205" id="Fax" name="Fax" value="{{.data.Fax}}" readonly="readonly">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">是否是领导：</td>
						<td><select id="Leader" name="Leader" disabled="disabled">
							<option value="0" {{if eq .data.Leader 0}}selected="selected"{{end}}>否</option>        
							<option value="1" {{if eq .data.Leader 1}}selected="selected"{{end}}>是</option>
							</select>
						</td>
						<td></td>
					</tr>
				</table>
			</fieldset>
			<input type="hidden" id="Vid" name="Vid" value="{{.data.Vid}}">
      <input type="hidden" id="CustomerId" name="CustomerId" value="{{.data.Cid}}">
      <input type="hidden" id="Id" name="Id" value="{{.data.Id}}">
      <input type="hidden" id="dbUname" name="dbUname" value="{{.data.Uname}}">
      <input type="hidden" id="Level" name="Level" value="{{.data.Level}}">
      <input type="hidden" id="Departid" name="Departid" value="{{.data.Departid}}">
		</form>
	</div>
	<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" />
	</div>
</body>

</html>