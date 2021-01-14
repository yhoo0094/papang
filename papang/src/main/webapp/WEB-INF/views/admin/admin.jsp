<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    					
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Primary Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                         
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                         	시터 월별 매출 현황
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        	장터 월별 매출 현황
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                         <div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> Table
	</div>
	<div>
	
	</div>
	
		
		<div class="table-responsive">
         <table class="table" >
            <tbody>
               <tr>
            <td width="48%">
            <p align="center">신고 내역</p>
            <table class="table table-bordered" id="dataTable2" width="100%"
				cellspacing="0" >
				<thead>
					<tr>
						<th>신고자 ID</th>
						<th>분류</th>
						<th>신고글 번호</th>
						<th>제재자</th>
						<th>신고 제목</th>
						<th>신고 내용</th>
					</tr>
				</thead>
			
				<tbody></tbody>
			
			</table>
            </td>
			
			<td width="4%"></td>
			
				<td width="48%">
				<p align="center">일별 매출 현황</p>
			<table class="table table-bordered" id="dataTable1" width="100%"
				cellspacing="0" >
				<thead>
					<tr>
						<th>거래 일</th>
						<th>매출 합계</th>
					</tr>
				</thead>
			
				<tbody></tbody>
			
			</table>
			</td>
			</tr>
		
		</div>
		</div>
                  
               