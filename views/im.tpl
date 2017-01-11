<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>中威通讯管理系统</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="{{.baseurl}}/static/newstyle/css/icon.css" rel="stylesheet" del="single" type="text/css" media="screen"/>
		<script src="{{.baseurl}}/static/newstyle/js/true.validate.js" del="single" type="text/javascript"></script>
		<script src="{{.baseurl}}/static/newstyle/js/chinatoenglish.js" del="single" type="text/javascript"></script>
		<!--<link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap-theme.min.css">-->
		<link rel="stylesheet" href="{{.baseurl}}/static/lib/font-awesome/css/font-awesome.min.css">
	</head>
	<body>
		<style>
			.target{
				background:#2b2b2b;
				color:#fff;
			}
			.tabUl {
				padding:0;
				border-bottom:#aebec2 1px solid;
				height:30px;
				overflow:hidden;
			}
			.tabUl li {
				list-style:none;
				padding:0px 20px;
				margin:0px 5px;
				text-align:center;
				border:#aebec2 1px solid;
				border-bottom:none;
				height:30px;
				line-height:30px;
				float:left;
				overflow:hidden;
			}
			.tabUl li.active {
				border-top:3px #4ca4f0 solid;
			}
			.tabUl li a {
				color:#000;
			}
			.tabUl li.active a {
				color:#4ca4f0;
			}
			table.table tbody tr td {
				vertical-align: middle;
				text-align: center;
			}
			.hintForSearch{
				position:absolute;
				right:0px;
				top:0;
				width:320px;
				height:28px;
				line-height:28px;
				color:#aaa;
			}
		</style>
	<form id="pagerForm" name="pagerForm" method="get" action="">
		<input type="hidden" name="pageNum" id="pageNum" value="{{.page}}" /> 
		<input type="hidden" name="numPerPage" value="30" />
		<input type="hidden" name="keywords" value="{{.keywords}}" />
	</form>

<div class="releasecontainer">
<div class="sitecontent fl" style="width: 99%;">
<div class="sitehead">
    <h3>
        IM管理
    </h3>
</div>
<div class="opwrap">
<!--<div class="siteoperate" id="check_list_opr">
    <div class="siteoperate-left">
        <a class="icon_opts modify_opt" id="xxgl-sh" href="javascript:edit_im_list();">
                    <span>
                       编辑
                    </span>
        </a>
        <a class="icon_opts close_opt" id="xxgl-delete" href="javascript:close_im_list();">
                    <span>
                      关闭
                    </span>
        </a>
    </div>
</div>-->
<div class="sitesearch" style="right: 49%;width:49%;">
    <input value="{{.keywords}}" maxlength="50" class="ipt_search" name="keywords" id="keywords" placeholder="请输入账号或姓名查询" style="width: 100%;" onkeydown="if(event.keyCode==13){searchFn()}"/>
    <a class="magnify-link" href="javascript:searchFn();"></a>
</div>
<div style="float: right;position: absolute;right: 20px;top: 4px;width:49%;">
    <input value="{{.markwords}}" maxlength="50" class="ipt_search" name="markwords" id="markwords" placeholder="请输入水印码查询" style="width: 100%;height: 27px;line-height: 27px;display: block;border: 1px solid #ced6e0;padding: 0 27px 0 20px;" onkeydown="if(event.keyCode==13){searchMarkFn()}"/>
	 <span class="hintForSearch">{{.markmsg}}</span>
    <a class="magnify-link" href="javascript:searchMarkFn();"></a>
</div>
<div class="cb"></div>
</div>
<div class="sitedetail">
<div class="dpt_tb_wrap">
        <ul class="tabUl clearfix">
          <li><a href="javascript:bindType_im_list('{{.baseurl}}/im/main.do');">全部</a></li>
          <li><a href="javascript:bindType_im_list('{{.baseurl}}/im/main.do?bind=0');">未绑定</a></li>
          <li><a href="javascript:bindType_im_list('{{.baseurl}}/im/main.do?bind=1');">已绑定</a></li>
		  <li><a href="javascript:bindType_im_list('{{.baseurl}}/im/main.do?bind=2');">白名单</a></li>
		</ul>
		<div id="historybox">
<table class="table site_tb" width="100%" layoutH="157">
    <thead>
            	<tr>
					<th width="10%" style="text-align: center">用户名</th>
					<th width="10%" style="text-align: center">姓名</th>
					<th width="10%" style="text-align: center">登录次数</th>
					<th width="15%" style="text-align: center">识别码</th>
					<th width="15%" style="text-align: center">SIM序列号</th>
					<th width="15%" style="text-align: center">手机端mac地址</th>
					<th width="15%" style="text-align: center">pc端mac地址</th>
					<th width="10%" style="text-align: center">操作</th>
				</tr>
    </thead>
    <tbody>
   {{range .list}} 
					<tr onclick="clickUser_im_list('{{.UserId}}')">
						<td style="text-align: center">{{.UserUsername}}<input type="hidden" value="{{.NameFlag}}" class="NameFlag" /></td>
						<td style="text-align: center">{{.UserRealname}}</td>
						<td style="text-align: center;cursor: pointer;color:blue" onclick="showLoginView('{{.UserUsername}}')">{{.UserSigntimes}}</td>
						<td style="text-align: left;">{{.IdCode}}</td>
						<td style="text-align: center">{{.Imsi}}</td>
						<td style="text-align: center">{{if .Mac}}{{if .Bind}}<i class="fa fa-lg fa-mobile-phone" style="font-size: 24px;"></i>&nbsp;&nbsp;{{.Mac}}&nbsp;&nbsp;<button data-show='{{.Mac}}' class='btn btn-bind btn-success btn-xs' onclick="bind()" data-userid="{{.UserId}}" value="{{.Bind}}" data-name="{{.UserRealname}}">解绑</button>{{else}}<i class="fa fa-lg fa-mobile-phone" style="font-size: 24px;"></i>&nbsp;&nbsp;{{.Mac}}&nbsp;&nbsp;<button data-show='{{.Mac}}' class='btn btn-bind btn-danger btn-xs' onclick="bind()" data-userid="{{.UserId}}" value="{{.Bind}}" data-name="{{.UserRealname}}">绑定</button>{{end}}{{end}}</td>
						<td style="text-align: center">{{if .PcMac}}{{if .PcBind}}<i class="fa fa-lg fa-desktop" style="font-size: 16px;"></i>&nbsp;&nbsp;{{.PcMac}}&nbsp;&nbsp;<button data-show='{{.PcMac}}' class='btn btn-pcbind btn-success btn-xs' onclick="pcbind()" data-userid="{{.UserId}}" value="{{.PcBind}}" data-name="{{.UserRealname}}">解绑</button>{{else}}
						<i class="fa fa-lg fa-desktop" style="font-size: 16px;"></i>&nbsp;&nbsp;{{.PcMac}}&nbsp;&nbsp;<button data-show='{{.PcMac}}' class='btn btn-pcbind btn-danger btn-xs' onclick="pcbind()" data-userid="{{.UserId}}" value="{{.PcBind}}" data-name="{{.UserRealname}}">绑定</button>{{end}}{{end}}</td>
						<td>
                          <button class='btn btn-primary btn-xs' onclick="edit({{.UserId}})"><i class="glyphicon glyphicon-pencil"></i> 编辑</button>
                          {{if .State}}<button class='btn btn-xxx btn-xs' onclick="change()" data-userid="{{.UserId}}" data-uuid="{{.Uuid}}" value="{{.State}}" data-name="{{.UserRealname}}">关闭</button>{{else}}<button class='btn btn-xxx btn-xs' onclick="change()" data-userid="{{.UserId}}" data-uuid="{{.Uuid}}" value="{{.State}}" data-name="{{.UserRealname}}">打开</button>{{end}}
                          </td>
					</tr>
				{{end}}
    </tbody>
</table>
</div>
              <div id="macDiv" style="display:none">
                <table class="" width="100%" layoutH="157">
                  <thead>
                    <tr>
                      <th style="text-align:center;background-color:#ECF0F1;">mac地址</th>     
                      <th style="text-align:center;background-color:#ECF0F1;">操作</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
</div>
</div>
<div class="panelBar">
		   
			<div class="pagination" targetType="navTab" totalCount="{{.rowTotal}}"
				numPerPage="30" pageNumShown="8"
				currentPage="{{.page}}"></div>
			<div class="pages">
		        <span>共{{.pages}}页 /{{.rowTotal}}条记录</span>
		    </div>
	</div>
</div>
</div>    
</body>
<script type="text/javascript">
	var userid = null;
	function clickUser_im_list(id){
		userid = id;
	}

    function showLoginView(id){
        var useMock = true;
        var mockData = [
            {
                "Id": 6,
                "userName": "15151000001",
                "terminalType": "iphone",
                "phoneType": "iphone5s",
                "sysVersion": "9.3.2",
                "appVersion": "32",
                "deviceId": "jfjgjslajklsjdag",
                "times": 2,
                "time": "1484042798"
            },
            {
                "Id": 7,
                "userName": "15151000001",
                "terminalType": "iphone",
                "phoneType": "iphone6s",
                "sysVersion": "9.3.2",
                "appVersion": "32",
                "deviceId": "jfjgjslajklsjdag",
                "times": 2,
                "time": "1484042839"
            }
        ];
        if(!useMock) {
            $.ajax({
                url: '/api/loginTimes',
                type: 'GET',
                data: {username:id},
                dataType: 'json',
                async: false,
                cache: false,
                success: function (msg) {
                    console.log(msg);
                    var data = msg.Data;
                    if (data &&　data.length > 0) {
                        var contentString = getHtmlString(data);
                        layer.open({
                            area:'auto',
                            maxWidth:'1000',
                            maxHeight:'700',
                            type: 1,
                            title: false,
                            closeBtn: 0,
                            shadeClose: true,
                            skin: 'yourclass',
                            content:contentString
                        });
                    }
                }
            });
        } else {
            var contentString = getHtmlString(mockData);
            layer.open({
                area:'auto',
                maxWidth:'1000',
                maxHeight:'700',
                type: 1,
                title: false,
                closeBtn: 0,
                shadeClose: true,
                skin: 'yourclass',
                content:contentString
            });
        }


        function getHtmlString(dataArray){
            var htmlString = "";
            htmlString += '<div style="background-color: white;width:1000px;"><table class="table site_tb" width="1000" layoutH="700">';
            htmlString += '<thead><tr>';
            htmlString += '<th width="10%" style="text-align: center">用户名</th>';
            htmlString += '<th width="10%" style="text-align: center">终端类型</th>';
            htmlString += '<th width="10%" style="text-align: center">具体型号</th>';
            htmlString += '<th width="10%" style="text-align: center">系统版本</th>';
            htmlString += '<th width="10%" style="text-align: center">应用版本</th>';
            htmlString += '<th width="10%" style="text-align: center">设备号</th>';
            htmlString += '<th width="10%" style="text-align: center">使用次数</th>';
            htmlString += '<th width="10%" style="text-align: center">使用时长</th></tr></thead><tbody>';
            for(var i=0;i<dataArray.length;i++){
                var tempString = "<tr>";
                tempString += '<td style="text-align: center">'+dataArray[i].userName+'</td>';
                tempString += '<td style="text-align: center">'+dataArray[i].terminalType+'</td>';
                tempString += '<td style="text-align: center">'+dataArray[i].phoneType+'</td>';
                tempString += '<td style="text-align: center">'+dataArray[i].sysVersion+'</td>';
                tempString += '<td style="text-align: center">'+dataArray[i].appVersion+'</td>';
                tempString += '<td style="text-align: center">'+dataArray[i].deviceId+'</td>';
                tempString += '<td style="text-align: center">'+dataArray[i].userName+'</td>';
                tempString += '<td style="text-align: center">'+dataArray[i].times+'</td></tr>';
                htmlString += tempString;
            }
            htmlString += '</tbody></table></div>';
            return htmlString;
        }
    }
	
	function getQueryString(url, name){
		var i = url.indexOf("?");
		var reg= new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
		var r = url.substring(i+1).match(reg);
        if (r != null) return unescape(r[2]);return null;   
    }
	
	$(function(){
		var param = '{{.bind}}';
		var $tabLi = $('.tabUl li');
		if (param != null&&param!='') {
      
			$tabLi.each(function(index){
				if(index == 0) return;
				var $a = $(this).find('a');
				var hrefStr = $a.attr('href');
				var compStr = hrefStr.substring(hrefStr.indexOf('?')+1);
			
				if(compStr.indexOf("bind="+param) != -1){
				  $tabLi.removeClass('active');
				  $(this).addClass('active');
				  $("#pagerForm").attr("action","{{.baseurl}}/im/main.do?bind="+param);
				}
			});
		} else {
			$("#pagerForm").attr("action","{{.baseurl}}/im/main.do");
			$tabLi.first().addClass('active');
		}
  });
  
	function bindType_im_list(url){
		var param = getQueryString(url, 'bind');
		if (param && param == 2){
			showMac();
		}else{
			$("#pageNum").val("1");
			navTab.reload(url,null,"GET");
		}
	}
  
	function showMac(){
		var $tabLi = $('.tabUl li');
		$tabLi.removeClass('active');
		$($tabLi[3]).addClass('active');
      $('.panelBar').hide();
      $('#historybox').hide();
      $('#macDiv').show();
      var url = '{{.baseurl}}/im/macWhiteList.do'; 
      $.get(url, '', function (v){
          var data = $.parseJSON(v);
          var html ='';
          for(var o in data){
		     html+='<tr>'
             html+='<td>'+data[o].Mac+'</td>'
             if(data[o].State==1){
                 html+="<td><button class='btn btn-bind btn-success btn-xs' onclick='macState("+data[o].Id+")'>"+'弃用'+"</button></td>";
               }else{
                    html+="<td><button class='btn btn-bind btn-danger btn-xs' onclick='macState("+data[o].Id+")'>"+'启用'+"</button></td>";
               }
             html+='</tr>'
          }
          $('#macDiv table tbody').text("");
          $('#macDiv table tbody').append(html);
      });
  }
  function macState(id){
      var url = '{{.baseurl}}/im/macState.do?id='+id; 
      $.get(url, '', function (v){
          showMac();
      });
  }
	function searchFn(){
		$("#pageNum").val("1");
		keywords=$('#keywords').val();
		keywords = $.trim(keywords);
		  
		navTab.reload('{{.baseurl}}/im/main.do?page=1&keywords='+keywords,null,"GET");
    }
	
	function searchMarkFn(){
        keywords=$('#markwords').val();
		keywords = $.trim(keywords);
    
        navTab.reload('{{.baseurl}}/im/main.do?page=1&type=mark&markwords='+keywords,null,"GET");
    }
	
	function edit_im_list(){
		if(userid==null){
			alert('请选择需要修改的用户');
			return;
		}
		dialog=null;
		dialog= show_by_url('IM用户详情','{{.baseurl}}/im/edit.do?id='+userid,'500','420');
	}
	
	function edit(userid){
		dialog=null;
		dialog= show_by_url('IM用户详情','{{.baseurl}}/im/edit.do?id='+userid,'500','420');
	}
	
	function getSwfInstance(movieName) { 
      if (navigator.appName.indexOf("Microsoft") != -1) { 
          return window[movieName]; 
      } else { 
          return document[movieName]; 
      } 
    } 
    
    function getVM (vmid) {
      vmid = vmid || 'chatVM';
      return getSwfInstance(vmid);
    }
	
	function initSWF(){
      
      $('.btn-xxx').attr('disabled', 'disabled');

      var flashvars = {
        };
        
      var params = {
        menu: "false",
        scale: "noScale",
        allowFullscreen: "true",
        allowScriptAccess: "always",
        bgcolor: "",
        wmode: "transparent"
      };
      
      var attributes = {
        id:"chatVM",
        name:"chatVM"
      };
      
      swfobject.embedSWF(
        "{{.baseurl}}/static/main.swf", 
        "chatVM", "0", "0", "10.0.0", 
        "static/expressInstall.swf", 
        flashvars, params, attributes);
    }
    
    /**
     * 控制台log
     */
    function log (k, v) {
      if(console && console.log){
         v ? console.log(k, v) : console.log(k);
      }
    }

    function AJ_SWFMSG(t,d){
      log(t, d);
      switch (t) {
        case 'onInitSuccess':
            connect();
            break;
        case 'login':
            $('.btn-xxx').removeAttr('disabled');
            break;
        case 'OnUserEnableSuccess':
            //实时改变了im用户状态后
            $.get(gUrl, '', function(){
              var className = gStatus == 1 ? 'btn-warning' : 'btn-success';
              $('.btn-current').removeClass('btn-warning').removeClass('btn-success').addClass(className);
              $('.btn-current').val(gStatus).text(gText).removeClass('btn-current');
              alert('成功设置用户状态');
            });
            break;
        default :
          break;
      }
    }
	
	var userPermission = {
      'enable' : function(destId){
        var vm = getVM();
        if (vm) {
          vm.USER_ENABLE('admin', destId, true);
        }
      },
      'disable' : function (destId){
        var vm = getVM();
        if (vm) {
          vm.USER_ENABLE('admin', destId, false);
        }
      }
    };
	
	gUrl = '';
    gText = '打开';
    gStatus = 1;
    function change(e){
      e = e || window.event;
      var target = e.target || e.srcElement;
      var userid = $(target).attr('data-uuid');
      var url = '{{.baseurl}}/im/changeState.do?id='+$(target).attr('data-userid');
      gUrl = url;
      var realname = $(target).attr('data-name');
          var value = $(target).val();
          gStatus = value ^ 1;
          $(target).addClass('btn-current');
          if(value == 1){
            gText = '打开';
          
          if(confirm('确认是否关闭 '+realname+' 的IM权限！')){
              userPermission['disable'](userid);
              //callback
              //window.location.href=url; 
          }
      }else if(value==0) {
          gText = '关闭';
          if(confirm('确认是否打开 '+realname+' 的IM权限！')){
              userPermission['enable'](userid);
             //callback
             //window.location.href=url; 
          }
      }   
    }
	
	function bind(e){
      e = e || window.event;
      var target = e.target || e.srcElement;
      var userid = $(target).attr('data-userid');
    $(target).addClass('btn-current');
      var url = '{{.baseurl}}/im/bind.do?id='+userid;
       $.get(url, '', function(v){
         navTab.reload();
      });
    }

   function pcbind(e){
      e = e || window.event;
      var target = e.target || e.srcElement;
      var userid = $(target).attr('data-userid');
    $(target).addClass('btn-current');
      var url = '{{.baseurl}}/im/pcbind.do?id='+userid;
       $.get(url, '', function(v){
			  navTab.reload();
      });
       
    }
	
</script>
</html>
