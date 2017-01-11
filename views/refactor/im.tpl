<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap.min.css">
  	<link rel="stylesheet" href="{{.baseurl}}/static/lib/bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/lib/font-awesome/css/font-awesome.min.css">
  	<link rel="stylesheet" href="{{.baseurl}}/static/css/app.css">
    <link rel="stylesheet" href="{{.baseurl}}/static/js/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
  </head>
  <body>
    {{template "header.tpl"}}
    <style>
    .target{
    	background:#2b2b2b;
    	color:#fff;
    }
    </style>
    <div class="container bs-docs-container">
          <!-- Getting started class="col-lg-6" -->
          <div>
            <div class="input-group">
         <input id="keywords" type="text" class="form-control" value="{{.keywords}}" placeholder="请输入姓名或账户名查询"  onkeydown="entersearch()">
              <div class="input-group-btn">
                <button onclick="searchFn();" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><i class="fa fa-search"></i> 搜索</button>
              </div>
            </div>
          </div>
              <div class="btn-group">
              </br>
              <a id="groupMng" onclick="showGroup();" type="button" class="btn btn-primary"> 群组管理</a>
            </div>
          <!-- Getting started ================================================== -->
          <ul class="pager">
            <li class="previous"><a onclick="gopage(false);" href="javascript:;">&larr; 上一页</a></li>
            <li class="next"><a onclick="gopage(true);" href="javascript:;">下一页 &rarr;</a></li>
          </ul>
          <!--
        <div class="btn-group">
          <div class="btn-group">
          <a href="{{.baseurl}}/im/add.do" type="button" class="btn btn-primary"><i class="glyphicon glyphicon-list"></i> 新增用户</a>
        </div>
      </div>-->
      <button id="testBtn" class="btn btn-primary">Ajax</button>
      <div id="testDiv" class="container">

      </div>
          <div id="historybox">
            <table class="table table-striped table-hover table-bordered">
              <thead>
                <tr>
                  <th style="text-align:center;background-color:#ECF0F1;" width="120">用户名</th>
                  <th style="text-align:center;background-color:#ECF0F1;" width="80">昵称</th>
                  <th style="text-align:center;background-color:#ECF0F1;" width="120">登录次数</th>
                  <th style="text-align:center;background-color:#ECF0F1;" width="200">操作</th>
                </tr>
              </thead>
              <tbody>
                {{range .list}}
                    <tr>
                      <td style="text-align:center;" >{{.UserUsername}}</td>
                      <td style="text-align:center;" >{{.UserRealname}}</td>
                      <td style="text-align:center;" >{{.UserSigntimes}}</td>
                      <td style="text-align:center;" >
                      <p><a onclick="edit({{.UserId}})" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="transfer({{.Uuid}})" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 数据迁移</a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="del({{.UserId}})" href="javascript:;"><i class="glyphicon glyphicon-edit"></i>删除</a></p>
                      </td>
                    </tr>
                {{end}}
              </tbody>
            </table>
          </div>
          <ul class="pager">
            <li class="previous"><a onclick="gopage(false);" href="javascript:;">&larr; 上一页</a></li>
            <li class="next"><a onclick="gopage(true);" href="javascript:;">下一页 &rarr;</a></li>
          </ul>
        </div>
        <div id="chatVM"></div>
	<i id='userList' style="display:none;">
		{{range .allUser}}
           {{.Uuid}},{{.UserRealname}};
        {{end}}
	</i>
        <div class="modal fade" id="groupModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
        					&times;
        				</button>
        				<h4 class="modal-title" id='groupModalTitle'>群组管理</h4>
        			</div>
        			<div class="modal-body">
        				ajaxContents
        			</div>
        			<div class="modal-footer">
        				<button class="btn btn-default" type="button">返回</button>
        			</div>
        		

        		</div>
        	</div>
        </div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="{{.baseurl}}/static/js/swfobject.js"></script> 
  <script>  
    var keywords="{{.keywords}}",page="{{.page}}";
    function gopage(t){
      if(t==true){
        page++;
      }else{
        page--;
      }
      if(page<=1) page=1;
      location.href='{{.baseurl}}/im/main.do?page='+page+'&keywords='+keywords;
    }
    function searchFn(){
      keywords=$('#keywords').val();
      // if(keywords!='')
        location.href='{{.baseurl}}/im/main.do?page=1&keywords='+keywords;
    }
    function entersearch(){
      var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13)
        {
            searchFn();
        }
    }
    function edit(cid){
      location.href='{{.baseurl}}/im/edit.do?id='+cid;
    }
    function del(cid){
      if(confirm("确认删除该联系人信息？")){
        location.href='{{.baseurl}}/im/del.do?id='+cid;
      }
    }
    function transfer(uid){
        location.href='{{.baseurl}}/mongo/transfer.do?uid='+uid;
    }


    /**
     * @Author : John.Nong
     * @Email : overkazaf@gmail.com
     * @Date : 2015/3/3 
     */

    /**
     * 委托管理群组事件
     */
     var CURRENT_MODAL_STATE = -1;//当前的modal状态标识
     var GROUP_EVENT = {
     	//待触发的群组操作事件
     	GROUP_LIST : 0,//展示群组列表
     	GROUP_EDIT : 1,//群组编辑
     	GROUP_MEMBER_ADD : 2,//添加群组成员
     	GROUP_MEMBER_LIST : 3
     };
     var WINDOW_CACHED_HTML = {
     	//用于缓存的htmlCode
     	GROUP_LIST : "",
     	GROUP_EDIT : "",
     	GROUP_MEMBER_ADD : "",
     	GROUP_MEMBER_LIST : ""
     }

     var GLOBAL_USERS = {
     	IS_INIT : false,
     	USER_LIST:[],
     	USER_MAPPING : {}
     };

     /**
      * [cacheDispatcher description]
      * @param  {[type]} requestType [description]
      * @return {[type]}             [description]
      * 用于进行htmlCode分发的函数
      */
     function cacheDispatcher(requestType) {
     	var htmlDom = null;
     	switch(requestType) {
     		case 0:
     			htmlDom = WINDOW_CACHED_HTML.GROUP_LIST;
     			break;
     		case 1:
     			htmlDom = WINDOW_CACHED_HTML.GROUP_EDIT;
     			break;
     		case 2:
     			htmlDom = WINDOW_CACHED_HTML.GROUP_MEMBER_ADD;
     			break;
     		case 3:
     			htmlDom = WINDOW_CACHED_HTML.GROUP_MEMBER_LIST;
     			break;
     		default:
     			break;
     	}
     	if (requestType == -1) {
     		$("#groupModal").modal('hide');
     	} else {
     		$("#groupModal").find(".modal-body").html(htmlDom);
     	}
     }


    /**
    * 弹出群管理dialog
    */
    function showGroup(requestType){
    	if (requestType) {
    		cacheDispatcher(requestType);
    	} else {
    		getAllOfficialGroup();
    	}
        
    }

    /**
     * [groupRequest description]
     * @param  {[type]} requestType [description]
     * @return {[type]}             [description]
     * 群组操作的请求统一由这个函数进行分发，看是使用缓存还是重新请求服务端数据
     */
    function groupRequest (requestType) {
     	switch (requestType) {
     		case -1 :
     			$('#groupModal').modal('hide');
     			break;
     		case 0 :
     			showGroup(requestType);
     			break;
     		case 1 :
     			editGroup(requestType);
     			break;
     		case 2 :
     			showGroupMembers(requestType);
     			break;
     		default : 
     			log(requestType);
     			break;
     	}
     }

     function showGroupMembers (requestType) {
     	if (requestType) {
     		$('#groupModal').find('.modal-body').html($(WINDOW_CACHED_HTML.GROUP_MEMBER_ADD).clone(true));
     		--CURRENT_MODAL_STATE;
     	}
     }

    /**
     * Parse Group List and display in the modal
     * 接收回调函数后，解析并展示JSON
     */
    
    function parseGroupList (d) {
    	var d = JSON.parse(d);
    	var lists = d['vGroupInfoList'];
    	
    	var btn = $("<button class='btn btn-primary'>新建官方群</button>"),
    		builtHTML = $("<div class='container'></div>"),
    		gListTable = $("<table class='table table-striped table-condensed'></table>"),
    		tHead = $("<thead><th>群组名</th><th>状态</th><th>操作</th></thead>"),
    		tBody = $("<tbody></tbody>");
	    	btn.bind('click', function (){
	    		createOfficialGroup();
	    	});

	    var editData = {};
    	if (lists.length > 0) {
    		for (var i=0,len=lists.length; i<len;i++) {
    			var item = lists[i],
    				gs = item["iGroupState"];
    			var stateText = gs == 1 ? "打开中" : "关闭中";
    			var aOperate = $("<span state="+ gs +" class='groupControl' gid="+item["szGroupID"]+"></span>");
    				aOperate
    				.append($("<a href='#' class='btn btn-link'>打开</a>"))
    				.append($("<a href='#' class='btn btn-link'>关闭</a>"))
    				.append($("<a href='#' class='btn btn-link'>编辑</a>"));
    			
    			$("<tr></tr>")
    			.append($("<td gid="+item["szGroupID"]+">"+ item["szGroupName"] +"</td>"))
    			.append($("<td width='80'>"+ stateText +"</td>"))
    			.append($("<td width='180'></td>").append(aOperate))
    			.appendTo(tBody);

    			editData[item["szGroupID"]] = item;
    		}
    	}


    	tBody.find('.groupControl').each(function (){
    		$(this).find("a").each(function (index, value){
    			$(this).bind('click', function (){
    				var oParent = $(this).parent();
    				if (index + oParent.attr("state") == 1) {
	    				alert("不需要操作");
	    			} else {
	    				var gid = oParent.attr("gid");
	    				switch(index){
	    					case 0:
	    					case 1:
	    						setOfficialGroupState(gid,1-index);
	    						break;
	    					case 2:
	    						if (WINDOW_CACHED_HTML.GROUP_EDIT != "") {
	    							$('#groupModal').find('.modal-body').html(WINDOW_CACHED_HTML.GROUP_EDIT);
	    							CURRENT_MODAL_STATE = 1;
	    						} else {
	    							getGroupMemberInfo(gid);
	    							//editGroup(editData[gid]);
	    						}
	    						break;
	    				}
	    			}
    			});
    		});
    	});

		gListTable.append(tHead);
		gListTable.append(tBody);

    	builtHTML.append(btn);
    	builtHTML.append(gListTable);

    	//Cached here to reuse when there is no more controls
    	WINDOW_CACHED_HTML.GROUP_LIST = builtHTML;
    	CURRENT_MODAL_STATE = 0;
    	$("#groupModal").find(".modal-body").html(builtHTML);
    	$('#groupModal').modal('show');
    }

    /**
     * [editGroup description]
     * @param  {[type]} groupJSON [description]
     * @return {[type]}           [description]
     * 进入了编辑群组信息的modal，需要根据人员列表生成可供编辑的表格
     */
    function editGroup (groupJSON) {
    	// generate ui
    	var bd = $("#groupModal").find(".modal-body").empty(),
    		builtHTML = $("<div class='container'></div>"),
    		gEditTable = $("<table class='table table-striped table-condensed'></table>"),
    		tHead = $("<thead><th>人员</th><th>操作</th></thead>"),
    		tBody = $("<tbody></tbody>"),
    		lists = groupJSON['szGroupUserList'],
    		btn = $("<button class='btn btn-primary'>新增人员</button>");
    	
    	
    	builtHTML.append(btn);
		gEditTable.append(tHead);
		gEditTable.append(tBody);
    	builtHTML.append(gEditTable); 
    	 
    	WINDOW_CACHED_HTML.GROUP_EDIT = builtHTML;
    	++CURRENT_MODAL_STATE;

    	bd.html(builtHTML);
    }


    /**
     *  使用当使用返回键时，采用系统缓存数据来减少网络延迟
     */
    $("#groupModal").on('shown.bs.modal',function (){
    	modalBack();
    });
    $("#groupModal").on('hidden.bs.modal',function (){
    	$("#groupMng").removeAttr("disabled");
    });
    function modalBack () {
    	var btn = $('#groupModal .modal-footer').find("button");
    	btn.unbind('click');
    	btn.bind('click', function (){
    		groupRequest(--CURRENT_MODAL_STATE);
    	});
    }

  /*
  * 连接通讯服务器
  */
  function connect(){
      var vm = getSwfInstance('chatVM');
    if (vm) {
        vm.CONNECT('admin','admin',"{{.s_host}}","{{.s_port}}",10007);
    }else{
        alert("连接socket服务器失败！");
    }
  }

  function parseUserMapping () {
  	var uList = $('#userList').text();
    var users = uList.split(";");

    for (var i=0,len=users.length; i<len; i++) {
      	var user = $.trim(users[i]).split(",");
      	if(user.length != 2)break;

      	var id = user[0],
      		name = user[1];

      	if (!GLOBAL_USERS.IS_INIT) {
      		GLOBAL_USERS.USER_LIST.push(id);
      		GLOBAL_USERS.USER_MAPPING[id] = name;
      	}
      }
      GLOBAL_USERS.IS_INIT = true;
  }
  /*
  * 创建官方群
  */
  function createOfficialGroup(){
      var vm = getSwfInstance('chatVM');
    if (vm) {
      var members = [];
      for (var userid in GLOBAL_USERS.USER_MAPPING) {
      	members.push("" + userid);
      }
      
      // 下面参数依次是管理员ID，群主ID，群名称，群头像，组员 ，版本ID
       vm.CREATE_OFFICIAL_GROUP('admin','23623697101226146' ,"{{.vname}}",'',members,"{{.vid}}");
    }   
  }
/*
  * 设置群状态  1:打开中 0:关闭中
  */
  function setOfficialGroupState(groupId,stateFlag){
      var vm = getSwfInstance('chatVM');
    if (vm) {
        vm.SET_OFFICIAL_GROUPSTATE('admin', groupId, stateFlag);
    }   
  }

  /**
   * [updateGroupStatus description]
   * @param  {[type]} d [description]
   * @return {[type]}   [description]
   * 
   * 当修改群组状态成功后，更新页面ui
   */
  function updateGroupStatus (d) {
  	var d = JSON.parse(d);
  	var groupId = d["szGroupID"],
  		groupStatus = d["iGroupState"];

  	var bd = $('#groupModal').find(".modal-body");
  	bd.find(".table > tbody > tr").each(function (){
  		var tds = $(this).children("td");
  		var td1 = tds.eq(0);
  		if (td1.attr("gid") == groupId){
  			var td2 = tds.eq(1),
  				td3 = tds.eq(2),
  				txt = groupStatus == 1 ? "打开中" : "关闭中";
  			td2.text(txt);
  			td3.find("span").attr("state", groupStatus);
  		}
  	});
  }

  function getGroupMemberInfo (groupId) {
  	var vm = getSwfInstance('chatVM');
  	//szUserID :String, szGroupID :String
  	vm && vm.GET_GROUP_MEMBER_INFO('admin',groupId);
  }

  function parseGroupUserList (d) {
  	var d = JSON.parse(d);
  	var info = d['groupInfo'];
  	var groupId = info['szGroupID'],
  		createrId = info['szCreaterId'],
  		groupUserList = info['szGroupUserList'];

  	var bd = $("#groupModal").find(".modal-body").empty(),
		builtHTML = $("<div class='container'></div>"),
		gMemberAddTable = $("<table class='table table-striped table-condensed'></table>"),
		tHead = $("<thead><th>人员</th><th>操作</th></thead>"),
		tBody = $("<tbody></tbody>"),
		addNewBtn = $("<button class='btn btn-primary'><i class='glyphicon glyphicon-user'></i>&nbsp;新增人员</button>");
    	
    	var lists = groupUserList["m_V"];

    	if (lists.length > 0){
    		for (var i=0,len=lists.length; i<len;i++) {
    			var userid = lists[i];
    			var btnSelect = $("<span gid="+ groupId +"><button uid="+userid+" class='btn btn-sm btn-danger'><i class='glyphicon glyphicon-trash'></i>&nbsp;删除</button></span>");
    			
    			$("<tr></tr>")
    			.append($("<td>"+ GLOBAL_USERS.USER_MAPPING[userid] +"</td>"))
    			.append($("<td width='180'></td>").append(btnSelect))
    			.appendTo(tBody);
    		}
    	}
    	
    	builtHTML.append(addNewBtn);
    	addNewBtn.bind('click', function (){
    		var arr = [];
    		var members = tBody.find("button");
    		$.each(members, function (){
    			var userid = $(this).attr("uid");
    			arr.push(userid);
    		});
    		showAddMemberList(groupId, arr);
    	});
		gMemberAddTable.append(tHead);
		gMemberAddTable.append(tBody);
    	builtHTML.append(gMemberAddTable); 
    	
    	tBody.find("button").each(function (){
    		$(this).bind('click', function (){
    			var userid = $(this).attr("uid");
    			
    			if (confirm("确定要删除会议成员 " + GLOBAL_USERS.USER_MAPPING[userid] + " 吗?")) {
    				var array = [];
    					array.push(userid);
    				delMemberFromGroup(groupId, array);
    			}
    		});
    	});

    	WINDOW_CACHED_HTML.GROUP_MEMBER_ADD = $(builtHTML).clone(true);
    	++CURRENT_MODAL_STATE;

    	bd.html(builtHTML);
  }

  function delMemberFromGroup (groupId, array) {
  	var vm = getSwfInstance('chatVM');
  	vm && vm.DEL_GROUP_MEMBER('admin', groupId, array)
  }
  function showAddMemberList (groupId, array) {
  	//从GLOBAL_USERS.USER_LIST中删除array成员
  	var lists = getValidMemberArray(GLOBAL_USERS.USER_LIST, array);
  	var bd = $("#groupModal").find(".modal-body").empty(),
		builtHTML = $("<div class='container'></div>"),
		gMemberAddTable = $("<table class='table table-hover table-condensed'></table>"),
		tHead = $("<thead><th>人员</th><th>操作</th></thead>"),
		tBody = $("<tbody></tbody>"),
		query = $("<input class='form-control' placeholder='查询要添加的会议成员'>");

		if (lists.length > 0){
    		for (var i=0,len=lists.length; i<len;i++) {
    			var userid = lists[i];
    			var oSelect = $("<input type='checkbox' uid=" + userid + ">选择");
    			
    			$("<tr></tr>")
    			.append($("<td>"+ GLOBAL_USERS.USER_MAPPING[userid] +"</td>"))
    			.append($("<td width='180'></td>").append(oSelect))
    			.appendTo(tBody);
    		}
    	}
    	
    	query.bind('keyup', function (){
    		var val = $.trim($(this).val());
    		hightlight(val);
    	});
    	function hightlight (v) {
    		var trs = tBody.find("tr");
    		$('#btnSelAll').text('成员全选').val('');



    		
    		trs.each(function (){
    			var flag = $(this).html().indexOf(v) == -1;
    			if (flag) {
    				$(this).hide();
    			} else{
    				$(this).sh
    				ow();
    			}
    		});
    	}
    	builtHTML.append(query);
    	
		gMemberAddTable.append(tHead);
		gMemberAddTable.append(tBody);
    	builtHTML.append(gMemberAddTable);


    	//全选和确定按钮
    	var selectCtl = $("<div class='pull-right'></div>")
    	var btnSelectAll = $("<button id='btnSelAll' class='selall btn btn-link'>成员全选</button>");
    	var btnConfirm = $("<button class='btn btn-success btn-sm'><i class='glyphicon glyphicon-ok'></i>&nbsp;确定添加</button>");
    	selectCtl.append(btnSelectAll).append(btnConfirm);
    	builtHTML.append(selectCtl);
    	

    	btnSelectAll.bind('click', function (){
    		var flag = $(this).val() == '',
    			inps = tBody.find('input[type="checkbox"]');
    		if (flag) {
    			$('#btnSelAll').text('取消全选').val("checked");
    			inps.each(function (){
	    			if ($(this).is(":visible")){
	    				$(this).attr('checked', true);
	    			}
	    		});
    		} else {
    			$('#btnSelAll').text('成员全选').val('');
    			inps.each(function (){
	    			if ($(this).is(":visible")){
	    				$(this).removeAttr('checked');
	    			}
	    		});
    		}
    	});
    	
    	btnConfirm.bind('click', function (){
    		var inps = tBody.find('input[type="checkbox"]'),
    			array = [];
    		$.each(inps, function (){
    			if ($(this).is(":visible") && $(this).prop('checked')) {
    				array.push($(this).attr("uid"));
    			}
    		});
    		if (array.length > 0) {
    			addMemberToGroup(groupId, array);
    		} else {
    			alert("未选择任何成员");
    		}
    	});

    	CURRENT_MODAL_STATE = 3;
    	WINDOW_CACHED_HTML.GROUP_MEMBER_LIST = $(builtHTML).clone(true);
    	bd.html(builtHTML);
  }

  function getValidMemberArray (a, b) {
  	for (var i=0, l1=a.length; i<l1; i++) {
  		for (var j=0, l2=b.length; j<l2; j++) {
  			if (a[i] == b[j]) {
  				a = a.slice(0,i).concat(a.slice(i+1,a.length));
  			}
  		}
  	}
  	return a;
  }
  function addMemberToGroup (groupId, array) {
  	var vm = getSwfInstance('chatVM');
  	log(groupId, array.length);
  	vm && vm.ADD_GROUP_MEMBER('admin', groupId, array);
  }

  function removeUserItemFromList (d) {
  	var d = JSON.parse(d);
  	var delList = d['szDeltedUserList'];
  	var users = delList['m_V'];
  	if (users.length > 0) {
  		//update html dom
  		var tBody = $('#groupModal').find(".table > tbody");
  		for (var i=0, len = users.length; i<len;i++) {
  			var userid = users[i];
  			var targetBtn = tBody.find("button[uid="+userid+"]");
  			var targetTr = targetBtn.parent().parent().parent();
  			targetTr.remove();
  		}
  	}
  }
  /*
  * 获取群列表
  */
  function getAllOfficialGroup(){
    var vm = getSwfInstance('chatVM');
    if (vm) {
        vm.GET_ALL_OFFICIAL_GROUP('admin',1);
    }   
  }

  /*
  * 获取swf
  */
	function getSwfInstance(movieName) { 
		if (navigator.appName.indexOf("Microsoft") != -1) { 
		    return window[movieName]; 
		} else { 
		    return document[movieName]; 
		} 
	} 
  
  function initSWF(){
    console.log("initSWF");
      
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
  	if(console&&console.log){
	   console.log(k, v);
	}
  }

  /*
  * as回调
  */
  function AJ_SWFMSG(t,d){
      log(t, d);
      switch (t) {
      	 case 'onInitSuccess':
      	 	connect();
      	 	break;
      	 case 'login' :
      	 	$("#groupMng").removeAttr("disabled");
      	 	break;
      	 case 'OnGetAllOfficialGroupDateList':
      	 	//parse group list and display
      	 	parseGroupList(d);
      	 	break;
      	 case 'OnSetOfficialGroupStateSuccess':
      	 	updateGroupStatus(d);
      	 	break;
      	 case 'OnCreateOfficialGroupSuccess':
      	 	showGroup();
      	 	break;
      	 case 'OnAddGroupMemberSuccess':
      	 	alert("成功添加群组成员");
      	 	getGroupMemberInfo(JSON.parse(d)['groupInfo']['szGroupID']);
      	 	break;
      	 case 'OnAddGroupMemberFailed':
      	 	log(d);
      	 	break;
      	 case 'OnDelGroupMemberSuccess':
      	 	removeUserItemFromList(d);
      	 	break;
      	 case 'OnDelGroupMemberFailed':
      	 	log(d);
      	 	break;
      	 case 'OnGroupInfoWithMobileSuccess':
      	 	parseGroupUserList(d);
      	 	break;
      	 default :
      	 	break;
      	}

  }

  initSWF();

  $("#groupMng").attr("disabled", true).bind('click', function (){
  	$(this).attr("disabled", true);
  });
  $('#testBtn').on('click', function (){
  		//url 
  		var url = "{{.baseurl}}/role/main.do";
		ajaxHTML($('#testDiv'), url);
	});

	function ajaxHTML (container, url) {
		$.ajax({
			url :, url
			type : "GET",
			dataType : "html",
			success : function (html){
				$(container).replaceWith(html);
			},
			error : function (e){
				console.log(e);
			}
		});
	}
  parseUserMapping();
  </script>
</html>
