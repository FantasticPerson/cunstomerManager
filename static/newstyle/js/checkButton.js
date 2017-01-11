function onloadButton(url, context) {
	// 验证站点下有没有栏目
	$.ajax({
		url : url + '/sysMenuController/getButton.do',
		type : 'POST',
		cache : false,
		async : false,
		error : function() {
			alert('链接异常，请检查网络');
		},
		data : {
		},
		success : function(result) {
			if (result != null && result != '') {
				var res = result.split(',');
				for ( var i = 0; i < res.length; i++) {
					context.find('#' + res[i]).show();
				}
			}

		}
	});
};
function onloadButtons(url,siteId, ids, context) {
	// 验证站点下有没有栏目
	$.ajax({
		url : url + '/sysRoleSiteMenuController/getButton.do',
		type : 'POST',
		cache : false,
		async : false,
		error : function() {
			alert('链接异常，请检查网络');
		},
		data : {
			'siteId':siteId
		},
		success : function(result) {
			if (result != null && result != '') {
				var res = result.split(',');
				for(var j=0;j<ids.length;j++){
					var flag=false;
					for ( var i = 0; i < res.length; i++) {
						if(res[i]==ids[j]){
							flag=true;
							break;
						}
					}
					if(flag){
						context.find('#' + ids[j]).hide();
					}else{
						context.find('#' + ids[j]).show();
					}
				}
			}else{
				for(var j=0;j<ids.length;j++){
					context.find('#' + ids[j]).show();
				}
			}

		}
	})
};
