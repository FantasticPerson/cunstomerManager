<!DOCTYPE html>
<html>
  <head>
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <style>
    	*{
    		padding: 0;
			margin: 0;
    	}
		
		.err{
			width: 486px;
			height: 527px;
			margin: 0 auto;
			background: url({{.baseurl}}/static/img/errb.png) no-repeat center top;
			position: relative;
		}
		.code{
			position: absolute;
			left: 210px;
			top:186px;
			width: 58px;
			height: 30px;
			line-height: 30px;
			overflow: hidden;
			color: red;
			display: block;
			text-align: center;
		}
		.text{
			padding-top: 270px;
			line-height: 1.5em;
			text-align: center;
		}
		.red{
			color: red;
			font-weight: bold;
		}
    </style>
  </head>
  <body>
  	<div class="err">
  		<strong class="code">{{.errcode}}</strong>
  		<p class="text">{{.errtext}}</p>
  		
  	</div>
  </body>
 </html>