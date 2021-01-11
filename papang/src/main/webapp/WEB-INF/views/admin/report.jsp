<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1 class="mt-4">신고 관리</h1>

       <div align="center">
       <form id="form1" class="form-horizontal">
         <table class="table">
            <tbody>
               <tr>
                  <td align="center" width="10%">회원 유형</td>
                  <td><input type='text' id='author'></td>
               </tr>
               <tr>
                  <td align="center">ID</td>
                  <td><input type="text" style="width: 100%" id='id'></td>
               </tr>
               <tr>
               <td align="center">활동 상태</td><td><input type='text' id='status'></td>
               </tr>
               <tr>
               <td align="center">정지일</td><td><input type='text' id='rinfo_cnt' name='rinfo_cnt'></td>
               </tr>
               <tr>
               <td align="center"><br><br><br><br>제재 사유</td><td colspan="2"><textarea name = 'ware_note' rows="10" cols="210" style="width: 100%"></textarea></td>
               </tr>
            </tbody>
         </table>
         <div align="center">
			<input type="button" class="btn btn-primary" value="등록"
				id="btnInsert" />  <input type="button"
				class="btn btn-primary" value="초기화" id="btnInit" />
		</div>
      </div>
      </form>
      <div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 재고 현황
	</div>
	<div>
	분류 <select id='filter'>
		<option selected value=''>전체</option>
		<option value="입고">입고</option>
		<option value="출고">출고</option>
	</select>
	</div>
	<div class="card-body">
		
		<div class="table-responsive">
			
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>입·출고 번호</th>
						<th>분류</th>
						<th>입·출고 수량</th>
						<th>상품번호</th>
						<th>상품 카테고리</th>
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