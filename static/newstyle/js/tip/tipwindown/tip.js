function show_by_url(_title,_href,_width,_height){
	var options = {
			title:_title,
			width:+_width,
			height:+_height,
			lock:true,
			fixed:true
	};
//	var dialog = top.art.dialog({title:""+title, iframe:href,height:width_,width:height_,lock:true, fixed:true});
		var dialog = top.art.dialog.open(_href,options);
	return dialog;
}




