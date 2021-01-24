<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<style type="text/css">
.communityFormTitle {
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

.titleFont{
	display: inline;
	color: rgb(249, 196, 94);
	font-size: 35px;
    font-weight: bold;
}
.fadein {animation: fadein 2s;}
@keyframes fadein {
    from {opacity:0;}
    to {opacity:1;}
}

@-webkit-keyframes fadein { /* Safari and Chrome */
    from {opacity:0;}
    to {opacity:1;}
}

.hideme{opacity:0;}

}
.famImage{width: 420px;height: 350px;}
</style>
<script type="text/javascript">
 	$(()=>{
		$('.sitterDiv').on({
			"click" : function() {
				var sit_mbr_id = $(this).find('.sitterIdInput').val();
				location.href="${pageContext.request.contextPath}/sitter/form?sit_mbr_id=" + sit_mbr_id; 		
			}
		})
		
		if('${sitterVOChk.sit_loc}' != ''){
			var optionList = $('.loactionInput').find('option');
			$.each(optionList, function(idx, val) {
				console.log($(val).text());
				if('${sitterVOChk.sit_loc}' == $(val).text()){
					$(val).attr("selected","selected");
				}
			})
		}
		
		$('#resetBtn').on({
			"click" : function() {
				location.href = "${pageContext.request.contextPath}/sitter/board";
			}
		})
	}) 
</script>
</head>
<body>
	<h3 class="titleFont">시터 리스트</h3>
	<hr>
	<br>
	<div align="center">
		<div align="center" class="communityFormTitle communityFormFilter">
			<form action="${pageContext.request.contextPath}/sitter/board" method="post">
				<table style="width: 70%">
					<tr>
						<td align="center" width="6%" height="40px">휴무일</td>
							<td align="left">
								<input value="월" type="checkbox" name="off_days" <c:if test="${fn:indexOf(sitterVOChk.off_days,'월')>=0}">checked="checked"</c:if>> 월 
								<input value="화" type="checkbox" name="off_days" <c:if test="${fn:indexOf(sitterVOChk.off_days,'화')>=0}">checked="checked"</c:if>> 화 
								<input value="수" type="checkbox" name="off_days" <c:if test="${fn:indexOf(sitterVOChk.off_days,'수')>=0}">checked="checked"</c:if>> 수
								<input value="목" type="checkbox" name="off_days" <c:if test="${fn:indexOf(sitterVOChk.off_days,'목')>=0}">checked="checked"</c:if>> 목 
								<input value="금" type="checkbox" name="off_days" <c:if test="${fn:indexOf(sitterVOChk.off_days,'금')>=0}">checked="checked"</c:if>> 금
							</td>
						<td align="center" width="10%">일급</td>
						<td align="left"><input type="number"
							class="sitterBoardInputSize" step="1000" placeholder="최소금액" name="minPay" <c:if test="${sitterVOChk.minPay != null}">value="${sitterVOChk.minPay}"</c:if>>
							~ <input type="number" class="sitterBoardInputSize" step="1000"
							placeholder="최대금액" name="maxPay" <c:if test="${sitterVOChk.maxPay != null}">value="${sitterVOChk.maxPay}"</c:if>></td>
					</tr>
					<tr>
						<td align="center" height="40px">별점</td>
						<td align="left"><select class="sitterBoardInputSize" name="minRate">
								<option value="" <c:if test="${sitterVOChk.minRate == null and sitterVOChk.minRate == ''}">selected="selected"</c:if>>선택하세요
								<option value="5" <c:if test="${sitterVOChk.minRate == 5}">selected="selected"</c:if>>★★★★★
								<option value="4" <c:if test="${sitterVOChk.minRate == 4}">selected="selected"</c:if>>★★★★
								<option value="3" <c:if test="${sitterVOChk.minRate == 3}">selected="selected"</c:if>>★★★
								<option value="2" <c:if test="${sitterVOChk.minRate == 2}">selected="selected"</c:if>>★★
								<option value="1" <c:if test="${sitterVOChk.minRate == 1}">selected="selected"</c:if>>★
						</select> ~ <select class="sitterBoardInputSize" name="maxRate">
								<option value="" <c:if test="${sitterVOChk.minRate == null and sitterVOChk.minRate == ''}">selected="selected"</c:if>>선택하세요
								<option value="5" <c:if test="${sitterVOChk.minRate == 5}">selected="selected"</c:if>>★★★★★
								<option value="4" <c:if test="${sitterVOChk.maxRate == 4}">selected="selected"</c:if>>★★★★
								<option value="3" <c:if test="${sitterVOChk.maxRate == 3}">selected="selected"</c:if>>★★★
								<option value="2" <c:if test="${sitterVOChk.maxRate == 2}">selected="selected"</c:if>>★★
								<option value="1" <c:if test="${sitterVOChk.maxRate == 1}">selected="selected"</c:if>>★
						</select></td>
						<td align="center">제재횟수</td>
						<td align="left"><input type="number" placeholder="제재횟수" name="report"
							class="sitterBoardInputSize" <c:if test="${sitterVOChk.report != null}">value="${sitterVOChk.report}"</c:if>> 회 이하</td>
					</tr>
					<tr>
						<td align="center" height="40px">지역</td>
						<td align="left"><select name="sit_loc"
							class="loactionInput sitterBoardInputSize">
								<option>선택하세요</option>
								<option value="서울">서울</option>
								<option value="경기">경기</option>
								<option value="인천">인천</option>
								<option value="대전">대전</option>
								<option value="대구">대구</option>
								<option value="부산">부산</option>
								<option value="울산">울산</option>
								<option value="광주">광주</option>
								<option value="강원">강원</option>
								<option value="세종">세종</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="전북">전북</option>
								<option value="경남">경남</option>
								<option value="전남">전남</option>
								<option value="제주">제주</option>
						</select></td>
						<td align="center" colspan="2">
							<button type="submit" class="btnYellow bSamll">검색</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btnYellow bSamll" id="resetBtn">초기화</button>
							
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<br>
	<div id="divForEntryNum">
		<table class="table" id="dataTable">
			<thead>
				<tr>
					<th>가</th>
				</tr>
			</thead>
			<tbody class="fadein">
				<c:forEach items="${sitterVOChkList}" var="v">
					<tr class="dataTableTr">
						<td>
							<div class="sitterDiv strongYellow">
								<input class="sitterIdInput" type="hidden" value="${v.sit_mbr_id}"> 
								<img class="sitterProfileImg" alt="시터이미지"
									src="${pageContext.request.contextPath}/resources/images/sitterProfile/${v.sit_pic}">
								<table class="TableInTheDataTable" align="center">
									<tr align="center">
										<td>휴&nbsp;무&nbsp;일</td>
										<td align="left">${v.sit_off}</td>
									</tr>
									<tr>
										<td align="center">일&nbsp;&nbsp;&nbsp;&nbsp;급</td>
										<td>${v.sit_pay}</td>
									</tr>
									<tr>
										<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;점</td>
										<td>
											<c:if test="${v.rate == '　'}">평가없음</c:if>
											<c:if test="${v.rate != null}">${v.rate}</c:if>
										</td>
									</tr>
									<tr>
										<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;역</td>
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
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
