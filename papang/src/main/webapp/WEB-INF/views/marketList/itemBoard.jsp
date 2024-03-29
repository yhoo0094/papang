<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
.noDepth>a {
	align 
}
/*.h-100>a {
	min-height: 300px;
 	max-height: 300px;
	overflow: hidden;
} */
.card-img-top {
	width: 100%;
 	height: 300px;
	display: block;
/* 	border-radius: 10px; */
/* 	-webkit-transform: translate(50%, 50%); */
/* 	-ms-transform: translate(50%, 50%); */
/* 	transform: translate(50%, 50%); */
/* 	padding-top: 100%; */
/* 	position: relative; */
	
}
thead, .dataTables_length{
	display: none;
}

.marketTableTr {
	display: inline;
	width: 50%;
	padding: 6px;
	border-radius: 10px;
}
.marketTableTr>td {
    width: 260px;
}
.Bigtitle {
	color: rgb(249, 196, 94);
	font-size: 35px;
    font-weight: bold;
margin: 20px 0 0 38px;
}
.row {
    margin-right: -155px;
}
.h-100 {
    width: 306px;
}
.proTitle{color:#58391c;font-size: 20px;}
.proTitle:hover{color:#fa91a2; text-decoration: none;}
.strongYellow {
    background-color: white;
}

.dataTables_filter{width: 480px;}
.searchBtn{color:#58391c;margin: 0 5px 0 20px;font-size: 18px;}
.searchBtn:hover{color:#fa91a2;text-decoration: none;}
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
.sample_image:hover {
    -webkit-transform:scale(1.2);
    -moz-transform:scale(1.2);
    -ms-transform:scale(1.2);   
    -o-transform:scale(1.2);
    transform:scale(1.05);
    transition-duration: 0.5s;
}
</style>

<div class="container center_div">
	<h2 class="Bigtitle">Papang Shop</h2>
	<div align="right" style="width: 1011px;margin: 40px 0 40px 0">
		<c:if test="${!empty admin.ad_id}">
			<button type="button" class="btnYellow bMedium"
				onclick="location.href='/papang/market/itemInsertForm'">관리자 상품등록</button>
		</c:if>
	</div>
	 <!-- a class="searchBtn" style="margin-right: 10px;" href="${pageContext.request.contextPath}/marketList/itemBoardPrice">가격 낮은순	|</a>
	<a class="searchBtn" style="margin-right: 10px;" href="${pageContext.request.contextPath}/marketList/itemBoardPriceDesc">가격 높은순	|</a>
	<a class="searchBtn" style="margin-right: 10px;" href="${pageContext.request.contextPath}/marketList/itemBoard">최신 등록순</a -->
	<div id="marketListBoard">
		<table class="table" id="dataTable">
			<thead>
				<tr>
					<th>r</th>
					<th>r</th>
				</tr>
			</thead>
			<tbody class="fadein">
				<c:forEach var="pro" items="${ pro }">
				<c:if test="${ empty pro.pro_cnt && !empty admin.ad_id}">
					<tr class="marketTableTr">
					<td style="display: none; width: 0px"><p>${pro.pro_no}</p></td>
						<td><p style="display: none">${pro.pro_no}</p>
							<div class="portfolio-item">
								<div class="card h-100 strongYellow">
									<a href="../market/itemDetail?pro_no=${pro.pro_no}"><img
										class="card-img-top"
										src="${pageContext.request.contextPath}/resources/images/market/${pro.pro_pic}"></a>
									<div class="card-body">
										<h4 class="card-title">
											<a class="proTitle" href="../market/itemDetail?pro_no=${pro.pro_no}">${pro.pro_name}</a>
										</h4>
										<p class="card-text"><font style="color: red;">입고필요 </font> </p> 
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:if>
				</c:forEach>
				<c:forEach var="pro" items="${ pro }">
				<c:if test="${ !empty pro.pro_cnt }">
					<tr class="marketTableTr">
					<td style="display: none; width: 0px"><p>${pro.pro_no}</p></td>
						<td class="sample_image"><p style="display: none">${pro.pro_no}</p>
							<div class="portfolio-item">
								<div class="card h-100 strongYellow">
									<a href="../market/itemDetail?pro_no=${pro.pro_no}"><img
										class="card-img-top"
										src="${pageContext.request.contextPath}/resources/images/market/${pro.pro_pic}"></a>
									<div class="card-body">
										<h4 class="card-title">
											<a class="proTitle" href="../market/itemDetail?pro_no=${pro.pro_no}">${pro.pro_name}</a>
										</h4>
										<p class="card-text" style="display: inline-block;">&#8361;${pro.pro_price}</p>
										<c:if test="${pro.pro_cnt == 0}">
											<font style="color: red; float: right;">품절</font>
										</c:if>
									</div>
								</div>
							</div>
						</td>
					</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
