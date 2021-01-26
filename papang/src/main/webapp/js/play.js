	
	
	//play-box 클릭
	$('.box').on('click',function boxclick() {
			var play_no= $(this).find('.play_no').text();
			location.href='playView?play_no='+ play_no+'&ac_category=놀이';
		});
		
	//cook-box 클릭
	$('.c_box').on('click',function(){
		var cook_no = $(this).find('.cook_no').text();
		location.href="cookView?cook_no=" + cook_no+'&ac_category=요리';
	});
	
	$(function(){
	//날로먹는 페이지네이션
			$("#cook_div .custom-select").empty();
			$("#cook_div .custom-select").append("<option value='9'>9</option>");
			$("#cook_div .custom-select").trigger("change");
			$("#cook_div th:eq(0)").trigger("click");
			
	// ########놀이 - 검색버튼
		$('#search1').on('click',function search1() {
			var play_category ='예비아빠';
			location.href='playList?play_category='+play_category;
		})
		
			$('#search2').on('click',function search2() {
			var play_category ='만0~1세';
			location.href='playList?play_category='+play_category;
		})
		 
			$('#search3').on('click',function search3() {
			var play_category ='만2세';
			location.href='playList?play_category='+play_category;
		})
		
			$('#search4').on('click',function search4() {
			var play_category ='만3~6세';
			location.href='playList?play_category='+play_category;
		})
		
		
		
		// ########요리 - 검색버튼
		$('#c_search1').on('click',function search5() {
			var cook_category ='이유식';
			location.href='cookList?cook_category='+cook_category;
		})
		
		
			$('#c_search2').on('click',function search6() {
			var cook_category ='아이와함께';
			location.href='cookList?cook_category='+cook_category;
		})
		
		 
			$('#c_search3').on('click',function search7() {
			var cook_category ='비건아이';
			location.href='cookList?cook_category='+cook_category;
		})
		
			$('#c_search4').on('click',function search8() {
			var cook_category ='육식아이';
			location.href='cookList?cook_category='+cook_category;
		})
		
		
		//취소버튼 - 이전페이지로 돌아가기(글작성 폼)
		$("#cancleBtn").click(function(){

		window.history.back();

	});


	});
	
	