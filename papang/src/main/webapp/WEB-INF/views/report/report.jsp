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
                  	  <select id='repo_category' name= 'repo_category' style="width:15%">
                  	  
                	<c:if test='${ReportVO.repo_category eq "시터"}'>
                  	  <option value="시터" selected="selected">시터</option>
                  	  <option value="장터 ">장터</option>
					  <option value="커뮤니티">커뮤니티</option>
					  <option value="활동">활동</option>
                  	  </c:if>
                  	  
                  	  <c:if test='${ReportVO.repo_category eq "장터"}'>
                  	  <option value="시터">시터</option>
                  	  <option value="장터 " selected="selected">장터</option>
					  <option value="커뮤니티">커뮤니티</option>
					  <option value="활동">활동</option>
                  	  </c:if>
                  	  
                  	  <c:if test='${ReportVO.repo_category eq "커뮤니티"}'>
                  	  <option value="시터">시터</option>
                  	  <option value="장터 ">장터</option>
					  <option value="커뮤니티"  selected="selected">커뮤니티</option>
					  <option value="활동">활동</option>
                  	  </c:if>
                  	  
                  	  <c:if test='${ReportVO.repo_category eq "활동"}'>
                  	  <option value="시터">시터</option>
                  	  <option value="장터 ">장터</option>
					  <option value="커뮤니티">커뮤니티</option>
					  <option value="활동"  selected="selected">활동</option>
                  	  </c:if>
                  	  
                  	  </select>
                  	  <input type="text" value='글제목' style="width:84%">
                  	  <input type="hidden" value='${user.mbr_id}' name = 'mbr_id'>
                  	  <input type="hidden" value='${ReportVO.repo_category_no' name ='repo_category_no'>
                  </td>
               </tr>
               <tr>
               <td>신고자 </td><td><input type='text' name='re_mbr_id' value='${ReportVO.re_mbr_id}'></td>
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
     