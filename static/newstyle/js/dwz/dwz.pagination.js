/**
 * 
 * @author ZhangHuihua@msn.com
 * @param {Object} opts Several options
 */
(function($){
	$.fn.extend({
		pagination: function(opts){
			var setting = {
				first$:"li.j-first", prev$:"li.j-prev", next$:"li.j-next", last$:"li.j-last", nums$:"li.j-num>a", jumpto$:"li.jumpto",
				pageNumFrag:'<li class="#liClass#"><a href="javascript:;">#pageNum#</a></li>'
			};
			return this.each(function(){
				var $this = $(this);
				var pc = new Pagination(opts);
				var interval = pc.getInterval();
	
				var pageNumFrag = '';
				var space = 0;
				for (var i=interval.start; i<interval.end;i++){
						  if(i-interval.start>4 && i!=(interval.end-1)&&i!=pc.getCurrentPage()){
		                    	if(!space){
		                    		pageNumFrag+='<li class="j-space"><span></span></li>';
		                    		space = 1;
		                    	}
		                        continue;
		                      /*  pageNumFrag+=setting.pageNumFrag.replaceAll("#pageNum#", interval.end-1).replaceAll("#liClass#", (interval.end)==pc.getCurrentPage() ? 'selected j-num' : 'j-num');
		                        break;*/
		                    }
					pageNumFrag += setting.pageNumFrag.replaceAll("#pageNum#", i).replaceAll("#liClass#", i==pc.getCurrentPage() ? 'selected j-num' : 'j-num');
				}
				$this.html(DWZ.frag["pagination"].replaceAll("#pageNumFrag#", pageNumFrag).replaceAll("#currentPage#", pc.getCurrentPage())).find("li").hoverClass();
	
				var $first = $this.find(setting.first$);
				var $prev = $this.find(setting.prev$);
				var $next = $this.find(setting.next$);
				var $last = $this.find(setting.last$);
				
				if (pc.hasPrev()){
					$first.add($prev).find(">span").hide();
					_bindEvent($prev, pc.getCurrentPage()-1, pc.targetType(), pc.rel(),pc.isOnclick_pagination(),pc.url(),pc.divId(),pc.isOnclick_return());
					_bindEvent($first, 1, pc.targetType(), pc.rel(),pc.isOnclick_pagination(),pc.url(),pc.divId(),pc.isOnclick_return());
				} else {
					$first.add($prev).addClass("disabled").find(">a").hide();
				}
				
				if (pc.hasNext()) {
					$next.add($last).find(">span").hide();
					_bindEvent($next, pc.getCurrentPage()+1, pc.targetType(), pc.rel(),pc.isOnclick_pagination(),pc.url(),pc.divId(),pc.isOnclick_return());
					_bindEvent($last, pc.numPages(), pc.targetType(), pc.rel(),pc.isOnclick_pagination(),pc.url(),pc.divId(),pc.isOnclick_return());
				} else {
					$next.add($last).addClass("disabled").find(">a").hide();
				}
	
				$this.find(setting.nums$).each(function(i){
					_bindEvent($(this), $(this).text(), pc.targetType(), pc.rel(),pc.isOnclick_pagination(),pc.url(),pc.divId(),pc.isOnclick_return());
				});
				$this.find(setting.jumpto$).each(function(){
					var $this = $(this);
					var $inputBox = $this.find(":text");
					var $button = $this.find(":button");
					$button.click(function(event){
						var pageNum = $inputBox.val();
						if (pageNum && pageNum.isPositiveInteger()) {
							if(pc.isOnclick_pagination()){
								if(pageNum>pc.numPages()){
									if(pc.isOnclick_return()){
										onClickMessagereturn(pageNum);
									}else{
										$("#"+pc.divId).load(pc.url+'&pageNum='+pageNum+'&numPerPage=20&t='+Math.random()*1000);
									}
									$inputBox.val(pc.numPages());
								}else{
									if(pc.isOnclick_return()){
										onClickMessagereturn(pageNum);
									}else{
										$("#"+pc.divId).load(pc.url+'&pageNum='+pageNum+'&numPerPage=20&t='+Math.random()*1000);
									}
								}
							}else{
								dwzPageBreak({targetType:pc.targetType(), rel:pc.rel(), data: {pageNum:pageNum}});
							}
						}
					});
					$inputBox.keyup(function(event){
						if (event.keyCode == DWZ.keyCode.ENTER) $button.click();
					});
				});
			});
			
			function _bindEvent($target, pageNum, targetType, rel,isOnclick_pagination,url,divId,isOnclick_return){
				$target.bind("click", {pageNum:pageNum}, function(event){
					if(isOnclick_pagination){
						if(isOnclick_return){
							onClickMessagereturn(pageNum);
						}else{
							$("#"+divId).load(url+'&pageNum='+pageNum+'&numPerPage=20&t='+Math.random()*1000);
						}
					}else{
						dwzPageBreak({targetType:targetType, rel:rel, data:{pageNum:pageNum/*event.data.pageNum*/}});
						event.preventDefault();
					}
				});
			}
		},
		
		orderBy: function(options){
			var op = $.extend({ targetType:"navTab", rel:"", asc:"asc", desc:"desc"}, options);
			return this.each(function(){
				var $this = $(this).css({cursor:"pointer"}).click(function(){
					var orderField = $this.attr("orderField");
					var orderDirection = $this.hasClass(op.asc) ? op.desc : op.asc;
					dwzPageBreak({targetType:op.targetType, rel:op.rel, data:{orderField: orderField, orderDirection: orderDirection}});
				});
				
			});
		},
		pagerForm: function(options){
			var op = $.extend({pagerForm$:"#pagerForm", parentBox:document}, options);
			var frag = '<input type="hidden" name="#name#" value="#value#" />';
			return this.each(function(){
				var $searchForm = $(this), $pagerForm = $(op.pagerForm$, op.parentBox);
				var actionUrl = $pagerForm.attr("action").replaceAll("#rel#", $searchForm.attr("action"));
				$pagerForm.attr("action", actionUrl);
				$searchForm.find(":input").each(function(){
					var $input = $(this), name = $input.attr("name");
					if (name && (!$input.is(":checkbox,:radio") || $input.is(":checked"))){
						if ($pagerForm.find(":input[name='"+name+"']").length == 0) {
							var inputFrag = frag.replaceAll("#name#", name).replaceAll("#value#", $input.val());
							$pagerForm.append(inputFrag);
						}
					}
				});
			});
		}
	});
	
	var Pagination = function(opts) {
		this.opts = $.extend({
			targetType:"navTab",	// navTab, dialog
			rel:"", //用于局部刷新div id号
			totalCount:0,
			numPerPage:10,
			pageNumShown:10,
			currentPage:1,
			callback:function(){return false;}
		}, opts);
	}
	
	$.extend(Pagination.prototype, {
		targetType:function(){return this.opts.targetType},
		isOnclick_pagination:function(){return this.opts.isOnclick_pagination},
		isOnclick_return:function(){return this.opts.isOnclick_return},
		url:function(){return this.opts.url},
		divId:function(){return this.opts.divId},
		rel:function(){return this.opts.rel},
		numPages:function() {
			return Math.ceil(this.opts.totalCount/this.opts.numPerPage);
		},
		getInterval:function(){
			var ne_half = Math.ceil(this.opts.pageNumShown/2);
			var np = this.numPages();
			var upper_limit = np - this.opts.pageNumShown;
			var start = this.getCurrentPage() > ne_half ? Math.max( Math.min(this.getCurrentPage() - ne_half, upper_limit), 0 ) : 0;
			var end = this.getCurrentPage() > ne_half ? Math.min(this.getCurrentPage()+ne_half, np) : Math.min(this.opts.pageNumShown, np);
			return {start:start+1, end:end+1};
		},
		getCurrentPage:function(){
			var currentPage = parseInt(this.opts.currentPage);
			if (isNaN(currentPage)) return 1;
			return currentPage;
		},
		hasPrev:function(){
			return this.getCurrentPage() > 1;
		},
		hasNext:function(){
			return this.getCurrentPage() < this.numPages();
		}
	});
})(jQuery);
