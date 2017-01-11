    // borwserRedirect
		
	String.prototype.startWith=function(str){
		var reg = new RegExp('^'+str);
		return reg.test(this);
	}
	
	String.prototype.endWith=function(str){
		var reg = new RegExp(str+'$');
		return reg.test(this);
	}
	
    function browserRedirect(){
      var sUserAgent = navigator.userAgent.toLowerCase();
      var bIsIpad = sUserAgent.match(/ipad/i) == 'ipad';
      var bIsIphone = sUserAgent.match(/iphone os/i) == 'iphone os';
      var bIsMidp = sUserAgent.match(/midp/i) == 'midp';
      var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == 'rv:1.2.3.4';
      var bIsUc = sUserAgent.match(/ucweb/i) == 'web';
      var bIsCE = sUserAgent.match(/windows ce/i) == 'windows ce';
      var bIsWM = sUserAgent.match(/windows mobile/i) == 'windows mobile';

	  var url = window.location.href;
	  if(url.endWith('/')){
		if(bIsIpad || bIsIphone || bIsMidp || bIsUc7 || bIsUc || bIsCE || bIsWM){
			window.location.href = './index.htm';
		}else{
			window.location.href = './index.html';
		}
	  }else if(url.endWith('.html') && (bIsIpad || bIsIphone || bIsMidp || bIsUc7 || bIsUc || bIsCE || bIsWM)){
		window.location.href = url.substr(0, url.length-5) + '.htm';
	  }else if (url.endWith('.htm') && !(bIsIpad || bIsIphone || bIsMidp || bIsUc7 || bIsUc || bIsCE || bIsWM)){
		window.location.href = url.substr(0, url.length-4) + '.html';
	  }
    }
	
	browserRedirect();
	
