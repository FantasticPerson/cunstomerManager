/**
   * 简单分页插件
   * @author zab
   * @version 1.0
   * @date 2014-08-21
   * @param option 插件配置
   */
(function($) {
	$.fn.pageUtil = function(option) {

		// 默认配置
		var defaults = {
			url : '',
			urlParam : '',
			dataType : 'json',
			initData : '',
			beforeContent : '',
			endContent : '',
			group : 1,
			pageSize : 15,
			pageButtonNum : 8
		}

		option = $.extend(defaults, option);

		return this.each(function() {

			var $this = $(this);

			/**
			 * pageNum : 当前页数
			 */
			function getPage(pageNum){
				var _msg = '';
				if (pageNum === 1 && option.initData && option.initData != '') {
					_msg = option.initData;
				}else{
					var param = $.extend({query : '', page : pageNum, pageSize : option.pageSize }, option.urlParam);
					$.ajax({
						url: option.url,
						type: 'GET',
						data : param,
						dataType: 'text',
						async: false,
						cache: false,
						success: function(msg) {
							if (option.dataType === 'json') {
								_msg = msg;
							}
						}
					});
				}
				
				var msgObj = $.parseJSON(_msg);
				if(msgObj && typeof msgObj === 'object'){
					msgObj.totalCount = msgObj.totalHits;
					getList(msgObj);
					getPagination(msgObj, pageNum);
				}
			}

			// 组织内容
			function getList(msgObj){
				if (!msgObj || msgObj.resultList.length == 0) {
					$this.html('无数据！');
					return;
				};

				var html = '';
				$.map(msgObj.resultList, function(record) {
					html += '<p class="title"><a href="' + record.url + '" target="_blank">' + record.title + '</a><p>'
						+ '<p class="content">' + record.content + '</p>'
						+ '<p class="foot">' + record.publishDate + '</p>'; 
				});
				// 填充容器
				$this.html(html);
			}

			// 组织分页条
			var getPagination = function(msgObj, pageNum){
				if (msgObj && msgObj.totalCount > 0) {
					var _totalCount = msgObj.totalCount;
					var _pageCount = option.pageSize > 0 ? Math.ceil(_totalCount / option.pageSize) : 0;
					
					if(_pageCount==0){
						_pageCount=1;
					}
					if (_totalCount > option.pageSize * _pageCount) {
						_pageCount++;
					}
					msgObj.pageCount = _pageCount;
					var pagetoobar = '';
					var startPageNum = 1;
					var currentPageNum = pageNum > _pageCount ? _pageCount : pageNum;
					var endPageNum = option.pageButtonNum;

					if(currentPageNum >= option.pageButtonNum) {
						startPageNum = currentPageNum - option.pageButtonNum / 2;
	    				endPageNum = startPageNum + option.pageButtonNum;
					}
					for(var i = startPageNum; i <= _pageCount; i++ ) {
						if(i <= endPageNum) {
							if(i == currentPageNum){
								pagetoobar += '<li class="active">' + i + '</li>';
							}else{
								pagetoobar += '<li><a href="#" class="page_to">' + i + '</a></li>';
							}
						}
					}
					// pagetoobar = '<a href="#" class="page_to" >首页</a>' + pagetoobar + '<a href="#" class="page_to">尾页</a>';
					pagetoobar = '<ul id="pagination-digg">' + pagetoobar + '</ul>';
					$this.append(pagetoobar);
				}
			}


				$('.page_to').live('click', function(event) {
					var pageNum = $(this).text();
					if (pageNum === '首页') {
						pageNum = '1';
					}else if(pageNum === '尾页'){
						pageNum = msgObj.pageCount;
					}
					getPage(Number(pageNum));
				});


			getPage(1);

		});

	}

})(jQuery);