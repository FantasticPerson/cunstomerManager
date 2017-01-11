$.fn.nav = function(relate){
    var root = this,
        subwrap = typeof relate == "object" ? relate : $(relate),
        hideSuper = true,
        hideSub = true;
    return me ={
        init:function(content){
            this.content = typeof  content == "object" ? content :$(content);
            this.initSub();
            this.bindSuperHover();
            this.bindSubHover();
        },
        initSub:function(){
        this.content.children().addClass("none");
        subwrap.addClass("none");
    },
        bindSuperHover:function(){
            var _self = this;
        $(root).find("a").each(function(){
            $(this).hover(function(){
                hideSuper = false;
                var subid = $(this).parent().attr("data-role");
                _self.showSub($(this).parent(),subid);
            },function(){
                hideSuper =true;
                setTimeout(function(){
                    if(hideSuper && hideSub){
                        hideSubWindow();
                    }
                },200);

            });
        });
        function hideSubWindow(){
            subwrap.addClass("none");
        }
    },
        bindSubHover:function(){
        var _self = this;
        subwrap.hover(function(){
            hideSub = false;
        },function(){
            hideSub = true;
            setTimeout(function(){
                if(hideSuper && hideSub){
                    hideSubWindow();
                }
            },200)
        });
        function hideSubWindow(){
            subwrap.addClass("none");
        }
    },
        showSub:function(superobj,id){
        var superL = superobj.offset().left,
            superT = superobj.children("a").offset().top,//高度用a标签来计算，因为要与a标签对其
            superW = superobj.width(),
            superH = superobj.height(),
            ot = superobj.position().top,
            mt = parseInt($(root).css("margin-top"),10),
            ft =29,
            t = 0;
            subwrap.removeClass("none");
            this.content.children().addClass("none").filter("#"+id).removeClass("none");
            subH = subwrap.height();
            t = $(window).height() - ft - subH;
            //边值判断
            if(superT + subH > $(window).height() -29){ //29为底部的高度，默认不遮住底部
            	subwrap.removeAttr("style");
                subwrap.css({
                    height:"auto",
                    left:superL + superW +"px",
                    top:t + "px" //87为头部高度，30为箭头和margin-top高度
                });
                //小三角判断
                var triH = superT -subwrap.offset().top;
                    $("#triangle").css("top",triH+"px");
            }else{
                subwrap.removeAttr("style");
            subwrap.css({
            left:superL + superW +"px",
            top:superT+"px" //87为头部高度，30为箭头和margin-top高度
        });
                $("#triangle").css("top","41px");
            }
            if(Math.abs(ot - Math.abs(mt)) < superH && Math.abs(ot - Math.abs(mt))!=0){
            	 $("#triangle").css("top",Math.abs(ot - Math.abs(mt)) + "px");
            }
            
    }
    }
};

$(function(){
    $(".arrow").bind("click",function(){
        if($("#guideList").is(":animated")) return;
        var mt = parseInt($("#guideList").css("marginTop")),tomt;
        if($(this).hasClass("uparrow")){
             tomt =mt + 101 >= 0 ? 0 :mt + 101;
            $("#guideList").animate({"margin-top":tomt + "px"},300);
        }else if($(this).hasClass("downarrow")){
            var limitMT = $("#guideList").height() - $("#slidewrap").height();
            tomt = mt -101 < -limitMT ? -limitMT : mt-101;
            $("#guideList").animate({"margin-top":tomt + "px"},300);
        }
    });
    $(".btngroup").hover(function(){
        $(this).addClass("hover");
    },function(){
        $(this).removeClass("hover");
    });
});
//设置左侧可操作区域的高度
function setLeftZone(){
    var win_H =$(window).height();
    var guideH = win_H - 94 -29;//94为头部的高度，29为底部的高度,如果文档高度大于window高度，就不需要减底部高度了
    $(".guidecontent").height(guideH);
    var slideH = guideH - 30 -30;//30为上下箭头的高度
    $("#slidewrap").height(slideH);
}