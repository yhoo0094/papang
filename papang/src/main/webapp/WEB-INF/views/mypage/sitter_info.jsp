<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
.input_small {width: 200px; height: 40px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_middle {}
.input_big {}
.divmargin {margin-top: 150px;}
.big_title {text-align: center;
font-size:50px;
}
.mid_title {text-align: left;
font-size:30px;
}
.small_title {text-align: right;
font-size:20px;
}
table,td {border : 1px solid black;}
.div{margin-left: 361px;}
.btn {width: 310px; height: 51px; background-color: red;}
.theader {height: 30px; width: 30px;border:1px solid black;}
td {margin : 10px;}
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

</style>
<title>월급확인</title>
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

							$('#sit_pic').attr('src', e.target.result);
							$('#sit_pic').attr('style',"width:300px; height: 400px");
						}
						reader.readAsDataURL(f);
					} else {
						$('#sit_pic').attr('src', e.target.result);
						$('#sit_pic').attr('style',"width:300px; height: 400px");
					}
				});//arr.forEach
	}

});




</script>
</head>
<body>
<div class="w3-large" align="center">
<h3 class="big_title">시터정보조회</h3>
</div> 
 
 <form id="fim" name="fim" action="sitterupdate" method="post"  enctype="multipart/form-data"> 
<div class="content_div">
<table >
	<tr  width="400" align="center">
		<td class="theader" rowspan="2" height="140"  >
			<img id = "sit_pic" name="sit_pic" src="${pageContext.request.contextPath}/resources/images/sitterProfile/${ sitterVO.sit_pic}">
		</td> 
		<td width="400" align="center" height="70">지역</td>
		<td width="400" align="center" height="70">
		    <select  name="sit_loc" id ="sit_loc" class="input_middle">
                        <option value="${ sitterVO.sit_loc}">${ sitterVO.sit_loc}</option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="대전">대전</option>
							<option value="대구">대구</option>
							<option value="부산">부산</option>
							<option value="울산">울산</option>
							<option value="광주">광주</option>
							<option value="강원">강원</option>
							<option value="세종">세종</option>
							<option value="충북">충북</option>
							<option value="충남">충남</option>
							<option value="경북">경북</option>
							<option value="경남">경남</option>
							<option value="전북">전북</option>
							<option value="경남">경남</option>
							<option value="전남">전남</option> 
							<option value="제주">제주</option>                       
            </select></td>
	
	</tr>
	<tr  width="400" align="center" height="70">
		<td align="center" >희망시급</td>
		<td> <input type="text" id = "sit_pay" name="sit_pay" style = "text-align:center;" value="${sitterVO.sit_pay}"/>원</td>	
            
	</tr>
	
	 
	
	<tr  width="400" align="center" height="70">
		<td align="center"><input type="file" id="uploadFile"  name="uploadFile"/></td>
							 
		<td>희망연령대 </td>
		<td colspan="2"><select id="sit_age" name="sit_age" class="input_middle">
                        <option value="${ sitterVO.sit_age}">${ sitterVO.sit_age}</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							                    
        </select>개월</td>	
            
	</tr>
	
	  
	
	<tr  width="400" align="center" height="70">
		<td>
			급여지급일
		</td>
		
		<td class="theader" colspan="2">
			${sitterVO.sit_payday}
		</td>
	
	</tr>
	<tr  width="400" align="center" height="70">
		<td>
			휴무일
		</td>
		

	

	<td class="theader" colspan="2">
       <input type = "checkbox" name = "array" value = "월" > <label>월</label></input>
       <input type = "checkbox" name = "array" value = "화" > <label>화</label></input>
       <input type = "checkbox" name = "array" value = "수" > <label>수</label></input>
       <input type = "checkbox" name = "array" value = "목" > <label>목</label></input>
       <input type = "checkbox" name = "array" value = "금" > <label>금</label></input>
   </td>

	</tr>	
	
	<tr  width="400" align="center" height="70">
		<td>
			특이사항
		</td>
		
		<td class="theader" colspan="2">
		<input type="text" id="sit_note" name="sit_note" style = "text-align:center;" value="${ sitterVO.sit_note}"/>
		</td>
	
	</tr>
	
		<tr  width="400" align="center" height="70">
		<td>
			계좌번호
		</td>
		
		
		<td class="theader" colspan="2">${memberVO.mbr_bank}　${ memberVO.mbr_account}
		</td>
	
	</tr>
</table>
	
	
	<p class="w3-center">
						<button type="submit" id="joinBtn"
							class="btnYellow bMedium">변경</button>
						<button type="reset"
							class="btnGray bMedium">취소</button>
					</p>
</div>
</form>

</body>
<script>


 var sitoff= '${sitterVO.sit_off}';
sitoff=sitoff.split(' ');
console.log(sitoff[0]); 
$('[name="array"]').val(sitoff);



/* $("input[name=current_proudct]:checked").each(function() { 
var test = $(this).val(); } */ //뿌릴떄쓰자


</script>
</html>