/**
name:ͼƬ�ֲ�
mial:xuxh@trueway.com.cn
UI:www.trueway.com.cn
**/

(function ($) {
 $.fn.picturePl = function(options) {
 var dft = {
 width:311,//���
 height:201,//�߶�
 proportion:false,//�Ƿ�ȱ������ţ�true | false
 numberWs:16,//��������
 fontSize:12,//���������С:12 | 14 | 16 | 18
 fontBoder:"bold",//�������Ƿ�Ӵ�:bold | normal
 time:3000,//�л�ʱ��
 //��ʽ
 style:'<style>'
 +'.picturePl_img{position:absolute;z-index:10;}' 
 +'.picturePl_btn{background:#85898D;color:#000000;cursor:pointer;font-size:10px;float:left;margin-right:5px;display:block;width:15px;height:15px;line-height:15px;text-align:center;FILTER:alpha(opacity=80);opacity: 0.8;}'
 +'.picturePl_btno{background:#ffffff;color:#000000;}'
 +'.picturePl_titcon{text-indent:1em;background:#000000;FILTER:alpha(opacity=60);opacity: 0.6;color:#ffffff;height:30px;line-height:30px;position:absolute;z-index:20;bottom:0px;}'
 +'.picturePl_btncon{overflow:hidden;*zoom:1;height:22px;position:absolute;z-index:30;bottom:0px;right:0px;}'
 +'.picturePl_nrcon{overflow:hidden;*zoom:1;position:relative;}'
 +'</style>'
 };
 var ops = $.extend(dft,options);
 $('head').append(ops.style);//�����ʽ
 var count=$(this).find('img').length;
 var _width=count*ops.width;//�����ܿ��
 var _atit='';
 var _btn='';
 var _imgWidth=ops.width
 if(!ops.proportion)
 $(this).find('img').width(ops.width);
 $(this).find('img').height(ops.height).addClass("picturePl_img");//����ͼƬλ�úͱ���	
 for(i=0;i<count;i++){//����IMG style
	
	var _title=$(this).find('a').eq(i).attr('title');//��ȡ��������
	if(_title.length>ops.numberWs){
	_title=_title.substring(0,ops.numberWs)+'...';//����
	}
	_atit+='<span style="display:none;">'+_title+'</span>';//ƴ�ӱ�������
	_btn+='<span class="picturePl_btn">'+(i+1)+'</span>';//�����л���ť��1����2����3��...
 }
 var _imgObj=$(this).html();//����ͼƬ����
 var _title='<div class="picturePl_titcon" style="font-size:'+ops.fontSize+'px;font-weight:'+ops.fontBoder+';width:'+ops.width+'px;">'+
 _atit+
 '</div>';//���������
 var _tabBtn='<div class="picturePl_btncon">'+_btn+'</div>';//�����л���ť
 var ojbcon='<div class="picturePl_nrcon" style="width:'+ops.width+'px;height:'+ops.height+'px;">'+_imgObj+_title+_tabBtn+'</div>';//�������ݿ�
 $(this).html(ojbcon);//���ض�������
 //��ʼ����һ��
 $(this).find('a').hide();
 $(this).find('a').eq(0).show();
 $(this).find('div').find('div').eq(1).find('span').eq(0).addClass("picturePl_btno");
 $(this).find('div').find('div').eq(0).find('span').eq(0).show();
 var n=0;
 //�л�Ч��
 $(this).find('div').find('div').eq(1).find('span').each(function() {
   $(this).click(function(){
    $(this).parent().parent().parent().find('a').hide();
    $(this).parent().parent().parent().find('a').eq(parseInt($(this).html())-1).show();
	$(this).parent().prev('div').find('span').hide();
    $(this).parent().prev('div').find('span').eq(parseInt($(this).html())-1).show();
	$(this).siblings("span").removeClass("picturePl_btno");
	$(this).addClass("picturePl_btno");
	n=parseInt($(this).html());
	if(n>=count)n=0;
   });
 });
    //ͼƬ�ֲ�
	var ojb=$(this);
	var t=true;
	function timedCount()
	{
		if(n>=count)
		n=0;
		ojb.find('a').hide();
		ojb.find('a').eq(n).show();	
		ojb.find('div').find('div').eq(1).find("span").removeClass("picturePl_btno");
		ojb.find('div').find('div').eq(1).find("span").eq(n).addClass("picturePl_btno");
		ojb.find('div').find('div').eq(0).find('span').hide();
		ojb.find('div').find('div').eq(0).find('span').eq(n).show();
		n++;			
	}
	//�Զ�����
	setInterval(function(){
		if(t==true) timedCount();
	},ops.time);
	//���ͣ����ͣ
	$(this).hover(function(){
		t=false;
	},function(){
		t=true;
	});
}
})(jQuery);