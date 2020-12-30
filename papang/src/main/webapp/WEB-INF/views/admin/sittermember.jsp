<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/json.min.js"></script>

<script type="text/javascript">
	$(function() {
		memberList();
		memberSelect();
		//nqDelete();
		//nqUpdate();
		memberUpdate();
		$("#filter").on('change', function() {
			memberList();
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

								$('#img').attr('src', e.target.result).attr(
										'style', 'width:50%');

							}
							reader.readAsDataURL(f);
						} else {
							$('#img').attr('src', e.target.result).attr(
									'style', 'width:50%');
						}
					});//arr.forEach
		}

	});

	//사용자 조회 요청
	function memberSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var id = $(this).parent().parent().children().eq(0).html();;
			console.log(id);
			//특정 사용자 조회
			$.ajax({
				url : '../sitter/' + id,
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : SitterSelectResult
			});
		}); //조회 버튼 클릭
	}//nqSelect
	function SitterSelectResult(sitter) {
		console.log(sitter);
		$('#img').attr('src','${pageContext.request.contextPath}/images/'+sitter.sit_pic);
		$('#sit_mbr_id').val(sitter.sit_mbr_id);
	    $('#la').html(sitter.sit_pic);sit_off
		$('#sit_payday').val(sitter.sit_payday);
	    $('#sit_off').val(sitter.sit_off);
		$('#sit_pay').val(sitter.sit_pay);
		$('select:text[name="sit_loc"]').val(sitter.sit_loc).prop(
				"selected", true);
		$('#sit_note').val(sitter.sit_note);
	
	}
	//사용자 삭제 요청
	function nqDelete() {
		//삭제 버튼 클릭
		$('body').on('click', '#btnDelete', function() {
			var nq_no = $(this).closest('tr').find('#hidden_nq_no').val();
			var result = confirm(nq_no + " 번 글을 정말로 삭제하시겠습니까?");
			if (result) {
				$.ajax({
					url : '../nq/' + nq_no,
					type : 'DELETE',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					error : function(xhr, status, msg) {
						console.log("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(xhr) {
						console.log(xhr.result);
						nqList();
						$('#form1').each(function() {
							alert("삭제되었습니다");
							this.reset();
							$('.note-editable').html("");
							$('#la').html("선택한 파일 없음");
						});
					}
				});
			}//if
		}); //삭제 버튼 클릭
	}//nqDelete

	//사용자 목록 조회 요청
	function memberList() {
		var filter = $("#filter").val()
		$.ajax({
			url : '../member',
			type : 'GET',
			//contentType:'application/json;charset=utf-8',
			dataType : 'json',
			data : {
				mbr_author : filter
			},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : memberListResult
		});
	}//userList

	//사용자 목록 조회 응답
	function memberListResult(data) {

		$("#dataTable tbody").empty();
		$
				.each(
						data,
						function(idx, item) {
							if (item.mbr_author == '시터') {
								$('<tr>')
										.append($('<td>').html(item.mbr_id))
										.append($('<td>').html(item.mbr_name))
										.append($('<td>').html(item.mbr_nick))
										.append(
												$('<td>')
														.html(
																"<select class='author' id='author"+item.mbr_id+"'><option value='시터'>시터</option><option  value='회원'>회원</option></select>"))
										.append($('<td>').html(item.mbr_phone))
										.append($('<td>').html(item.mbr_status))
										.append($('<td>').html(item.rcnt))
										.append(
												$("<td>")
														.html(
																'<button id=\'btnSelect\'>수정</button> <button id=\'btnDelete\'>탈퇴</button>'))
										.appendTo('#dataTable tbody');
							} else {
								$('<tr>')
										.append($('<td>').html(item.mbr_id))
										.append($('<td>').html(item.mbr_name))
										.append($('<td>').html(item.mbr_nick))
										.append(
												$('<td>')
														.html(
																"<select class='author' id='author"+item.mbr_id+"'><option value='시터'>시터</option><option  value='회원'>회원</option></select>"))
										.append($('<td>').html(item.mbr_phone))
										.append($('<td>').html(item.mbr_status))
										.append($('<td>').html(item.rcnt))
										.append(
												$("<td>")
														.html(
																'<button id=\'btnDelete\'>탈퇴</button>'))
										.appendTo('#dataTable tbody');
							}
							$("#author" + item.mbr_id).val(item.mbr_author)
									.prop("selected", true);
						});

		$('#dataTable').DataTable();
	}//userListResult

	function memberUpdate() {
		//수정 버튼 클릭
		var id;
		$("body").on('change', '.author', function() {
			var author = $(".author").val();
			id = $(this).parent().parent().children().eq(0).html();
			$.ajax({
				url : "../member",
				type : 'PUT',
				dataType : 'json',
				data : JSON.stringify({
					mbr_id : id,
					mbr_author : author
				}),
				contentType : 'application/json',
				success : function(data) {

				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
			console.log(author);
			if (author == '시터') {

				$.ajax({
					url : "../sitter",
					type : 'POST',
					dataType : 'json',
					data : JSON.stringify({
						sit_mbr_id : id
					}),
					contentType : 'application/json',
					success : function(response) {
						if (response.result == true) {
							alert('시터로 권한이 변경 되었습니다.');
							memberList();
						}
					},
					error : function(xhr, status, message) {
						alert(" status: " + status + " er:" + message);
					}
				});
			} else {
				$.ajax({
					url : '../sitter/' + id,
					type : 'DELETE',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					error : function(xhr, status, msg) {
						console.log("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(xhr) {
						alert('회원으로 권한이 변경 되었습니다.');
						memberList();

					}
				});
			}

		});

	}//userUpdate
</script>
<h1 class="mt-4">시터/회원 관리</h1>
<br>
<div id="sitterForm" class="strongYellow" align="center">
	<table>
		<tr>
			<td>
				<table>
					<tr>
						<td><img id="img" class="sitterProfileImg" alt="시터이미지"
							src="${pageContext.request.contextPath}/resources/images/sitterProfile/profile1.jpg"></td>
					</tr>
					<tr>
						<td><input type="file" name="uploadFile" id="uf" />
							<div
								style="display: inline-block; position: relative; width: 300px; left: -210px; background: white;">
								<label id="la">선택한 파일 없음</label>
							</div></td>
				</table>
			</td>
			<td><table class="sitterInfoTable" align="center">
					<tr align="center">
						<td align="center">아&nbsp;이&nbsp;디:</td>
						<td align="left"><input type='text' name='sit_mbr_id'
							id='sit_mbr_id' readonly></td>
					</tr>
					<tr>
						<td align="center">월&nbsp;급&nbsp;일</td>
						<td align="left"><input type='text' name='sit_payday'
							id='sit_payday'></td>
					</tr>

					<tr>
						<td align="center">휴&nbsp;무&nbsp;일</td>
						<td align="left"><input type='text' name='sit_off'
							id='sit_off'></td>
					</tr>
					<tr>
						<td align="center">시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급:</td>
						<td align="left"><input type='text' name='sit_pay'
							id='sit_pay'></td>
					</tr>

					<tr>
						<td align="center">지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;역:</td>
						<td align="left"><select id="sit_loc" name="sit_loc"
							style="width: 100%">
								<option value='서울'>서울</option>
								<option value='부산'>부산</option>
								<option value='대구'>대구</option>
								<option value='인천'>인천</option>
								<option value='광주'>광주</option>
								<option value='대전'>대전</option>
								<option value='울산'>울산</option>
								<option value='강원'>강원</option>
								<option value='경기'>경기</option>
								<option value='경남'>경남</option>
								<option value='경북'>경북</option>
								<option value='전남'>전남</option>
								<option value='전북'>전북</option>
								<option value='제주'>제주</option>
								<option value='충남'>충남</option>
								<option value='충북'>충북</option>
						</select></td>
					</tr>
					<tr>
						<td>특이사항</td>
						<td><textarea id='sit_note' name= 'sit_note' rows="20" cols="20"
								style="width: 100%; height: 50px"></textarea></td>
					</tr>

				</table></td>
		</tr>
	</table>

	<br> <br>
</div>
</div>
<div align="left">
	분류 <select id='filter'>
		<option selected value=''>전체</option>
		<option value="시터">시터</option>
		<option value="회원">회원</option>
	</select>
</div>
<div align="center">

	<table class="table table-bordered" id="dataTable" cellspacing="0">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>권한</th>
				<th>휴대폰</th>
				<th>활동상태</th>
				<th>제재횟수</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
</div>

<script>
	//사용자 수정 요청
</script>