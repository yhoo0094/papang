<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
.center_div {
    min-height: 750px;
    display: block;
    margin: 176px 15% 9px 23%;
    width: 65%;
}
.qwe{
	text-overflow: ellipsis;
	display: block;
	 white-space: nowrap; 
    overflow: hidden; 
    
   
}
textarea.form-control {
    height: 240px;
    width: 410px;
}
</style> 
<body>
		<h3>신고현황</h3>
		<hr />
		<div align="right">
			<form id="filterFrm" name="filterFrm" action="goNoticeBoardPage.do"
				method="get">
				
			</form> 
		</div>
		<br>
			<table class="table" id="dataTable" style="table-layout: fixed">
				<thead>
					<tr class="tableTrTh">
						<th width="10%" class="tableTh">번호</th>			
						<th width="10%" class="tableTh">신고 제목</th>
						<th width="25%" class="tableTh">신고 사유</th>   
						<th width="25%" class="tableTh">답변</th>
						<th width="10%" class="tableTh">처리상태</th>    
						<th width="10%" class="tableTh">카테고리</th>
						<td width="10%" class="tableTh" style="display: none">히든</td>
					</tr>
				</thead>
				<tbody> 
				<c:forEach var="co" items="${cos3}">
					<tr>
						<td align="center">${co.repo_no}</td> 
						<td align="center">${co.repo_title}</td>   
						<td align="center">${co.repo_content}</td>  
						<td align="center" class="qwe" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" style="text-overflow: ellipsis; overflow: hidden; cursor: pointer; color:red;">답변보기</td>
						<td align="center">${co.repo_status}</td>
						<td align="center">${co.repo_category}</td>
						<td class="tableTh" style="display: none; color:red;">${co.repo_ans}</td> 
					</tr>
				</c:forEach>	
					
					 
				</tbody>
			</table>
			<br>	
		<div align="right">
			
		</div>
		
		


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">신고현황</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">신고제목　</label>
            <input type="text" class="form-control" id="recipient-name1" value="1">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">신고사유　</label>
            <input type="text" class="form-control" id="recipient-name2" value="2">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">관리자 답변</label>
            <textarea class="form-control" id="recipient-name3" style="color:red">3</textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        
        
      </div>
    </div>
  </div>
</div>
</body>

<script>
//테이블의 Row 클릭시 값 가져오기
$("#dataTable tr").click(function(){ 	

	var str = ""
	var tdArr = new Array();	// 배열 선언 
	
	// 현재 클릭된 Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	
	// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
	console.log("클릭한 Row의 모든 데이터 : "+tr.text());
	
	// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
	td.each(function(i){
		tdArr.push(td.eq(i).text());
	});
	
	console.log("배열에 담긴 값 : "+tdArr);
	
	// td.eq(index)를 통해 값을 가져올 수도 있다.
	
	var title = td.eq(1).text();
	var content = td.eq(2).text();
	var ans = td.eq(6).text();
	
	$("#recipient-name1").val(title)
	$("#recipient-name2").val(content)
	$("#recipient-name3").val(ans)
	
	str +=	" 신고제목 <font color='red'>" + title + "</font>" +
			",신고내용: <font color='red'>" + content + "</font>" +
			",답변 : <font color='red'>" + ans + "</font>";	
			
			
	$("#ex1_Result1").html(str);
	
	$("#ex1_Result2").html(title);	
	$("#ex1_Result3").html(content);	
	$("#ex1_Result4").html(ans);	
	
});	

</script>
		</html>

