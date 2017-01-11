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
				<legend class="legend">新建部门</legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<tr>
						<td width="20%" height="35" align="right">上级部门名称：</td>
						<td width="30%"><input type="text" class="textInput width_205" id="pname" name="pname" value="{{.pname}}" readonly></td>
						<td></td>
					</tr>
					<tr>
						<td width="20%" height="35" align="right">部门名称：</td>
						<td width="30%"><input type="text" class="textInput width_205" id="deptName" name="deptName" value=""></td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">部门排序：</td>
						<td><input type="text" class="textInput width_205" id="deptIndex" name="deptIndex" value="">
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
			onclick="saveDept();" value="保存" class="confirmBtn" />
	</div>
</body>
<script type="text/javascript">
function saveDept(){
	var pid=$.trim($('#pid').val());
	var pname=$.trim($('#pname').val());
	var deptName=$.trim($('#deptName').val());
	var deptIndex=$.trim($('#deptIndex').val());
    if(!deptName){
		alert("部门名称不能为空！");
		return;
	}
	var namePattern=/^[\u4e00-\u9fa5a-zA-Z0-9_]+$/g;//字母、数字、下划线
	if(!namePattern.test(deptName)){
		alert("部门名称必须由中文、字母、数字、下划线组成！");
		return;
	}
	var numberPattern=/^[1-9]*[1-9][0-9]*$/g;//正整数
	if(deptIndex){
		if(!numberPattern.test(deptIndex)){
			alert("部门排序必须为正整数！");
			return;
		}
	}
	
    pname= encodeURIComponent(pname);
    deptName = encodeURIComponent(deptName);
	var gUrl = '{{.baseurl}}/depart/create.do?pid='+pid+'&model='+0+'&name='+deptName+'&departIndex='+deptIndex;
	$.get(gUrl, '', function (data){
		if (data == -2) {
            alert('部门名称不能重复!');
            return false;
        }else{
			alert('新增部门成功！');
			parent.navTab.reload('{{.baseurl}}/contacts/show.do',null,"GET");
			parent.dialog.close();
		}
	});

}
</script>
</html>