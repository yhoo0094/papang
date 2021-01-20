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
.input_small {width: 300px; height: 30px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
.input_middle {}
.input_big {}
.divmargin {margin-top: 150px;}
.big_title {text-align: center;
font-size:50px;
}
p {
    margin-top: 0;
    margin-bottom: 1rem;
}
.content_div{width: 90%;
    margin: 0px 0px 0px 110px;}
    .w3-large {
    margin: 0 0 60px 230px;
}
table tbody tr td {
  font-size: 24px;
}

.img1 {
  width: 300px;
  height: 300px;
  object-fit: cover;
}
.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    font-family: 'Jua', sans-serif;
    }
</style>




<title>마이페이지</title>
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
</head>
<body> 
					<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<div>
		<div>
			<div class="w3-large" align="center">
				<h3 class="big_title">회원 정보 수정</h3>
			</div>
			<div class="content_div">
			 
				 <form id="fim" name="fim" action="update" method="post" enctype="multipart/form-data" onsubmit="return submitCheck();" > 
					<p>
						<label>이름</label> <input class="w3-input" type="text" id="mbr_name"
							name="mbr_name" readonly value="${ memberVO.mbr_name}">
					</p>
					<p>
						<label>프로필 사진</label> <img class= "img1" id = "mbr_pic" name="mbr_pic" 
						src="${pageContext.request.contextPath}/images/memberimage/${ memberVO.mbr_pic}"><input type="file" id="uploadFile"  name="uploadFile" value="${ memberVO.mbr_pic}"/>		
					</p>
					
					<p>
						<label>아이디</label> <input class="w3-input" type="text" id="mbr_id"
							name="mbr_id" readonly value="${ memberVO.mbr_id }">
					</p>
					<p>
						<label>생년월일</label> <input class="w3-input" type="text"
							id="mbr_birth" readonly name="mbr_birth" value="${ memberVO.mbr_birth }">
					</p>
					<p class="w3-center"></p>
					<input type="hidden" name="id" value="${ memberVO.mbr_pw }">
					<p> 
						<label style="color: red">비밀번호</label> 
							<div class="content_content">
   								 <input type="password" id="mbr_pw" name ="mbr_pw" class="pw w3-input" placeholder="비밀번호" >
   								 <span>8~15자리의 영문, 숫자, 특수문자의 입력이 가능합니다.</span>
							</div>  
					</p>
					<p> 
						<label style="color: red">비밀번호 확인</label> 
						<div class="content_content">
   								 <input type="password" id="mbr_pw2" name ="mbr_pw2" class="pw w3-input"  placeholder="비밀번호 확인">
    							<span id="alert-success" style="display: none; color: #84FF33; font-weight: bold;">비밀번호가 일치합니다.</span>
    							<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
						</div>
					</p>
					<p>
						
					</p>
					<p>
						<label>핸드폰</label> <input class="w3-input" type="text"
							id="mbr_phone" name="mbr_phone" type="text" value="${ memberVO.mbr_phone }">
					</p>
					<p> 
						<label>우편 번호</label>    <input  type="text" class="input_small"
							id="sample2_postcode" name="mbr_post" value="${ memberVO.mbr_post }" > 주소<input  type="text" class="input_small"
							id="sample2_address" name="mbr_addr1" type="text" value="${ memberVO.mbr_addr1 }">   
							<input class="input_small" type="text" id="sample2_extraAddress" name="mbr_addr3"  value="${ memberVO.mbr_addr3 }" ><input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
					</p>   
  
					<p> 
							<input class="w3-input"
							id="mbr_addr2"  name="mbr_addr2" type="text" value="${ memberVO.mbr_addr2 }">
					</p>
					<p>
						<label>계좌번호</label><select  class="input_small" name="mbr_bank" id="mbr_bank">
		 							<option value="${ memberVO.mbr_bank}">${ memberVO.mbr_bank}</option>
									<option value="경남은행">경남은행</option>
									<option value="광주은행">광주은행</option>
									<option value="국민은행">국민은행</option>
									<option value="기업은행">기업은행</option>
									<option value="농협중앙회">농협중앙회</option>
									<option value="농협회원조합">농협회원조합</option>
									<option value="대구은행">대구은행</option>
									<option value="도이치은행">도이치은행</option>
									<option value="부산은행">부산은행</option>
									<option value="산업은행">산업은행</option>
									<option value="상호저축은행">상호저축은행</option>
									<option value="새마을금고">새마을금고</option>
									<option value="수협중앙회">수협중앙회</option>
									<option value="신한금융투자">신한금융투자</option>
									<option value="신한은행">신한은행</option>
									<option value="신협중앙회">신협중앙회</option>
									<option value="외환은행">외환은행</option>
									<option value="우리은행">우리은행</option>
									<option value="우체국">우체국</option>
									<option value="전북은행">전북은행</option>
									<option value="제주은행">제주은행</option>
									<option value="카카오뱅크">카카오뱅크</option>
									<option value="케이뱅크">케이뱅크</option>
									<option value="하나은행">하나은행</option>
									<option value="한국씨티은행">한국씨티은행</option>
									<option value="HSBC은행">HSBC은행</option>
									<option value="SC제일은행">SC제일은행</option>
							</select> <input class="w3-input" 
							id="mbr_account" name="mbr_account"  value="${ memberVO.mbr_account }">
					</p>
					<p>
						<label style="color: red">이메일</label> <input class="w3-input"
							id="mbr_email" name="mbr_email" type="text"  value="${ memberVO.mbr_email }">
					</p>
					
					<p class="w3-center">
						<button type="submit" id="myhomechange"
							class="btnYellow bMedium aa">변경</button>
						
					</p>
					
				</form>
			</div>
		</div>
	</div>



</body>
<script>
    $('.pw').focusout(function () {
        var pwd1 = $("#mbr_pw").val();
        var pwd2 = $("#mbr_pw2").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        } 
    });
    
    

    function submitCheck() {
    	var pwd1 = $("#mbr_pw").val();
        var pwd2 = $("#mbr_pw2").val();
        var email = $("#mbr_email").val();
    	    
         if(email ==''){
			   alert("이메일 입력해주세요");
			   return false
		   }   
         
        
        else if(pwd1 == pwd2) {
    		   if(pwd2 !='' && pwd2 !=''){
    			   alert("다시 로그인해주세요");
    			   return true 
    		   }
    		   else if(pwd1 =='' && pwd2==''){
        		   alert("비밀번호를 제대로 입력해주세요");
        		   return false 
        	   }
    		   
    		   
    	   }
    	   
   
    	   else if(pwd1 ==null || pwd2==null){
    		   alert("비밀번호를 제대로 입력해주세요");
    		   return false 
    	   }
    	 
    	   else {
    		   alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
    	  return false
    	   }
    	}
    
    
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께
 
        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }

</script>
</html>