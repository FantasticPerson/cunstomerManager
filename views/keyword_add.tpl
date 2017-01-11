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
				<legend class="legend">敏感词信息</legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<tr>
						<td width="20%" height="35" align="right">敏感词：</td>
						<td width="30%"><input type="text" class="textInput width_205" id="inputKeyword" value=""></td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">替换文字：</td>
						<td><input type="text" class="textInput width_205" id="inputReplace" value="">
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
			onclick="saveKeyword();" value="保存" class="confirmBtn" />
	</div>
</body>
<script type="text/javascript">
function saveKeyword(){
	var inputName=$.trim($('#inputKeyword').val());
     var inputReplace=$.trim($('#inputReplace').val());
     if(inputName==""){
        alert("请输入敏感词！");
        return;
     }
     if(inputName.length>10){
        alert("敏感词长度过长，请重新输入！");
        return;
     }
     if(inputReplace.length>10){
        alert("替换文字长度过长，请重新输入！");
        return;
     }
     inputName= encodeURIComponent(inputName);
     inputReplace = encodeURIComponent(inputReplace);
     var gUrl ='{{.baseurl}}/keyword/create.do?id=0&keyword='+inputName+'&replace='+inputReplace;
              $.ajax({
                type : 'get',
                url : gUrl,
                async : false,
                cache : false,
                dataType : "json",
                success : function (data){			
					if(data.errmsg) {				
					    alert('敏感词已存在！');
					} else if (data.msg) {
					    alert('新增敏感词成功！');
						parent.navTab.reload('{{.baseurl}}/keyword/main.do?page=1',null,"GET");
						parent.dialog.close();
					} else {
					    
					}
                }
              });
}
</script>
</html>