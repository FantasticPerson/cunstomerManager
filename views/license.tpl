<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<style type="text/css">
	.licensemain{
	font:19px "Microsoft YaHei";
	color: #fff;
 
	 background: url("{{.baseurl}}/static/images/benpao.gif") top center no-repeat;
	 background-color: #eaeaea;
	margin: 0;
	margin-top:72px;
	padding: 0;
}
.banner{ width:1200px; height:470px; margin:0 auto; margin-bottom: 30px;  position: relative;overflow: hidden;}
.huihua{ height: 178px; width: 485px; background: url("{{.baseurl}}/static/images/20150414huihua.png") top no-repeat; position: absolute; right:100px; top:80px;z-index:100;  padding-left: 31px;}
.shijian{ height: 103px; width:395px; background: url("{{.baseurl}}/static/images/20150414tishi.png") left center no-repeat;  padding:27px 0 0 66px; color: #6a6a6a; font-size: 30px;}
.shijian .sp4{ color: #ff3838;}

.sp1{ color: #6c6868;}
.sp2{color:#000; font-size: 21px;}
.sp3{ background: url("{{.baseurl}}/static/images/20150414dianhua.png") left center no-repeat; color: #42a2df; font-size: 27px; padding-left: 30px;}
.footer{ text-align: center;}
.footer p{ margin-top: 10px;}
</style>	
  </head>
  <body>
	<div class="licensemain"> 
	<div class="banner">
		<div class="huihua">
		<div class="shijian">
			<span>产品许可将在</span>
			<br>
			<span class="sp4">{{.deadTime}}失效</span>
		</div></div></div>
		
	<div class="footer">
		<p>
			<span class="sp1">请联系软件开发商</span>
			&nbsp;
			<span  class="sp2">江苏中威科技软件系统有限公司</span>
		</p>
		<p >
			<span class="sp3">咨询电话：0513-81550800</span>
		</p>
	</div>
</div>	
  </body>
</html>
