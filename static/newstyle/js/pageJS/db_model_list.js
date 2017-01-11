/**
 * Created by Administrator on 14-4-24.
 */
$(function(){
    function adjust(){
        var CH= $(".unitBox").filter(function(){
                return $(this).css("display") == "block";
            }).height(),
            containerHeight =CH? CH : $(".gxHome").height(),
            departSiteH = containerHeight - 10 - 27 - 31 - 30 - 2,
            dptSite_tb1_wrap = containerHeight -10 - 28-1;
        $("#dptSite_tb_wrap").height(departSiteH);
        $("#dptSite_tb1_wrap").height(dptSite_tb1_wrap);
    }
    adjust();
    var lazyLayout =  _.debounce(adjust, 300);
    $(window).resize(lazyLayout);
    //表格隔行换色
    $(".dpt_tb tbody tr:odd").addClass("bgH");
//    $("#treeTable1 tbody>tr").each(function(){
//        var td_first = $(this).children().eq(0),
//            td_second = $(this).children().eq(1),
//            td_third = $(this).children().eq(2),
//            td_forth = $(this).children().eq(3);
//        td_first.css({
//            "width":"170px",
//            "overflow":"hidden"
//        });
//        td_second.css({
//            "width":"318px",
//            "overflow":"hidden"
//        });
//        td_third.css({
//            "width":"107px",
//            "overflow":"hidden"
//        });
//        td_forth.css({
//            "width":"108px",
//            "overflow":"hidden"
//        });
//        return false;
//    });
});