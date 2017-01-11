<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="{{.baseurl}}/static/newstyle/css/icon.css" rel="stylesheet" del="single" type="text/css" media="screen"/>
	<script src="{{.baseurl}}/static/newstyle/js/true.validate.js" del="single" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/chinatoenglish.js" del="single" type="text/javascript"></script>
	<link href="{{.baseurl}}/static/newstyle/themes/css/skins/blue.css" rel="stylesheet" type="text/css" media="screen"/>
	<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/themes/css/login.css"/>
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/themes/default/common.css" />
	<link id="tree_table_vsStyle" href="{{.baseurl}}/static/newstyle/themes/css/plugin/vsStyle/jquery.treeTable.css" rel="stylesheet">
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/themes/css/page/websiteManage.css" />
	<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/css/dialog.css" />
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/zTree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/underscore-min.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/pageJS/websiteManage.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/tipwindown/tip.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/artDialog.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/iframeTools.js"></script>
		<script type="text/javascript">
function resetForm(){
	$('#username').val('');
	$('#password').val('');
}
function submitFrom(){

	var username = $('#username').val();
	var password=$('#password').val();
	if(!username){
		alert('提示：请输入用户名！');
		return;
	}
	if(!password){
		alert('提示：请输入密码！'); 
		return;
	}

	document.getElementById('loginForm').submit();
	
}
$(function(){
var page="{{.page}}";
 var signinerr = "{{.signinerr}}";
 if(signinerr !=''){
	alert(signinerr);
 }
});
$(document).ready(function() {
	document.onkeydown = function(e){
    	e = e ? e : window.event;
    	var keyCode = e.which ? e.which : e.keyCode;
    	if(keyCode == 13)
    	{
    		submitFrom();
    	}
    };
});
</script>
  </head>
  <body>
   <div class="topBox">
  <div class="topBox_content">
    <form action="{{.baseurl}}/sign/checkin.do" method="post" id="loginForm">
    <div class="formBox">
        <div>
              <input type="text" class="textInput" value="" placeholder="请输入用户名" id="username" name="username">
             </div>
        <div class="pwdBox">
              <input type="password" class="textInput" value="" placeholder="请输入密码" id="password" name="password">
            </div>  
            <div class="remenberPwd">
              {{if eq .project "2"}}
            <input type="checkbox" name="superadmin" id="superadmin"><label for="superadmin">一级管理员</label>
            {{else}}
             <input type="checkbox" name="superadmin" id="superadmin"><label for="superadmin">超级管理员</label>
            {{end}}
          </div>
        <br>
		 <div class="btnBox"> <a href="#" class="loginBtn" onclick="submitFrom()"></a><a href="#" class="resetBtn" onclick="resetForm()"></a></div>
  </form>
    </div>
  <div style="position:absolute;bottom: 0;width: 100%"><span style="text-align: center;font-size: 12px">版权所有:江苏中威科技软件系统有限公司&nbsp;&nbsp;电话:0513-81550880&nbsp;&nbsp;建议使用IE8.0以上浏览器</span>
  </div>
</div>
  </body>
</html>
