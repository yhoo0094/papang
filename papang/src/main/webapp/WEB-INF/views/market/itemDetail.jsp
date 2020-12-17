<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세페이지</title>
</head>
<body>
	<div id="mainContent" style="min-width: 600px !important;">
		<div id="tab-1" class="tab-content current">
			<form id="frm" name="frm" enctype="multipart/form-data">
				<div class="col-sm-12 pt-3">
					<div class="card">
						<div class="card-header card-header-primary">
							<span class="card-title" id="movieTitle"> <i
								class="fas fa-square"></i>${vo.mvTitle}
							</span>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table">
									<tbody>
										<tr style="line-height: 32px;">
											<td>제목</td>
											<td><input type="text" name="mvTitle"
												class="form-control" value="${vo.mvTitle}" readonly></td>
											<td>감독</td>
											<td><input type="text" name="mvDir" class="form-control"
												value="${vo.mvDir}" readonly></td>
										</tr>
										<tr>
											<td>개봉일</td>
											<td><input type="text" name="strdate"
												class="form-control" value="${vo.strdate}" readonly></td>
											<td>상영 종료일</td>
											<td><input type="text" name="findate"
												class="form-control" value="${vo.findate}" readonly></td>
										</tr>
										<tr>
											<td>장르</td>
											<td><input type="text" name="mvType"
												class="form-control" value="${vo.mvType}" readonly></td>
											<td>관람 연령</td>
											<td><input type="text" name="mvAge" class="form-control"
												value="${vo.mvAge}" readonly></td>
										</tr>
										<tr>
											<td>등장인물</td>
											<td colspan="3"><input type="text" name="mvCha"
												class="form-control mb-3" value="${vo.mvCha}" readonly></td>
										</tr>
										<tr>
											<td>줄거리</td>
											<td colspan="3"><textarea rows="3" cols="60"
													name="mvSum" readonly>${vo.mvSum}</textarea></td>
										</tr>
										<tr>
											<td>설명</td>
											<td colspan="3"><textarea rows="3" cols="60"
													name="mvCont" readonly>${vo.mvCont}</textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>