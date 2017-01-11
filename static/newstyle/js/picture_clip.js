$(function(){
	//图片垂直居中
	$('#imgBox td').height($(window).height());
	
	var imgCount = 1;
	
	$('#pic').attr('src', imgSrc);
	
	$('#pic').load(
		function(){
			if (imgCount == 0)
				return;
			
			imgCount--;
			
			var imgWidth=$('#pic').width();
		    var imgHeight=$('#pic').height();
		    var boxWidth = $(window).width();
		    var boxHeight = $(window).height();
		    var scale = 1;
		    
		    //比较imgBox的长宽比与img的长宽比大小
		    if(imgWidth>boxWidth||imgHeight>boxHeight){
			    if((boxWidth/boxHeight)>=(imgWidth/imgHeight)){
			        //重新设置img的width和height
			        scale = boxHeight/imgHeight;
			    }else{
			        //重新设置img的width和height
			        scale = boxWidth/imgWidth;
			    }
			}
			
		    $('#scale').text(Math.round(scale*100));
			
			var x1 = 0;
			var y1 = 0;
			var x2 = 0;
			var y2 = 0;
		    var initValue = Math.round(scale*100);
			var imgApi = $('#pic').imgAreaSelect({
				handles: true,
				instance: true,
				onSelectChange: function(img, selection){
					if($('#cliptype').val()==2){
						$('#infowidth').text($('#clipwidth').val());
						$('#infoheight').text($('#clipheight').val());
					}else if(selection.width){
						$('#infowidth').text(Math.round(selection.width / scale));
						$('#infoheight').text(Math.round(selection.height / scale));
					}else{
						$('#infowidth').text(0);
						$('#infoheight').text(0);
					}
				},
				onSelectEnd: function(img, selection){
					x1 = selection.x1;
					y1 = selection.y1;
					x2 = selection.x2;
					y2 = selection.y2;
				}
			});

			$('#zoom')
			.slider({
				from: 10,
				to: 300,
				dimension: '&nbsp;%',
				skin: 'round_plastic',
				onstatechange: function(value) {
					imgApi.cancelSelection();
					scale = value / 100;
					$('#pic').width(imgWidth * scale);
					$('#pic').height(imgHeight * scale);
					$('#scale').text(value);
				}
			})
			.slider('value', initValue);
			
			$('#cliptype').change(
				function(){
					switch($(this).val()){
						case '0':
							imgApi.setOptions({
								handles: true,
								aspectRatio: null,
								minWidth: null,
								minHeight: null,
								maxWidth: null,
								maxHeight: null,
								resizable:true
							});
							break;
						case '1':
							imgApi.setOptions({
								handles: true,
								aspectRatio: $('#clipwidth').val()+':'+$('#clipheight').val(),
								minWidth: null,
								minHeight: null,
								maxWidth: null,
								maxHeight: null,
								resizable: true
							});
							break;
						case '2':
							imgApi.setOptions({
								handles: false,
								aspectRatio: null,
								minWidth: $('#clipwidth').val() * scale,
								minHeight: $('#clipheight').val() * scale,
								maxWidth: $('#clipwidth').val() * scale,
								maxHeight: $('#clipheight').val() * scale,
								resizable: false
							});
							break;
					}
				}
			);
			
			$('#pic').draggable().draggable('disable');
			
			
			function openHand() {
				$('#drag').css('cursor', 'url(images/openhand.cur),pointer');
			}
			
			function closeHand() {
				$('#drag').css('cursor', 'url(images/closedhand.cur),pointer');
			}
			
			$('#drag').click(
				function() {
					imgApi.cancelSelection();
					imgApi.setOptions({disable: true});
					$('#pic')
						.draggable('enable')
						.on({
							'mousedown': closeHand,
							'mouseup': openHand
						})
						.css('cursor', 'url(images/openhand.cur),pointer');
				}
			);
			
			$('#clip').click(
				function() {
					$('#pic')
						.off({
							'mousedown': closeHand,
							'mouseup': openHand
						})
						.css('cursor', 'default')
						.draggable('disable');
					imgApi.setOptions({enable: true});
				}
			);
			
			$('#save').click(
				function(){
					var imgX1 = Math.round(x1/scale);
					var imgY1 = Math.round(y1/scale);
					var imgX2 = Math.round(x2/scale);
					var imgY2 = Math.round(y2/scale);
					var width = Math.round($('#infowidth').text());
					var height = Math.round($('#infoheight').text());
					
					var imgWidth=$('#imageInfo').attr("imageWidth");
					var imgHeight=$('#imageInfo').attr("imageHeight");
					
					if((imgX1==imgX2 && imgY1==imgY2) || (width == 0 && height == 0)){
						alert('请先选择剪裁区.');
						return;
					}
					
					if(width*1 > imgWidth*1 || height*1 > imgHeight*1){
						alert('选择的剪裁区不能超过原图的宽高.');
						return;
					}
					
					saveClipPicture(imgX1, imgY1, width, height);
				}
			);
			
			$('#saveAs').click(
					function(){
						var imgX1 = Math.round(x1/scale);
						var imgY1 = Math.round(y1/scale);
						var imgX2 = Math.round(x2/scale);
						var imgY2 = Math.round(y2/scale);
						var width = Math.round($('#infowidth').text());
						var height = Math.round($('#infoheight').text());
						
						var imgWidth=$('#imageInfo').attr("imageWidth");
						var imgHeight=$('#imageInfo').attr("imageHeight");
						
						// alert("x1=" + imgX1 + ";y1=" + imgY1 + ";width=" + width + ";height=" + height);
						
						if((imgX1==imgX2 && imgY1==imgY2) || (width == 0 && height == 0)){
							alert('请先选择剪裁区.');
							return;
						}
						
						if(width*1 > imgWidth*1 || height*1 > imgHeight*1){
							alert('选择的剪裁区不能超过原图的宽高.');
							return;
						}
						
						parent.addClipPicture_picture_list(imgX1, imgY1, width, height);
					}
				);
			
			$('#clipwidth,#clipheight').keyup(
				function(){
					if($('#cliptype').val()==1){
						imgApi.setOptions({
							aspectRatio: $('#clipwidth').val()+':'+$('#clipheight').val()
						});
					}else if($('#cliptype').val()==2){
						imgApi.setOptions({
							minWidth: $('#clipwidth').val()*scale,
							minHeight: $('#clipheight').val()*scale,
							maxWidth: $('#clipwidth').val()*scale,
							maxHeight: $('#clipheight').val()*scale
						});
					}
				}
			);
		}
	);
});