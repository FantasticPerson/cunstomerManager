<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>中威通讯管理系统</title>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/pageJS/websiteManage.js"></script>
<script src="{{.baseurl}}/static/js/juicer.min.js"></script>
	<style type="text/css">
		#sync_a, #buildSiteIndex{
			margin-left:10px;
		}
	</style>
</head>
<body>
	<table class="table site_tb" id="emps_dept_tb" layoutH="40">
	<thead>
           <tr>
          		 <th style="width:20%">
                     <input type="checkbox" id="idcheckall" name="idcheckall" onclick="allCheck_emp_list()"></span>
                </th>
                <th style="width:30%">
                         姓名
                </th>
				<th style="width:30%">
                         职务
                </th>
                <th style="width:20%">
                     所在角色
                </th>
            </tr>
    </thead>
    <tbody id="emps">
    </tbody>
</table>
<div class="panelBar" id="emp_pagination">
			<div class="pagination"  targetType="navTab" totalCount=""
				numPerPage="" pageNumShown="8"
				currentPage="" isOnclick_pagination=true></div>
			<div class="pages" id="page_emp_list">
			</div>
		</div>
</body>
  <script type="text/template" id="htpl">

          {@each data as it,index}
            <tr onclick="click_emps_list(this,${it.Id})">
             <td style="width:20%"><input type="checkbox" id="${it.Id}_idcheck" name="idcheck" value="${it.Id}"></td>
              <td style="width:30%">${it.Name}</td>
              <td style="width:30%">${it.Job}</td>
              <td style="width:20%">${it.RoleName}</td>
            </tr>
        {@/each}    
  </script>
<script type="text/javascript">
var deptid = "";
var searchWord = "";
var empLevel = "";
var currentPage = 0;
var totalPage = 0;
$(function(){
	initContacts({{.deptid}},{{.keyword}},{{.level}},{{.page}});
	$("#emps_dept_tb").jTable();
	$('.gridScroller', '#emps_dept_list').layoutH($("#emps_dept_list"));
});

function initContacts(id,keywords,level,page){
      q={"id":id,"kwords":keywords,"level":level,"page":page}
	  deptid = id;
	  searchWord = keywords;
	  empLevel = level;
	  currentPage = page;
      $.post('{{.baseurl}}/depart/getcontacts.do',q,function(data){
			totalPage = data.Pages;
			currentPage = data.Page;
          $('#emps').html(juicer(htpl, {"data":data.Emps}));
		  
		  $('.pagination').pagination({divId:"emps_dept_tb",url:'',currentPage:data.Page,totalCount:data.Total,numPerPage:'30',pageNumShown:8,isOnclick_pagination:true});
		  $("li.j-num").click(function(){
			var pagenum = parseInt($(this).find("a").html());
			if(pagenum != currentPage){
				initContacts(deptid,searchWord,empLevel,pagenum);
			}
			});
			$("li.j-prev").click(function(){
				var pagenum = currentPage - 1;
				if(pagenum > 0){
					initContacts(deptid,searchWord,empLevel,pagenum);
				}
			});
			$("li.j-next").click(function(){		
				var pagenum = currentPage + 1;
				
				if(pagenum <= totalPage){
					initContacts(deptid,searchWord,empLevel,pagenum);
				}
			});
			document.getElementById("page_emp_list").innerHTML="<span>共"+data.Pages+"页 / "+data.Total+"条记录</span>";
		  });
}



function clickDicItem(itemStatus,dicCode, itemCode, dicId,itemName,e){
	//获取
	var sfqd = document.getElementById(dicId).innerText;
	parent.itemStatus = itemStatus;
	parent.itemCode = itemCode;
	parent.dic_itemId = dicId;
	parent.dic_itemName = itemName;
	parent.item_sfqd = sfqd;
}

function click_emps_list(emps,empid){
	$(emps).siblings().removeClass("selected");
	$(emps).addClass("selected");
	
	if(!document.getElementById(empid+"_idcheck").checked){
		ids_emp_list.push(document.getElementById(empid+"_idcheck").value);
		document.getElementById(empid+"_idcheck").checked=true;
	}else{
		ids_emp_list.pop(document.getElementById(empid+"_idcheck").value);
		document.getElementById(empid+"_idcheck").checked=false;
	}
	
	parent.empids = ids_emp_list.join(",");
}

var htpl = document.getElementById('htpl').innerHTML;

var ids_emp_list=[];
function allCheck_emp_list(){
	var checks = document.getElementsByName("idcheck");
	if(checks&&checks.length>0){
		ids_emp_list=[];
		for(var i=0;i<checks.length;i++){
			checks[i].checked=document.getElementById("idcheckall").checked;
			if(document.getElementById("idcheckall").checked){
				ids_emp_list.push(checks[i].value);
			}else{
				ids_emp_list.pop(checks[i].value);
			}
		}
	}
	parent.empids = ids_emp_list.join(",");
}
</script>
</html>