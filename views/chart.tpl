<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/themes/css/reset.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/css/bootstrap/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/css/bootstrap/css/bootstrap-theme.min.css" type="text/css" />
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/css/bootstrap/css/quirk-bootstrap.css"/>
	<link href="{{.baseurl}}/static/newstyle/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="{{.baseurl}}/static/newstyle/themes/css/core_dev.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="{{.baseurl}}/static/newstyle/themes/css/skins/blue.css" rel="stylesheet" type="text/css" media="screen"/>
	<!-- Ztreev3.5 -->
	<script src="{{.baseurl}}/static/newstyle/js/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="{{.baseurl}}/static/newstyle/js/layer/layer.js"></script>
	<script src="{{.baseurl}}/static/newstyle/js/jquery.cookie.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/css/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.core.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.util.date.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.barDrag.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.drag.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.simpletree.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.accordion.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.ui.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.contextmenu.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.tab.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.resize.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.cssTable.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.multiStable.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.stable.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.ajax.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.pagination.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.panel.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.checkbox.js" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.combox.js" type="text/javascript"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/underscore-min.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/pageJS/websiteManage.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/tipwindown/tip.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/artDialog.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/iframeTools.js"></script>
	<script src="{{.baseurl}}/static/newstyle/js/jquery.form.js" type="text/javascript"></script>
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/css/tipswindown.css" type="text/css" media="all" />
	<link href="{{.baseurl}}/static/newstyle/css/icon.css" rel="stylesheet" type="text/css" media="screen"/>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/checkButton.js"></script>
	<link id="tree_table_vsStyle" href="{{.baseurl}}/static/newstyle/themes/css/plugin/vsStyle/jquery.treeTable.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/themes/css/page/websiteManage.css" />
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/plugin/jquery.treeTable.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/pageJS/websiteManage.js"></script>
	
	
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/themes/default/common.css" />
   	<link id="tree_table_vsStyle" href="{{.baseurl}}/static/newstyle/themes/css/plugin/vsStyle/jquery.treeTable.css" rel="stylesheet">
	<link rel="stylesheet" href="{{.baseurl}}/static/newstyle/themes/css/page/websiteManage.css" />
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/extend.js"></script>
    <script src="{{.baseurl}}/static/newstyle/js/dwz/dwz.navTab.js" type="text/javascript"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/highcharts.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/index.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/plugin/jquery.treeTable.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/pageJS/websiteManage.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/jquery-powerFloat-min.js"></script>
	<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/plugin/jquery.treeTable.js"></script>
	<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/css/dialog.css" />
	<style type="text/css">
		.slh{white-space:nowrap;text-overflow:ellipsis;overflow: hidden;}
	
		.selected {background-color:#7cc5e5;}

		.hovered {background-color:#f2ffea;}
		
		table { width: 98%;border-right: 1px solid #ececec;border-bottom: 1px solid #ececec;}
		
		.gridbody table td{border-left: 1px solid #ececec;border-top: 1px solid #ececec;}
		.gridbody table td.tl{ width: 20%;text-align:right;background:rgba(248,251,255,1);}
		.gridbody td.tri{width: 30%;text-align:left;}
		
	</style>
  </head>
  <body>
  <div id="layout">
<div id="header">
    <div class="logo">
    	<a href="javascript:void(0);"></a>
    </div>
    <div class="headertext">
    	<p>
    		组织单位：{{.vName}}&nbsp;&nbsp;当前用户名：{{.uName}} &nbsp;&nbsp;&nbsp;&nbsp;<span id="time"></span>
    	</p>
    </div>
	 <a href="javascript:changePassword()" class="changePasswordSystem"></a>
     <a href="{{.baseurl}}/sign/checkout.do" class="exitSystem"></a>
     <div class="sitepos">
     	<div class="sitetab">
     		<span>
     			通讯管理
     		</span>
     		<a id="sitelink" href="javascript:void(0);"></a>
     		
     	</div>
     </div>
    </div>


<div id="leftside">
<!------------------------------guide bar---------------------------------->
	<div class="guidewrap">
        <div class="guidecontent">
            <a href="javascript:void(0);" class="arrow uparrow"></a>
            <div class="slidewrap" id="slidewrap">
                <ul id="guideList">
                	<li data-role="2d51091a-3bee-4213-b97b-23996aa84637">
						<a href="javascript:mainClick();">
                        <span class="gkyjx-icon"></span>
						</a>
					</li>
					<li data-role="2d51091a-3bee-4213-b97b-23996aa84637">
						<a href="javascript:contactsClick();">
                        <span class="xxgkzd-icon"></span>
						</a>
					</li>
					<li data-role="2d51091a-3bee-4213-b97b-23996aa84637">
						<a href="javascript:imClick();">
                        <span class="xxgkzn-icon"></span>
						</a>
					</li>
					<li data-role="2d51091a-3bee-4213-b97b-23996aa84637">
						<a href="javascript:roleClick();">
                        <span class="xxgknb-icon"></span>
						</a>
					</li>
					<li data-role="2d51091a-3bee-4213-b97b-23996aa84637">
						<a href="javascript:keywordClick();">
                        <span class="ysqgk-icon"></span>
						</a>
					</li>
					<li data-role="2d51091a-3bee-4213-b97b-23996aa84637">
						<a href="javascript:resigningClick();">
                        <span class="zdgl-icon"></span>
						</a>
					</li>
					<li data-role="2d51091a-3bee-4213-b97b-23996aa84637">
						<a href="javascript:licenseClick();">
                        <span class="rdta-icon"></span>
						</a>
					</li>
                </ul>
            </div>
            <a href="javascript:void(0);" class="arrow downarrow"></a>
        </div>
     </div>
<!------------------------------end---------------------------------------->


</div>
<!-- container -->
<div id="container">
<div id="navTab" class="tabsPage">
<div class="tabsPageHeader">
    <div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
        <ul class="navTab-tab" style="left:0;">
            <li tabid="main" class="main"><a href="javascript:;"><span class="home_icon">我的主页</span></a>
            </li>
        </ul>
    </div>
    <div class="tabsLeft">left</div>
    <!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
    <div class="tabsRight">right</div>
    <!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
    <div class="tabsMore">more</div>
</div>
<ul class="tabsMoreList">
    <li><a href="javascript:;">我的主页</a></li>
</ul>
<div class="navTab-panel tabsPageContent layoutBox">

<!--content-->
<div style="overflow:hidden;height:100%; position:relative;">
        <div class="sitehead">
            <h3>
                我的主页
            </h3>
            <!--<div class="operate">
                <a class="icon_opt sp_opt" href="javascript:checkMsgIndex(0)">
                       <span>
                           审核
                       </span>

                </a>
                <a class="icon_opt plsp_opt" href="javascript:batchCheckIndex(0)">
                        <span>
                            批量审核
                        </span>
                </a>
                <a class="icon_opt delete_opt" href="javascript:deleteMsgIndex(0)">
                       <span>
                           删除
                       </span>
                </a>
            </div>-->
        </div>
        <div class="gridbody" id="dbzx_0" >
            <table border="0" cellspacing="0" cellpadding="0">
			{{if eq .s_level "3"}}
				<tr>
                    <td class="tl">通信录用户</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="" name="" value="{{.empTotal}}" readonly></td>
				</tr>
				<tr>
					<td class="tl">IM用户数</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="" name="" value="{{.total}}" readonly></td>
                </tr>
				<tr>
                    <td class="tl">通信录更新次数</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="" name="" value="{{.version.VersionUptimes}}" readonly></td>
                </tr>
              {{else}}
                <tr>
                    <td class="tl">通信录用户</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="" name="" value="{{.empTotal}}" readonly></td>
					<td class="tl">IM用户数</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="" name="" value="{{.total}}" readonly></td>
                </tr>
				<tr>
                    <td class="tl">通信录更新次数</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="" name="" value="{{.version.VersionUptimes}}" readonly></td>
					<td class="tl">官网地址</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="homeUrl" name="homeUrl" value="{{.version.HomeUrl}}"></td>
                </tr>
				
				<tr>
                    <td class="tl">待办地址</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="thirdUrl" name="thirdUrl" value="{{.version.ThirdUrl}}"></td>
					<td class="tl">OA地址</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="todoUrl" name="todoUrl" value="{{.version.TodoUrl}}"></td>
                </tr>
				<tr>
                    <td class="tl">短信地址</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="smsUrl" name="smsUrl" value="{{.version.SmsUrl}}"></td>
					<td class="tl">水印</td>
					<td class="tri">
						<select id="waterSelect" name="waterSelect"  class="textInput width_205" onchange="waterMarkChange(this)">
                            <option value="1">开</option>
                            <option value="0">关</option>
						</select>
					</td>
                </tr>
				<tr>
                    <td class="tl">敏感词</td>
					<td class="tri">
						<select id="keywordSelect" name="keywordSelect"  class="textInput width_205" onchange="keywordChange(this)">
                            <option value="1">打开</option>
                            <option value="0">关闭</option>
						</select>
					</td>
					<td class="tl">管理员号码</td>
					<td class="tri"><input  class="textInput width_205" type="text" id="phone" name="phone" value="{{.phone}}" ></td>
                </tr>
				<tr>
                    <td class="tl">默认排序</td>
					<td colspan="3" style="text-align:left;">
						<select id="sortSelect" name="sortSelect"  class="textInput width_205" onchange="sortkeyChange(this)">
                            <option value="1" >按拼音</option>
							<option value="0">按部门</option>
						</select>
					</td>
                </tr>
				{{end}}
            </table>
			{{if eq .s_level "3"}}
			{{else}}
            <div class="buttonBar">
				<a class="more" >
					 <input type="submit" onclick="postForm();" value="确认修改" class="confirmBtn" />
				</a>
			</div>
			{{end}}
        </div>
</div>
<!-- end content-->
</div>
</div>
</div>

</div>
<div id="footer">
	<span style="line-height:21px;">
	版权所有：江苏中威科技软件系统有限公司 &nbsp;&nbsp;地址：江苏省南通市工农路5号亚太大厦北楼3层&nbsp;&nbsp;电话：0513-81550880&nbsp;&nbsp;网址：www.trueway.com.cn
	</span>
</div>
<script type="text/javascript">
$(function () {
            DWZ.init("{{.baseurl}}/static/newstyle/dwz.frag.xml", {
                loginUrl: "login_dialog.html", loginTitle: "登录",	// 弹出登录对话框
                pageInfo: {pageNum: "pageNum", numPerPage: "numPerPage", orderField: "orderField", orderDirection: "orderDirection"}, //【可选】
                debug: false,	// 调试模式 【true|false】
                callback: function () {
                    initEnv();
                }
            });
        });
$(function(){
	$(".gridbody tr").hover(function(){
		 $(this).addClass("hover");
		 $(this).siblings().removeClass("hover");
		},function(){
			$(this).removeClass("hover");
			});
	$("#guideList>li").hover(function(){
        $(this).addClass("hover");
    },function(){
        $(this).removeClass("hover");
    });
    setLeftZone();
    $(window).resize(function(){
    	  setLeftZone();
        });
	$("#guideList").nav("#subcontent").init("#subContainer");
	
	hijackATags();
		
	$("#guideList").hover(function(){
		if(document.addEventListener){
			document.addEventListener('DOMMouseScroll',scrollFunc);
		}
		window.onmousewheel = document.onmousewheel = scrollFunc;
	},function(){
		if(document.removeEventListener){
			document.removeEventListener('DOMMouseScroll',scrollFunc);
		}
		window.onmousewheel = document.onmousewheel = "";
	});
	
	function scrollFunc(e){
		e = e || window.event;
		var delta = e.wheelDelta ? e.wheelDelta : e.detail;
		if(parseInt(delta)<0){
			if(e.wheelDelta){
				$(".downarrow").click();
			}else{
				$(".uparrow").click();
			}
		}else{
			
			if(e.wheelDelta){
				$(".uparrow").click();
			}else{
				$(".downarrow").click();
			}
		}
	}
	document.getElementById('time').innerHTML=new Date().toLocaleString();
    setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString();",1000);
});

function hijackATags () {
	var $ctx = $('#subContainer');
	 $ctx.on('click', 'a', function (ev){
		 var target = ev.target || ev.srcElement;
		 var $target = $(target);
		 
		 var url = $target.attr('href');
		 if (url.indexOf('_t=') == -1) {
			 url = $.trim(url);
			 if (url.indexOf('?') >= 0) {
				 url += '&_t=' + +(new Date());
			 } else {
				 url += '?_t=' + +(new Date());
			 }
			 $target.attr('href', url);
		 }else{
			 url = $.trim(url);
			 url = url.substring(0,url.lastIndexOf("_t="))+"_t=" + + (new Date());
			 $target.attr('href', url);
		 }
		 ev.preventDefault();
	 });
	
}
function mainClick(){
        	 $("li[tabid='main']").click();
        }

function contactsClick(){
        	 navTab.openTab('contactsid','{{.baseurl}}/contacts/show.do',{title:'通讯录管理',fresh:false,rel:'contacts'});
        }
function imClick(){
        	 navTab.openTab('imid','{{.baseurl}}/im/main.do',{title:'IM管理',fresh:false,rel:'im'});
        }
function roleClick(){
        	 navTab.openTab('roleid','{{.baseurl}}/role/main.do',{title:'角色管理',fresh:false,rel:'role'});
        }
function keywordClick(){
        	 navTab.openTab('keywordid','{{.baseurl}}/keyword/main.do',{title:'敏感词管理',fresh:false,rel:'keyword'});
        }
function licenseClick(){
        	 navTab.openTab('licenseid','{{.baseurl}}/depart/license.do',{title:'license信息',fresh:false,rel:'license'});
        }
function resigningClick(){
        	 navTab.openTab('resigningid','{{.baseurl}}/contacts/resigning.do',{title:'离职人员',fresh:false,rel:'resigning'});
        }
		
function waterMarkChange(t){
//这边调用ajax
   $.post('{{.baseurl}}/depart/setWater.do?sortKey='+t.value,"{}",function(data){
     if(data==1){
     if(t.value==1){
        $("#waterSelect option").eq(0).attr('selected','true');
      }else{
        $("#waterSelect option").eq(1).attr('selected','true');
      }
        }
    });
}

function keywordChange(t){
//这边调用ajax
   $.post('{{.baseurl}}/depart/setKeyword.do?sortKey='+t.value,"{}",function(data){
     if(data==1){
     if(t.value==1){
        $("#keywordSelect option").eq(0).attr('selected','true');
      }else{
        $("#keywordSelect option").eq(1).attr('selected','true');
      }
        }
    });
}

  function sortkeyChange (t){
    $.post('{{.baseurl}}/contacts/setSort.do?sortKey='+t.value,"{}",function(data){
     if(data == 1){
        if(t.value == 1){
          $("#sortSelect option").eq(0).attr('selected','true');
        }else{
          $("#sortSelect option").eq(1).attr('selected','true');
        }
      }
    });
  }
  
     var markKey="{{.mark}}"
  if(markKey==1){
    $("#waterSelect option").eq(0).attr('selected','true');
  }else{
    $("#waterSelect option").eq(1).attr('selected','true');
  }
     var keywordKey="{{.keyword}}"
  if(keywordKey==1){
    $("#keywordSelect option").eq(0).attr('selected','true');
  }else{
    $("#keywordSelect option").eq(1).attr('selected','true');
  }

   var sortKey="{{.version.PrefixUser}}"
  if(sortKey==1){
    $("#sortSelect option").eq(0).attr('selected','true');
  }else{
    $("#sortSelect option").eq(1).attr('selected','true');
  }

  function postForm(){
      var homeUrl = $('#homeUrl').val();
		var thirdUrl = $('#thirdUrl').val();
		var todoUrl = $('#todoUrl').val();
		var data =  {
		homeUrl : homeUrl,
		thirdUrl : thirdUrl,
		todoUrl : todoUrl
	};
  
	var url = '{{.baseurl}}/chart/updateVersion.do';
	$.post(url, data, function (res){
		postPhone();
	});
  }
  
   function postPhone(){
      var phone = $('#phone').val();
    var url = '{{.baseurl}}/chart/postPhone.do?phone='+phone;  
    $.get(url, '', function (data){
    });
    
  } 
  
  function changePassword(){
	dialog=null;
	dialog = show_by_url('修改密码',"{{.baseurl}}/chart/toChangePwd.do?t="+Math.random()*1000, '550', '230');
}
</script>
  </body>
</html>
