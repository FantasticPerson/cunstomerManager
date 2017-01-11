/**
 * Created by Administrator on 14-4-24.
 */
$(function(){
    function adjust(){
        var CH= $(".unitBox").filter(function(){
                return $(this).css("display") == "block";
            }).height(),
         containerHeight = CH ? CH : $(".gxHome").height(),
            departNameH = containerHeight - 10 - 27 - 31 - 31 -2,
            dirNameH=departNameH,
            dpt_tb_wrapH = containerHeight- 10 - 27 -30 -50 -2-2;
        $("#departName").height(departNameH);
        $("#dirName").height(dirNameH);
        $("#dpt_tb_wrap").height(dpt_tb_wrapH);
    }
    adjust();
    var lazyLayout =  _.debounce(adjust, 300);
    $(window).resize(lazyLayout);
    //表格隔行换色
    $(".dpt_tb tbody tr:odd").addClass("bgH");
    //矫正表格最后列边框为实线
});