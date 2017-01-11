
//_name是包含此文件的<script>的id值
var v = document.getElementById("visits_js");
//下面的name是url中的参数名
var cmsURL = getUrlParameterAdv("cmsURL",v.getAttribute('src'));

/**
 * 访问统计
 * Created by zab
 */
$(function(){
	try{
		$.getScript('http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js', function(_result){  
			if (remote_ip_info.ret == '1'){
				var visitorCountry = remote_ip_info.country;
				var visitorProvince = remote_ip_info.province;
				var visitorCity = remote_ip_info.city;
				var siteId = '${nr.site.siteId}';
				$.ajax({
					url: cmsURL + "/sysVisitorLogController/visit.do",  
					dataType:'jsonp',
					data:{'visitorCountry' : visitorCountry, 'visitorProvince' : visitorProvince, 'visitorCity' : visitorCity, 'siteId' : siteId}, 
					success:function(result) {  
						if(result.success){
							$('#visitcount').text(result.count);
						}
					}, 
					timeout:3000  
				});  
				
			}
	    });
	}catch(e){
	}
});