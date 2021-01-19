<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/resources/json.min.js"></script>

<script type="text/javascript">
	$(function() {
		memberList();
		memberSelect();
		//nqDelete();
		SitterDelete();
		sitterUpdate();
		memberUpdate();
		init();
		var sitoff;
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

								$('#img').attr('src', e.target.result);
								$('#img').attr('style',"width:300px; height: 350px");
							}
							reader.readAsDataURL(f);
						} else {
							$('#img').attr('src', e.target.result);
							$('#img').attr('style',"width:300px; height: 350px");
						}
					});//arr.forEach
		}

	});

	//사용자 조회 요청
	function memberSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var id = $(this).parent().parent().children().eq(0).html();
			;
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
		
		console.log(sitter.sit_loc);
		$('#img').attr('src',
				'${pageContext.request.contextPath}/resources/images/sitterProfile/' + sitter.sit_pic);
		$('#sit_mbr_id').val(sitter.sit_mbr_id);
		$('#la').html(sitter.sit_pic);
		$('#sit_payday').val(sitter.sit_payday);
		console.log(sitter.sit_off);
		if(sitter.sit_off != null && sitter.sit_off !=''){
			sitoff = sitter.sit_off;
			sitoff = sitoff.split(' ');
			$('[name="array"]').val(sitoff);
		}
		$('#sit_pay').val(sitter.sit_pay);
		$('#sit_loc').val(sitter.sit_loc).prop("selected", true);
		$('#sit_note').val(sitter.sit_note);
		$('#sit_age').val(sitter.sit_age);
		$('#img').attr('style',"width:300px; height: 350px");
		

	}
	//사용자 삭제 요청
	function SitterDelete() {
		var id;
		//삭제 버튼 클릭
		$('body').on('click', '#btnDelete', function() {
			id = $(this).parent().parent().children().eq(0).html();
			var result = confirm(id + "  정말로 탈퇴 하시겠습니까?");
			if (result) {
				$.ajax({
					url : "../memberdelete",
					type : 'PUT',
					dataType : 'json',
					data : JSON.stringify({
						mbr_id : id,
					}),
					contentType : 'application/json',
					success : function(data) {
						alert('탈퇴 되었습니다');
						memberList();
					},
					error : function(xhr, status, message) {
						alert(" status: " + status + " er:" + message);
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
							if (item.MBR_AUTHOR == '시터') {
								$('<tr>')
										.append($('<td>').html(item.MBR_ID))
										.append($('<td>').html(item.MBR_NAME))
										.append(
												$('<td>')
														.html(
																"<select class='author' id='author"+item.MBR_ID+"'><option value='시터'>시터</option><option  value='회원'>회원</option></select>"))
										.append($('<td>').html(item.MBR_PHONE))
										.append($('<td>').html(item.MBR_STATUS))
										.append($('<td>').html(item.RCNT)) 
										.append(
												$("<td>")
														.html(
																'<button id=\'btnSelect\'  class=\'buttonclass\' >조회</button> <button id=\'btnDelete\'  class=\'buttonclass\'>탈퇴</button>'))
										.appendTo('#dataTable tbody');
							} else {
								$('<tr>')
										.append($('<td>').html(item.MBR_ID))
										.append($('<td>').html(item.MBR_NAME))
										.append(
												$('<td>')
														.html(
																"<select class='author' id='author"+item.MBR_ID+"'><option value='시터'>시터</option><option  value='회원'>회원</option></select>"))
										.append($('<td>').html(item.MBR_PHONE))
										.append($('<td>').html(item.MBR_STATUS))
										.append($('<td>').html(item.RCNT))
										.append(
												$("<td>")
														.html(
																'<button id=\'btnDelete\' class=\'buttonclass\' >탈퇴</button>'))
										.appendTo('#dataTable tbody');
							}
							$("#author" + item.MBR_ID).val(item.MBR_AUTHOR)
									.prop("selected", true);
						});

		$('#dataTable').DataTable();
	}//userListResult

	function memberUpdate() {
		//수정 버튼 클릭
		var id;
		$("body").on('change', '.author', function() {
			var author = $(this).val();
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
			console.log($(this).val());
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
	
	//사용자 수정 요청
	function sitterUpdate() {
	//수정 버튼 클릭
	
	$('#btnUpdate').on('click',function(){
	var form = $('#form1')[0];
	var formData = new FormData(form);

	$.ajax({ 
	url: "../sitterUpdate", 
	dataType: 'json', 
	data: formData,
	method : 'post',
	contentType : false,
    processData : false,
	success: function(data) { 
	memberList();
	$('#form1').each(function() {
		this.reset();
		$('#la').html("선택한 파일 없음");
		alert("수정되었습니다");
		$('#img').attr('src','');
	});
	},
	error:function(xhr, status, message) { 
	alert(" status: "+status+" er:"+message);
	}
	});
	});//수정 버튼 클릭
	}//userUpdate
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click', function() {
			$('#form1').each(function() {
				this.reset();
				$('#la').html("선택한 파일 없음");
				alert("초기화되었습니다");
				$('#img').attr('src','');
			});
		});
	}//init
	
</script>
<h1 class="mt-4">시터/회원 관리</h1>
<br>
<form id="form1" class="form-horizontal">
<div id="sitterForm" class="strongYellow" align="center">
	
	<table border = '1px' style= 'width:50%'>
		<tr>
			<td width="50%">
				<table width="100%">
					<tr align="center">
						<td>
						<img id="img" class="sitterProfileImg" alt="시터이미지"
							src="${pageContext.request.contextPath}/resources/images/sitterProfile/defaultpic.png" style="width:300px; height: 350px"></td>
					</tr>
					<tr align="center">
						<td><input type="file" name="uploadFile2" id="uf" />
							<div
								style="display: inline-block; position: relative; width: 200px; left:40px; top:-24px; background: white;">
								<label id="la">선택한 파일 없음</label>
							</div></td>
							</tr>
				</table>
			</td>
			<td><table class="sitterInfoTable" align="center" border = 1px>
					<tr align="center">
						<td align="center">아&nbsp;이&nbsp;디:</td>
						<td align="left"><input type='text' name='sit_mbr_id'
							id='sit_mbr_id' readonly width="100%"></td>
					</tr>
					<tr align="center">
						<td align="center">나&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이:</td>
						<td align="left"><input type='text'
							id='sit_age' readonly width="100%"></td>
					</tr>
					<tr>
						<td align="center">월&nbsp;급&nbsp;일</td>
						<td align="left"><input type='text' name='sit_payday' readonly="readonly"
							id='sit_payday' width="100%"></td>
					</tr>

					<tr>
						<td align="center">휴&nbsp;무&nbsp;일</td>
						<td align="center">
						<input type="checkbox" class="payday" name="array" value="월">월   
						<input type="checkbox" class="payday" name="array" value="화">화   
						<input type="checkbox" class="payday" name="array" value="수">수   
						<input type="checkbox" class="payday" name="array" value="목">목   
						<input type="checkbox" class="payday" name="array" value="금">금   
						</td>
					</tr>
					<tr>
						<td align="center">일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급:</td>
						<td align="left"><input type='text' name='sit_pay'
							id='sit_pay'>원</td>
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
						<td><textarea id='sit_note' name='sit_note' rows="20"
								cols="20" style="width: 100%; height: 50px"></textarea></td>
					</tr>
					
				</table></td>
		</tr>
		<tr>
		<td colspan="2" align="center">
		 <input type="button" class='buttonclass'
			value="수정" id="btnUpdate" /> <input type="button"
			class='buttonclass' value="초기화" id="btnInit" />
		</td>
		</tr>
	</table>
	</form>
	<br> <br>
</div>
</div>

<div align="center">
	<div class='card-header' align="left">
		<svg class="svg-inline--fa fa-table fa-w-16 mr-1" aria-hidden="true"
			focusable="false" data-prefix="fas" data-icon="table" role="img"
			xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
			data-fa-i2svg="">
			<path fill="currentColor"
				d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path></svg>
	분류 <select id='filter'>
		<option selected value=''>전체</option>
		<option value="시터">시터</option>
		<option value="회원">회원</option>
	</select>
	</div>
	<div class="card-body">
	<div class="table-responsive" border ='1px'>
	<table class="table table-bordered" id="dataTable" cellspacing="0">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
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
	</div>
</div>

<script>
	//사용자 수정 요청
</script>