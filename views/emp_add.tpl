<!DOCTYPE html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>中威通讯管理系统</title>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/jquery.form.js"></script>
<script type="text/javascript" src="{{.baseurl}}/static/newstyle/js/tip/tipwindown/tip.js"></script>
<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/css/dialog.css">
<link rel="stylesheet" type="text/css" href="{{.baseurl}}/static/newstyle/themes/default/style.css">
	<style type="text/css">
		#sync_a, #buildSiteIndex{
			margin-left:10px;
		}
	</style>
</head>
<body>
	<div class="contentBox">
		<form id="dataform" name="dataform" enctype="multipart/form-data" method="post" action="">
			<fieldset>
				<legend class="legend">新建联系人</legend>
				<table width="99%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="contentTable">
					<tr>
						<td width="20%" height="35" align="right">IM用户名:</td>
						<td width="30%"><input type="text" class="textInput width_205" id="Uname" name="Uname" value="" ></td>
						<td></td>
					</tr>
					<tr>
						<td width="20%" height="35" align="right">姓名：</td>
						<td width="30%"><input type="text" class="textInput width_205" id="Name" name="Name" value="" placeholder="  --姓名必填"></td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">部门：</td>
						<td><input type="text" class="textInput width_205" id="Depart" name="Depart" value="" readonly placeholder="  --部门必填" onclick="chooseDepart();">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">职位：</td>
						<td><input type="text" class="textInput width_205" id="Job" name="Job" value="" >
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">邮箱：</td>
						<td><input type="text" class="textInput width_205" id="Mail" name="Mail" value="" >
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">手机号码1：</td>
						<td><input type="text" class="textInput width_205" id="Mobile1" name="Mobile1" value="">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">短号1：</td>
						<td><input type="text" class="textInput width_205" id="ShortMobile1" name="ShortMobile1" value="">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">手机号码2：</td>
						<td><input type="text" class="textInput width_205" id="Mobile2" name="Mobile2" value="">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">短号2：</td>
						<td><input type="text" class="textInput width_205" id="ShortMobile2" name="ShortMobile2" value="">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">手机号码3：</td>
						<td><input type="text" class="textInput width_205" id="Mobile3" name="Mobile3" value="">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">短号3：</td>
						<td><input type="text" class="textInput width_205" id="ShortMobile3" name="ShortMobile3" value="">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">办公室电话：</td>
						<td><input type="text" class="textInput width_205" id="Officetel" name="Officetel" value="" placeholder="区号-电话号码(-分机号)">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">部门内排序：</td>
						<td><input type="text" class="textInput width_205" id="Userindex" name="Userindex" value="">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">家庭电话：</td>
						<td><input type="text" class="textInput width_205" id="Hometel" name="Hometel" value="">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">传真：</td>
						<td><input type="text" class="textInput width_205" id="Fax" name="Fax" value="">
						</td>
						<td></td>
					</tr>
					<tr>
						<td height="35" align="right">是否是领导：</td>
						<td><select id="Leader" name="Leader">
							<option value="0">否</option>        
							<option value="1">是</option>
							</select>
						</td>
						<td></td>
					</tr>
				</table>
			</fieldset>
			<input type="hidden" id="Vid" name="Vid" value="{{.data.Vid}}">
      <input type="hidden" id="CustomerId" name="CustomerId" value="{{.data.Cid}}">
      <input type="hidden" id="Id" name="Id" value="{{.data.Id}}">
      <input type="hidden" id="dbUname" name="dbUname" value="{{.data.Uname}}">
      <input type="hidden" id="Level" name="Level" value="{{.data.Level}}">
      <input type="hidden" id="Departid" name="Departid" value="{{.data.Departid}}">
		</form>
	</div>
	<div class="buttonBar">
		<input type="submit" onclick="javascript:parent.dialog.close();"
			value="关闭" class="cancelBtn" /> <input type="submit"
			onclick="doSave();" value="保存" class="confirmBtn" />
	</div>
</body>
<script type="text/javascript">

function doSave(){ 
    var uname = $('#Uname').val();
    var name = $('#Name').val();
    var departId = $('#Departid').val();
    var job = $('#Job').val();
    var mail = $('#Mail').val();
    var mobile1 = $('#Mobile1').val();
    var s_mobile1 = $('#ShortMobile1').val();
    var mobile2 = $('#Mobile2').val();
    var s_mobile2 = $('#ShortMobile2').val();
    var mobile3 = $('#Mobile3').val();
    var s_mobile3 = $('#ShortMobile3').val();
    var officetel = $('#Officetel').val();
    var userindex = $('#Userindex').val();
    var hometel = $('#Hometel').val();
    var fax = $('#Fax').val();
    var leader = $('#Leader').val();
    
    var vid = $('#Vid').val();
    var cid = $('#CustomerId').val();
    var level = $('#Level').val();
    var id = $('#Id').val();
    var leader = $('#Leader').val();
    
     if((uname=="")||($.trim(uname)=="")){
       
     }else{
//      if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(uname))){
 //     alert("对不起,用户名必须为手机号码！");
 //     document.dataform.mobile.focus();
 //     $('#Uname').focus();
 //     return false;
 //    }
     }
 
     if(name==""){
     alert("请输入姓名！");
     return false;
     }
      if($.trim(name)==""){
      alert("姓名不能为空格！");
          return false;
     }
//      if(name.length>5){
//         alert("姓名最长5个字符！")
//         return false;
//       }
     if(departId==""){
     alert("请选择部门！");
     return false;
     }  
//      if(job.length>10){
 //        alert("职位最长10个字符！")
 //        return false;
//       } 
      if(mail && !(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(mail))){
       alert("您的邮件格式不正确！")
     return false;
    } 
      if(mail.length>50){
         alert("邮件最长50个字符！")
         return false;
       }  

//      if(mobile1 && !(/^1[3|4|5|8][0-9]\d{4,8}$/.test(mobile1))){ 
//         alert("手机号码1格式不正确！")
//         return false;
//      }
    
//      if(mobile1.length>11){
//         alert("手机号码1最长11个字符！")
//         return false;
//       }   
      if(s_mobile1 && !(/^\d+$/.test(s_mobile1))){  
         alert("短号1必须为数字！")
         return false;
       }
//      if(mobile2 && !(/^1[3|4|5|8][0-9]\d{4,8}$/.test(mobile2))){ 
//         alert("手机号码2格式不正确！")
 //        return false;
//       }     
//       if(mobile2.length>11){
//         alert("手机号码2最长11个字符！")
//         return false;
//       }
      if(s_mobile2 && !(/^\d+$/.test(s_mobile2))){  
         alert("短号2必须为数字！")
         return false;
       }
//      if(mobile3 && !(/^1[3|4|5|8][0-9]\d{4,8}$/.test(mobile3))){ 
//         alert("手机号码3格式不正确！")
//         return false;
//      }     
 //     if(mobile3.length>11){
 //        alert("手机号码3最长11个字符！")
 //        return false;
//       }
      if(s_mobile3 && !(/^\d+$/.test(s_mobile3))){  
         alert("短号3必须为数字！")
         return false;
       }
//       if(officetel && !(/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(officetel))){
//         alert("办公室电话格式不正确！")
//         return false;
 //      }
 //      if(officetel.length>20){
 //        alert("办公室电话最长20个字符！")
 //        return false;
 //      }     
      if(isNaN(userindex)){
         alert("部门内排序必须为数字！")
         return false;
       }
      if(userindex.length>20){
         alert("部门内排序最长20个字符！")
         return false;
       }
 //      if(hometel && !(/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(hometel))){
//         alert("家庭电话格式不正确！")
 //        return false;
 //      }     
 //      if(hometel.length>20){
 //        alert("家庭电话最长20个字符！")
 //        return false;
 //      }
 //      if(fax && !(/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(fax))){
 //        alert("传真格式不正确！")
  //       return false;
 //      }     
 //      if(fax.length>20){
//         alert("传真最长20个字符！")
 //        return false;
 //      }         
      
      var url = '{{.baseurl}}/depart/save.do';
      var data = {
      'Uname' :uname,
      'Name' : name,
      'DepartId' : departId,
      'Job' : job,
      'Mail' : mail,
      'Mobile1' : mobile1,
      'ShortMobile1' : s_mobile1,
      'Mobile2' : mobile2,
      'ShortMobile2' : s_mobile2,
      'Mobile3' : mobile3,
      'ShortMobile3' : s_mobile3,
      'Officetel' : officetel,
      'Userindex' : userindex,
      'Hometel' : hometel,
      'Fax' : fax,
      'Aletter' : '',
      'Jletter' : '',
      'Uuid' : '',
      'Leader' : leader,
      'Vid' : vid,
      'Cid' :cid,
      'Level':level,
      'Id':id
      };
	  
	  $('#dataform').form('submit',{
			url:url,
			onSubmit: function(){
				return $(this).form('validate');
			},success: function(result){
				var data = eval("("+result+")");
				if(data.errmsg) {				
					    alert(data.errmsg);
					} else if(data.msg){
						alert('保存成功');
						parent.navTab.reload('{{.baseurl}}/depart/show.do',null,"GET");
						parent.dialog.close();
					}else {
					    
				}
			}
		});
    }  
	
	function chooseDepart(){
	
		parent.deptDialog=null;
		parent.deptDialog = show_by_url('选择部门','{{.baseurl}}/depart/departDialog.do', '300', '430');
      
    }
</script>
</html>