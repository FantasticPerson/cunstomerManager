/**
   * jpage for  jQuery分页插件
   * 功能：
   * 1.指定页数内静态分页
   * 2.超过指定页数后ajax请求下一组静态分页
   * 3.支持cookie记录当前页码和分组大小
   * @author 陈健
   * @version 2.0
   * @date 2011-09-13
   * @param config 插件配置
   */
	jQuery.fn.jpage = function(config){
		init("#"+this.attr("id"),config);
		
		/**
		   * 初始化，主程序
		   * @param t 容器的ID，带#号
		   * @param config 插件配置
		   */
		function init(t,config){
			//公有变量
			if(!t)
				return;
			var initStore = config.dataStore;			//初始数据
			if(initStore != null){
				initStore = initStore.replace(/&gt;/gi,'>');
			}
			
			var xmlStore = $(createXMLDocument(initStore));
			var dataStore = new Array();
			xmlStore.find('record').each(
				function(){
					dataStore.push($(this).text());
				}
			);
			
			var openCookies = config.openCookies != null ? config.openCookies : true;
			var configPage = config.perPage > 0 ? config.perPage : 10;
			var perPage = !openCookies || $.cookie(t+"_perPage") == null ? configPage : parseInt($.cookie(t+"_perPage"));	//每页显示记录数
			var totalRecord = config.totalRecord;																			//总记录数
			if(totalRecord==undefined)
				totalRecord = 0;
			else{
				totalRecord = config.totalRecord > 0 ? config.totalRecord : 0;	
				if(totalRecord == 0){
					$(t).css("text-align","center");
					$(t).css("line-height","50px");
					$(t).html("没有检索到任何记录！");
					return;
				}
			}	
			var proxyUrl = config.proxyUrl != null ? config.proxyUrl : 'dataproxy.jsp';									//数据代理地址
			var groupSize = config.groupSize != null ? config.groupSize : 1;											//组大小
			var barPosition = config.barPosition == null || config.barPosition == ""? 'bottom' : config.barPosition;	//工具条位置
			var ajaxParam = config.ajaxParam;																			//ajax的请求参数
			var showMode = config.showMode == null || config.showMode == '' ? 'full' : config.showMode;					//显示模式
			var allowChangePerPage = config.allowChangePerPage == null || config.allowChangePerPage ? true : false;		//是否允许切换每页显示数
			var themeName = config.themeName == null || config.themeName == '' ? 'default' : config.themeName;			//主题名称
			var dataBefore = config.dataBefore == null ? '' : config.dataBefore;
			var dataAfter = config.dataAfter == null ? '' : config.dataAfter;
			var callBack = config.callBack == null ? function(){} : config.callBack;
			var pageButtonNum = config.pageButtonNum == null ? 8 : config.pageButtonNum;								// 分页按钮个数
			var contentTemplate = config.contentTemplate == null ? '' : config.contentTemplate;							// 内容模板
		
			//私有变量
			var totalPage = Math.ceil(totalRecord/perPage);																//总页数
			var currentPage = !openCookies || $.cookie(t+"_currentPage") == null ? 1 : parseInt($.cookie(t+"_currentPage"));//当前页码
			var startRecord;																							//每页起始记录，相对于当前组
			var endRecord;	 																							//每页结束记录，相对于当前组
			var gpStartPage;																							//组开始页
			var gpEndPage;																								//组结束页
			var gpStartRecord = 1;																						//组开始记录
			var gpEndRecord = perPage * groupSize;
			
		
			//数据容器
			var container = '<div class="'+themeName+'_pgContainer"></div>';
			// 分页工具条
			var toolbar = '<div class="'+themeName+'_pgToolbar">' + getToolBar() + '</div>';
		
			/*
			//添加工具条
			var toolbar = '<table width="100%" border="0" cellpadding="0" cellspacing="0" class="'+themeName+'_pgToolbar"><tr><td>';
			toolbar += '<table border="0" cellspadding="0" cellspacing="0" class="'+themeName+'_pgPanel"><tr>';
			if(showMode == 'full' && allowChangePerPage){
				toolbar += '<td valign="middle"><select class="'+themeName+'_pgPerPage" title="每页显示条数">';
				if(config.perPage>0)
					toolbar += '<option value="'+config.perPage+'">'+config.perPage+'</option>';
				toolbar += '<option value="5">5</option>';
				toolbar += '<option value="10">10</option>';
				toolbar += '<option value="15">15</option>';
				toolbar += '<option value="20">20</option>';
				toolbar += '<option value="25">25</option>';
				toolbar += '<option value="40">40</option>';
				toolbar += '</select>&nbsp;</td>';
				toolbar += '<td valign="middle"><div class="'+themeName+'_separator"></div></td>';
			}
			toolbar += '<td valign="middle"><div class="'+themeName+'_pgBtn '+themeName+'_pgFirst" title="首页"></div></td>';
			toolbar += '<td valign="middle"><div class="'+themeName+'_pgBtn '+themeName+'_pgPrev" title="上页"></div></td>';
			if(showMode == 'full'){
				toolbar += '<td valign="middle" width="10" align="left"><div class="'+themeName+'_separator"></div></td>';
				toolbar += '<td valign="middle">第 <input class="'+themeName+'_pgCurrentPage" type="text" value="' + currentPage + '" title="页码" /> 页 / 共 <span class="'+themeName+'_pgTotalPage">' + totalPage + '</span> 页</td>';
				toolbar += '<td valign="middle" width="10" align="right"><div class="'+themeName+'_separator"></div></td>';
			}else if(showMode == 'normal'){
				toolbar += '<td valign="middle"><div class="'+themeName+'_separator"></div></td>';
				toolbar += '<td valign="middle"> <input class="'+themeName+'_pgCurrentPage" type="text" value="' + currentPage + '" title="页码" /> /  <span class="'+themeName+'_pgTotalPage">' + totalPage + '</span> 页</td>';
				toolbar += '<td valign="middle"><div class="'+themeName+'_separator"></div></td>';
			}
			toolbar += '<td valign="middle"><div class="'+themeName+'_pgBtn '+themeName+'_pgNext" title="下页"></div></td>';
			toolbar += '<td valign="middle"><div class="'+themeName+'_pgBtn '+themeName+'_pgLast" title="尾页"></div></td>';
			if(groupSize){
				toolbar += '<td valign="middle"><div class="'+themeName+'_separator"></div></td>';
				toolbar += '<td valign="middle"><div class="'+themeName+'_pgBtn '+themeName+'_pgRefresh" title="刷新"></div></td>';
			}
			if(showMode == 'full'){
				toolbar += '<td valign="middle" width="10" align="left"><div class="'+themeName+'_separator"></div></td>';
				toolbar += '<td valign="middle" class="'+themeName+'_pgSearchInfo">检索到&nbsp;' + totalRecord + '&nbsp;条记录，显示第&nbsp;<span class="'+themeName+'_pgStartRecord">' + startRecord + '</span>&nbsp;条&nbsp;-&nbsp;第&nbsp;<span class="'+themeName+'_pgEndRecord">' + endRecord + '</span>&nbsp;条记录</td>';
			}
			toolbar += '</td></tr></table>';
			toolbar += '</td></tr></table>';
			*/
			
			$('.page_to').live('click', function(event) {
				var pageNum = parseInt($(this).text());
				if(!dataStore || pageNum < gpStartPage || pageNum > gpEndPage ){
					currentPage =  parseInt(pageNum);
					getGroupStartEnd();
					getStartEnd();
					getRemoteData();
				}else{
					currentPage = parseInt(pageNum);
					getStartEnd();
					loadData();
					refresh();
				}
			});

		
			//if(configPage<totalRecord) {
				switch(barPosition){
					case 'top':
						$(t).html(toolbar+container);
						break;
					case 'bottom':
						$(t).html(container+toolbar);
						break;
					default:
						$(t).html(toolbar+container+toolbar);
				}
			//} else {
			//	$(t).html(container);
			//}
		
			var btnRefresh = $(t+" ."+themeName+"_pgRefresh");															//刷新按钮
			var btnNext =$(t+" ."+themeName+"_pgNext");																	//下一页按钮
			var btnPrev = $(t+" ."+themeName+"_pgPrev");																//上一页按钮
			var btnFirst = $(t+" ."+themeName+"_pgFirst");																//首页按钮
			var btnLast = $(t+" ."+themeName+"_pgLast");																//末页按钮
			var btnGo = $(t+" ."+themeName+"_pgNext,"+t+" ."+themeName+"_pgLast");
			var btnBack = $(t+" ."+themeName+"_pgPrev,"+t+" ."+themeName+"_pgFirst");
			var btn = $(t+" ."+themeName+"_pgFirst,"+t+" ."+themeName+"_pgPrev,"+t+" ."+themeName+"_pgNext,"+t+" ."+themeName+"_pgLast");
			var mask;
			
			var valCurrentPage = $(t+" ."+themeName+"_pgCurrentPage");
			var valStartRecord = $(t+" ."+themeName+"_pgStartRecord");
			var valEndRecord =$(t+" ."+themeName+"_pgEndRecord");
			var valContainer = $(t+" ."+themeName+"_pgContainer");
			var valPerPage = $(t+" ."+themeName+"_pgPerPage");
			var valTotalPage = $(t+" ."+themeName+"_pgTotalPage");
			var valPager = $(t+" ."+themeName+"_pgToolbar");
			
			$(t+" ."+themeName+"_pgPerPage").attr("value",perPage);
			getGroupStartEnd();
			getStartEnd();
			if((dataStore==null || dataStore.length == 0) || perPage!=configPage){
				getRemoteData();
			}else{
				getStartEnd();
				loadData();
				refresh();
			}
		
			//刷新按钮监听
			btnRefresh.bind("mousedown",pressHandler).bind("mouseup",unpressHandler).bind("mouseout",unpressHandler);
		
			//刷新工具栏
			refresh();
			
			//按钮监听
			btnNext.live('click',
				function(){
					if(currentPage < totalPage){
						if(!dataStore || currentPage == gpEndPage){
							currentPage += 1;
							getGroupStartEnd();
							getStartEnd();
							getRemoteData();
						}else{
							currentPage += 1;
							getStartEnd();
							loadData();
							refresh();
						}
					}
				}
			);	

			btnPrev.live('click',
				function(){
					if(currentPage > 1){
						if(!dataStore || currentPage == gpStartPage){
							currentPage -= 1;
							getGroupStartEnd();
							getStartEnd();
							getRemoteData();
						}else{
							currentPage -= 1;
							getStartEnd();
							loadData();
							refresh();
						}
					}
				}
			);
			/*
			btnFirst.click(
				function(){
					if(!dataStore || currentPage > 1){
						if(gpStartPage > 1){
							currentPage = 1;
							getGroupStartEnd();
							getStartEnd();
							getRemoteData();
						}else{
							currentPage = 1;
							getStartEnd();
							loadData();
							refresh();
						}
					}
				}
			);
			*/
			btnFirst.live('click',
				function(){
					if(!dataStore || currentPage > 1){
						if(gpStartPage > 1){
							currentPage = 1;
							getGroupStartEnd();
							getStartEnd();
							getRemoteData();
						}else{
							currentPage = 1;
							getStartEnd();
							loadData();
							refresh();
						}
					} 
				}
			);
			btnLast.live('click',
				function(){
					if(!dataStore || currentPage < totalPage){
						if(gpEndPage > 0 && gpEndPage < totalPage){
							currentPage = totalPage;
							getGroupStartEnd();
							getStartEnd();
							getRemoteData();
						}else{
							currentPage = totalPage;
							getStartEnd();
							loadData();
							refresh();
						}
					}
				}
			);
			btnRefresh.click(
				function(){
					getGroupStartEnd();
					getStartEnd();
					getRemoteData();
				}
			);
			
			//页码输入框监听
			valCurrentPage.keydown(
				function(event){
					var targetPage = parseInt($(this).val());
					if(event.keyCode==13 && targetPage>=1 && targetPage<=totalPage){
						if(!dataStore || gpStartPage > targetPage || (gpEndPage > 0 && gpEndPage < targetPage)){
							currentPage = targetPage;
							getGroupStartEnd();
							getStartEnd();
							getRemoteData();
						}else{
							currentPage = targetPage;
							getStartEnd();
							loadData();
							refresh();
						}
					}
				}
			);
			
			valPerPage.change(
				function(){
					valPerPage.val($(this).val());
					perPage = parseInt($(this).val());
					currentPage = 1;
					totalPage = Math.ceil(totalRecord/perPage);
					if(groupSize){
						getGroupStartEnd();
						getStartEnd();
						getRemoteData();
					}else{
						getStartEnd();
						loadData();
						refresh();				
					}			
				}
			);
			
			/*********************************init私有函数***************************************************/
			/**
			   * 置为正在检索状态
			   */
			function startLoad(){
				$(t).addClass(themeName+"_container");
				mask = document.createElement('div');
				$(mask).addClass(themeName+"_mask");
				$(mask).css("height",$(t).height());
				$(t).append(mask);
				$(t+" ."+themeName+"_pgRefresh").addClass(themeName+"_pgLoad");
				$(t+" ."+themeName+"_pgSearchInfo").html("正在检索中，请稍后...");
			}
			
			/**
			   * 置为结束检索状态
			   */
			function overLoad(){
				$(t+" ."+themeName+"_pgRefresh").removeClass(themeName+"_pgLoad");
				$(t+" ."+themeName+"_pgSearchInfo").html('检索到&nbsp;' + totalRecord + '&nbsp;条记录，显示第&nbsp;<span class="'+themeName+'_pgStartRecord">' + (startRecord+gpStartRecord-1) + '</span>&nbsp;条&nbsp;-&nbsp;第&nbsp;<span class="'+themeName+'_pgEndRecord">' + (endRecord+gpStartRecord-1) + '</span>&nbsp;条记录');
				$(mask).remove();
				$(t).removeClass(themeName+"_container");
				valStartRecord = $(t+" ."+themeName+"_pgStartRecord");
				valEndRecord =$(t+" ."+themeName+"_pgEndRecord");
			}
		
			/**
			   * 获得远程数据
			   */
			function getRemoteData(){
				startLoad();
				var param = $.extend({startrecord : gpStartRecord, endrecord : gpEndRecord, perpage : perPage, contentTemplate : contentTemplate }, ajaxParam);
				$.ajax(
					{
						type: "GET",
						url: proxyUrl,
						cache: false,
						data: param,
						dataType: "jsonp",
						timeout: 30000,
						success: function(xml){
							xmlStore = $(createXMLDocument(xml.result));
							totalRecord = xmlStore.find('totalrecord').text();
							dataStore = null;
							dataStore = new Array();
							xmlStore.find('record').each(
								function(){
									dataStore.push($(this).text());
								}
							);
							
							if(totalRecord==0)
								$('.'+themeName+'_pgToolbar').remove();
							getStartEnd();
							loadData();
							refresh();
							overLoad();
						},
						error: function(){
							alert("请求失败或超时，请稍后再试！");
							overLoad();
							return;
						}
					}
				);
			}

			/**
			   * 获得当前页开始结束记录
			   */
			function getStartEnd(){
				if(groupSize){
					startRecord = (currentPage-1)*perPage+1 - gpStartRecord + 1;
					endRecord = Math.min(currentPage*perPage,totalRecord) - gpStartRecord + 1;
				}else{
					startRecord = (currentPage-1)*perPage+1;
					endRecord = Math.min(currentPage*perPage,totalRecord);
				}
			}
		
			/**
			   * 获得当前组开始结束页码
			   */
			function getGroupStartEnd(){
				if(groupSize==null){
					return;
				}
				var groupId = groupSize > 0 ? Math.ceil(currentPage/groupSize) : 0;
				gpStartPage = (groupId-1)*groupSize+1;
				if(totalRecord > 0){
					gpEndPage = Math.min(groupId*groupSize,totalPage);
				}
				
				gpStartRecord = (gpStartPage-1)*perPage+1;
				if(totalRecord > 0){
					gpEndRecord = Math.min(gpEndPage*perPage,totalRecord);
				}
			}
		
			/**
			   * 刷新数据容器
			   */
			function loadData(){
				if(dataStore==null||dataStore.length==0||dataStore[0]=="没有检索到任何记录"){
					valContainer.css("text-align","left");
					valContainer.css("line-height","22px");
					valContainer.html("没有检索到任何记录！");
					return;
				}
				
				var view = "";
				for(var i=startRecord-1;i<=endRecord-1 && i < dataStore.length;i++){
					view += dataStore[i].replace("{id}",gpStartRecord+i);
				}
				valContainer.html(dataBefore + view + dataAfter);
				valPager.html(getToolBar());
				//翻页回调函数
				callBack();
			}
		
			/**
			   * 刷新工具栏状态
			   */
			function refresh(){
				if(openCookies){
					//当前页码写入cookie
					$.cookie(t+'_currentPage', currentPage);
					$.cookie(t+'_perPage', perPage);
				}
		
				valCurrentPage.val(currentPage);
				valStartRecord.html(startRecord+gpStartRecord-1);
				valEndRecord.html(endRecord+gpStartRecord-1);
				valTotalPage.html(totalPage);
				
				btn.unbind("mousedown",pressHandler);
				btn.bind("mouseup",unpressHandler);
				btn.bind("mouseout",unpressHandler);
				if(currentPage == 1 && currentPage != totalPage){
					enabled();
					btnGo.bind("mousedown",pressHandler);
					btnPrev.addClass(themeName+"_pgPrevDisabled");
					btnFirst.addClass(themeName+"_pgFirstDisabled");
				}else if(currentPage != 1 && currentPage == totalPage){
					enabled();
					btnBack.bind("mousedown",pressHandler);
					btnNext.addClass(themeName+"_pgNextDisabled");
					btnLast.addClass(themeName+"_pgLastDisabled");
				}else if(currentPage == 1 && currentPage == totalPage){
					disabled();
				}else{
		  			enabled();
					btnBack.bind("mousedown",pressHandler);
					btnGo.bind("mousedown",pressHandler);
					btnNext.addClass(themeName+"_pgNext");
					btnPrev.addClass(themeName+"_pgPrev");
					btnFirst.addClass(themeName+"_pgFirst");
					btnLast.addClass(themeName+"_pgLast");
				}
			}
			
			function getToolBar(){
				var toolbar = '';
				var startPageNum = 1;
				var endPageNum = pageButtonNum;
				if(currentPage >= endPageNum) {
					startPageNum = currentPage - pageButtonNum / 2;
					endPageNum = startPageNum + pageButtonNum;
				}
				for(var i = startPageNum; i <= totalPage; i++ ) {
					if(i <= endPageNum) {
						if(i == currentPage){
							toolbar += '<li class="active">' + i + '</li>';
						}else{
							toolbar += '<li><a href="#" class="page_to">' + i + '</a></li>';
						}
					}
					/*
					else {
						toolbar += '...';
					    break;
					}
					*/
				}
				
				// toolbar = '<ul id="pagination-digg">' + toolbar + '</ul>';
				//<td valign="middle"><div class="'+themeName+'_pgBtn '+themeName+'_pgFirst" title="首页"></div></td>
				toolbar = '<ul id="pagination-digg"><li class="'+themeName+'_pgFirst active" title="首页">首页</li><li class="'+themeName+'_pgPrev active" title="上页">上页</li>' 
					+ toolbar + '<li class="'+themeName+'_pgNext active" title="下页">下页</li><li class="'+themeName+'_pgLast active" title="尾页">尾页</li></ul>';
				return toolbar;
			}
			   
			   
			
			/**
			   * 移除按钮disabled状态样式
			   */
			function enabled(){
					btnNext.removeClass(themeName+"_pgNextDisabled");
					btnPrev.removeClass(themeName+"_pgPrevDisabled");
					btnFirst.removeClass(themeName+"_pgFirstDisabled");
					btnLast.removeClass(themeName+"_pgLastDisabled");
			}
			
			/**
			   * 添加按钮disabled状态样式
			   */
			function disabled(){
					btnNext.addClass(themeName+"_pgNextDisabled");
					btnPrev.addClass(themeName+"_pgPrevDisabled");
					btnFirst.addClass(themeName+"_pgFirstDisabled");
					btnLast.addClass(themeName+"_pgLastDisabled");
			}
		
			/**
			   * 添加按钮按下状态样式
			   */
			function pressHandler(){
				$(this).addClass(themeName+"_pgPress");
			}
		
			/**
			   * 移除按钮按下状态样式
			   */
			function unpressHandler(){
				$(this).removeClass(themeName+"_pgPress");
			}
		}
		
		/**
		 * 创建XML文档
		 */
		function createXMLDocument(text) {
			var xmlDoc = null;
			try{// Internet Explorer
				xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
				xmlDoc.async = "false";
				xmlDoc.loadXML(text);
			}catch (e){
				try{// Firefox, Mozilla, Opera, etc.
					parser = new DOMParser();
					xmlDoc = parser.parseFromString(text, "text/xml");
				}catch (e) {
				}
			}
			return xmlDoc;
		}
	};