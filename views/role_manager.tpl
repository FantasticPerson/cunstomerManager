<!DOCTYPE html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>中威通讯管理系统</title>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/pageJS/websiteManage.js"></script>
<script src="{{.baseurl}}/static/js/juicer.min.js"></script>
</head>
<body>
	<table class="table site_tb" id="table_role_tb" width="100%"  layoutH="40">
	<thead>
           <tr>
                <th>
                    <div>
                         <span>角色名</span>
                    </div>
                </th>
				<th>
                     <div>
                         <span>用户名</span>
                     </div>
                </th>
            </tr>
    </thead>
    <tbody id="adminTbody">
    </tbody>
</table>
</body>
<script type="text/template" id="roletpl">

          {@each data as it,index}
            <tr onclick="click_role_manager_list(this,${it.Id})">
              <td>${it.RealName}</td>
              <td>${it.UserName}</td>
            </tr>
        {@/each}    
</script>
<script type="text/javascript">

$(function(){
	loadAdminRoleTable();
	$("#table_role_tb").jTable();
	$('.gridScroller', '#table_role_list').layoutH($("#table_role_list"));
});

var roletpl = document.getElementById('roletpl').innerHTML;

function loadAdminRoleTable () {
	var template = $('#adminTbodyTpl').html();
	var $tbody = $('#adminTbody');
	
	$.get('{{.baseurl}}/superadmin/manager.do',function(data){
		$('#adminTbody').html(juicer(roletpl, {"data":data.Data}));
		parent.window.__cache__.data = data.Data;
	});
	
}

function click_role_manager_list(role,adminid){
	$(role).siblings().removeClass("selected");
	$(role).addClass("selected");
	
	parent.adminroleid = adminid;
}
</script>
</html>