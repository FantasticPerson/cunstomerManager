/**
 * Created by Administrator on 14-4-22.
 */
var chart1; // 全局变量
$(function(){
    $("#backlogMenu>a").bind("click",function(){
   // $(".navTab-panel").on("click","#backlogMenu>a",function(){
        var index = $(this).index();
        $(this).siblings().each(function(){
            var index = $(this).index();
            $(this).removeClass("circle"+(index+1)+"_open");
        });
        $(this).addClass("circle"+(index+1)+"_open");
        $(this).parent().css("background-position",(-index*443)+"px 0");
        $(".backLogWrap>div").addClass("none").eq(index).removeClass("none");
    });
    //处理主页切换
//    $("#changeM").bind("click",function(){
//        $(this).parents(".gxHome").remove();
//        return true;
//    });

    /***
     * chart
     */
    chart1 = new Highcharts.Chart({
        chart: {
            renderTo: 'chartContainer',
            defaultSeriesType: 'spline'
        },
        colors:[
                '#df6972','#f8d487'
                ]
        ,
        title: {
            text: '统计中心'
        },
        xAxis: {
            categories: ['一月', '二月', '三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
        },
        yAxis: {
            title: {
                text: ''
            }
        },
        series: [{
            name: '产量',
            data: [100,110,200,240,460,600,700,600,500,400,300,200]
        },
    {
        name: '金额',
            data: [140,160,200,240,460,600,700,600,400,400,300,600]
    }],
        credits :{
            enabled:false
        }
    });

});