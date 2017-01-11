// JavaScript Document
function showtipswithoutsyh(title, columnName, siteName, sumbitResult,
		backReason) {
	if (document.getElementById("showtips") != null) {
		document.getElementsByTagName("body")[0].removeChild(document
				.getElementById("showtips"));
	}
	tipswithoutsyh(title, columnName, siteName, sumbitResult, backReason);
	tipPosition();
}

function tipPosition() {
	var mouse = mouseposition();
	var scrollingPosition = getScrollingPosition();
	// //alert(mouse[0]);
	// alert(mouse[1]);
	var tips = document.getElementById("showtips");
	if (tips != null) {
		tips.style.position = "absolute";
		tips.style.display = "block";
		tips.style.width = "400px";
		tips.style.backgroundColor = "#EEEEE0" +
				"";
		tips.style.border = "1";
		tips.style.zIndex = "10000";
		tips.style.left = mouse[0] + 10 + "px";
		tips.style.top = mouse[1] + 10 + "px";

		var viewportSize = getViewportSize();

		if (mouse[0] - scrollingPosition[0] + 10 + tips.offsetWidth > viewportSize[0] - 25) {
			tips.style.left = scrollingPosition[0] + viewportSize[0] - 25
					- tips.offsetWidth + "px";
		} else {
			tips.style.left = mouse[0] + 10 + "px";
		}

		if (mouse[1] - scrollingPosition[1] + 10 + tips.offsetHeight > viewportSize[1] - 25) {
			if (event.clientX > (viewportSize[0] - 25 - tips.offsetWidth)) {
				tips.style.top = mouse[1] - tips.offsetHeight - 10 + "px";
			} else {
				tips.style.top = scrollingPosition[1] + viewportSize[1] - 25
						- tips.offsetHeight + "px";
			}
		} else {
			tips.style.top = mouse[1] + 10+ "px";
		}
	}
}

function tipswithoutsyh(title, columnName, siteName, sumbitResult, backReason) {
	var tips = document.createElement("div");
	tips.setAttribute("id", "showtips");
	document.getElementsByTagName("body")[0].appendChild(tips);
	var htmlValue = "<fieldset><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"contentTable\" >"
			+ "<tr>" 
			+"<td style=\"text-align:right;height:25px\" width=\"20%\">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：<\/td>"
			+"<td align=\"left\">"+ title+ "<\/td>" 
			+"<\/tr>" 
			+ "<tr>" 
			+"<td style=\"text-align:right;height:25px\" width=\"20%\">站点名称：<\/td>"
			+"<td align=\"left\">"+ siteName+ "<\/td>" 
			+"<\/tr>" 
			+ "<tr>" 
			+"<td style=\"text-align:right;height:25px\" width=\"20%\">栏目名称：<\/td>" 
			+"<td align=\"left\">"+ columnName+ "<\/td>" 
			+"<\/tr>" 
			+ "<tr>" 
			+"<td style=\"text-align:right;height:25px\" width=\"20%\">审核结果：<\/td>" 
			+"<td align=\"left\">"+ sumbitResult + "<\/td>" 
			+"<\/tr>" 
			+"<\/table></fieldset>";
	if (sumbitResult == '不通过') {
		htmlValue += "<fieldset><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"  class=\"contentTable\">"
				+ "<tr>" 
				+"<td style=\"text-align:right;height:25px\" width=\"20%\">不通过理由：<\/td>"
				+"<td align=\"left\">"+ backReason+ "<\/td>" 
				+"<\/tr><\/table></fieldset>";
	} else if (sumbitResult == '退回') {
		htmlValue += "<fieldset><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"contentTable\" >"
				+ "<tr>" 
				+"<td style=\"text-align:right;height:25px\" width=\"20%\">退回理由：<\/td>"
				+"<td align=\"left\">"+ backReason+ "<\/td>" 
				+"<\/tr><\/table></fieldset>";
	}
	tips.innerHTML += htmlValue;
}
function removetips() {
	if (document.getElementById("showtips") != null) {
		document.getElementsByTagName("body")[0].removeChild(document
				.getElementById("showtips"));
	}
}

function mouseposition() {
	var position = getScrollingPosition();
	if (typeof event == "undefined") {
		event = window.event;
	}
	var cursorPosition = [ 0, 0 ];

	if (typeof event.pageX != "undefined" && typeof event.x != "undefined") {
		cursorPosition[0] = event.pageX;
		cursorPosition[1] = event.pageY;
	} else {
		cursorPosition[0] = event.clientX + position[0];
		cursorPosition[1] = event.clientY + position[1];
	}
	return cursorPosition;
}
function getScrollingPosition() {
	var position = [ 0, 0 ];
	if (typeof window.pageYOffset != 'undefined') {
		position = [ window.pageXOffset, window.pageYOffset ];
	}
	if (typeof document.documentElement.scrollTop != 'undefined'
			&& document.documentElement.scrollTop > 0) {
		position = [ document.documentElement.scrollLeft,
				document.documentElement.scrollTop ];
	} else if (typeof document.body.scrollTop != 'undefined') {
		position = [ document.body.scrollLeft, document.body.scrollTop ];
	}
	return position;
}

function getViewportSize() {
	var size = [ 0, 0 ];

	if (typeof window.innerWidth != 'undefined') {
		size = [ window.innerWidth, window.innerHeight ];
	} else if (typeof document.documentElement != 'undefined'
			&& typeof document.documentElement.clientWidth != 'undefined'
			&& document.documentElement.clientWidth != 0) {
		size = [ document.documentElement.clientWidth,
				document.documentElement.clientHeight ];
	} else {
		size = [ document.getElementsByTagName('body')[0].clientWidth,
				document.getElementsByTagName('body')[0].clientHeight ];
	}

	return size;
}