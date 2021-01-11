<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
img {
  width: 300px;
  height: 150px;
  object-fit: cover;
}
@media (min-width: 1200px)
.modal-dialog {
    max-width: 1200px;
    margin: 1.75rem auto;
}
</style>
<script>
$(function() {


	$("#uploadFile").on(
			'change',
			function(e) {
				if (window.FileReader) {
					console.log($($(this)[0].files[0].name));
					var filename = $(this)[0].files[0].name;

				} else {

					var filename = $(this).val().split('/').pop().split(
							'\\').pop();
					console.log($(this).val().split('/').pop().split('\\')
							.pop());

				}

				$('#la').text(filename);

				var files = e.target.files;
				var arr = Array.prototype.slice.call(files);
				for (var i = 0; i < files.length; i++) {
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
				}

				preview(arr);

			});

	function checkExtension(fileName, fileSize) {

		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 20971520; //20MB

		if (fileSize >= maxSize) {
			alert('파일 사이즈 초과');
			$("input[type='file']").val(""); //파일 초기화
			return false;
		}

		if (regex.test(fileName)) {
			alert('업로드 불가능한 파일이 있습니다.');
			$("input[type='file']").val(""); //파일 초기화
			return false;
		}
		return true;
	}

	function preview(arr) {
		arr
				.forEach(function(f) {

					//파일명이 길면 파일명...으로 처리
					var fileName = f.name;
					if (fileName.length > 10) {
						fileName = fileName.substring(0, 7) + "...";
					}

					//div에 이미지 추가
					var str = '<div style="display: inline-flex; padding: 10px;"><li>';
					str += '<span>' + fileName + '</span><br>';

					//이미지 파일 미리보기
					if (f.type.match('image.*')) {
						var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
						reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
							//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';

							$('#pro_pic').attr('src', e.target.result);
							$('#pro_pic').attr('style',"width:300px; height: 400px");
						} 
						reader.readAsDataURL(f);
					} else {
						$('#pro_pic').attr('src', e.target.result);
						$('#pro_pic').attr('style',"width:300px; height: 400px");
					}
				});//arr.forEach
	}

});
 



</script>
</head>
<body>
 
      	      <table class="table" id="dataTable"> 
				<thead>
					<tr class="tableTrTh"> 
						<th width="15%" class="tableTh">상품 번호</th>
						<th width="20%" class="tableTh">상품 사진</th>
						<th width="20%" class="tableTh">상품 명</th>
						<th width="20%" class="tableTh">상품 가격</th>
						<th width="15%" class="tableTh">상품 수량</th>
					
					</tr>
				</thead>  
				<tbody>
				<c:forEach var="co8" items="${cos7}" >
					<tr> 
			
						<td align="center">${co8.pro_no}</td>
						<td align="center"><img id = "pro_pic" name="pro_pic" src="${pageContext.request.contextPath}/images/${co8.pro_pic}"></td>
						<td align="center">${co8.pro_name}</td>
						<td align="center">${co8.pro_price}</td>
						<td align="center">${co8.bag_cnt}</td>  
					</tr>
				</c:forEach>	
					
					
				</tbody>
			</table>
</body>
</html>