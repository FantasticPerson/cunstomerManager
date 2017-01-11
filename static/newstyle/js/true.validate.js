/**
 * 
 * @param id 标签id{input等}
 * @param tip_id 提示标签id{span}
 * @param name 元素名称{站点名称}
 * @param type 验证类型{0-空值与非法字符，1-正整数，2-邮件，3-中文，4-手机，5-固定电话，6-字母、数字、下划线}
 * @return
 */
function checkError(id,tip_id,name,type){
	var emailPattern=/^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$/g; //邮件
	var nullPattern=/(^\s*)|(\s*$)/g;//空值
	var illegalPattern=/[`~!@$%^&*()+<>?:"{},;']/im; //非法字符
	var numberPattern=/^[1-9]*[1-9][0-9]*$/g;//正整数
	var chinesePattern=/^[\u4e00-\u9fa5]+$/g;//仅中文
	var mobilePattern=/^(13|15)[0-9]{9}$/g;	//手机
	var telPattern=/(\\d{3}-|\\d{4}-)?(\\d{8}|\\d{7})/g;//国内电话
	var namePattern=/^[a-zA-Z0-9_]+$/g;//字母、数字、下划线
	
	var value =$('#'+id).val();
	value=value.replace(nullPattern, "");
	if(value==""){
		showTip(tip_id,name,"不能为空!");
        return false;  
	}else if(illegalPattern.test(value)){
		showTip(tip_id,name,"含有非法字符!");
        return false;     
    }else if(type>0){
    	if(type==1){
    		if(!numberPattern.test(value)){
    			showTip(tip_id,name,"不是正整数!");
    			return false; 
        	}
    	}else if(type==2){
    		if(!emailPattern.test(value)){
    			showTip(tip_id,name,"格式不正确!");
    			return false; 
        	}
    	}else if(type==3){
    		if(!chinesePattern.test(value)){
    			showTip(tip_id,name,"只能为中文!");
    			return false; 
        	}
    	}else if(type==4){
    		if(!mobilePattern.test(value)){
    			showTip(tip_id,name,"格式不正确!");
    			return false; 
        	}
    	}else if(type==5){
    		if(!telPattern.test(value)){
    			showTip(tip_id,name,"格式不正确!");
    			return false; 
        	}
    	}else if(type==6){
    		if(!namePattern.test(value)){
    			showTip(tip_id,name,"只能为字母、数字、下划线!");
    			return false; 
        	}
    	}
    }   
	return true; 
}

function showTip(tip_id,name,error){
	$('#'+tip_id).addClass("formTip");
	$('#'+tip_id)[0].innerHTML=name+error;
}