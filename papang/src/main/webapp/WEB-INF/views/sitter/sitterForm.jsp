<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
.center_div {
	font-size: 19px;
}

#calendarForm {
	display: inline;
	width: 48%;
	float: left;
}

#sitterForm {
	display: inline;
	width: 48%;
	float: right;
	padding: 1%;
	border-radius: 10px;
}

.custom_calendar_table {
	width: 100%;
}

.custom_calendar_table td, .custom_calendar_table th {
	text-align: left;
	vertical-align: text-top;
	height: 80px;
	min-width: 50px;
	max-width: 50px;
	font-size: 20px;
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
	font-size: 25px;
}

.custom_calendar_table tbody td:nth-child(1) {
	color: red;
}

.custom_calendar_table tbody td:nth-child(7) {
	color: #288CFF;
}

.custom_calendar_table tbody td.startDay, .custom_calendar_table tbody td.endDay, .custom_calendar_table tbody td.reservedTd {
	background-color: yellow;
}

.sitterProfileImg {
	width: 30%;
	display: inline;
	border-radius: 10px;
	float: left;
}

.sitterInfoTable {
	width: 60%;
	font-size: 30px;
}

.sitterInfoTable2 {
	width: 80%;
	font-size: 30px;
}

.btnReserve {
	width: 100px;
	height: 35px;
}

.sitterFormHr{
	border-top: 5px solid black;
}

.startDayTd, .endDayTd {
	color: red;
}

.priceTd {
	color: blue;
}

.reservationInfoDiv{
	background-color: white;
	border-radius: 8px;
	display: inline-block;
	width: 99%;
	margin-top: -25px;
}

.offDayTd{
	background-color: #bbbbbb;
	cursor: default;
}
.introductoryOff{
	color: #bbbbbb;
}

.reservatedDayTd{
	background-color: cyan;
	cursor: default;
}
.introductoryRev{
	color: cyan;
}

.introductoryForCalender{
	float: right;
	position: relative;
}
.calenderMenu{
	position: absolute;
	width: 33%;
}

#showRateBtn{
	float: right;
	font-size : 18px;
	color: white;
	border: solid 1px #333;
	background: #333;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	border-radius: .5em;
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
}

.custom_calendar_table tbody td:not(.reservatedDayTd){
	cursor: pointer;
}
.titleFont{
	display: inline;
	color: rgb(249, 196, 94);
	font-size: 35px;
    font-weight: bold;
}
#titleFont{
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(()=>{
	calendarMaker($("#calendarForm"), new Date());
	offDays();
	var sit_pay = ("${sitterVOChk.sit_pay}").replace(",","");
	$('.srv_payInput').val(sit_pay);
	giveIdForDate();
	getReservatedDayList();
	
	$('#btnReserve').on('click', function() {
		if('${sessionScope.user.mbr_id}' != ''){//로그인을 체크
			var childChkBoxList = $.find('.childChkBox:checked').length;
			if(childChkBoxList > 0){//아이를 체크 했는지
				if($('.reservationDays').val() != ''){
					$('#frmReserve').submit();	
				} else {
					alert("날짜를 선택하세요.");	
				}
					
			} else {
				alert("아이를 선택하세요.");	
			}
			
		} else {
			alert("로그인이 필요합니다.");
		}
		
	})
})

var startDaySelete = false;
var endDaySelete = false;
var nowDate2 = new Date();
var yearForCal = nowDate2.getFullYear();
var monthForCal = nowDate2.getMonth() + 1;
var startDayTdText = $('.startDayTd').text();
var endDayTdText = $('.endDayTd').text();
var reservatedDayList = [];

function offDays(){
		var sitOffTdText = $('.sitOffTd').text();
	   	var allTr = $('#custom_set_date').find('tr');
	   	var days = ['월','화','수','목','금']
	   	$.each(days, function(idx, val){
	   		if(sitOffTdText.indexOf(val) != -1){
	   	   		$.each(allTr, function(idx2, val2){
	   	   			$(val2).find('td').eq(idx+1).attr('class', 'offDayTd').css('cursor','default');  			
	   	   		})
	   	   	}
	   	})
	   $('.offDayTd').off();
}

function giveIdForDate() {
	var allTd = $('#custom_set_date').find('td');
	$.each(allTd, function(idx, val){
		var date = ($(val).text()).replace("/","");
		if(date.length == 2){//이번달 날짜 일때
			if(monthForCal < 10){//한자리수 달 일때
				$(val).attr('id',"0" + monthForCal + date);	
			} else {
				$(val).attr('id',monthForCal + date);	
			}
		} else {
			$(val).attr('id',date);	
		}
	})
}

function moveMonth() {//책갈피
	var startDayTd = $('.startDayTd').text();
	var startDayText = startDayTd.substring(3,5)+startDayTd.substring(6,8);
	var endDayTd = $('.endDayTd').text();
	var endDayTdText = endDayTd.substring(3,5)+endDayTd.substring(6,8);
	
	var allTds = $('.custom_calendar_table').find('td');
	var startChker = false;
	$.each(allTds, function(idx, val) {
		if($(val).attr('id') == endDayTdText){
			$(val).attr('class','endDay')
			startChker = false;
		}
		if(startChker){
			$(val).attr('class','reservedTd')
		}
		if($(val).attr('id') == startDayText){
			$(val).attr('class','startDay')
			startChker = true;
		}
		
		
	})
	
}

function getReservatedDayList(){
	var calenderY = $('.calenderY').text();
	var calenderM = $('.calenderM').text();
	$.ajax({ 
	    url: "${pageContext.request.contextPath}/ajax/reservatedDays",  
	    type: 'POST', 
	    dataType: 'json', 
	    data : {"calenderY":calenderY,"calenderM":calenderM, "sit_mbr_id": "${param.sit_mbr_id}"},
	    success: function(sitter_revChkVOList) {
	    	$.each(sitter_revChkVOList, function(idx, val) {
	    		var srv_date = (val.srv_date).substring(5,7) + (val.srv_date).substring(8,10);
	    		reservatedDayList.push(srv_date);
	    		$('#'+ srv_date ).attr('class','reservatedDayTd'); 
	    		$('.reservatedDayTd').off();
			})
	    }, 
	    error:function(xhr, status, message) { 
	        alert(" status: "+status+" er:"+message);
	    } 
	 });  
}

function calendarMaker(target, date) {
    if (date == null || date == undefined) {
        date = new Date();
    }
    nowDate = date;
    if ($(target).length > 0) {
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1;
        if(month < 10){
        	month = "0" + month 
        }
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
        tag += "<td>"+ prevMonth + "/" + (prevMonthStart+i+1) +"</td>";
        cnt++;
    }

    //날짜 채우기
    for (i = 1; i <= thisLastDay.getDate(); i++) {
        if (cnt % 7 == 0) { 
        	tag += "<tr>"; 
        }
        if(i < 10){
        	i = "0" + i;
        }
        tag += "<td>" + i + "</td>";
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
    	tag += "<td>" + nextMonth + "/0" + i + "</td>";  	
    }
    
    $(target).find("#custom_set_date").append(tag);
    calMoveEvtFn();

    function assembly(year, month) {
        var calendar_html_code =
        	"<div class='introductoryForCalender'><span class='introductoryRev'>■</span>예약완료 <span class='introductoryOff'>■</span>휴무일 </div>"+
        	"<div class='calenderMenu' align = 'center'>"+
        	"<button type='button' class='prev'><</button>&nbsp;&nbsp;" +
        	"<span class='calenderY'>" + year + "</span>년 <span class='calenderM'>" + month + "</span>월"+
        	"&nbsp;&nbsp;<button type='button' class='next'>></button>"+
        	"</div>"+
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
        //이전달 클릭
        $(".prev").on("click", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
            yearForCal = nowDate.getFullYear();
            monthForCal = nowDate.getMonth()+1;
            offDays();
            giveIdForDate();
            getReservatedDayList();
            moveMonth();
        });
        //다음달 클릭
        $(".next").on("click", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
            yearForCal = nowDate.getFullYear();
            monthForCal = nowDate.getMonth()+1;
            offDays();
            giveIdForDate();
            getReservatedDayList()
            moveMonth();
        });
        
      	//일자 선택 클릭
        $(".custom_calendar_table td").on("click", function () {
        	if(String(monthForCal).length < 2){
    			monthForCal = "0"+monthForCal;
    		}
        	if(!startDaySelete) { //시작일이 입력되지 않았을 때 
        		startDaySelete = true;
        		$(this).addClass("startDay");
        		if(($(this).text()).length > 2){
        			if(monthForCal == '01' && ($(this).text()).substring(0,2) == '12'){
        				yearForCal = yearForCal - 1;
        				$('.startDayTd').text(("0" + yearForCal).slice(-2) + "-" + ($(this).text()).slice(-5,-3) + "-" +($(this).text()).slice(-2));
        				yearForCal = yearForCal + 1;
        			} else {
        				$('.startDayTd').text(("0" + yearForCal).slice(-2) + "-" + ($(this).text()).slice(-5,-3) + "-" +($(this).text()).slice(-2));	
        			}
        		} else {
        			$('.startDayTd').text(("0" + yearForCal).slice(-2) + "-" + monthForCal + "-" + ($(this).text()).slice(-2));	
        		}
        		startDayTdText = $('.startDayTd').text();
        	} else { //시작일이 입력되었을 때
        		var thisClass = $(this).attr('class'); //누른 td의 클래스 조회	
        		if(thisClass == 'startDay'){//시작일을 다시 눌렀을 때
        			startDaySelete = false;
        			endDaySelete = false;
        			monthForCal = nowDate.getMonth() + 1;
        			$('.startDayTd').text('');
        			$('.endDayTd').text('');
        			$('.priceTd').text('');
        			$(this).removeClass("startDay");
        			$(".custom_calendar_table .reservedTd").removeClass("reservedTd");
        			$(".custom_calendar_table .endDay").removeClass("endDay");
        			$('.reservationDays').val('');
        		} else { //시작일 말고 다른 날짜를 눌렀을 때
        			if(!endDaySelete){//종료일이 입력되지 않았을 때 
        				endDaySelete = true;
            			$(this).addClass("endDay");	
                		if(($(this).text()).length > 2){
                			if(monthForCal == '01' && ($(this).text()).slice(-5,-3) == '12'){
                				yearForCal = yearForCal - 1;
                				$('.endDayTd').text(("0" + yearForCal).slice(-2) + "-" + ($(this).text()).slice(-5,-3) + "-" +($(this).text()).slice(-2));
                				yearForCal = yearForCal + 1;
                			} else {
                				$('.endDayTd').text(("0" + yearForCal).slice(-2) + "-" + ($(this).text()).slice(-5,-3) + "-" +($(this).text()).slice(-2));	
                			}
                		} else {
                			$('.endDayTd').text(("0" + yearForCal).slice(-2) + "-" + monthForCal + "-" + ($(this).text()).slice(-2));
                		}
        			} else {//종료일이 이미 있고 시작일을 누른 것이 아닐 때
        				$(".custom_calendar_table .endDay").removeClass("endDay");
        				$(".custom_calendar_table .reservedTd").removeClass("reservedTd");
        				$(this).addClass("endDay");
        				$('.endDayTd').text('');
        				if(($(this).text()).length > 2){
        					if(monthForCal == '01' && ($(this).text()).slice(-5,-3) == '12'){
                				yearForCal = yearForCal - 1;
                				$('.endDayTd').text(("0" + yearForCal).slice(-2) + "-" + ($(this).text()).slice(-5,-3) + "-" +($(this).text()).slice(-2));
                				yearForCal = yearForCal + 1;
                			} else {
                				$('.endDayTd').text(("0" + yearForCal).slice(-2) + "-" + ($(this).text()).slice(-5,-3) + "-" +($(this).text()).slice(-2));	
                			}
                		} else {
                			$('.endDayTd').text(("0" + yearForCal).slice(-2) + "-" + monthForCal + "-" + ($(this).text()).slice(-2));	
                		}
        			}
        			startDayTdText = $('.startDayTd').text();
        			endDayTdText = $('.endDayTd').text();
        			var startDayTd = parseInt(($('.startDayTd').text()).replace(/-/gi,''));
        			var endDayTd = parseInt(($('.endDayTd').text()).replace(/-/gi,''));
        			if(startDayTd > endDayTd){
        				$('.startDayTd').text(endDayTdText);
        				$('.endDayTd').text(startDayTdText);
        				$('.startDay').attr('class', 'tempt');
            			$('.endDay').attr('class', 'startDay');
            			$('.tempt').attr('class', 'endDay');
        			}
        		}
        	};//end of if 
        	var allTd = $('#custom_set_date').find('td');
			var started = false;
			$.each(allTd, function(idx, val){
				if($(val).attr('class') == 'endDay'){
					started = false;
				}
				if(started && endDaySelete && $(val).attr('class') != 'offDayTd' && $(val).attr('class') != 'reservatedDayTd'){
					$(val).attr('class', 'reservedTd');
				}
				if($(val).attr('class') == 'startDay'){
					started = true;
				}
			})
			startDayTdText = $('.startDayTd').text();
        	endDayTdText = $('.endDayTd').text();
			if(endDayTdText == null || endDayTdText == ''){
				endDayTdText = startDayTdText;
			}
			if(startDayTdText != ''){
				howManyDays(startDayTdText, endDayTdText);	
			}
        });//일자 선택 클릭 끝 
        
        function howManyDays(startDayTdText, endDayTdText) {
        	var temptStartDayTdText = null;
        	var temptEndDayTdText = null;
        	temptStartDayTdText = "20" + startDayTdText;
        	temptEndDayTdText = "20" + endDayTdText; 
        	temptStartDayTdText = new Date(temptStartDayTdText);
        	temptEndDayTdText = new Date(temptEndDayTdText);
        	temptStartDayTdText2 = temptStartDayTdText;
        	
        	var onDayCnt = 0; //기간에 포함된 서비스 일 수
        	var offDayCnt = 0; //기간에 포함된 휴무 일 수
        	
        	//휴무일을 숫자로 변환하기
        	var sitOffTdText = $('.sitOffTd').text();
        	var days = ['일','월','화','수','목','금'];
        	var changedText = '';
        	$.each(days, function(idx, val){
        		if(sitOffTdText.indexOf(val) != -1){
        			changedText = changedText + String(idx);
        		};
        	});
        	var  reservationDays = '';
        	while(true){
       			if(changedText.indexOf(temptStartDayTdText2.getDay()) != -1) { //휴무일이다!
       				offDayCnt++
       			} else { //휴무일이 아닐 때
       				var changeToDateYear = String(temptStartDayTdText2.getFullYear());
       				var changeToDateMonth = temptStartDayTdText2.getMonth() + 1;
       				var changeToDateDate = temptStartDayTdText2.getDate();
       				if(changeToDateMonth < 10){
       					changeToDateMonth = "0" + changeToDateMonth;
       				} 
       				if(changeToDateDate < 10){
       					changeToDateDate = "0" + changeToDateDate;
       				} 
       				var mmddType = changeToDateMonth+changeToDateDate; //(mmdd 형식으로 바꾸기)
       				var changeToDate = changeToDateYear+changeToDateMonth+changeToDateDate; //(yyyymmdd 형식으로 바꾸기)
       				if(!reservatedDayList.includes(mmddType)){
       					reservationDays = reservationDays + " " + changeToDate;
           				onDayCnt++	
       				}
       			}
       			if(temptStartDayTdText2.getTime() == temptEndDayTdText.getTime() || endDaySelete == false){
       				break;
       			}
       			temptStartDayTdText2.setDate(temptStartDayTdText2.getDate() + 1);
        	}
        	
        	var pay = ($('.sitterPayTd').text()).replace(',','');
        	var result = String(parseInt(onDayCnt)*parseInt(pay)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        	if(startDaySelete){
        		$('.priceTd').text(result);
        	}
        	$('.reservationDays').val($.trim(reservationDays));
		}
    }//calMoveEvtFn함수 끝
    
    $('#titleFont').on({
		"click" : function() {
			location.href = "${pageContext.request.contextPath}/sitter/board";
		}
	});
}
</script>
</head>
<body>
	<h3 class="titleFont" id="titleFont"> 시터 리스트</h3><h3 class="titleFont"> > 시터 예약하기</h3>
	<hr>
	<br>
	<div align="right">
		<form action="${pageContext.request.contextPath}/sitter/reservation" id="frmReserve">
			<input type="hidden" name="sit_mbr_id" value="${sitterVOChk.sit_mbr_id}">
			<input type="hidden" class="reservationDays" name="reservationDays">
			<input type="hidden" class="srv_payInput" name="srv_pay" value="">
			<c:forEach items="${childVOList}" var="v">
				<input type="checkbox" value="${v.chi_no}" name="chi_no" class="childChkBox">${v.chi_name}
			</c:forEach>
			<button class="btnReserve btnYellow" type="button" id="btnReserve">예약하기</button>
			<br>
			<br>
		</form>
	</div>
	<div align="center">
		<div id="calendarForm" align="center"></div>
		<br>
		<div id="sitterForm" class="strongYellow" align="center">
			<div>
				<img class="sitterProfileImg" alt="시터이미지"
					src="${pageContext.request.contextPath}/resources/images/sitterProfile/${sitterVOChk.sit_pic}">
				<button id="showRateBtn" class="btnYellow" type="button" data-toggle="modal" data-target="#reviewModal">후기보기</button>
				<table class="sitterInfoTable" align="center">
					<tr align="center">
						<td align="center">휴&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;무:</td>
						<td align="left" class="sitOffTd">${sitterVOChk.sit_off}</td>
					</tr>
					<tr>
						<td align="center">일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급:</td>
						<td align="left" class="sitterPayTd">${sitterVOChk.sit_pay}</td>
					</tr>
					<tr>
						<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점:</td>
						<td align="left">
							<c:if test="${sitterVOChk.rate == null}">평가없음</c:if>
							<c:if test="${sitterVOChk.rate != null}">${sitterVOChk.rate}</c:if>
						</td>
					</tr>
					<tr>
						<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역:</td>
						<td align="left">${sitterVOChk.sit_loc}</td>
					</tr>
					<tr>
						<td align="center">제재횟수:</td>
						<td align="left">${sitterVOChk.report}</td>
					</tr>
				</table>
				
			</div>
			<br>
			<br>
			<div align="center" class="reservationInfoDiv">
				<br>
				<table class="sitterInfoTable2" align="center">
					<tr align="center">
						<td align="center" width="50%">돌봄 시작일:</td>
						<td align="left" class="startDayTd" width="50%"></td>
					</tr>
					<tr>
						<td align="center">돌봄 종료일:</td>
						<td align="left" class="endDayTd"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><hr class="sitterFormHr"></td>
					</tr>
					<tr>
						<td align="center">돌봄 비용:</td>
						<td align="left" class="priceTd"></td>
					</tr>
				</table>
				<br>
			</div>
		</div>
	</div>
	
	<!-- Modal 후기 리스트-->
	<div class="modal fade" id="reviewModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title" id="exampleModalLabel">서비스 후기</p>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<span id="reservationNumTd" style="display: none;"></span>
				</div>
				<div class="modal-body" align="center">
					<table class="reportTd">
						<c:forEach items="${sitter_revChkVOList}" var="v">
							<tr>
								<td align="left">${v.sc_rate}</td>
								<td id="reservationSitterIdTd">${v.sc_content}</td>
							</tr>	
						</c:forEach>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal -->
</body>
</html>