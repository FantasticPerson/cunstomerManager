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
  <style>
      .pager li>a:hover,.pager li>a:focus {background:#FFF;}
  </style>
  </head>
  <body>
    <header class="navbar navbar-inverse navbar-fixed-top" role="banner">
  <div class="container">
    <div style="color:#FFF;height:30px;line-height:30px;font-size:12px;"><span>组织单位：{{.vName}}</span><span style="margin-left:10px;">当前用户名：{{.uName}}</span></div>
    <div class="navbar-header">
      <a href="{{.baseurl}}" class="navbar-brand" id="logo"><i class="fa fa-cloud"></i>TrueIM Cloud</a>
    </div>
    <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
      <ul class="nav navbar-nav">
        <li>
          <a class="active" href="{{.baseurl}}/chart/main.do"><i class="fa fa-bar-chart-o"></i> 组织信息</a>
        </li>
        <li>
          <a href="{{.baseurl}}/depart/show.do"><i class="fa fa-book"></i> 通讯录管理</a>
        </li>
        <li>
          <a href="{{.baseurl}}/im/main.do"><i class="fa fa-comments-o"></i> IM管理</a>
        </li>
         <li>
          <a href="{{.baseurl}}/role/main.do"><i class="fa fa-comments-o"></i> 角色管理</a>
        </li>
        {{if eq .project "2"}}
          <li class="qzgl" style="display:none;">
        {{else}}
          <li class="qzgl">
        {{end}}
          <a href="{{.baseurl}}/im/group"><i class="fa fa-comments-o"></i> 群组管理</a>
        </li>
          <li>
              <a href="{{.baseurl}}/keyword/main.do"><i class="fa fa-comments-o"></i>敏感词管理</a>
         </li>
          <li>
              <a href="{{.baseurl}}/depart/license.do"><i class="fa fa-comments-o"></i>license页面</a>
         </li>  
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
          <a href="{{.baseurl}}/sign/checkout.do"><i class="fa fa-power-off"></i> 退出</a>
        </li>
      </ul>
    </nav>
  </div>
  <input type="hidden" id="Project" name="Project" value="{{.project}}">
</header>
  <div class="container bs-docs-container">
      <div class="col-md-8 col-md-offset-2">  
        <hr />
    <div class="row">
          <button id="createGroup" class="btn btn-primary"><i class='glyphicon glyphicon-home'></i> 创建官方群</button>
</div>
          <div class="row">
            <ul class="pager">
              <li class="previous"><a onclick="jumpPage('prev')" href="javascript:;">&larr; 上一页</a></li>
              <li><span class="page">1</span> / <span class="totalPage">1</span></li>
              <li class="next"><a onclick="jumpPage('next')" href="javascript:;">下一页 &rarr;</a></li>
          </ul>
          </div>
        <div class="row">
          <table id="groupTable" class="table table-striped table-bordered table-condensed table-hover">
            <thead>
              <th width='140'>群名称</th>
              <th width='60'>状态</th>
              <th width='120'>群主</th>
              <th width='120'>操作</th>
            </thead>
            <tbody>
              
            </tbody>
          </table>
 </div>

        <div class="row">
          <ul class="pager" >
              <li class="previous"><a onclick="jumpPage('prev')" href="javascript:;">&larr; 上一页</a></li>
              <li><span class="page">1</span> / <span class="totalPage">1</span></li>
              <li class="next"><a onclick="jumpPage('next')" href="javascript:;">下一页 &rarr;</a></li>
          </ul>
        </div>
      </div>
    </div>

    <i id='userList' style="display:none;">
      {{range .allUser}}
         {{.Uuid}},{{.UserRealname}};
      {{end}}
    </i>
    <!-- groupModal for create a new group -->
    <div class="modal fade" id="groupModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                  &times;
                </button>
                <h4 class="modal-title" id='groupModalTitle'>创建官方群</h4>
              </div>
              <div class="modal-body">
                <div class='first-page'>
                  <div class="row">
                    <div class="container">
                      <div class="col-md-2 text-right" style="line-height:30px;">群组名:</div>
                      <div class="col-md-8"><input type="text" class="form-control" placeholder="中威科技"></div>
                    </div>
                  </div>
                  <br>
                  <div class="row">
                    <div class="col-md-2 text-right" style="margin-left:10px;line-height:30px;">创建者:</div>
                    <div class="col-md-4">
                      <input type="text" class="form-control" readonly/>
                      <input type="hidden" name="adminid">
                    </div>
                      
                      <div class="col-md-2"><button class='btn btn-primary choose-user'>选择群主</button></div>
                  </div>
                <hr>
                <div class="row">
                  <div class="container">
                    <div class="col-md-4 pull-right"><button class="btn btn-primary" id="createGroupBtn" type="button">创建</button></div>
                    
                  </div>
                </div>          
                </div>
                <div class="second-page" style="display:none;">
                  <button class='btn btn-primary' onclick='javascript:switchPagePanel()'><i class='glyphicon glyphicon-circle-arrow-left'></i>  返回</button>
                  <hr>
                  <div class="row">
                    <div class="container">
                      <div class='col-md-12'>
                        <input type="text" id='queryInp' class="form-control" placeholder="输入手机号或姓名">
                      </div>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="container">
                      <div class='col-md-12' style='max-height:240px;overflow:auto;'>
                        <table id='userTable' class='table table-striped table-condensed table-bordered table-hover'>
                          <thead>
                            <th>姓名</th>
                            <th>操作</th>
                          </thead>
                          <tbody>
                            
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <!--<div class="row">
                  <div class="container">
                    <div class="col-md-12">
                      <div class='well' readonly>
                        <div id="usersToAdd" style="max-width:600px;overflow-x:auto;"></div>
                      </div>
                    </div>
                  </div>
                </div>-->
              </div>
            

            </div>
          </div>
        </div>
        <!-- Modal for deleting confirmations -->
    {{template "footer.tpl"}}
    <div id="chatVM"></div>
  </body>
  <script src="{{.baseurl}}/static/lib/jquery.js"></script>
  <script src="{{.baseurl}}/static/lib/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="{{.baseurl}}/static/js/swfobject.js"></script> 
  <script type="text/javascript">
   var jumpPage = function(command){
      pageStrategies[command]();
    };
  
    var pageStrategies = {
      'prev' : function (){
        if(TW.Pager.current == 1)return;
        var page = TW.Pager.current-1;
        page = page <= 0 ? 1 : page;
        getGroupInfo(page);
      },
      'next' : function (){
        if(TW.Pager.current == TW.Pager.totalPage)return;
        var page = TW.Pager.current+1;
        page = page >= TW.Pager.totalPage ? TW.Pager.totalPage : page;
        getGroupInfo(page);
      }
    };
  
    function pageCommand (){};
    pageCommand.prototype.execute = function (type){
      pageStrategies[type]();
    }
    // 节流函数
    function throttle (obj, fn) {
      clearTimeout(obj.timerId);
      obj.timerId = setTimeout(function (){
        fn && fn.call(obj);
      }, 500);
    }

    //swfobject工具类函数
    function connect(){
      console.log('connecting');
      var vm = getVM();
      if (vm) {
          vm.CONNECT('admin','admin', "{{.s_host}}","{{.s_port}}",10007);
      }else{
          alert("连接socket服务器失败！");
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
    
    function getVM (vmid) {
      vmid = vmid || 'chatVM';
      return getSwfInstance(vmid);
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
      if(console && console.log){
         v ? console.log(k, v) : console.log(k);
      }
    }

  // getting group infomation from the remote server
    function getGroupInfo(pageNo, records) {
      
      pageNo = pageNo || 1;
      records = records || 20;
      
      var handler = getVM();
      if (handler) {
        handler.GET_ALL_OFFICIAL_GROUP('admin', 1, pageNo, records);
      }
    
    }

    /*
      初始化群信息表格 

     */
    function renderGroupTable () {
      var $tab = $('#groupTable');
      var $tabBody = $tab.find("tbody");
      var fragment = '';

      var groups = TW.GROUP;
      for (var i=0,len=groups.length; i<len; i++) {
        var group = groups[i],
          gid = group['groupId'];
        var stateText = (group['state'] == 0?'关闭':'打开');
        var tr = '<tr>';
          tr += '<td>' + group['groupName'] + '</td>';
          tr += '<td><a href="#" data-groupid='+ gid +' title="群组状态">' + stateText + '</a></td>';
      tr += '<td>' + TW.UserMapping[group['createrId']] + '</td>';
          tr += '<td class="text-center">';
          if (group['state'] == 0) {
            tr += '<button class="btn btn-success btn-xs" data-groupid='+ gid +'>打开群组</button> '
          } else {
            tr += '<button class="btn btn-warning btn-xs" data-groupid='+ gid +'>关闭群组</button> ';
          }
          tr += '</tr>';
        fragment += tr;
      }
      $tabBody.empty().append(fragment);
      $tabBody.find('tr').on('click', 'button', function (){
        var type = $(this).text(),
          groupId = $(this).attr('data-groupid');
        type = $.trim(type);
        if (type === '编辑'){
          editGroup(groupId);
        } else {
          $(this).attr('disabled', 'disabled').html('正在设置');
          if (type === '打开群组') {
            setOfficialGroupState(groupId, 1);
          } else  if (type === '关闭群组') {
            setOfficialGroupState(groupId, 0);
          } else if (type === '删除') {
            if (confirm('确定要进行删除操作吗？')) {
              delGroupByGroupId(groupId);
            }
          }
        }
      });
    }

    window.TW = {};
    window.TW.GROUP = [];
    window.TW.UserMapping = {};
    window.TW.UserList = [];
    window.TW.Pager = {};
    /* 
    解析用户 id 和 name的映射
    */
    function parseUserMapping(){
      var users = $('#userList').html();
      users = $.trim(users);
      if (users) {
        if (users.indexOf(';') >= 0) {
          var userList = users.split(';');
          for (var i=0,len=userList.length; i<len; i++) {
            var user = userList[i];
            if (user.indexOf(',') >= 0) {
              user = user.split(',');
              var id = $.trim(user[0]),
                name = $.trim(user[1]);
              TW.UserMapping[id] = name;
              TW.UserList.push(id);
            }
          }
        }
      }
    }
    function parseGroupList (d, callback) {
    var current = d['iCurPage'],
        pageCount = d['iPageCount'],
        totalCount = d['iTotalCount'];
     

      window.TW.Pager = {
        current : current,
        totalPage : Math.ceil(totalCount / pageCount),
        totalRecords : totalCount
      };

      
      $('.page').html(current);
      $('.totalPage').html(TW.Pager.totalPage);

      // disable 效果
      if (current === 1){
        $('.previous a').css({
          background : '#EEE', color : '#333'
        });
      } else if(current === TW.Pager.totalPage){
        $('.next a').css({
          background : '#EEE', color : '#333'
        });
      } else {

        $('.previous a').css({
          background : '#fff', color : '#000'
        });
        $('.next a').css({
          background : '#fff', color : '#000'
        });
      }


      var lists = d['vGroupInfoList'];
      TW.GROUP = [];
      console.log("LENGTH:"+lists.length);
      for (var i=0,len=lists.length; i<len; i++) {
        (function(currentGroup){
          var state  = currentGroup['iGroupState'],
          isOfficial = currentGroup['iGroupOfficial'],
          groupId    = currentGroup['szGroupID'],
            groupName  = currentGroup['szGroupName'],
            createrId    = currentGroup['szCreaterID'],
        groupUserList = currentGroup['szGroupUserList'];
        
        
       var groupInfo = {};
          groupInfo['state'] = state;
          groupInfo['isOfficial'] = isOfficial;
          groupInfo['groupName'] = groupName;
          groupInfo['createrId'] = createrId;
          groupInfo['groupId'] = groupId;
      groupInfo['groupUserList'] = groupUserList;
          
          TW.GROUP[TW.GROUP.length] = groupInfo;
        })(lists[i]);
      }
      
       renderGroupTable();
    }

  /* 添加新群组成功后，向原表格中添加行 */
  function appendNewGroup (d) {
     
     var $tab = $('#groupTable');
     var $tabBody = $tab.find("tbody");
     var fragment = '';
     var gid    = d['szGroupID'],
       groupName  = d['szGroupName'],
       createrId    = d['szCreaterID'];
    
      var groupInfo = {};
        groupInfo['state'] = 1;
        groupInfo['isOfficial'] = 1;
        groupInfo['groupName'] = groupName;
        groupInfo['createrId'] = createrId;
        groupInfo['groupId'] = gid;
        
        TW.GROUP[TW.GROUP.length] = groupInfo;
      
    var stateText = '打开';
    var tr = '<tr>';
      tr += '<td>' + groupInfo['groupName'] + '</td>';
      tr += '<td><a href="#" data-groupid='+ gid +' title="群组状态">' + stateText + '</a></td>';
      tr += '<td>' + TW.UserMapping[groupInfo['createrId']] + '</td>';
      tr += '<td class="text-center">';
      tr += '<button class="btn btn-warning btn-xs" data-groupid='+ gid +'>关闭群组</button> ';
      tr += '</tr>';
    fragment += tr;
    
    $tabBody.append(fragment);

    $tabBody.find('tr:last-child').on('click', 'button', function (){
      var type = $(this).text(),
          groupId = $(this).data('groupid');
        type = $.trim(type);
        
        if (type === '编辑'){
          editGroup(groupId);
        } else {
          $(this).attr('disabled', 'disabled').html('正在设置');
          if (type === '打开群组') {
            setOfficialGroupState(groupId, 1);
          } else  if (type === '关闭群组') {
            setOfficialGroupState(groupId, 0);
          }
        }
    });
    $('#groupModal').modal('hide');
 
  }
  
  /* 删除群组成功后，原表格中删除该行 */
  function DeleteGroup (d) {
    var $tab = $('#groupTable');
    var $tabBody = $tab.find("tbody"); 
    var gid = d['szGroupID'];
  
  $tabBody.find("tr").each(function(){
      var tabAttr = $(this).find("td:last-child").find("button.btn-danger").attr("data-groupid");
    if(tabAttr === gid){
        $(this).remove();
    }
  });
  
  }  
  /*
  * 设置群状态  1:打开 0:关闭
  */
  function setOfficialGroupState(groupId,stateFlag){
    log(stateFlag);
    var vm = getVM();
  if (vm) {
      vm.SET_OFFICIAL_GROUPSTATE('admin', groupId, stateFlag);
  }   
  }

  /*
   * 设置群状态后， 更新UI
   */

   function updateGroupStatus (d) {

       var gid = d['szGroupID'],
         state = d['iGroupState'],
         stateText = state == 1 ? '打开':'关闭',
         btnAddClassName = state == 1 ? 'btn-warning' : 'btn-success',
         btnRemoveClassName = state == 1 ? 'btn-success' : 'btn-warning',
         btnText = state == 1 ? '关闭群组':'打开群组';
      
        $tab = $('#groupTable');
        $tabBody = $tab.find('tbody');
        $tabBody.find('tr>td>a[data-groupid='+ gid +']').text(stateText);
        var targetBtn = $tabBody.find('tr>td>button[data-groupid='+ gid +']:eq(0)');
        setTimeout(function (){
          targetBtn.removeAttr('disabled').addClass(btnAddClassName).removeClass(btnRemoveClassName).html(btnText);
        }, 1000);
   }

   //删除官方群
   function delGroupByGroupId (groupId){
     var handler = getVM();
     if (handler) {
      log(handler);
      handler.DELETE_OFFICIAL_GROUP('admin',''+groupId);
     }
   }
  /*
  *编辑官方群
  */
  function editGroup (groupId){ 
    var $tab = $('#groupTable');
    var $tabBody = $tab.find("tbody");
    var fragment = '';  

    var groups = TW.GROUP;
    
  }
  /*
  * 创建官方群
  */
  function createOfficialGroup(json){
    var vm = getSwfInstance('chatVM');
    if (vm) {
      var userList  = json['userList'],
          groupName = json['groupName'],
          adminId   = json['adminId'];

      log(json);
      //adminId: 23623697101226146
      
        // 下面参数依次是管理员ID，群主ID，群名称，群头像，组员 ，版本ID
       //log("VERSIONID:" + '{{.vid}}');
       vm.CREATE_OFFICIAL_GROUP('admin', adminId, groupName, '', userList, 1);
    } 
  }


  //
  function switchPagePanel(){
    var $container = $('#groupModal');
    var firstPage = $container.find('.first-page'),
      secondPage = $container.find('.second-page');
    if (firstPage.is(":visible")) {
      firstPage.hide();
      secondPage.show();
    } else {
      secondPage.hide();
      firstPage.show();
    }
  }

  /* 初次加载可添加的用户表格 */
  function initUserPanel(){
    var $container = $('#groupModal');
    var $tabBody = $container.find("table>tbody");
    var $inpName = $container.find('input[type="text"]').eq(1);
    var $inpUid = $container.find('input[name="adminid"]');
    $tabBody.empty();
    var fragment = '';
    for (var userid in TW.UserMapping) {
      var tr  = '<tr>';
        tr += '<td>' + TW.UserMapping[userid] + '</td>';
        tr += '<td><button class="btn btn-xs btn-primary" data-userid="' + userid + '">选择</button></td>';
        tr += '</tr>';
      fragment += tr;
    }
    $tabBody.html(fragment);


    var aBtns = $tabBody.find('button');
    $tabBody.on('click', 'button',function (){

      aBtns.removeClass('btn-success').text('选择');
      $(this).addClass('btn-success').text('已选择');
      
      var userid = $(this).attr('data-userid');
      $inpUid.val(userid);
      $inpName.val(TW.UserMapping[userid]);
    switchPagePanel();
    });

  }



  function getUserList () {
    return TW.UserList;
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
        case 'OnUserLoginSuccess':
            $("#createGroup").removeAttr("disabled");
            getGroupInfo();
            break;
        case 'OnGetAllOfficialGroupDateList':
          //parse group list and display
          var d = JSON.parse(d);
          TW.GROUP.length = 0;
    
          parseGroupList(d, renderGroupTable());
          break;
        case 'OnSetOfficialGroupStateSuccess':
          log('设置成功');
          var d = JSON.parse(d);
          updateGroupStatus(d);
          break;
        case 'OnCreateOfficialGroupSuccess':
       //var d = JSON.parse(d);
          //appendNewGroup(d);
      var page = TW.Pager.current;
          getGroupInfo(page);
      $('#groupModal').modal('hide');
          break;
    case 'OnDeleteOfficialGroupSuccess':
            log('删除成功');    
        var d = JSON.parse(d);
      DeleteGroup(d);
      break;
    case 'OnDeleteOfficialGroupFailed': 
        log('删除失败');
      break;      
        default :
          break;
        }

  }
  function fixTopBar(){
    $('.navbar-fixed-top').css({
      'position' : 'fixed',
      'top' : 0, 'left' : 0
    });
  }
  </script>

  <script type="text/javascript">
      $(function (){
        //log("VERSIONID:" + '{{.vid}}');
        fixTopBar();
        initSWF();
        parseUserMapping();
        initUserPanel();

        //初始化创建群的功能不可用
        $('#createGroup').attr("disabled", "disabled");

        $('#createGroup').on('click', function (){
          $('#groupModal').modal('show');
          $('#createGroupBtn').removeAttr('disabled');
        });

        //选择用户
        $('#groupModal').find('.choose-user').on('click', function (){
          switchPagePanel();
        });

        // 检索功能
        $('#queryInp').on('keyup',function (){
          var val = $(this).val();
          val = $.trim(val);
          throttle(this, function (){
            doSearch(val);
          });
        });
        //在当前panel中检索 keywords
        function doSearch(kw){
          var $tab = $('#userTable');
          var $tabBody = $tab.find('tbody');
          var aTr = $tabBody.find('tr');
          $.each(aTr, function (){
            var oTd = $(this).find('td:eq(0)');
            if (oTd.html().indexOf(kw) >= 0) {
              $(this).show();
            } else {
              $(this).hide();
            }
          });
        }

        $('#createGroupBtn').on('click', function (){
          var $inps = $('#groupModal').find('input[type=text]');
          var groupName = $inps.eq(0).val(),
              adminId = $('#groupModal').find('input[type=hidden]').val();
          if (groupName == '') {
            alert('群组名不能为空!');
            $inps.eq(0).focus();
            return false;
          }
          if (groupName.length>20) {
            alert('群组名不能超过20个字符!');
            $inps.eq(0).focus();
            return false;
          }
          if ($inps.eq(1).val() === '') {
            alert('创建者不能为空，请先选择！');
            $inps.eq(1).focus();
            return false;
          }
          
          //创建官方群
          $(this).attr('disabled', 'disabled');
            var json = {
              'userList'  : getUserList(),
              'adminId'   : adminId,
              'groupName' : groupName 
            };
            createOfficialGroup(json);
      $("input").val('');
        });
      });
  </script>
</html>