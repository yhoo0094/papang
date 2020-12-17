<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매페이지 리스트.. 아작스 연습</title>
</head>
<body>
	<script type="text/javascript">
		$(function() {
			itemList();
		})
		function itemList(searchType, keyword) { // 검색할때 쓸 매개변수
			// url : movieListAction 참고
			$.ajax({
				url : '',
				type : 'get',
				data : {
					searchType : searchType,
					keyword : keyword
				}, success : itemResult
			});
		}
		function itemResult(data){
			$("ol[id='listCont']").empty();
			$.each(data, function(idx, item) {
				
			})
		}
	</script>
	<div class="container">
		<h2>전체 상품</h2>
		<ol id="listCont"></ol>

	</div>
</body>
</html>