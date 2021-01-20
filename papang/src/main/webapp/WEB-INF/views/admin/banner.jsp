<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		bannerlist();
		bannerinsert();
		bannerSelect();
		bannerUpdate();
		bannerDelete();
		statusUpdate();
		init();
		$("#filter").on('change', function() {
			bannerlist();
		});

		$("#uf").on(
				'change',
				function(e) {
					if (window.FileReader) {
						console.log($($(this)[0].files[0].name));
						var filename = $(this)[0].files[0].name;

					} else {

						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
						console.log($(this).val().split('/').pop().split('\\')
								.pop());

					}

					$('#la').text(filename);

					var files = e.target.files;
					var arr = Array.prototype.slice.call(files);
					for (var i = 0; i < files.length; i++) {
						if (!checkExtension(files[i].name, files[i].size)) {
							return false;
						}
					}

					preview(arr);

				});

		function checkExtension(fileName, fileSize) {

			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 20971520; //20MB

			if (fileSize >= maxSize) {
				alert('파일 사이즈 초과');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}

			if (regex.test(fileName)) {
				alert('업로드 불가능한 파일이 있습니다.');
				$("input[type='file']").val(""); //파일 초기화
				return false;
			}
			return true;
		}

		function preview(arr) {
			arr
					.forEach(function(f) {

						//파일명이 길면 파일명...으로 처리
						var fileName = f.name;
						if (fileName.length > 10) {
							fileName = fileName.substring(0, 7) + "...";
						}

						//div에 이미지 추가
						var str = '<div style="display: inline-flex; padding: 10px;"><li>';
						str += '<span>' + fileName + '</span><br>';

						//이미지 파일 미리보기
						if (f.type.match('image.*')) {
							var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
							reader.onload = function(e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
								//str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';

								$('#img').attr('src', e.target.result);
								$('#img').attr('style',
										"width:300px; height: 350px");
							}
							reader.readAsDataURL(f);
						} else {
							$('#img').attr('src', e.target.result);
							$('#img').attr('style',
									"width:300px; height: 350px");
						}
					});//arr.forEach
		}
	});

	//사용자 목록 조회 요청
	function bannerlist() {
		var filter = $("#filter").val()
		$.ajax({
			url : '../banner',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			data : {
				ban_category : filter
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : bannerListResult
		});
	}//userList

	//사용자 목록 조회 응답
	function bannerListResult(data) {

		$("#dataTable tbody").empty();
		$
				.each(
						data,
						function(idx, item) {
							$('<tr>')
									.append($('<td>').html(item.ban_no))
									.append($('<td>').html(item.ban_category))
									.append($('<td>').html(item.ban_pic_name))
									.append(
											$('<td>')
													.html(
															"<select class='status' id='status"+item.ban_no+"'><option value='숨김'>숨김</option><option  value='표시'>표시</option></select>"))
									.append(
											$('<td>')
													.html(
															"<img  alt='배너이미지' src='${pageContext.request.contextPath}/resources/images/Banner/"+item.ban_pic+"' style='width: 300px; height: 200px'>"))
									.append($('<td>').html(item.ban_link))
									.append(
											$("<td>")
													.html(
															'<button id=\'btnSelect\' class=\'buttonclass\'>조회</button><button id=\'btnDelete\' class=\'buttonclass\'>삭제</button>'))
									.appendTo('#dataTable tbody');
							$("#status" + item.ban_no).val(item.ban_pic_status)
									.prop("selected", true);
						});
		$('#dataTable').DataTable();
	}//userListResult

	//사용자 등록 요청
	function bannerinsert() {
		//등록 버튼 클릭
		$('#btnInsert').on('click', function() {
			var form = $('#form1')[0];
			var formData = new FormData(form);
			$.ajax({
				url : "../banner",
				type : 'POST',
				dataType : 'json',
				data : formData,
				contentType : false,
				processData : false,
				success : function(response) {
					if (response.result == true) {

						$('#form1').each(function() {
							this.reset();
							bannerlist();
							$('#img').attr('src', '');
							$('#la').html("선택한 파일 없음");
							alert("등록되었습니다");
						});
					}
				},
				error : function(xhr, status, message) {
					alert("status: " + status + " er:" + message);
				}
			});
		});//등록 버튼 클릭
	}//userInsert

	//사용자 조회 요청
	function bannerSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var banno = $(this).parent().parent().children().eq(0).html();
			console.log(banno);
			//특정 사용자 조회
			$.ajax({
				url : '../banner/' + banno,
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : bannerSelectResult
			});
		}); //조회 버튼 클릭
	}//nqSelect
	function bannerSelectResult(banner) {

		$('#img').attr(
				'src',
				'${pageContext.request.contextPath}/resources/images/Banner/'
						+ banner.ban_pic);
		$('#ban_category').val(banner.ban_category).prop("selected", true);
		$('#la').html(banner.ban_pic);
		$('#ban_pic_name').val(banner.ban_pic_name);
		$('#ban_link').val(banner.ban_link);
		$('#ban_category').val(banner.ban_category).prop("selected", true);
		$('input[name= ban_pic_status]').val(banner.ban_pic_status).prop(
				"selected", true);
		$('#ban_pic_status').val(banner.ban_pic_status).prop("selected", true);
		$('#img').attr('style', "width: 600px; height: 350px");
		$('#ban_no').val(banner.ban_no);

	}

	//사용자 수정 요청
	function bannerUpdate() {
		//수정 버튼 클릭

		$('#btnUpdate').on('click', function() {
			var form = $('#form1')[0];
			var formData = new FormData(form);

			$.ajax({
				url : "../bannerUpdate",
				dataType : 'json',
				data : formData,
				method : 'post',
				contentType : false,
				processData : false,
				success : function(data) {
					bannerlist();
					$('#form1').each(function() {
						this.reset();
						$('#la').html("선택한 파일 없음");
						alert("수정되었습니다");
						$('#img').attr('src', '');
					});
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});//수정 버튼 클릭
	}//userUpdate

	//사용자 삭제 요청
	function bannerDelete() {
		//삭제 버튼 클릭
		$('body').on('click', '#btnDelete', function() {
			var banno = $(this).parent().parent().children().eq(0).html();
			var result = confirm(banno + " 번 배너를 정말로 삭제하시겠습니까?");
			if (result) {
				$.ajax({
					url : '../banner/' + banno,
					type : 'DELETE',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					error : function(xhr, status, msg) {
						console.log("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(xhr) {
						console.log(xhr.result);
						bannerlist();
						$('#form1').each(function() {
							alert("삭제되었습니다");
							this.reset();
							$('#la').html("선택한 파일 없음");
						});
					}
				});
			}//if
		}); //삭제 버튼 클릭
	}//nqDelete

	function statusUpdate() {
		//수정 버튼 클릭
		var banno;
		$("body").on('change', '.status', function() {
			var status = $(this).val();
			banno = $(this).parent().parent().children().eq(0).html();
			$.ajax({
				url : "../banner",
				type : 'PUT',
				dataType : 'json',
				data : JSON.stringify({
					ban_no : banno,
					ban_pic_status : status
				}),
				contentType : 'application/json',
				success : function(data) {
					alert(banno + "번 배너의 상태가" + status + "으로 변경 되었습니다");
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
			console.log($(this).val());

		});

	}//userUpdate

	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click', function() {
			$('#form1').each(function() {
				this.reset();
				$('#la').html("선택한 파일 없음");
				alert("초기화되었습니다");
				$('#img').attr('src', '');
			});
		});
	}//init
</script>
<h1 class="mt-4">배너 관리</h1>

<form id="form1" class="form-horizontal">
	<div align="center">

		<table class="table">
			<tbody>
				<tr>
					<td align="center">분류</td>
					<td><select name="ban_category" id="ban_category">
							<option value="사이드배너">사이드 배너</option>
							<option value="이미지슬라이드">이미지 슬라이드</option>
					</select>
					</td>
				</tr>
				<tr>
			
				</tr>
				
				<tr>
					<td align="center">제목</td>
					<td><input type=hidden name='ban_no' id='ban_no'> <input
						type="text" style="width: 100%" name='ban_pic_name'
						id='ban_pic_name'></td>
				</tr>

				<tr>
					<td align="center">이미지 상태</td>
					<td align="left"><select name="ban_pic_status"
						id="ban_pic_status">
							<option value="숨김">숨김</option>
							<option value="표시">표시</option>
					</select></td>
				</tr>
				<tr>
					<td align="center"><br> <br> <br>이미지</td>
					<td>
						<table style="width: 100%">
							<tr>
								<td align="center"><img id="img" class="sitterProfileImg"
									alt="배너이미지" src="" style="width: 600px; height: 350px"></td>
							</tr>
							<tr align="center">
								<td><input type="file" name="uploadFile2" id="uf" />
									<div
										style="display: inline-block; position: relative; width: 200px; left: -241px; top: 0px; background: white;">
										<label id="la">선택한 파일 없음</label>
									</div></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
				<tr>
					<td align="center">링크</td>
					<td><input id='ban_link' name='ban_link' type="text"
						style="width: 100%"></td>
				</tr>
			</tbody>
		</table>
		<div align="center">
			<input type="button" class='buttonclass' value="등록"
				id="btnInsert" /> <input type="button" class='buttonclass'
				value="수정" id="btnUpdate" /> <input type="button"
				class='buttonclass' value="초기화" id="btnInit" />

		</div>
	</div>
</form>
<br>
<br>
<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 배너
	</div>
	<div class="card-body">

		<div class="table-responsive">
			분류 <select id='filter'>
				<option selected value=''>전체</option>
				<option value="사이드배너">사이드 배너</option>
				<option value="이미지슬라이드">이미지 슬라이드</option>
			</select>
			<br>
			<br>
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>배너 번호</th>
						<th>분류</th>
						<th>배너 제목</th>
						<th>배너 상태</th>
						<th>배너 이미지</th>
						<th>배너 링크</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>


