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
		<form id="dataform" name="dataform" enctype="multipart/form-data" method="post" action="{{.baseurl}}/im/save.do">
			<fieldset>
				<legend class="legend">IM用户信息</legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<tr>
						<td width="20%" height="35" align="right">用户名：</td>
						<td width="30%"><input type="text" class="textInput width_205" id="UserUsername" name="UserUsername" value="{{.data.UserUsername}}" readonly></td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">真实姓名：</td>
						<td><input type="text" class="textInput width_205" id="UserRealname" name="UserRealname" value="{{.data.UserRealname}}" readonly>
						</td>
						<td></td>
					</tr>
					<tr>
		         		<td height="35" align="right">
		         			登录次数：
		         		</td>
		         		<td>
		         			<input type="text" class="textInput width_205" readonly="readonly" id="UserSigntimes" name="UserSigntimes" value="{{.data.UserSigntimes}}" >
		        		 </td>	
		        		 <td></td>
		      		</tr>
					<tr>
		         		<td height="35" align="right">
		         			密码：
		         		</td>
		         		<td>
		         			<input type="password" class="textInput width_205" onKeyUp="value=value.replace(/[^\w\.v]/ig,)" id="UserPassword"  name="UserPassword" value="{{.data.UserPassword}}" >
		        		 </td>	
		         		<td></td>
		      		</tr>
					<tr>
						<td height="35" align="right">识别码：</td>
						<td><input type="text" class="textInput width_205" id="IdCode" name="IdCode" value="{{.data.IdCode}}" ></td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">SIM序列号：</td>
						<td><input type="text" class="textInput width_205" id="Imsi" name="Imsi" value="{{.data.Imsi}}" >
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">mac地址：</td>
						<td><input type="text" class="textInput width_205" id="Mac" name="Mac" value="{{.data.Mac}}" ></td>
						<td></td>
					</tr>
					<tr>
		         		<td height="35" align="right" >
		         			pc端mac地址：
		         		</td>
		         		<td>
		         			<input type="text" class="textInput width_205" id="PcMac" name="PcMac" value="{{.data.PcMac}}" >
                 		</td>
                 		<td>
		         		</td>
		      		</tr>
					<tr>
						<td height="35" align="right" >临时用户</td>
						<td><select id="NameFlag" name="NameFlag" class="textInput width_205">
					      <option value="1" {{if eq .data.NameFlag 1}}selected="selected"{{end}}>是</option>
					      <option value="0" {{if eq .data.NameFlag 0}}selected="selected"{{end}}>否</option>
					  </select></td>
						<td></td>
					</tr>
				</table>
			</fieldset>
			<input type="hidden" id="VersionId" name="VersionId" value="{{.data.VersionId}}">
              <input type="hidden" id="CustomerId" name="CustomerId" value="{{.data.CustomerId}}">
              <input type="hidden" id="ContactsId" name="ContactsId" value="{{.data.ContactsId}}">
              <input type="hidden" id="Level" name="Level" value="{{.data.Level}}">
              <input type="hidden" id="UserId" name="UserId" value="{{.data.UserId}}">
              <input type="hidden" id="Token" name="Token" value="{{.data.Token}}">
              <input type="hidden" id="Uuid" name="Uuid" value="{{.data.Uuid}}">
              <input type="hidden" id="UserIcon" name="UserIcon" value="{{.data.UserIcon}}">
              <input type="hidden" id="State" name="State" value="{{.data.State}}">
              <input type="hidden" id="UserPassword" name="UserPassword" value="{{.data.UserPassword}}">
			  <input type="hidden" id="flagGet" name="flagGet" value="{{.data.NameFlag}}">
		</form>
	</div>
	<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" /> <input type="submit"
			onclick="updateImUser();" value="保存" class="confirmBtn" />
	</div>
</body>
<script type="text/javascript">

function updateImUser(){	
	var password = $('#UserPassword').val();
	if(!(/^[0-9a-zA-Z_]{1,}$/.test(password))){
		 alert("密码由字母，数字，下划线组成，不能全部为数字！");
		  
		  return false;
		}
	 
	 if(password.length<6 || password.length>16){
				 alert("密码长度在6~16之间！");
				 return false;
			}
     if(password.match(/^\d+$/)){
	     alert("密码不能全部为数字！");
		 return false;
	 }	
	$('#dataform').form('submit',{
			url:"{{.baseurl}}/im/save.do",
			onSubmit: function(){
				return $(this).form('validate');
			},success: function(result){
				alert('保存成功');
				parent.navTab.reload('{{.baseurl}}/im/main.do?page=1',null,"GET");
				parent.dialog.close();
			}
		});
	
}
    $(function (){
        var sortKey= $('#flagGet').val();
        if(sortKey==1){
          $("#NameFlag option").eq(0).attr('selected','true');
        }else{
          $("#NameFlag option").eq(1).attr('selected','true');
        }	  
    }); 
 
</script>
</html>