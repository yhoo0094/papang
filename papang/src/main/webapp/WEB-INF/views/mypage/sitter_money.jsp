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
</style>
<body>
		<h3>월급 확인</h3>
		<hr />
		<div align="right">
			<form id="filterFrm" name="filterFrm" action="goNoticeBoardPage.do"
				method="get">
				
			</form>
		</div>
		<br>
			<table class="table" id="dataTable">
				<thead>
					<tr class="tableTrTh">
						<th width="15%" class="tableTh">예약 번호</th>
						<th width="20%" class="tableTh">고객ID</th>
						<th width="15%" class="tableTh">시작 일</th>
						<th width="15%" class="tableTh">종료 일</th>
						<th width="15%" class="tableTh">결제 상태</th>
						<th width="15%" class="tableTh">결제 상태</th>
					 
					</tr>
				</thead>
				<tbody> 
				<c:forEach var="co" items="${co}">
					<tr> 
						<td align="center" class="qwe" data-num="${co.srv_no}"
                           data-target="#exampleModal1" data-toggle="modal" align="center"
                           style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${co.srv_no}</td>
						<td align="center">${co.mbr_id}</td>
						<td align="center">${co.startday}</td>
						<td align="center">${co.finishday}</td>
						<td align="center">${co.srv_status}</td>
						<td align="center" class="qwe" data-num="${co.srv_no}"
                           data-target="#exampleModal1" data-toggle="modal" align="center"
                           style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><button>상세보기</button></td>
						 
					</tr>
				</c:forEach>	
					
					 
				</tbody>
			</table>
			<br>	
		<div align="right">
			
		</div>
		
		
     <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-body" id="body1">....</div>
            </div>
         </div>
      </div>
</body>

<script>

// td.eq(index)를 통해 값을 가져올 수도 있다.
var tr = $(this);
var td = tr.children();
var no = td.eq(0).text();
$("#no").val(no);
console.log(no);

$(".qwe").on("click", function() {
   var srv_no = $(this).data("num");
   modal = $("#exampleModal1"); 
   $.ajax({   
      url : "sitter_money2?srv_no=" + srv_no,
      success : function(result) {
         modal.find('#body1').html(result);
         modal.modal('show');
         console.log("srv_no 는 "+srv_no);
      }
   });
});

   //테이블의 Row 클릭시 값 가져오기
   $("#dataTable tr").click(function() {

      var str = ""
      var tdArr = new Array(); // 배열 선언 

      // 현재 클릭된 Row(<tr>)
      
      

      // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
      console.log("클릭한 Row의 모든 데이터 : " + tr.text());

      // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
      td.each(function(i) {
         tdArr.push(td.eq(i).text());
      });

      console.log("배열에 담긴 값 : " + tdArr);


      /* $.ajax({
      url : "market_buyinfo?order_no=" + no,
      success : function(result) {
        modal.find('#exampleModal').html(result);
        modal.modal('show');
      }
      }); */
   });
</script>

</html>
