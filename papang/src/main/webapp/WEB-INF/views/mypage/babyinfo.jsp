<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-input{}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
.input_small {width: 400px; height: 40px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_middle {width: 80px; height: 40px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_big {}
.divmargin {margin-top: 150px;}
.big_title {text-align: center;
font-size:50px;
}
.mid_title {text-align: right;
font-size:25px;


}
#hi input[id="cb1"] + label {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
}
.label {font-size:20px;margin:30px;width:200px;}
.td_content {font-size:22px;}
.table-bordered {text-align: center;}
.btnYellow {font-size:22px;}
input[type=checkbox]{width: 20px;height: 20px;}
p {
    margin-top: 0;
    margin-bottom: 1rem;
}
.content_div{width: 90%;
    margin: 0px 0px 0px 200px;}
    .w3-large {
    margin: 0 0 60px 230px;
}
table tbody tr td {
  font-size: 24px;
}
.btnRed {
    background-color: #ff8080;
    border: none;
    font-weight: bold;
    width: 60px; 
    height: 40px;
    font-size: 28px;
    margin-bottom: 10px;
}
#fim2{
    margin: 0 0 0 193px;
}

#aa{
        width: 1287px;
}
</style>
<title>마이페이지</title>
</head>

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

							$('#mbr_pic').attr('src', e.target.result);
							$('#mbr_pic').attr('style',"width:300px; height: 400px");
						}
						reader.readAsDataURL(f);
					} else {
						$('#mbr_pic').attr('src', e.target.result);
						$('#mbr_pic').attr('style',"width:300px; height: 400px");
					}
				});//arr.forEach
	}

});




</script>
<body>
 
	<div>
	
	<form id="fim" name="fim" action="babyinfodelete" method="post">
		<div>
			<div class="w3-large" align="center">
				<h3 class="big_title">아기정보 관리</h3>
			</div>
			<div class="content_div">
				<br>
			    
			 
					   <button type="submit" class="btnRed bSmall pull-right" id="selectBtn">삭제</button>
					   
					      <div align="right">
			
		</div>
		<br>
			<table class="table" id="example-table-3">
				<thead>
					<tr class="tableTrTh">
						<th width="15%" class="tableTh">선택</th>
						<th width="15%" class="tableTh">사진</th>
						<th width="15%" class="tableTh">아기 이름</th>
						<th width="15%" class="tableTh">성별</th>
						<th width="15%" class="tableTh">태어난 날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="co5" items="${cos5}">
					<tr>
						 
						<td align="center"><input value="${co5.chi_no}" type="checkbox" name="user_CheckBox" ></td>
						<td align="center"><img class= "img1" id = "chi_pic" name="chi_pic" 
						src="${pageContext.request.contextPath}/resources/images/baby/${co5.chi_pic}"></td>
						<td align="center">${co5.chi_name}</td>
						<td align="center">${co5.chi_gender}</td>
						<td align="center">${co5.chi_birth}</td>
					</tr>
				</c:forEach>	
					
					
				</tbody>
			</table>
			
		
					   <br>  
					   <br>
			<!-- <button style="font-size:22px">추가</button>	 -->
			<%--  <button class="btnRed bSmall">추가</button>
				    
			<div style="background:rgb(249, 196, 94)">    					    
			<label class="label">아이 이름</label>
			<input class="input_small" type="text" id="id" name="id"></br>
			<label class="label">아이 성별선택</label>
			<select class="input_middle" id="room_address" name="room_address">
                        <option>남</option>
                        <option>여</option>
                        <option>예정</option>                       
            </select>		
           <br>
			<label class="label">아이 출생년도</label>
			<input class="input_small" type="date" id="id" name="id"  value="${ member.id }">
			</div>		 --%>
		</div>
	</div>
	</form>
	
	  <form id="fim2" name="fim2" action="babyinfoinsert" method="post" enctype="multipart/form-data">
			  <button type="submit" class="btnRed bSmall">추가</button>
				    
			<div id="aa" style="background:rgb(249, 196, 94)">    					    
			<label class="label">아이 이름</label>
			<input class="input_small" type="text" id="chi_name" name="chi_name"></br>
			
			<label class="label">아이 성별선택</label>
			<select class="input_middle" id="chi_gender" name="chi_gender">
                        <option value="남">남</option>
                        <option value="여">여</option>
                        <option value="예정">예정</option>                       
            </select>
                           사진 추가
            <input type="file" id="uploadFile"  name="uploadFile" value="${childVO.chi_pic}"/>		
           <br>
			<label class="label">아이 출생년도</label>
			<input class="input_small" type="date" id="chi_birth" name="chi_birth">
			<label class="label">SNS 수신 알림</label>
			<select class="input_middle" id="chi_sns" name="chi_sns">
                        <option value="동의">동의</option>
                        <option value="비동의">비동의</option>               
            </select>
			</div>	
	  </form>			 
</div>	
	

</body>

<script>
$("#selectBtn").click(function(){ 
	
	
	var rowData = new Array();
	var tdArr = new Array();
	var cnt = $("input[name=user_CheckBox]:checked").length;
	var checkbox = $("input[name=user_CheckBox]:checked");
	
	// 체크된 체크박스 값을 가져온다
	
	 if(cnt == 0){
         alert("선택된 글이 없습니다.");
     }
	 else { 
		checkbox.each(function(i) {


		// checkbox.parent() : checkbox의 부모는 <td>이다.
		// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
		
		// 체크된 row의 모든 값을 배열에 담는다.
		rowData.push(tr.text());
		   
		// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		var no = td.eq(1).text()
		
		 	
		// 가져온 값을 배열에 담는다.
		tdArr.push(no);
		$("#ex3_Result3").html(tdArr);
		
	/* 	$.ajax({ 
            url : "mapage/babyinfo",
            type : 'POST',
            data : {
               
            	tdArr:tdArr
                
            },
            error{
               alert("실패");
            },
            success : function(data) {
               alert("전송되었습니다.");
               location.replace("checkbox")
            }
         }); */
	});
	  
	 }
	
	
		
});
</script>

</html>