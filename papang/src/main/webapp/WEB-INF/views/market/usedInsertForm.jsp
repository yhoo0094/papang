<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.FormTitle {
	padding: 1%;
}

.FormType {
	width: 100%;
	border: none;
}

.sirenImg {
	width: 30px;
	height: 30px;
	margin-bottom: 10px
}

.insertBtn {
	height: 126px;
	width: 126px;
}

.FormTxtarea {
	width: 100%;
	height: 100%;
	border: none;
}

.FormTable {
	width: 100%;
	border: solid gray 1px;
	border-collapse: collapse;
}
</style>
<script
   src="${pageContext.request.contextPath}/resources/summernote/js/summernote/summernote-lite.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/summernote/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/summernote/css/summernote/summernote-lite.css">

<div align="center" class="FormTitle strongYellow">
	<h3>중고장터 글 등록</h3>
</div>
<form id="frm" class="form-horizontal" name="frm" method="post" action="${pageContext.request.contextPath}/market/usedInsert">
   <div align="center">
      <table class="table" style="width: 100%">
         <tbody>
            <tr>
               <td align="center" style="width: 10%">제목</td>
               <td><input name="used_title" type="text" style="width: 100%"></td>
            </tr>
            <tr>
               <td align="center" style="width: 10%">지역</td>
               <td><select name="used_loc" class="FormType">
						<option value='택배'>택배</option>
						<option value='서울'>서울</option>
						<option value='부산'>부산</option>
						<option value='대구'>대구</option>
						<option value='인천'>인천</option>
						<option value='광주'>광주</option>
						<option value='대전'>대전</option>
						<option value='울산'>울산</option>
						<option value='강원'>강원</option>
						<option value='경기'>경기</option>
						<option value='경남'>경남</option>
						<option value='경북'>경북</option>
						<option value='전남'>전남</option>
						<option value='전북'>전북</option>
						<option value='제주'>제주</option>
						<option value='충남'>충남</option>
						<option value='충북'>충북</option>
				</select></td>
            </tr>
            <tr>
               <td align="center" style="width: 10%">가격</td>
               <td><input name="used_price" type="text" style="width: 100%"></td>
            </tr>
            <tr>
               <td align="center" style="width: 10%">사진</td>
               <td><input type="text" id="used_pic" name="used_pic"
                  style="width: 80%; margin-right: 20px"><input type="button" value="찾기">
                  <input type="hidden" id="mbr_id" name="mbr_id" value="${user.mbr_id}">
               </td>
            </tr>
         </tbody>
      </table>
   </div>
   <div align="center">
      <textarea id="summernote" name="used_content"></textarea><br>
      <input type="submit" class="btnRed bMedium" value="등록">&nbsp;&nbsp;
      <input type="reset" class="btnGray bMedium" value="취소">
   </div>
</form>
<script>
      //여기 아래 부분
      $('#summernote').summernote({
         height : 500, // 에디터 높이
         minHeight : null, // 최소 높이
         maxHeight : null, // 최대 높이
         focus : true, // 에디터 로딩후 포커스를 맞출지 여부
         lang : "ko-KR", // 한글 설정
      });
</script>