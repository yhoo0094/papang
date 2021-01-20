<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/resources/json.min.js"></script>   
<script type="text/javascript">
	$(function() {
		Wareinsert();
		WareList();
		init();
		$("#filter").on('change', function() {
			WareList();
		});
	});
	//사용자 목록 조회 요청
	function WareList() {
		var filter = $("#filter").val()
		$.ajax({
			url : '../warehousing',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			 data : {
				ware_category : filter
			}, 
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : WareListResult
		});
	}//userList

	//사용자 목록 조회 응답
	function WareListResult(data) {

		$("#dataTable tbody").empty();
		$.each(data,function(idx, item) {
							$('<tr>')
						    .append($('<td>').html(item.WARE_NO))
							.append($('<td>').html(item.WARE_CATEGORY))
							.append($('<td>').html(item.WARE_CNT))
							.append($('<td>').html(item.PRO_NO))
							.append($('<td>').html(item.PRO_NAME))
							.append($('<td>').html(item.PRO_CNT))
							.append($('<td>').html(item.PRO_CN))
							.append($('<td>').html(item.WARE_DATE))
							.append($('<td>').html(item.WARE_NOTE))
					        .appendTo('#dataTable tbody');
						});

		$('#dataTable').DataTable();
	}//userListResult
	
	//사용자 등록 요청
	function Wareinsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			$("#form1")
			$.ajax({ 
			    url: "../warehousing",  
			    type: 'POST',  
			    dataType: 'json', 
			    //data: JSON.stringify({ id: id, name:name,password: password, role: role }),
			    //data :$("#form1").serialize(),
			    data : JSON.stringify($("#form1").serializeObject()),
			    contentType: 'application/json', 
			    success: function(response) {
			    	if(response.pro_no != null) {
			    		alert("입고 되었습니다");
			    		WareList();
			    		$('#form1').each(function() {
							this.reset();
						});
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" er:"+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click', function() {
			$('#form1').each(function() {
				this.reset();
				alert("초기화되었습니다");
			});
		});
	}//init
	
</script>
  <h1 class="mt-4">재고관리</h1>

   <div class="sizeDiv">
      <br>
      <h3>입 고</h3>
     	
       <div align="center">
       <form id="form1" class="form-horizontal">
         <table class="table">
            <tbody>
               <tr>
                  <td align="center" id='pro_no_title' width="10%">상품 번호</td>
                  <td><select name ='pro_no'>
                  	<c:forEach items="${product}" var="pro">
                  	<option value='${pro.pro_no}'>${pro.pro_no} : ${pro.pro_name}</option>
                  	</c:forEach>
                  </select>
                  </td>
               </tr>
               <tr>
                  <td align="center">수량</td>
                  <td><input type="text" style="width: 100%" name ='ware_cnt'></td>
               </tr>
               <tr>
               <td align="center"><br><br><br><br><br>특이사항</td><td colspan="2"><textarea name = 'ware_note' rows="10" cols="210" style="width: 100%"></textarea></td>
               </tr>
            </tbody>
         </table>
         <div align="center">
			<input type="button" class='buttonclass' value="등록"
				id="btnInsert" />  <input type="button"
				class='buttonclass' value="초기화" id="btnInit" />
		</div>
      </div>
      </form>
    <br>
			<br>
	<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 재고 현황
	</div>
	<div class="card-body">

		<div class="table-responsive">
			분류 <select id='filter'>
				<option selected value=''>전체</option>
				<option value="입고">입고</option>
				<option value="출고">출고</option>
			</select>
			<br>
			<br>
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>입·출고 번호</th>
						<th>분류</th>
						<th>입·출고 수량</th>
						<th>상품번호</th>
						<th>상품명</th>
						<th>상품 수량</th>
						<th>기업명</th>
						<th>입출고일</th>
						<th>특이사항</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>