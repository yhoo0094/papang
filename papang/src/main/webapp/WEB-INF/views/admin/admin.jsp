<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
<
style type ="text /css ">.communityFormTitle {
	padding: 1%;
}

.sitterBoardInputSize {
	width: 40%;
}

.sitterProfileImg {
	width: 100%;
	height: 300px;
	display: block;
	border-radius: 10px;
}

thead, #dataTable_filter, #dataTable_length {
	display: none;
}

.dataTableTr {
	display: inline;
	width: 50%;
}

.dataTableDisplayBlock {
	display: block;
	width: 20%;
}

.TableInTheDataTable td {
	border-top: none;
	vertical-align: middle;
	padding: 3px 11px;
}

.dataTableTr .sitterDiv {
	padding: 6px;
	border-radius: 10px;
}

.communityFormFilter {
	width: 100%;
	border-radius: 20px;
	background-color: #ff971d;
}

.dataTableTr>td {
	width: 260px;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth() + 1;
		$('#year').val(year);
		$('#month').val(month);
		reportselect();

		if ($('#month').val() * 1 < 10) {
			var date7 = $('#year').val().substring(2, 4) + '/0'
					+ $('#month').val();
			ajax(date7);
		} else {
			var date8 = $('#year').val().substring(2, 4) + '/'
					+ $('#month').val();
			ajax(date8);
		}

		$('#next').on(
				'click',
				function() {
					if ($('#month').val() * 1 == 12) {
						$('#year').val($('#year').val() * 1 + 1);
						$('#month').val('01');

						var date1 = $('#year').val().substring(2, 4) + '/'
								+ $('#month').val();
						ajax(date1);

					} else {
						$('#month').val($('#month').val() * 1 + 1);
						if ($('#month').val() * 1 < 10) {
							var date2 = $('#year').val().substring(2, 4) + '/0'
									+ $('#month').val();
							ajax(date2);
						} else {
							var date3 = $('#year').val().substring(2, 4) + '/'
									+ $('#month').val();
							ajax(date3);
						}

					}

				});

		$('#prev').on(
				'click',
				function() {
					if ($('#month').val() * 1 == 1) {
						$('#year').val($('#year').val() * 1 - 1);
						$('#month').val(12);
						var date4 = $('#year').val().substring(2, 4) + '/'
								+ $('#month').val();
						ajax(date4);
					} else {
						$('#month').val($('#month').val() * 1 - 1);
						if ($('#month').val() * 1 < 10) {
							var date5 = $('#year').val().substring(2, 4) + '/0'
									+ $('#month').val();
							ajax(date5);
						} else {
							var date6 = $('#year').val().substring(2, 4) + '/'
									+ $('#month').val();
							ajax(date6);
						}
					}

				});

	}

	function ajax(date) {

		$.ajax({
			url : '${pageContext.request.contextPath}/sitterinfoselect',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			data : {
				monthsitter : date
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : sitterinfoselect
		});
	}

	function sitterinfoselect(data) {

		$("#chartContainer").CanvasJSChart({
			title : {
				text : "시터 매출 현황",
				fontSize : 24
			},
			axisY : {
				title : ""
			},
			data : [ {
				type : "bar",
				toolTipContent : "{label}: {y} 원",
				dataPoints : data
			} ]
		});
	}

	function reportselect() {
		$.ajax({
			url : '${pageContext.request.contextPath}/reportselect',
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

		$("#dataTable2 tbody").empty();
		$.each(data, function(idx, item) {
			$('<tr>').append($('<td>').html(item.mbr_id)).append(
					$('<td>').html(item.repo_category)).append(
					$('<td>').html(item.repo_category_no)).append(
					$('<td>').html(item.re_mbr_id)).append(
					$('<td>').html(item.repo_title)).append(
					$('<td>').html(item.repo_content)).append(
					$('<input type=\'hidden\' id=\'hidden_repo_no\'>').val(
							item.repo_no)).appendTo('#dataTable2 tbody');
		});

		$('#dataTable2').DataTable();
	}//userListResult
</script>


<script src="https://www.gstatic.com/charts/loader.js"></script>

<script>
	//구글 시각화 API를 로딩하는 메소드

	google.charts.load('current', {
		packages : [ 'corechart' ]
	});

	// 구글 시각화 API가 로딩이 완료되면,

	// 인자로 전달된 콜백함수를 내부적으로 호출하여 차트를 그리는 메소드

	// 화면이 실행될때 함께 실행된다.

	google.charts.setOnLoadCallback(columnChart1);

	// 묶은 세로 막대형 차트 1

	function columnChart1() {

		// 버튼 클릭 시 ajax를 사용하여 서버로부터 json 배열 객체를 가져왔다고 가정함

		var arr = [ [ '월', '매출액' ] ];

		$.ajax({
			url : '${pageContext.request.contextPath}/orderinfoselect',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			async : false,
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$.each(data, function(idx, val) {
					var a = [];
					a.push(val.order_date);
					a.push(val.order_sum * 1);
					arr.push(a);
				})

			}
		});

		// 실 데이터를 가진 데이터테이블 객체를 반환하는 메소드

		var dataTable = google.visualization.arrayToDataTable(arr);

		// 옵션객체 준비

		var options = {

			title : '장터 월별 매출현황',

			hAxis : {

				title : '',

				titleTextStyle : {

					color : 'red'

				}

			}

		};

		// 차트를 그릴 영역인 div 객체를 가져옴

		var objDiv = document.getElementById('column_chart_div1');

		// 인자로 전달한 div 객체의 영역에 컬럼차트를 그릴수 있는 차트객체를 반환

		var chart = new google.visualization.ColumnChart(objDiv);

		// 차트객체에 데이터테이블과 옵션 객체를 인자로 전달하여 차트 그리는 메소드

		chart.draw(dataTable, options);

	}// drawColumnChart1()의 끝
</script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script type="text/javascript">
	var arr = [ [ "성별", "Rating" ] ];
	google.load("visualization", "1", {
		packages : [ "corechart" ]
	});
	google.setOnLoadCallback(drawChart);
	mbrajax();
	function drawChart() {
		var data = google.visualization.arrayToDataTable(arr);
		var options = {
			title : "Employee Ratings"
		};
		var chart = new google.visualization.PieChart(document
				.getElementById("employee_piechart"));
		chart.draw(data, options);
	}

	function mbrajax() {

		$.ajax({
			url : '${pageContext.request.contextPath}/gendercount',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			async : false,
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				$.each(data, function(idx, val) {
					var a = [];
					a.push(val.MBR_GENDER);
					a.push(val.MBR_COUNT * 1);
					arr.push(a);
				});
				console.log(arr);
			}
		});
	}
</script>




<h1 class="mt-4">Papang</h1>

	<div class="card-header" style="width: 100%">
				우수 베이비 시터
			</div>

<div id="divForEntryNum" style="border :1px solid rgba(0, 0, 0, 0.125)">
	<table class="table" id="dataTable"  >
		<thead>
			<tr>
				<th>가</th>
			</tr>
		</thead>
		<tbody align="center" style="border-color: white">
			<c:forEach items="${sitterVOChkList}" var="v" varStatus="i">
				<c:if test='${i.index < 5}'>
					<tr class="dataTableTr" align="center">
						<td align="center">
							<div class="sitterDiv strongYellow">
								<input class="sitterIdInput" type="hidden"
									value="${v.sit_mbr_id}"> <img class="sitterProfileImg"
									alt="시터이미지"
									src="${pageContext.request.contextPath}/resources/images/sitterProfile/${v.sit_pic}">
								<table class="TableInTheDataTable" align="center">
									<tr align="center">
										<td>돌봄요일</td>
										<td align="left">${v.sit_off}</td>
									</tr>
									<tr>
										<td align="center">일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
										<td>${v.sit_pay}</td>
									</tr>
									<tr>
										<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
										<td><c:if test="${v.rate == '　'}">평가없음</c:if> <c:if
												test="${v.rate != null}"><font color=yellow>${v.rate}</c:if></td>
									</tr>
									<tr>
										<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
										<td>${v.sit_loc}</td>
									</tr>
									<tr>
										<td>제재횟수</td>
										<td>${v.report}회</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>
<br>
<br>
<br>
<div class="row">
	<div class="col-xl-6">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-area mr-1"></i> 시터 월별 매출 현황
			</div>
			<div class="card-body" style="height: 400px">
				<div class='calenderMenu' align='center'>
					<button type='button' id='prev' class='buttonclass'><</button>
					&nbsp;&nbsp; <span class='calenderY'><input type='text'
						id='year' style="width: 50px; border: none"></span>년 <span
						class='calenderM'><input type='text' id='month'
						style="width: 30px; border: none"></span>월 &nbsp;&nbsp;
					<button type='button' id='next' class='buttonclass'>></button>
				</div>
				<br>
				<div id="chartContainer" style="width: 90%; height: 70%"></div>
			</div>
		</div>
	</div>
	<div class="col-xl-6">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-bar mr-1"></i> 장터 월별 매출 현황
			</div>
			<div class="card-body" style="height: 400px">
				<div id="column_chart_div1" style="width: 90%; height: 100%"></div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-xl-6">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table mr-1"></i> 신고 내역
			</div>
			<div class="card-body" style="height: 400px">
				<table class="table table-bordered" id="dataTable2" cellspacing="0">
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
			</div>
		</div>
	</div>
	<div class="col-xl-6">
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-chart-bar mr-1"></i> 남녀 성비 차트
			</div>
			<div align="center" id="employee_piechart"
				style="width: 600px; height: 400px"></div>
		</div>
	</div>
</div>
