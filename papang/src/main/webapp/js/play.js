	//play-box 클릭
	$('.box').on('click',function boxclick() {
			var play_no= $(this).find('.play_no').text();
			location.href='playView?play_no='+ play_no;
		});
	$(function(){
	//날로먹는 페이지네이션
			$("#cook_div .custom-select").empty();
			$("#cook_div .custom-select").append("<option value='12'>12</option>");
			$("#cook_div .custom-select").trigger("change");
			$("#cook_div th:eq(0)").trigger("click");
			
	// 놀이 - 검색버튼
		$('#search1').on('click',function search1() {
			var play_category ='예비아빠';
			location.href='playList?play_category='+play_category;
		})
		/*window.onload=search1;*/
		
			$('#search2').on('click',function search2() {
			var play_category ='만0~1세';
			location.href='playList?play_category='+play_category;
		})
		/*window.onload=search2;*/
		 
			$('#search3').on('click',function search3() {
			var play_category ='만2세';
			location.href='playList?play_category='+play_category;
		})
		/*window.onload=search3;*/
		
			$('#search4').on('click',function search4() {
			var play_category ='만3~6세';
			location.href='playList?play_category='+play_category;
		})
		/*window.onload=search4;*/
		
		
		$("#cancleBtn").click(function(){

		window.history.back();

	});


	});
	
	