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
	width: 50px;
}

.custom_calendar_table thead.cal_week th {
	background-color: #ff971d;
	color: #fff;
	text-align: center;
	vertical-align: middle;
	font-size: 25px;
}

.custom_calendar_table tbody td {
	cursor: pointer;
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
}

.offDayTd{
	background-color: #bbbbbb;
}

</style>
<script type="text/javascript">
$(()=>{
	calendarMaker($("#calendarForm"), new Date());
	offDays();
})

function offDays(){
		var sitOffTdText = $('.sitOffTd').text();
	   	var allTr = $('#custom_set_date').find('tr');
	   	var days = ['월','화','수','목','금']
	   	$.each(days, function(idx, val){
	   		if(sitOffTdText.indexOf(val) != -1){
	   	   		$.each(allTr, function(idx2, val2){
	   	   			$(val2).find('td').eq(idx+1).attr('class', 'offDayTd');  			
	   	   		})
	   	   	}
	   	})
	   $('.offDayTd').off();
}

var startDaySelete = false;
var endDaySelete = false;
var nowDate2 = new Date();
var yearForCal = nowDate2.getFullYear();
var monthForCal = nowDate2.getMonth() + 1;
var startDayTdText = $('.startDayTd').text();
var endDayTdText = $('.endDayTd').text();

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
    for (i = 0; i <= thisMonth.getDay(); i++) {
        tag += "<td>"+ prevMonth + "/" + (prevMonthStart+i) +"</td>";
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
        	"<button type='button' class='prev'><</button>&nbsp;&nbsp;" +
        	"<span>" + year + "</span>년 <span>" + month + "</span>월"+
        	"&nbsp;&nbsp;<button type='button' class='next'>></button>"+
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
        });
        //다음달 클릭
        $(".next").on("click", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
            yearForCal = nowDate.getFullYear();
            monthForCal = nowDate.getMonth()+1;
            offDays();
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
        			if(monthForCal == '01'){
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
        		} else { //시작일 말고 다른 날짜를 눌렀을 때
        			if(startDaySelete && $('#custom_set_date').find('.startDay').length == 0){ //시작일이 선택되어 있고 달을 옮겼을 때
        				$('#custom_set_date').find('td').eq(0).addClass("startDay");
        				endDaySelete = true;
            			$(this).addClass("endDay"); 
            			if(($(this).text()).length > 2){
                			if(monthForCal == '01'){
                				yearForCal = yearForCal - 1;
                				$('.endDayTd').text(("0" + yearForCal).slice(-2) + "-" + ($(this).text()).slice(-5,-3) + "-" +($(this).text()).slice(-2));
                				yearForCal = yearForCal + 1;
                			} else {
                				$('.endDayTd').text(("0" + yearForCal).slice(-2) + "-" + ($(this).text()).slice(-5,-3) + "-" +($(this).text()).slice(-2));	
                			}
                		} else {
                			$('.endDayTd').text(("0" + yearForCal).slice(-2) + "-" + monthForCal + "-" + ($(this).text()).slice(-2));
                		}
            			var startDayTdText = $('.startDayTd').text();
            			var endDayTdText= $('.endDayTd').text();
            			var startDayTd = parseInt(($('.startDayTd').text()).replace(/-/gi,''));
            			var endDayTd = parseInt(($('.endDayTd').text()).replace(/-/gi,''));
            			if(startDayTd > endDayTd){
            				$('.startDayTd').text(endDayTdText);
            				$('.endDayTd').text(startDayTdText);
            				$('.startDay').attr('class', 'tempt');
                			$('.endDay').attr('class', 'startDay');
                			$('.tempt').attr('class', 'endDay');
            				$(".custom_calendar_table .endDay").removeClass("endDay");
            				console.log($('#custom_set_date').find('.endDay').length);
            			} 
        			} else if(!endDaySelete){//종료일이 입력되지 않았을 때 
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
			var minusDays = 0; //휴무일과 겹치는 일 수
			$.each(allTd, function(idx, val){
				if($(val).attr('class') == 'endDay'){
					started = false;
				}
				if(started && endDaySelete && $(val).attr('class') != 'offDayTd'){
					$(val).attr('class', 'reservedTd');
				}
				if(started && endDaySelete && $(val).attr('class') == 'offDayTd'){
					minusDays = minusDays + 1;
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
			howManyDays(startDayTdText, endDayTdText, minusDays);
        });//일자 선택 클릭 끝 
        
        function howManyDays(startDayTdText, endDayTdText, minusDays) {
        	var temptStartDayTdText = null;
        	var temptEndDayTdText = null;
        	temptStartDayTdText = "20" + startDayTdText;
        	temptEndDayTdText = "20" + endDayTdText; 
        	temptStartDayTdText = new Date(temptStartDayTdText);
        	temptEndDayTdText = new Date(temptEndDayTdText);
        	temptStartDayTdText2 = temptStartDayTdText;
        	
        	while(temptStartDayTdText2.getTime() != temptEndDayTdText.getTime()){
        		temptStartDayTdText2.setDate(temptStartDayTdText2.getDate() + 1);
					        		
        	}
        		
        	
        	var daysBeetween = ((temptEndDayTdText.getTime() - temptStartDayTdText.getTime())/1000/60/60/24) + 1;
        	var pay = ($('.sitterPayTd').text()).replace(',','');
        	var result = String((parseInt(daysBeetween)-parseInt(minusDays))*parseInt(pay)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        	if(startDaySelete){
        		$('.priceTd').text(result);
        	}
		}
    }//함수 끝
}
</script>
</head>
<body>
	<h3>시터 예약하기</h3>
	<hr>
	<br>
	<div align="right">
		<form action="${pageContext.request.contextPath}/sitter/reservation">
			<input type="hidden" value="${sitterVOChk.sit_mbr_id}">
			<c:forEach items="${childVOList}" var="v">
				<input type="checkbox" value="${v.chi_name}" >${v.chi_name}
			</c:forEach>
			<button class="btnReserve btnYellow" type="submit">예약하기</button>
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
						<td align="left">★★★★☆</td>
					</tr>
					<tr>
						<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역:</td>
						<td align="left">${sitterVOChk.sit_loc}</td>
					</tr>
					<tr>
						<td align="center">제재횟수:</td>
						<td align="left">0회</td>
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
</body>
</html>