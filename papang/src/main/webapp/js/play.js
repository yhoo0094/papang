	//play-box 클릭
	$(function(){
		$('.box').on('click',function() {
			var play_no= $(this).find('.play_no').text();
			location.href='playView?play_no='+ play_no;
			/* alert('dd'); */
		});
		
	//날로먹는 페이지네이션
			$("#cook_div .custom-select").empty();
			$("#cook_div .custom-select").append("<option value='16'>16</option>");
			$("#cook_div .custom-select").trigger("change"); 
			
	})(jQuery);
	
	