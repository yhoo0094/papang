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

.custom_calendar_table tbody td.startDay {
	background-color: #ff971d;
	color: #fff;
}

.custom_calendar_table tbody td.endDay {
	background-color: red;
	color: #fff;
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
</style>
<script type="text/javascript">
$(()=>{
	calendarMaker($("#calendarForm"), new Date());
})

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
    }
    for (i = 0; i < thisMonth.getDay(); i++) {
        tag += "<td>"+ prevMonth + "/" + (prevMonthStart+i) +"</td>";
        cnt++;
    }

    //날짜 채우기
    for (i = 1; i <= thisLastDay.getDate(); i++) {
        if (cnt % 7 == 0) { tag += "<tr>"; }

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
    	tag += "<td>" + nextMonth + "/" + i + "</td>";  	
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
        });
        //다음달 클릭
        $(".next").on("click", function () {
            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
            calendarMaker($(target), nowDate);
        });
        //일자 선택 클릭
        var startDaySelete = false;
        var endDaySelete = false;
        var year = nowDate.getFullYear();
        var month = nowDate.getMonth() + 1;
        $(".custom_calendar_table").on("click", "td", function () {
        	if(!startDaySelete) { //시작일이 입력되지 않았을 때 
        		startDaySelete = true;
        		$(this).addClass("startDay");
        		$('.startDayTd').text(("0" + year).slice(-2) + "-" + month + "-" + $(this).text());
        	} else { //시작일이 입력되었을 때
        		var thisClass = $(this).attr('class'); //누른 td의 클래스 조회	
        		if(thisClass == 'startDay'){//시작일을 다시 눌렀을 때
        			startDaySelete = false;
        			$(this).removeClass("startDay");
        			$(".custom_calendar_table .endDay").removeClass("endDay");
        		} else { //시작일 말고 다른 날짜를 눌렀을 때
        			if(!endDaySelete){//종료일이 입력되지 않았을 때
        				endDaySelete = true;
            			$(this).addClass("endDay");	
        			} else {//종료일이 이미 있고 시작일을 누른 것이 아닐 때
        				$(".custom_calendar_table .endDay").removeClass("endDay");
        				$(this).addClass("endDay");
        			}
        		}
        	}; 
        	//
        });
    }
}
</script>
</head>
<body>
	<h3>시터 예약하기</h3>
	<hr>
	<br>
	<div align="right">
		<c:forEach items="${childVOList}" var="v">
			<input type="checkbox" value="${v.chi_name}">${v.chi_name}
		</c:forEach>
		<button class="btnReserve btnYellow">예약하기</button>
		<br>
		<br>

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
						<td align="left">${sitterVOChk.sit_off}</td>
					</tr>
					<tr>
						<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급:</td>
						<td align="left">${sitterVOChk.sit_pay}</td>
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
						<td align="center">돌봄 시작일:</td>
						<td align="left" class="startDayTd"></td>
					</tr>
					<tr>
						<td align="center">돌봄 종료일:</td>
						<td align="left" class="endDayTd"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><hr class="sitterFormHr"></td>
					</tr>
					<tr>
						<td align="center">돌봄 총비용:</td>
						<td align="left" class="priceTd">99,000원</td>
					</tr>
				</table>
				<br>
			</div>
		</div>
	</div>
</body>
</html>