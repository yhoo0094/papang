<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	reportInsert();
});

//사용자 등록 요청
function reportInsert(){
	//등록 버튼 클릭
	$('#btnInsert').on('click',function(){
		var formData = $("#form1").serialize();
		$("#form1")
		$.ajax({ 
		    url: "${pageContext.request.contextPath}/reportInsert",  
		    type: 'POST',  
		    dataType: 'json', 
		    data : formData,
		    success: function(response) {
		    	if(response == true) {
		    		alert('신고 되었습니다.');
		    		window.history.back();
		    	}
		    }, 
		    error:function(xhr, status, message) { 
		        alert(" status: "+status+" er:"+message);
		    } 
		 });  
	});//등록 버튼 클릭
}//userInsert
</script>

    
    <div align="center">
 <h3>신고 하기</h3>
     	</div>
       <div align="center">
       <form id="form1" class="form-horizontal" style="width:60%">
         <table class="table">
            <tbody>
               <tr>
                  <td align="center" width="20%" >제목</td>
                  <td><input type='text' name='repo_title' style="width:100%"></td>
               </tr>
               <tr>
                  <td align="center">신고글</td>
                  <td width="100%">
                  	  <select id='repo_category' name= 'repo_category' style="width:20%">
	                  	  <option value="중고장터" <c:if test='${reportVO.repo_category eq "중고장터"}'> selected="selected" </c:if>>중고장터</option>
	                  	  <option value="중고장터 댓글" <c:if test='${reportVO.repo_category eq "중고장터 댓글"}'> selected="selected" </c:if>>중고장터 댓글</option>
						  <option value="활동" <c:if test='${reportVO.repo_category eq "활동"}'> selected="selected" </c:if>>활동</option>
						  <option value="커뮤니티" <c:if test='${reportVO.repo_category eq "커뮤니티"}'> selected="selected" </c:if>>커뮤니티</option>
						  <option value="커뮤니티댓글" <c:if test='${reportVO.repo_category eq "커뮤니티댓글"}'> selected="selected" </c:if>>커뮤니티댓글</option>
                  	  </select>
                  	  <input type="text" value='글제목' style="width:79%">
                  	  <input type="hidden" value='${user.mbr_id}' name = 'mbr_id'>
                  	  <input type="hidden" value='${reportVO.repo_category_no}' name ='repo_category_no'>
                  </td>
               </tr>
               <tr>
               <td align="center">신고대상ID </td><td><input type='text' name='re_mbr_id' value='${reportVO.re_mbr_id}'></td>
               </tr>
               <tr>
               <td align="center"><br><br><br><br><br>신고 내용</td><td colspan="2"><textarea name = 'repo_content' rows="10" cols="210" style="width: 100%"></textarea></td>
               </tr>
            </tbody>
         </table>
          </form>
         <div align="center">
			<input type="button" class="btn btn-primary" value="등록"
				id="btnInsert" />  <input type="button"
				class="btn btn-primary" value="초기화" id="btnInit" />
		</div>
      </div>
     