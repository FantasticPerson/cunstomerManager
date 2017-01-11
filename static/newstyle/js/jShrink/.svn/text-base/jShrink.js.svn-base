/**
 * [A tiny shrink jQuery based plugin written by John Nong]
 * @param  {[type]} $ [rootQuery]
 * @return {[type]}   [description]
 *
 *
 * Detail : 
 * 	Author : John Nong
 * 	Date : 2015/09/11
 * 	Email : overkazaf@gmail.com
 * 	Git : https://www.github.com/overkazaf
 */
;(function ($){
	$.fn.jShrink = function (option){
		var opt = $.extend({}, $.fn.jShrink.defaults, option || {}),
			target = $(opt.targetContext),
			btnContext = $(opt.btnContext),
			leftBtn = $(opt.leftBtn),
			rightBtn = $(opt.rightBtn),
			leftSide = target.find(opt.leftSide),
			rightSide = target.find(opt.rightSide),
			btnStatus = 0,
			statusTarget = {};
		
		var shrink = {
			init : function (){
				
				shrink.adjustPosition.call(this);
				statusTarget = shrink.buildStatusTarget.call(this);
				shrink.bindEvents.call(this);
			},
			adjustPosition : function (){
				$(btnContext).css({
					'position' : 'absolute',
					left : leftSide.offset().left + leftSide.width() - btnContext.width()/2,
					top  : leftSide.offset().top + leftSide.height()/2 - btnContext.height()/2
				});
			},
			buildStatusTarget : function (){
				var 
					lL = leftSide.offset().left,
					lW = leftSide.width(),
					rW = rightSide.width(),
					bW = $(btnContext).width(),
					totW = lW + rW,
					percentL = Math.floor(lW-1 / totW),
					percentR = Math.floor(rW-1 / totW),
				    hideElFn = function ($el){
		    			setTimeout(function(){
							$el.hide();
						}, opt.interval)
					};
				return {
					'-1' : {
						left : 0,
						pos : lL -(bW/2),
						right : totW,
						callbacks : {
							left : hideElFn,
							pos : function (){},
							right : function (){}
						}
					},
					'0' : {
						left : lW,
						pos : lL + leftSide.width() -(bW/2),
						right : rW,
						callbacks : {
							left : function (){},
							pos : function (){},
							right : function (){}
						}
					},
					'1' : {
						left : totW,
						pos : lL + totW - (bW/2),
						right : 0,
						callbacks : {
							left : function (){},
							pos : function (){},
							right : hideElFn
						}
					}
				};
			},
			bindEvents : function (){
				leftBtn.click(function (){
					shrink.shrinkView(btnStatus-1);
				});

				rightBtn.click(function (){
					shrink.shrinkView(btnStatus+1);
				});
			},
			shrinkView : function (index){
				btnStatus = index;
				if (index < -1) btnStatus = -1;
				if (index > 1) btnStatus = 1;

				var state = statusTarget[''+btnStatus];
				shrink.doAnimate(state)

				
			},
			doAnimate : function (state) {
				
				leftSide.show().animate({
					width : state.left
				}, opt.interval, opt.animateEffect, state.callbacks['left'].call(leftSide, leftSide));

				rightSide.show().animate({
					width : state.right
				}, opt.interval, opt.animateEffect, state.callbacks['right'].call(rightSide, rightSide));

				
				btnContext.animate({
					left : +state.pos
				}, opt.interval, opt.animateEffect, state.callbacks['pos'].call(btnContext, btnContext));



			}
		};

		shrink.init()

		return this;

	};

	$.fn.jShrink.defaults = {
		targetContext : '.container', // 需要进行收缩展开的容器
		interval : 500, // 动画的间隔
		animateEffect : 'swing', // 动画效果，支持swing和linear
		btnContext : '#shrink', // 按钮上下文
		leftBtn : '#shrink-l', // 左侧按钮id
		rightBtn : '#shrink-r', // 右侧按钮id
		leftSide : '.fl', // 容器内的左侧容器
		rightSide : '.fr' // 容器内的右侧容器
	};
})(jQuery);