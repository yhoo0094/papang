<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
   src="${pageContext.request.contextPath}/resources/summernote/js/summernote/summernote-lite.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/summernote/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/summernote/css/summernote/summernote-lite.css">
<script>
function formCheck() {
	var f = document.frm;
	if (f.pro_name.value == "") {
		alert("상품명을 입력하세요");
		f.pro_name.focus();
		return false;
	}
	if (f.pro_price.value == "") {
		alert("상품가격을 입력하세요");
		f.pro_price.focus();
		return false;
	}
	if (isNaN(f.pro_price.value)) {
		alert("상품가격은 숫자만 입력가능합니다");
		f.pro_price.focus();
		return false;
	}
	if (f.pro_cn.value == "") {
		alert("기업명을 입력하세요");
		f.pro_cn.focus();
		return false;
	}
	if (f.pro_detail.value == "") {
		alert("상세정보를 등록하세요");
		f.pro_detail.focus();
		return false;
	}
	return true;
}
</script>


<h1 class="mt-4">판매상품 수정</h1>
	
<form id="frm" class="form-horizontal" name="frm" method="post" encType="multipart/form-data" action="${pageContext.request.contextPath}/market/itemUpdate">
   <div align="center">
      <table class="table" style="width: 100%">
         <tbody>
            <tr>
               <td align="center" style="width: 10%" >상품명</td>
               <td><input class="form-control" name="pro_name" type="text" style="width: 100%" value="${pro.pro_name}"></td>
            </tr>
            <tr>
               <td align="center" style="width: 10%">가격</td>
               <td><input class="form-control" name="pro_price" type="text" style="width: 100%" value="${pro.pro_price}"></td>
            </tr>
            <tr>
               <td align="center" style="width: 10%">기업명</td>
               <td><input class="form-control" name="pro_cn" type="text" style="width: 100%" value="${pro.pro_cn}"></td>
            </tr>
            <tr>
               <td align="center" style="width: 10%">대표사진</td>
               <td><input type="file" id="pro_pic" name="uploadFile" class="form-control" style="width: 100%" >
                  <input type="hidden" id="pro_no" name="pro_no" value="${pro.pro_no}">
               </td>
            </tr>
         </tbody>
      </table>
   </div>
   <div align="center">
      <textarea id="summernote" name="pro_detail">${pro.pro_detail}</textarea><br>
      <button type="submit" class="btnRed bMedium" onclick="return formCheck()">수정</button>
      <button type="button" class="btnGray bMedium" onclick="location.href='/papang/marketList/itemBoard'">취소</button>
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