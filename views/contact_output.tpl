<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/zTree/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/jquery.form.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/tipwindown/tip.js"></script>
	<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/css/dialog.css">
	<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/themes/default/style.css">
  </head>
  <body>
    <div class="contentBox">
		<form id="dataform" name="dataform" enctype="multipart/form-data" method="post" action="">
			<input type="hidden" id="pid" name="pid" value="{{.pid}}">
			<fieldset>
				<legend class="legend">版本信息</legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<tr>
						<td width="40%" height="35" align="right">版本名称：</td>
						<td width="60%">
							<input type="text" class="form-control" id="vname" name="VersionName" value="{{.VersionName}}" readonly>
						</td>
						<td></td>
					</tr>
					<tr>
						<td width="40%" height="35" align="right">文件地址：</td>
						<td width="60%">
							 {{if .errmsg}} {{.errmsg}} {{else}} <i class="fa fa-download"></i><a href="{{.vhref}}" target="_blank">{{.VersionName}}</a> {{end}}
						</td>
						<td></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" />
	</div>
  </body>
</html>
