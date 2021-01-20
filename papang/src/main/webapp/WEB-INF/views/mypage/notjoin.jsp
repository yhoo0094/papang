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
.input_small {width: 200px; height: 30px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
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
    margin: 0px 0px 0px 200px;}
    .w3-large {
    margin: 0 0 60px 230px;
}
table tbody tr td {
  font-size: 24px;
}
.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    font-family: 'Jua', sans-serif;
    }
</style>
<title>마이페이지</title>
</head>
<body>
	<div>
		<div>
			<div class="w3-large" align="center">
				<h3 class="big_title">회원 탈퇴</h3>
			</div>
			<div class="content_div" align="center">
				</br>
			    <h3>회원탈퇴 주의사항</h3></br>
			    <div align="left" style="margin-left: 350px;">
			   <h4> 1. 회원 탈퇴는 즉시 처리되며, 개인정보가 모두 삭제됩니다.<h4>
			   <h4 style="color:red">2. 단, 게시판 등에 공유하신 게시물은 탈퇴 후에도 삭제되지 않습니다.</h4>
			   </div>
			   	</br>
			   
			   
			   	<form id="myForm" action="notjoin2" method="post" onsubmit="return submitCheck();"> 
			   	<label style="font-size:20px;margin:20px">아이디　　　</label><input class="input_small" type="text" id="id"

							name="id" readonly value="${ memberVO.mbr_id }">
			    </br>
				<label style="font-size:20px;margin:20px">이름　　　　</label><input class="input_small" type="text" id="id"
							name="id" readonly value="${ memberVO.mbr_name}">
				</br> 
				<label style="font-size:20px;margin:20px;color: red">비밀 번호　　
				</label> 
				<input class="input_small pw" type="password" id="mbr_pw"
							name="mbr_pw">
				</br>			
				<label style="font-size:20px;margin:20px;color: red">비밀 번호 확인</label>  
				
				<input class="input_small pw" type="password" id="mbr_pw2"
							name="mbr_pw2">
							
				
				<input type="hidden" name="hintpw" id="hintpw" value="${ memberVO.mbr_pw }">
						<br><br>				 
						<p class="w3-center">
						<button type="submit a" id="joinBtn" 
							class="btnYellow bMedium">탈퇴</button>
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
        var pwd3 = $("#hintpw").val();
        
    	   if(pwd1 == pwd2 && pwd2== pwd3 ) {
    		   alert("회원 탈퇴되었습니다.");
    	   return true;

    	 }
    	   else {
    		   alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
    	  return false
    	   }
    	}
    
    
  
   
</script>
</html>