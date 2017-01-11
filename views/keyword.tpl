<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <title>中威通讯管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="{{.baseurl}}/static/newstyle/css/icon.css" rel="stylesheet" del="single" type="text/css" media="screen"/>
	<script src="{{.baseurl}}/static/newstyle/js/true.validate.js" del="single" type="text/javascript"></script>
	<script src="{{.baseurl}}/static/newstyle/js/chinatoenglish.js" del="single" type="text/javascript"></script>
	<style type="text/css">
		#inputdiv{
			opacity: 1;
			position: fixed;
			top: -1000px;
			right: 0;
			bottom: 0;
			left: 0;
			z-index: 9999;
			display: block;
			overflow: auto;
			overflow-y: scroll;		  
		}
		.modal-backdrop {z-index:-9999;}
	</style>
  </head>
  <body>
  	<form id="pagerForm" name="pagerForm" method="get" action="">
		<input type="hidden" name="pageNum" id="pageNum" value="{{.page}}" /> 
		<input type="hidden" name="numPerPage" value="30" />
	</form>

<div class="releasecontainer">
<div class="sitecontent fl" style="width: 99%;">
<div class="sitehead">
    <h3>
        敏感词管理
    </h3>
</div>
<div class="opwrap">
<div class="siteoperate" id="check_list_opr">
    <div class="siteoperate-left">
		<a class="icon_opts add_opt" id="xxgl-sh" href="javascript:toAdd_keyword_list();">
                    <span>
                       新增
                    </span>
        </a>
        <a class="icon_opts modify_opt" id="xxgl-sh" href="javascript:toEdit_keyword_list();">
                    <span>
                       编辑
                    </span>
        </a>
        <a class="icon_opts delete_opt" id="xxgl-delete" href="javascript:toDelete_keyword_list();">
                    <span>
                      删除
                    </span>
        </a>
    </div>
</div>
<div class="sitesearch">
    <input value="{{.keywords}}" maxlength="50" class="ipt_search" name="keywords" id="keywords" placeholder="请输入敏感词查询" style="width: 200px;" onkeydown="if(event.keyCode==13){searchKeyword()}"/>
    <a class="magnify-link" href="javascript:searchKeyword();"></a>
</div>

<div class="cb"></div>
</div>
<div class="sitedetail">
<div class="dpt_tb_wrap">
<table class="table site_tb" width="100%" layoutH="157">
    <thead>
            	<tr>
					<th width="40%" style="text-align: center">敏感词</th>
					<th width="40%" style="text-align: center">替换文字</th>
				</tr>
    </thead>
    <tbody>
   {{range $i,$list := .list}} 
   
					<tr onclick="click_keyword_list('{{.Id}}')">
						<td style="text-align: center">{{.KeyWord}}</td>
						<td style="text-align: center">{{.ReplaceWord}}</td>
					</tr>
				{{end}}
    </tbody>
</table>
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

  <script>
  var keyid = null;
  function toAdd_keyword_list(){
	dialog=null;
	dialog= show_by_url('新增敏感词','{{.baseurl}}/keyword/add.do','500','220');
  }
  
  function toEdit_keyword_list(){
	if(keyid==null){
		alert('请选择需要修改的敏感词');
		return;
	}
	dialog=null;
	dialog= show_by_url('修改敏感词','{{.baseurl}}/keyword/edit.do?id='+keyid,'500','220');
  }
  
  function click_keyword_list(id){
	keyid = id
  }
  
  function toDelete_keyword_list(){
	if(keyid==null){
		alert('请选择需要修改的敏感词');
		return;
	}
	if(confirm("确认删除该敏感词吗？")){
			$.ajax({
                type : 'get',
                url : '{{.baseurl}}/keyword/del.do?id='+keyid,
                async : false,
                cache : false,
                success : function (data){			
					navTab.reload('{{.baseurl}}/keyword/main.do?page=1',null,"GET");
                }
              });
			  }
  }
  
  function searchKeyword(){
      keywords=$('#keywords').val();
      // if(keywords!='')
        navTab.reload('{{.baseurl}}/keyword/main.do?page=1&keywords='+keywords,null,"GET");
   }
  $(function(){
    $('#keywords').focus().val(keywords);
    var Project = $('#Project').val(); 
    if(Project == 1 ){
	   $('.qzgl').css('display','block'); 		
	}else if(Project == 2) {    
	}
  });   
  
    var keywords="{{.keywords}}",
    page="{{.page}}",
    pages = "{{.pages}}";
    if(page <= 1){
       $('.previous a').css({
        'background' : '#EEE',
        'color' : '#333'
      }).attr('disabled', 'disabled');

    }else if (page >= pages){
       $('.next a').css({
        'background' : '#EEE',
        'color' : '#333'
      }).attr('disabled', 'disabled');

    } else {
      $('.previous a').removeAttr('disabled');
      $('.next a').removeAttr('disabled');

    }
    
    function gopage(t){
    if((!t && page == 1) || (t && page == pages)){
      return;
    }

    t ? page++ : page--;
      
    if(page<=1) {
    page=1;
    } else if (page > pages) {
    page = pages;
    }
      
    location.href='{{.baseurl}}/keyword/main.do?page='+page+'&keywords='+keywords;
    }
 
  
    //隐藏div
    $("#inputdiv").hide();
    //主键ID
    var mid;
    function searchFn(){
      keywords=$('#keywords').val();
      // if(keywords!='')
        location.href='{{.baseurl}}/keyword/main.do?page=1&keywords='+keywords;
    }
    function entersearch(){
      var event = window.event || arguments.callee.caller.arguments[0];
        if (event.keyCode == 13)
        {
            searchFn();
        }
    } 
	var dialog_title = "添加敏感词";
    function edit(cid,keyword,replace){
       mid=cid
       $('#inputKeyword').val(keyword);
       $('#inputReplace').val(replace);
	   dialog_title = "编辑敏感词"
    $('#dialog_title').html("编辑敏感词");	   
    $("#inputdiv").fadeIn("fast",function(){
	    $(this).animate({'top':'10px'},300);
	});
    }
    function del(cid){
      if(confirm("确认删除该敏感词吗？")){
        location.href='{{.baseurl}}/keyword/del.do?id='+cid;
      }
    }

  $("#close").click(function(){
    $("#inputdiv").animate({'top':'-500px'},300,function(){
	    $(this).fadeOut("slow");
	});
  });

  function addKeyword(){
    mid=0;
    $('#inputKeyword').val("");
    $('#inputReplace').val("");
    $('#dialog_title').html("新增敏感词");
    $("#inputdiv").fadeIn("fast",function(){
	    $(this).animate({'top':'10px'},300);
	});
  }

    /**
   * 提交敏感词处理
   */
  $("#saveWord").click(function(){
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
     var gUrl ='{{.baseurl}}/keyword/create.do?id='+mid+'&keyword='+inputName+'&replace='+inputReplace;
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
					    alert(dialog_title+'成功！');
					} else {
					    
					}
                    //$("#inputdiv").animate({'top':'-500px'},300,function(){$(this).fadeOut("slow");});						
					location = location;
                }
              });
  });
  </script>
</html>
