//_name是包含此文件的<script>的id值
var v = document.getElementById("limit_js");
//下面的name是url中的参数名
var msgId = getUrlParameterAdv("msgId",v.getAttribute('src'));
var ctx = getUrlParameterAdv("ctx",v.getAttribute('src'));

/**
 * 1、限制ip时，发布时，清空正文内容。然后模板里，通过ajax验证ip是否被限制，没有被限制，则返回文章正文。
 * 2、如果栏目对信息阅读做了限制，发布时，清空正文内容。然后模板里，通过ajax验证输入密码是否正确，输入正确，则可以返回文章正文。
 * Created by zab
 */
$(function(){
	if($('#submitPassword').length > 0){
		$('#submitPassword').click(function(){
		    $.ajax({   
		        url : cmsURL + '/messageController/limit.do',
		        type : 'GET',   
		        cache : false,
		        async : false,
		        dataType : 'jsonp',
		        error : function() {  
		            alert('链接异常，请检查网络');
		        },
		        data : {
		            'msgId': msgId,
		            'readPassword' : $('#readPassword').val()
		        },  
		        success : function(result) {
		            if(result.success){
		                $('#cms_limit').empty().append(result.message);
		            }else{
		                alert(result.message);
		            }
		        }
		    });		
		});
	}else{
	    $.ajax({   
	        url : cmsURL + '/messageController/limit.do',
	        type : 'GET',   
	        cache : false,
	        async : false,
	        dataType : 'jsonp',
	        error : function() {  
	            alert('链接异常，请检查网络');
	        },
	        data : {
	            'msgId': msgId
	        },  
	        success : function(result) {
	            if(result.success){
	                $('#cms_limit').empty().append(result.message);
	            }else{
	                alert(result.message);
	            }
	        }
	    });
	}
});