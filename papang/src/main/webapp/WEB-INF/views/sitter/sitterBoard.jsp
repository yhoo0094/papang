<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	height: 100%;
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

</head>
<body>
		<h3>시터 리스트</h3>
	<hr>
	<br>
	<div align="center">
		<div align="center"
			class="communityFormTitle communityFormFilter">
			<table style="width: 70%">
				<tr>
					<td align="center" width="6%" height="40px">날짜</td>
					<td align="left"><input type="date"
						class="sitterBoardInputSize"> ~ <input type="date"
						class="sitterBoardInputSize"></td>
					<td align="center" width="10%">시급</td>
					<td align="left"><input type="number"
						class="sitterBoardInputSize" step="1000" placeholder="최소금액">
						~ <input type="number" class="sitterBoardInputSize" step="1000"
						placeholder="최대금액"></td>
				</tr>
				<tr>
					<td align="center" height="40px">별점</td>
					<td align="left"><select class="sitterBoardInputSize">
							<option value="★★★★★">★★★★★
							<option value="★★★★">★★★★
							<option value="★★★">★★★
							<option value="★★">★★
							<option value="★" selected="selected">★
					</select> ~ <select class="sitterBoardInputSize">
							<option value="★★★★★">★★★★★
							<option value="★★★★">★★★★
							<option value="★★★">★★★
							<option value="★★">★★
							<option value="★">★
					</select></td>
					<td align="center">제재횟수</td>
					<td align="left"><input type="number" placeholder="제재횟수"
						class="sitterBoardInputSize"> 회 이하</td>
				</tr>
				<tr>
					<td align="center" height="40px">지역</td>
					<td align="left"><select id="location1" name="location1"
						class="loactionin sitterBoardInputSize">
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
						<button type="button" class="btnYellow bSamll">초기화</button>
					</td>
				</tr>
			</table>
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
			<tbody>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr class="dataTableTr">
					<td>
						<div class="sitterDiv strongYellow">
							<img class="sitterProfileImg" alt="시터이미지"
								src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg">
							<table class="TableInTheDataTable" align="center">
								<tr align="center">
									<td>돌봄요일</td>
									<td>월, 화, 수, 목, 금</td>
								</tr>
								<tr>
									<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급</td>
									<td>8,000원</td>
								</tr>
								<tr>
									<td align="center">별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;점</td>
									<td>★★★★☆</td>
								</tr>
								<tr>
									<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역</td>
									<td>대구</td>
								</tr>
								<tr>
									<td>제재횟수</td>
									<td>0회</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
