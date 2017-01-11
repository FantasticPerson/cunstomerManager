//create GUID
;(function() {
  var CHARS = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
 
  Math.uuid = function (len, radix) {
    var chars = CHARS, uuid = [], i;
    radix = radix || chars.length;
    if (len) {
      for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random()*radix];
    } else {
      var r;
      uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
      uuid[14] = '4';
       for (i = 0; i < 36; i++) {
        if (!uuid[i]) {
          r = 0 | Math.random()*16;
          uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
        }
      }
    }  
    return uuid.join('');
  };

  Math.uuidFast = function() {
    var chars = CHARS, uuid = new Array(36), rnd=0, r;
    for (var i = 0; i < 36; i++) {
      if (i==8 || i==13 ||  i==18 || i==23) {
        uuid[i] = '-';
      } else if (i==14) {
        uuid[i] = '4';
      } else {
        if (rnd <= 0x02) rnd = 0x2000000 + (Math.random()*0x1000000)|0;
        r = rnd & 0xf;
        rnd = rnd >> 4;
        uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
      }
    }
    return uuid.join('');
  };

  Math.uuidCompact = function() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
      return v.toString(16);
    });
  };
})();

//格式化时间
;(function(){
    Date.prototype.pattern=function(fmt) {     
        var o = {     
        "M+" : this.getMonth()+1, //月份     
        "d+" : this.getDate(), //日     
        "h+" : this.getHours()%12 == 0 ? 12 : this.getHours()%12, //小时     
        "H+" : this.getHours(), //小时     
        "m+" : this.getMinutes(), //分     
        "s+" : this.getSeconds(), //秒     
        "q+" : Math.floor((this.getMonth()+3)/3), //季度     
        "S" : this.getMilliseconds() //毫秒     
        };     
        var week = {     
        "0" : "\u65e5",     
        "1" : "\u4e00",     
        "2" : "\u4e8c",     
        "3" : "\u4e09",     
        "4" : "\u56db",     
        "5" : "\u4e94",     
        "6" : "\u516d"    
        };     
        if(/(y+)/.test(fmt)){     
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));     
        }     
        if(/(E+)/.test(fmt)){     
            fmt=fmt.replace(RegExp.$1, ((RegExp.$1.length>1) ? (RegExp.$1.length>2 ? "\u661f\u671f" : "\u5468") : "")+week[this.getDay()+""]);     
        }     
        for(var k in o){     
            if(new RegExp("("+ k +")").test(fmt)){     
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));     
            }     
        }     
        return fmt;     
    }
})();

//binddata FOR FORM
;(function($){
    $.fn.bindData = function(opts) {
        
        var defaults = {
            prefix: "",
            data: {}
        };
        var options = $.extend(defaults, opts);
        var bindObj = $(this);
        $.each(options.data, function(key, value){
            if (options.prefix != "") {
                key = options.prefix + "." + key;
            }
            //key = key.toLowerCase();
            var elements = $(bindObj).find("[name='" + key + "']");
            if ($(elements).length == 0) {
                elements = $(bindObj).find("[id='" + key + "']");
            }
            if ($(elements).length == 0) {
                return true;
            }
            var tagName = $(elements)[0].tagName.toLowerCase();
            var type = elements.attr("type");
            if (type == undefined) {
                type = "";
            } else {
                type = type.toLowerCase();
            }
            if (tagName == "input" && type == "radio") {
                $(elements).each(function() {
                    if (this.value == value) {
                        this.checked = true;
                    }
                });
            } else if (tagName == "input" || tagName == "textarea" || tagName == "select") {
                if (((tagName == "input" && type == "checkbox") || tagName == "select") && typeof(value) == "string") {
                    $(elements).val(value.split(","));
                    //初始化小区楼栋和楼层
                    if($(elements).attr('id')=='xqmc'){
                        var s=$(elements).find('option:selected');
                        var ldhm=$(s).attr('data-ldhm'),zdhh=$(s).attr('data-zdhh'),zglc=$(s).attr('data-zglc');
                        $('#xqldbox').html(createXqldbox(ldhm));
                        $('#xqwsbox').html(createXqwsbox(zdhh,zglc));
                        $('#xqld').val(options.data.xqld);
                        $('#xqws').val(options.data.xqws);
                    }
                } else {
                    if(type=="date"){
                        $(elements).val(value.substr(0,10));
                    }else{
                        $(elements).val(value);
                    }
                }
            } else {
                $(elements).html(value);
            }
            return true;
        });
    };

    $.fn.bindDivData = function(opts) {
        var defaults = {
            prefix: "",
            data: {}
        };
        var options = $.extend(defaults, opts);
        var bindObj = $(this);
        $.each(options.data, function(key, value){
            if (options.prefix != "") {
                key = options.prefix + "." + key;
            }
            $('#'+key,bindObj).html(value);
            return true;
        });
    };

})(jQuery);


function getQueryString(name)
{
    // 如果链接没有参数，或者链接中不存在我们要获取的参数，直接返回空
    if(location.href.indexOf("?")==-1 || location.href.indexOf(name+'=')==-1)
    {
        return '';
    }
 
    // 获取链接中参数部分
    var queryString = location.href.substring(location.href.indexOf("?")+1);
 
    // 分离参数对 ?key=value&key2=value2
    var parameters = queryString.split("&");
 
    var pos, paraName, paraValue;
    for(var i=0; i<parameters.length; i++)
    {
        // 获取等号位置
        pos = parameters[i].indexOf('=');
        if(pos == -1) { continue; }
 
        // 获取name 和 value
        paraName = parameters[i].substring(0, pos);
        paraValue = parameters[i].substring(pos + 1);
 
        // 如果查询的name等于当前name，就返回当前值，同时，将链接中的+号还原成空格
        if(paraName == name)
        {
            return unescape(paraValue.replace(/\+/g, " "));
        }
    }
    return '';
}

function formStringToObject(string){
  var s=string.split('&'),
        i=0,l=s.length;
    var json={};
    for(i;i<l;i++){
        var il=s[i].indexOf('=');
        json[s[i].substr(0,il)]=s[i].substr(il+1);
    }
    return json;
}

function formArrayToObject(formarray){
  var s=formarray,
        i=0,l=s.length;
    var json={};
    for(i;i<l;i++){
        if(json[s[i]['name']]){
             if(json[s[i]['name']]==''||json[s[i]['name']]==null){
                if(s[i]['value']){
                    json[s[i]['name']]=s[i]['value'];
                }else{
                    json[s[i]['name']]='';
                }
            }else{
                if(s[i]['value']) json[s[i]['name']]=json[s[i]['name']]+','+s[i]['value'];
            }
        }else{
           json[s[i]['name']]=s[i]['value'];
        }
    }
    return json;
}

function subString(str, len, hasDot){ 
    var newLength = 0; 
    var newStr = ""; 
    var chineseRegex = /[^\x00-\xff]/g; 
    var singleChar = ""; 
    var strLength = str.replace(chineseRegex,"**").length; 
    for(var i = 0;i < strLength;i++) 
    { 
        singleChar = str.charAt(i).toString(); 
        if(singleChar.match(chineseRegex) != null) 
        { 
            newLength += 2; 
        }     
        else 
        { 
            newLength++; 
        } 
        if(newLength > len) 
        { 
            break; 
        } 
        newStr += singleChar; 
    } 
     
    if(hasDot && strLength > len) 
    { 
        newStr += "..."; 
    } 
    return newStr; 
} 