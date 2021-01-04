	//play-box 클릭
	$(function(){
		$('.box').on('click',function() {
			var play_no= $(this).find('.play_no').text();
			location.href='playView?play_no='+ play_no;
		});
		
	//날로먹는 페이지네이션
			$("#cook_div .custom-select").empty();
			$("#cook_div .custom-select").append("<option value='16'>16</option>");
			$("#cook_div .custom-select").trigger("change");
			$("#cook_div th:eq(0)").trigger("click");
			
	// 놀이 - 검색버튼
		$('#search1').on('click',function() {
			var play_category ='예비아빠';
			location.href='playList?play_category='+play_category;
		})
		
			$('#search2').on('click',function() {
			var play_category ='만0~1세';
			location.href='playList?play_category='+play_category;
		})
		
			$('#search3').on('click',function() {
			var play_category ='만2세';
			location.href='playList?play_category='+play_category;
		})
		
			$('#search4').on('click',function() {
			var play_category ='만3~6세';
			location.href='playList?play_category='+play_category;
		})
	});
	
	