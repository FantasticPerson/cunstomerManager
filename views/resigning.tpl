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

<div class="releasecontainer">
<div class="sitecontent fl" style="width: 99%;">
<div class="sitehead">
    <h3>
        离职人员
    </h3>
</div>
<div class="opwrap">
<div class="siteoperate" id="check_list_opr">
    <div class="siteoperate-left">
        <a class="icon_opts ck_opt" id="xxgl-sh" href="javascript:toSee_resigning_list();">
                    <span>
                       查看
                    </span>
        </a>
        <a class="icon_opts delete_opt" id="xxgl-delete" href="javascript:toDelete_resigning_list();">
                    <span>
                      删除
                    </span>
        </a>
    </div>
</div>

<div class="cb"></div>
</div>
<div class="sitedetail">
<div class="dpt_tb_wrap">
<table class="table site_tb" width="100%" layoutH="157">
    <thead>
            	<tr>
					<th width="45%" style="text-align: center">姓名</th>
					<th width="45%" style="text-align: center">职务</th>
				</tr>
    </thead>
    <tbody>
   {{range $i,$emps := .emps}} 
   
					<tr onclick="click_resigning_list('{{.Id}}')">
						<td style="text-align: center">{{.Name}}</td>
						<td style="text-align: center">{{.Job}}</td>
					</tr>
				{{end}}
    </tbody>
</table>
</div>
</div>

</div>
</div>
  </body>

  <script>
  var resigningid = null;
  
  function toSee_resigning_list(){
	if(resigningid==null){
		alert('请选择人员');
		return;
	}
	dialog=null;
	dialog= show_by_url('离职人员信息','{{.baseurl}}/contacts/resigningInfo.do?id='+resigningid,'500','720');
  }
  
  function click_resigning_list(id){
	resigningid = id
  }
  
  function toDelete_resigning_list(){
	if(resigningid==null){
		alert('请选择需要删除的离职人员');
		return;
	}
	if(confirm("确认删除该离职人员吗？")){
			$.ajax({
                type : 'post',
                url : '{{.baseurl}}/contacts/removeResigning.do?id='+resigningid,
                async : false,
                cache : false,
                success : function (data){			
					navTab.reload('{{.baseurl}}/contacts/resigning.do',null,"GET");
                }
              });
			  }
  }
   
  </script>
</html>
