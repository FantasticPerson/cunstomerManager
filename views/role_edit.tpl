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
				<legend class="legend">角色信息</legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<tr>
						<td width="20%" height="35" align="right">角色名：</td>
						<td width="30%"><input type="text" class="textInput width_205" id="RoleName" name="RoleName" value="{{.data.RoleName}}"></td>
						<td></td>
					</tr>
					<tr>
						<td width="20%" height="35" align="right">最低级别：</td>
						<td width="30%"><input type="checkbox"  id="Lower" name="Lower" value="1"></td>
						<td></td>
					</tr>
				</table>
			</fieldset>
			<input type="hidden" id="RoleId" name="RoleId" value="{{.data.RoleId}}">
		</form>
	</div>
	<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" /> <input type="submit"
			onclick="saveRole();" value="保存" class="confirmBtn" />
	</div>
</body>
<script type="text/javascript">
function saveRole(){
	var name = $('#RoleName').val();
        if ($.trim(name) == '') {
          alert('角色名不能为空');
          $('#RoleName').focus();
          return;
        }
	$('#dataform').form('submit',{
			url:'{{.baseurl}}/role/save.do',
			onSubmit: function(){
				return $(this).form('validate');
			},success: function(result){
				var data = eval("("+result+")");
				if(data.errmsg) {				
					    alert(data.errmsg);
					} else if(data.msg){
						alert('保存成功');
						parent.navTab.reload('{{.baseurl}}/role/main.do',null,"GET");
						parent.dialog.close();
					}else {
					    
				}
			}
		});

}

var lower="{{.data.Lower}}";
   if(lower==1){
      $('#Lower').attr("checked",true);
   }
      $('#dataform').on('submit', function (){
        var name = $('#RoleName').val();
        if ($.trim(name) == '') {
          alert('角色名不能为空');
          $('#RoleName').focus();
          return false;
        }
		if(name.length>20){
		  alert("角色名最长20个字符！")
		  return false;
		}
      });
</script>
</html>
