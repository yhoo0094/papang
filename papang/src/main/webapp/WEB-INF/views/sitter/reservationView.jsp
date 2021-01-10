<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#calendarForm {
	width: 100%;
	font-size: 19px;
}

.custom_calendar_table {
	width: 100%;
}

.custom_calendar_table td, .custom_calendar_table th {
	text-align: left;
	vertical-align: text-top;
	height: 100px;
	width: 80px;
}

.prev, .next {
	background: none;
	border: none;
	width: 20px;
}

.custom_calendar_table thead.cal_week th {
	background-color: #ff971d;
	color: #fff;
	text-align: center;
	vertical-align: middle;
	font-size: 40px;
}

.custom_calendar_table tbody td:nth-child(1) {
	color: red;
}

.custom_calendar_table tbody td:nth-child(7) {
	color: #288CFF;
}

.introductoryForCalender {
	float: right;
	position: relative;
}

.calenderMenu {
	font-size: 25px;
	position: absolute;
	width: 71%;
}

.reservatedDayTd {
	background-color: cyan;
}

.introductoryRev {
	color: cyan;
}

.needPayTd {
	background-color: #ee9595;
}

.introductoryNeedPay {
	color: #ee9595;
}

.selectedTd {
	background-color: yellow;
	cursor: pointer;
}
</style>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(()=>{
	calendarMaker($("#calendarForm"), new Date());
	$('#selectChildNum').on({
		'change': function() {
			calendarMaker($("#calendarForm"), new Date());
		}
	})
	
	$('#sitterRevPayBtn').on({
		'click': function() {
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	        var amount = $("#amount").val();
	     	var link;
			var IMP = window.IMP; // 생략가능
   			IMP.init('imp35581825'); // "가맹점 식별코드"를 사용
	     	IMP.request_pay({
	     	    pg : 'inicis',
	     	    pay_method : 'card',
	     	    merchant_uid : 'merchant' + new Date().getTime(),
	     	    name : '파팡 시팅 서비스',
	     	    amount : 100, //디버깅용
	     	    //amount : ($('#reservationPriceTd').text()).replace(',',''), 
	     	    buyer_email : '${user.mbr_email}',
	     	    buyer_name : '${user.mbr_id}',
	     	    buyer_tel : '12345',
	     	    buyer_addr : '테스트주소',
	     	    buyer_postcode : '12345'
	     	}, function(rsp) {
	     	    if ( rsp.success ) {
	     	    	var reservationNum = $('#reservationNumTd').text(); 
	     	    	var msg = '결제가 완료되었습니다.';
 	    			msg += '\n고유ID : ' + rsp.imp_uid;
 	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
 	    			msg += '\결제 금액 : ' + rsp.paid_amount;
 	    			msg += '카드 승인번호 : ' + rsp.apply_num;
 	    			alert(msg);
	     	    	location.href = "${pageContext.request.contextPath}/sitter/reservationPay?srv_no=" + reservationNum;
	     	    } else {
	     	        var msg = '결제에 실패하였습니다.';
	     	        msg += '에러내용 : ' + rsp.error_msg;
	     	        alert(msg);
	     	    }
	     	});
		}
	})//sitterRevPayBtn버튼 끝
	
	$('#sitterRevCancleBtn').on({
		'click': function() {
			var reservationNum = $('#reservationNumTd').text();
			location.href = "${pageContext.request.contextPath}/sitter/reservationCancle?srv_no=" + reservationNum + "&from=user";
		}
	})
	
	$('#sitterRevReviewBtn').on({
		'click': function() {
			$('#reservationModal').modal("hide");
		}
	})
})

function getReservatedDayList(){
	var calenderY = $('.calenderY').text();
	var calenderM = $('.calenderM').text();
	var selectChildNum = $('#selectChildNum').val();
	$.ajax({ 
	    url: "${pageContext.request.contextPath}/ajax/reservatedDays",  
	    type: 'POST', 
	    dataType: 'json', 
	    data : {"calenderY":calenderY,"calenderM":calenderM, "chi_no": selectChildNum},
	    success: function(sitter_revChkVOList) {
	    	$.each(sitter_revChkVOList, function(idx, val) {
	    		//예약
	    		var srv_date = (val.srv_date).substring(5,7) + (val.srv_date).substring(8,10);
	    		if(val.srv_status == '결제완료'){
	    			$('#'+ srv_date).addClass('reservatedDayTd');	
	    		} else {
	    			$('#'+ srv_date).addClass('needPayTd');
	    		}
	    		
	    		//호버 달기
	    		var srv_no = val.srv_no;
	    		$('#'+ srv_date ).addClass(srv_no);
	    		hoverToSrv(srv_no);
	    		
	    		//예약 정보 모달 띄우기
	    		$('#'+ srv_date ).attr('data-toggle', 'modal').attr('data-target', '#reservationModal')
	    		
	    		$('#'+ srv_date).on({ //결제하기 
    				'click': function() {
    					var reservationDay = (val.start_date).substring(5,11)+" ~ "+(val.end_date).substring(5,11);
    					$('#reservationDayTd').text(reservationDay);
    					$('#reservationSitterIdTd').text(val.sit_mbr_id);
    					var reservationPrice = String(val.srv_pay*val.count).replace(/\B(?=(\d{3})+(?!\d))/g, ",");;
    					$('#reservationPriceTd').text(reservationPrice);
    					$('#reservationNumTd').text(val.srv_no);
    					$('#reviewNo').val(val.srv_no)
    					
    					if(val.srv_status == '결제완료' && val.review == null){ //결제완료&후기미작성
    		    			$('#sitterRevPayBtn').css('display','none'); //결제하기
    		    			$('#sitterRevCancleBtn').css('display','none'); //취소하기
    		    			$('#sitterRevReviewBtn').css('display','inline'); //후기작성
    		    			$('#reviewViewBtn').css('display','none'); //후기보기
    		    		} else if(val.srv_status == '결제완료' && val.review == '1') {//결제완료&후기작성
    		    			$('#sitterRevPayBtn').css('display','none'); //결제하기
    		    			$('#sitterRevCancleBtn').css('display','none'); //취소하기
    		    			$('#sitterRevReviewBtn').css('display','none'); //후기작성
    		    			$('#reviewViewBtn').css('display','inline'); //후기보기
    		    		} else { //미결제
    		    			$('#sitterRevPayBtn').css('display','inline'); //결제하기
    		    			$('#sitterRevCancleBtn').css('display','inline'); //취소하기
    		    			$('#sitterRevReviewBtn').css('display','none'); //후기작성
    		    			$('#reviewViewBtn').css('display','none'); //후기보기
    		    		}
    					
    					
    				}
    			});
			})
	    }, 
	    error:function(xhr, status, message) { 
	        alert(" status: "+status+" er:"+message);
	    } 
	 });  
}

function hoverToSrv(srv_no){
	$('.'+srv_no).mouseenter(function() {
		$.each($.find('.'+srv_no), function(idx, val) {
			$(val).addClass("selectedTd");
		})
	});
	$('.'+srv_no).mouseleave(function() {
		$.each($.find('.'+srv_no), function(idx, val) {
			$(val).removeClass("selectedTd");
		})
	});
}

var nowDate = new Date();
function calendarMaker(target, date) {
    if (date == null || date == undefined) {
        date = new Date();
    }
    nowDate = date;
    if ($(target).length > 0) {
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1;
        $(target).empty().append(assembly(year, month));
    } else {
        console.error("custom_calendar Target is empty!!!");
        return;
    }

    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);
    var prevLastDay = (new Date(nowDate.getFullYear(), nowDate.getMonth(), 0)).getDate();

    var tag = "<tr>";
    var cnt = 0;
    //전달 날짜 넣기
    var prevMonthStart = prevLastDay - thisMonth.getDay();
    var prevMonth = parseInt(nowDate.getMonth());
    
    if(prevMonth==0){
    	prevMonth=12;
    } else if(prevMonth < 10) {
    	prevMonth="0"+ prevMonth;
    }
    for (i = 0; i < thisMonth.getDay(); i++) {
        tag += "<td id='"+ prevMonth + (prevMonthStart+i+1) +"'>"+ prevMonth + "/" + (prevMonthStart+i+1) +"</td>";
        cnt++;
    }

    //날짜 채우기
    var calenderM = $('.calenderM').text();
    for (i = 1; i <= thisLastDay.getDate(); i++) {
        if (cnt % 7 == 0) { 
        	tag += "<tr>"; 
        }
        if(i < 10){
        	i = "0" + i;
        }
        tag += "<td id='" + calenderM + i + "'>" + i + "</td>";
        cnt++;
        if (cnt % 7 == 0) {
            tag += "</tr>";
        }
    }
    
    //다음달 날짜 앞에 넣기
    var nextMonthdays = 7-(cnt%7)
    var nextMonth = parseInt(nowDate.getMonth()) + 2;
    if(nextMonth == 13){
    	nextMonth = "01";
    } else if(nextMonth < 10) {
    	nextMonth = "0" + nextMonth; 
    }
    for(i = 1; i <= nextMonthdays; i++){
    	tag += "<td id='"+ nextMonth +"'>" + nextMonth + "/0" + i + "</td>";  	
    }
    
    $(target).find("#custom_set_date").append(tag);
    calMoveEvtFn();

    function assembly(year, month) {
    	if(month < 10){
    		month = "0" + month;
    	}
        var calendar_html_code =
        	"<div class='introductoryForCalender'><span class='introductoryRev'>■</span>예약완료 <span class='introductoryNeedPay'>■</span>미결제 </div>"+
        	"<div class='calenderMenu' align = 'center'>"+
        	"<button type='button' class='prev'><</button>&nbsp;&nbsp;" +
        	"<span class='calenderY'>" + year + "</span>년 <span class='calenderM'>" + month + "</span>월"+
        	"&nbsp;&nbsp;<button type='button' class='next'>></button>"+
        	"</div><br><br>"+
            "<table class='custom_calendar_table' border='1'>" +
            "<thead  class='cal_week'>" +
            "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
            "</thead>" +
            "<tbody id='custom_set_date'>" +
            "</tbody>" +
            "</table>";
        return calendar_html_code;
    }

    function calMoveEvtFn() {
        //전달 클릭
        $(".prev").on("click", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        //다음날 클릭
        $(".next").on("click", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
    }
    getReservatedDayList();
}
$(function(){
	var IMP = window.IMP; // 생략가능
    IMP.init('imp35581825'); // "가맹점 식별코드"를 사용
})
</script>
</head>
<body>
	<h3 style="display: inline;">예약내역 보기</h3>
	<form class="category" action="#" method="get">
		<select id="selectChildNum" name="chi_no"
			style="width: 100%; font-size: 20px;">
			<c:forEach items="${childVOList}" var="v">
				<option value="${v.chi_no}">${v.chi_name}
			</c:forEach>
		</select>
	</form>
	<hr>
	<div id="calendarForm" align="center"></div>

	<!-- Modal 예약내용-->
	<div class="modal fade" id="reservationModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" id="exampleModalLabel">예약정보</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<span id="reservationNumTd" style="display: none;"></span>
				</div>
				<div class="modal-body" align="center">
						<table class="reportTd">
							<tr>
								<td align="left">시터</td>
								<td id="reservationSitterIdTd"></td>
							</tr>
							<tr>
								<td width="50%" align="left">예약일</td>
								<td width="50%" id="reservationDayTd"></td>
							</tr>
							<tr>
								<td align="left">돌봄 비용</td>
								<td><span id="reservationPriceTd"></span>원</td>
							</tr>
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" id="sitterRevPayBtn" class="btn btn-primary">결제하기</button>
					<button type="button" id="sitterRevCancleBtn" class="btn btn-primary">예약취소</button>
					<button type="button" id="sitterRevReviewBtn" class="btn btn-primary" data-toggle='modal' data-target = '#reviewModal'>후기쓰기</button>
					<button type="button" id="reviewViewBtn" class="btn btn-primary" data-toggle='modal' data-target = '#reviewModal'>후기보기</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
	
	<!-- Modal 후기-->
	<div class="modal fade" id="reviewModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="${pageContext.request.contextPath}/sitter/insertReview">
					<input type="text" name="srv_no" id="reviewNo">
					<div class="modal-body" align="center">
						<div align="left" style="display: inline-block; width: 50%;">후기쓰기</div>
						<div align="right" style="float: right; display: inline-block; width: 50%;">
							<select name="sc_rate">
									<option value="5" selected="selected">★★★★★
									<option value="4">★★★★
									<option value="3">★★★
									<option value="2">★★
									<option value="1" >★
							</select>
						</div>
						<br><br>			
						<div>
							<textarea rows="5" cols="55" name="sc_content"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" >확인</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal -->
</body>
</html>