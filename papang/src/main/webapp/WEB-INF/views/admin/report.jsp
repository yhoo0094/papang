<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
$(function() {
	reportinfoList();
	reportselect();
	reportSelect2();
	reportInsert();
	
	//init();
	/* $("#filter").on('change', function() {
		WareList();
	}); */
});
function reportinfoList() {
		$.ajax({
			url : '../reportinfoselect',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			/*  data : {
				ware_category : filter
			}, */
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : reportinfoListResult
		});
	}//userList

	//사용자 목록 조회 응답
	function reportinfoListResult(data) {

		$("#dataTable2 tbody").empty();
		$.each(data,function(idx, item) {
							$('<tr>')
						    .append($('<td>').html(item.REPO_NO))
							.append($('<td>').html(item.MBR_AUTHOR))
							.append($('<td>').html(item.MBR_ID))
							.append($('<td>').html(item.RINFO_START))
							.append($('<td>').html(item.RINFO_CNT))
							.append($('<td>').html(item.RINFO_REASON))
					        .appendTo('#dataTable2 tbody');
						});

		$('#dataTable2').DataTable();
	}//userListResult
	
	
	function reportselect() {
		$.ajax({
			url : '../reportselect',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			/*  data : {
				ware_category : filter
			}, */
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : reportselectResult
		});
	}//userList
	function reportselectResult(data) {

		$("#dataTable tbody").empty();
		$.each(data,function(idx, item) {
							$('<tr>')
							.append($('<td>').html(item.mbr_id))
							.append($('<td>').html(item.repo_category))
							.append($('<td>').html(item.repo_category_no))
							.append($('<td>').html(item.re_mbr_id))
							.append($('<td>').html(item.repo_title))
							.append($('<td>').html(item.repo_content))
							.append(
							$('<td>').html(
									'<button id=\'btnSelect\'>조회</button>'))
							.append(
							$('<input type=\'hidden\' id=\'hidden_repo_no\'>')
									.val(item.repo_no))		
					        .appendTo('#dataTable tbody');
						});

		$('#dataTable').DataTable();
	}//userListResult
	
	//사용자 조회 요청
	function reportSelect2() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var repo_no = $(this).closest('tr').find('#hidden_repo_no').val();
			//특정 사용자 조회
			$.ajax({
				url : '../reportselectone/' + repo_no,
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : repoSelectResult
			});
		}); //조회 버튼 클릭
	}//nqSelect
	
	//사용자 조회 응답
	function repoSelectResult(data) {
		console.log(data);
		$.each(data,function(idx, item) {
		$('#author').val(item.MBR_AUTHOR);
		$('#id').val(item.RE_MBR_ID);
		$('#status').val(item.MBR_STATUS);
		$('#repo_no').val(item.REPO_NO);
		});
	}
	
	
	function reportInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			var formData = $("#form1").serialize();
			$("#form1")
			$.ajax({ 
			    url: "${pageContext.request.contextPath}/reportinfoInsert",  
			    type: 'POST',  
			    dataType: 'json', 
			    data : formData,
			    success: function(response) {
			    	if(response == true) {
			    		alert('제재 처리 되었습니다.');
			    		reportinfoList();
			    		reportselect();
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
	}
	

	
</script>		
<h1 class="mt-4">신고 관리</h1>

       <div align="center">
       <form id="form1" class="form-horizontal" style="width: 80%"> 
         <table class="table" >
            <tbody>
               <tr>
                  <td align="center" width="20%">회원 유형</td>
                  <td><input type='text' id='author'><input type='hidden' name='repo_no' id='repo_no'>
                  </td>
               </tr>
               <tr>
                  <td align="center">ID</td>
                  <td><input type="text" style="width: 100%" id='id' name='mbr_id'></td>
               </tr>
               <tr>
               <td align="center">활동 상태</td><td><input type='text' id='status'></td>
               </tr>
               <tr>
               <td align="center">정지 시작일</td><td><input type='date' name='rinfo_start'></td>
               </tr>
               <tr>
               <td align="center">정지 기간</td><td><input type='text' id='rinfo_cnt' name='rinfo_cnt'></td>
               </tr>
               <tr>
               <td align="center"><br><br><br><br>제재 사유</td><td colspan="2"><textarea name = 'rinfo_reason' rows="10" cols="210" style="width: 100%"></textarea></td>
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
      <br>
	
      <div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 신고/제제 내역
	</div>
	<div>
	<!-- 분류 <select id='filter'>
		<option selected value=''>전체</option>
		<option value="입고">입고</option>
		<option value="출고">출고</option>
	</select> -->
	</div>
	
		
		<div class="table-responsive">
			<table>
			<tr>
			<td>
			<table class="table table-bordered" id="dataTable" width="100%
				cellspacing="0">
				<thead>
					<tr>
						<th>신고자 ID</th>
						<th>분류</th>
						<th>신고글 번호</th>
						<th>제재자</th>
						<th>신고 제목</th>
						<th>신고 내용</th>
						<th>관리</th>
					</tr>
				</thead>
			
				<tbody></tbody>
			
			</table>
			</td>
			<td width="1%"></td>
			
				<td>
			<table class="table table-bordered" id="dataTable2" width="100%"
				cellspacing="0" >
				<thead>
					<tr>
						<th>제재 번호</th>
						<th>회원 권한</th>
						<th>제재자</th>
						<th>정지 시작일</th>
						<th>정지 종료일</th>
						<th>정지 사유</th>
					</tr>
				</thead>
			
				<tbody></tbody>
			
			</table>
			</td>
			</tr>
			</table>
			
			
			
		</div>