<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
   src="${pageContext.request.contextPath}/resources/summernote/js/summernote/summernote-lite.js"></script>
<script
   src="${pageContext.request.contextPath}/resources/summernote/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/summernote/css/summernote/summernote-lite.css">



<h1 class="mt-4">판매상품 등록</h1>
	
<form id="frm" class="form-horizontal" name="frm" method="post" action="${pageContext.request.contextPath}/market/itemInsert">
   <div align="center">
      <table class="table" style="width: 100%">
         <tbody>
            <tr>
               <td align="center" style="width: 10%">상품명</td>
               <td><input name="pro_name" type="text" style="width: 100%"></td>
            </tr>
            <tr>
               <td align="center" style="width: 10%">가격</td>
               <td><input name="pro_price" type="text" style="width: 100%"></td>
            </tr>
            <tr>
               <td align="center" style="width: 10%">기업코드</td>
               <td><input name="pro_cc" type="text" style="width: 100%"></td>
            </tr>
            <tr>
               <td align="center" style="width: 10%">대표사진</td>
               <td><input type="text" id="pro_pic" name="pro_pic"
                  style="width: 80%; margin-right: 20px"><input type="button" value="찾기">
                  <input type="hidden" id="pro_no" name="pro_no">
               </td>
            </tr>
         </tbody>
      </table>
   </div>
   <div align="center">
      <textarea id="summernote" name="pro_detail"></textarea><br>
      <input type="submit" class="btn btn-primary" value="등록">&nbsp;&nbsp;
      <input type="reset" class="btn btn-primary" value="취소">
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