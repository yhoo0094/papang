<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.modal-dialog {
    max-width: 950px;
    margin: 1.75rem auto;
}
.modal-wd {
    width: 1000px;
    margin: 230px 0 0 110px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style>
.input_small {
   width: 400px;
   height: 40px;
   padding: 8px;
   border: none;
   border-bottom: 1px solid #ccc;
}

.input_middle {
   
}

.input_big {
   
}

.divmargin {
   margin-top: 150px;
}

.big_title {
   text-align: center;
   font-size: 50px;
}

p {
   margin-top: 0;
   margin-bottom: 1rem;
}

.content_div {
   width: 90%;
   margin: 0px 0px 0px 150px;
}

.w3-large {
   margin: 0 0 60px 230px;
}

table tbody tr td {
   font-size: 16px;
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


    
         <div class="content_div">

            <table class="table" id="dataTable">
               <thead>
                  <tr class="tableTrTh">
                     <th width="14%" class="tableTh">주문번호</th>
                     <th width="10%" class="tableTh">운송장번호</th>
                     <th width="10%" class="tableTh">주문날짜</th>
                     <th width="13%" class="tableTh">주문상태</th>
                     <th width="12%" class="tableTh">가격합계</th>
                     <th width="12%" class="tableTh">상세보기</th>
                     <th width="12%" class="tableTh">배송조회</th>
                  </tr>
               </thead>
               <tbody>
                  <c:forEach var="co6" items="${cos6}">
                     <tr>
                        <td align="center">${co6.order_no}</td>
                        <td align="center">${co6.waybill}</td>
                        <td align="center">${co6.order_date}</td>
                        <td align="center">${co6.order_status}</td>
                        <td align="center">${co6.order_sum}원</td>
                        <td align="center" class="qwe" data-num="${co6.order_no}"
                           data-target="#exampleModal1" data-toggle="modal" align="center"
                           style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;"><button
                              type="submit">상세보기</button></td>
                        <td align="center"><a href="https://tracker.delivery/#/kr.logen/${co6.waybill}" target="_blank">배송조회</a>     
                          
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            </br> </br> no <input id="no" type="text" name="no">


         </div>
       
      </div>

      <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel">
         <div class="modal-dialog" role="document">
            <div class="modal-content modal-wd">
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
   var order_no = $(this).data("num");
   modal = $("#exampleModal1"); 
   $.ajax({   
      url : "market_buyinfomm?order_no=" + order_no,
      success : function(result) {
         modal.find('#body1').html(result);
         modal.modal('show');
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