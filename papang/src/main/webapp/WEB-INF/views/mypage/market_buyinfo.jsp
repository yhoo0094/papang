<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.input_small {width: 400px; height: 40px; padding: 8px;border: none;border-bottom: 1px solid #ccc;}
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
</style>
<title>마이페이지</title>
</head>
<body>
	<div>
		<div>
			<div class="w3-large" align="center">
				<h3 class="big_title">구매내역</h3>
			</div>
			
				</br>
			     
			    
			<!-- <form id="fim" name="fim" action="market_buyinfo" method="post">   -->
					   <div class="content_div">
		  
			 <table class="table" id="dataTable"> 
				<thead>
					<tr class="tableTrTh">
						<th width="15%" class="tableTh">상품번호</th>
						<th width="15%" class="tableTh">운송장번호</th>
						<th width="20%" class="tableTh">주문날짜</th>
						<th width="15%" class="tableTh">주문상태</th>
						<th width="15%" class="tableTh">가격합계</th>
						<th width="15%" class="tableTh">상세보기</th>
					</tr>
				</thead> 
				<tbody>
				<c:forEach var="co6" items="${cos6}">
					<tr> 
						<td align="center">${co6.order_no}</td>
						<td align="center">${co6.waybill}</td>
						<td align="center">${co6.order_date}</td>
						<td align="center">${co6.order_status}</td>
						<td align="center">${co6.order_sum}</td>
						<td align="center" class="qwe" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" align="center"  style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><button type="submit">상세보기</button></td>
					</tr>
				</c:forEach>	
					
					
				</tbody>
			</table>
					      
					      
					    
					   </br>
					   </br>
				   
					  no <input id="no" type="text" name="no"> 
					    
				
		</div>
		<!-- </form> -->
	</div>
	
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">신고현황</h4>
      </div>
      <div class="modal-body">
      
      	      <table class="table" id="dataTable"> 
				<thead>
					<tr class="tableTrTh"> 
						<th width="15%" class="tableTh">상품 상세번호</th>
						<th width="20%" class="tableTh">상품 번호</th>
						<th width="15%" class="tableTh">수량</th>
					
					</tr>
				</thead> 
				<tbody>
				<c:forEach var="co7" items="${cos7}">
					<tr> 
						<td align="center">${co7.od_detail_no}</td>
						<td align="center">${co7.pro_no}</td>
						<td align="center">${co7.bag_cnt}</td>
					</tr>
				</c:forEach>	
					
					
				</tbody>
			</table>
      
      
<%--         <form>
          <div class="form-group">
            <label for="recipient-name" class="control-label">상세주문번호　</label>
            <input type="text" class="form-control" id="recipient-name1" value="${co6.order_sum}">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">상품번호　</label>
            <input type="text" class="form-control" id="recipient-name2" value="${co7.pro_no}">
          </div>
           <div class="form-group">
            <label for="message-text" class="control-label">상품번호　</label>
            <input type="text" class="form-control" id="recipient-name2" value="${co7.pro_no}">
          </div>
           <div class="form-group">
            <label for="message-text" class="control-label">상품번호　</label>
            <input type="text" class="form-control" id="recipient-name2" value="${co7.pro_no}">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">수량　</label>
            <input type="text" class="form-control" id="recipient-name2" value="${co7.bag_cnt}">
          </div>
        </form> --%>
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
	
	var no = td.eq(0).text();
	
	
	
	
			
			
			
	$("#no").val(no);
	
	 
	
	console.log(no);
	
});	

</script>

</html>