<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/active/css/cookList.css"/>
<style>
td{width: 90px; height:70px; border:1px solid black;text-align: center;font-size: 12px;}
.vacc_table{display: inline;}
.content{margin: 10px 0 0 0;}
th{background-color: rgb(249, 196, 94);border :1px solid black;font-size: 12px;}
.vacc_title {background-color: rgb(249, 196, 94);}
.vacc_prev{background-color: #f9c0c0;}
.vacc_prev:hover{background-color:#ec5858;transition-duration: 1s;}
.ex_div {width: 16px;height: 16px;;display: inline-block;margin: 0 12px 0 0;border-radius: 4px;}
.prev{background-color: #f9c0c0}
.reg{background-color:#98d6ea;}
.control-label {width: 70px;}
.form-control {width: 470px;}
#message-text {height: 150px;}
.modal-footer {display: block;}
.btn-primary {background-color: rgb(249, 196, 94);border: none;width: 80px;}
.btn-primary:hover {color: #fff;background-color: rgb(238, 140, 140);}
.btn-primary:focus {color: #fff; background-color: rgb(249, 196, 94);border:rgb(249, 196, 94);}
.btn-primary:not(:disabled):not(.disabled):active {color: #fff;background-color:  rgb(249, 196, 94);border: rgb(249, 196, 94);box-shadow: none;} 
.btn-default{background-color: #EDEDED;width: 80px;}
.modal-header{background-color: rgb(249, 196, 94);display: block;height: 60px;}
.modal-title {display: inline;margin: 0 0 0 150px;}
.modal-header .close {padding: 0; margin: 0; }
.modal {top: 160px;}
.Bigtitle {margin: 20px 0 40px -2px;}
.ex{display: block;margin-top: 20px;}
.select, .age {
    display: inline-block;
    height: 40px;
    width: 110px;
    margin: 0 20px 0 0;
    font-size: 16px;
}
.select {border-radius: 8px;border: 3px solid rgb(249, 196, 94);background-color: rgb(249, 196, 94);}
</style>
<script src="../resources/json.min.js"></script>
<script type="text/javascript" >
	$(function(){
		childList();
		
		init();
	});
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click',function(){
			$('#form1').each(function(){
				this.reset();
			});
		});
	}//init
	

	
	//사용자 조회 요청
	function userSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var userId = $(this).closest('tr').find('#hidden_userId').val();
			//특정 사용자 조회
			$.ajax({
				url:'users/'+userId,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:userSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	
	//사용자 조회 응답
	function userSelectResult(user) {
		$('input:text[name="id"]').val(user.id);
		$('input:text[name="name"]').val(user.name);
		$('input:text[name="password"]').val(user.password);
		$('select[name="role"]').val(user.role).attr("selected", "selected");
	}//userSelectResult
	


	//사용자 목록 조회 요청
	function childList() {
		$.ajax({
			url:'../child',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			data: {mbr_id : 'father1'},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:childListResult
		});
	}//userList
	
	//사용자 목록 조회 응답
	function childListResult(data) {
		
		$.each(data,function(idx,item){
			console.log(item);
			$('#child')
			.append($("<option class='selectOpt' value= '"+item.chi_no+"'>"+item.chi_name+"</option>"));
			
		});//each
		
		$('#child').on('change',function(){
			console.log($('#child').val());
			}); 
	}//userListResult
	
</script>
<script>
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) 
	  var recipient = button.data('whatever') 
	  modal.find('.modal-title').text('예방접종 일지 등록 to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
	
	$(() => {
		
	/* console.log($('#BCG_1차').text()); */
	
	$('td').on('click',function(){
		console.log($(this));
		console.log('====');
		console.log($(this).attr('id'))
		 var $in = $(this).attr('id');
		$('#inTitle').attr('value',$in) 
		
	})
	
	});
	
	
/* 	$( document ).ready( function() {
  $( '.vacc_prev' ).click( function() {
    $( this ).toggleClass( 'reg' );
  } );
} ); */
</script>
</head>
<body>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
	<form action="" method="post">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	       <h4 class="modal-title" id="exampleModalLabel">예방접종 일지 등록</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	        <form>
	        <div class="form-group">
	            <label for="recipient-name" class="control-label">접종명</label>
	            <input id="inTitle" type="text" class="form-control" id="recipient-title" value="">
	          </div>
	          <div class="form-group">
	            <label for="recipient-name" class="control-label">접종일</label>
	            <input type="date" class="form-control" id="recipient-name">
	          </div>
	          <div class="form-group">
	            <label for="message-text" class="control-label">예방일지</label>
	            <textarea class="form-control" id="message-text"></textarea>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer" align="center">
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary">등록하기</button>
	      </div>
	    </div>
	  </div>
	  </form>
	</div>
	
	<div class="Bigtitle"> 예방접종</div>
	<select class="select" id='child'>
	
	</select>
		 <p class="age">만{DBVALUE}살</p>
		 <div class="ex">
			 <div class="ex_div prev"></div>작성 가능
			 <div class="ex_div reg"></div>작성 완료
		 </div>
		 <div class="content">
			 <table class="vacc_table">
			 <tbody>
			 	<tr>
			 		<td class="vacc_title">대상감염병</td>
			 		<td class="vacc_title">백신 종류 및 방법</td>
			 		<th>0 개월</th>
			 		<th>1 개월</th>
			 		<th>2 개월</th>
			 		<th>4 개월</th>
			 		<th>6 개월</th>
			 		<th>12 개월</th>
			 		<th>15 개월</th>
			 		<th>18 개월</th>
			 		<th>24 개월</th>
			 		<th>36 개월</th>
			 		<th>만 4세</th>
			 		<th>만 6세</th>
			 		<th>만 11세</th>
			 		<th>만 12세</th>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">결핵</td>
			 		<td class="vacc_title">BCG(피내용)</td>
			 		<td class="vacc_prev" id="BCG_1차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1회 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">B형간염</td>
			 		<td class="vacc_title">Hepβ(유전자재조합)</td>
			 		<td class="vacc_prev" id="Hepβ_1차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" >1차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="Hepβ_2차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="Hepβ_3차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">3차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td  class="vacc_title" rowspan="2" >디프테리아ㆍ파상풍ㆍ백일해</td>
			 		<td class="vacc_title">DTaP</td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="DTaP_1차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="DTaP_2차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="DTaP_3차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">3차 {DBVALUE}</td>
			 		<td></td>
			 		<td class="vacc_prev" id="DTaP_추가4차" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">추가 4차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="DTaP_추가5차" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">추가 5차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">Tdap</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="Tdap_추가6차" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">추 6차 {DBVALUE}</td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">폴리오</td>
			 		<td class="vacc_title">IPV</td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="IPV_1차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="IPV_2차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="IPV_3차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">3차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="IPV_추가4차" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">추 4차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">b형헤모필루스 인플루엔자</td>
			 		<td class="vacc_title">Hib</td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="Hib_1차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="Hib_2차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="Hib_3차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">3차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="Hib_추가4차" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">추 4차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title" rowspan="2">폐렴구균</td>
			 		<td class="vacc_title">PCV</td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="PCV_1차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="PCV_2차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="PCV_3차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">3차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="PCV_추가4차" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">추 4차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">PPSV</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="PPSV_고위험군에_한하여_접종" colspan="6" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> 고위험군에 한하여 접종 {DBVALUE}</td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">홍역ㆍ유행성이하선염ㆍ풍진</td>
			 		<td class="vacc_title">MMR</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="MMR_1차" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="MMR_2차" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">수두</td>
			 		<td class="vacc_title">VAR</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="VAR_1회" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1회 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">A형간염</td>
			 		<td class="vacc_title">HepA</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="HepA_1회" colspan="3" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1회 {DBVALUE}</td>
			 		<td class="vacc_prev" id="HepA_2차" colspan="2" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 1차접종 6개월 후</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title" rowspan="2">일본뇌염</td>
			 		<td class="vacc_title">IJEV(불활성화 백신)	</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="IJEV_1차" colspan="4" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="IJEV_3차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> 3차 1차 접종 후 12개월 후</td>
			 		<td></td>
			 		<td class="vacc_prev" id="IJEV_추가4차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">추 4차{DBVALUE}</td>
			 		<td></td>
			 		<td class="vacc_prev" id="IJEV_추가5차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">추 5차{DBVALUE}</td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">LJEV(햄스터 신장세포 유래 약독화 생백신)</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="LJEV_1차" colspan="4" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1차{DBVALUE}</td>
			 		<td class="vacc_prev" id="LJEV_2차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 1차 접종 후 12개월 후</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">사람유두종바이러스 감염증</td>
			 		<td class="vacc_title">HPV</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="HPV_1_2차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1~2차 {DBVALUE}</td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title">인플루엔자</td>
			 		<td class="vacc_title">IIV</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="IIV_우선접종권자" colspan="7" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">우선접종권장 대상자{DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	<tr>
			 		<td class="vacc_title" rowspan="2">로타바이러스 감염증</td>
			 		<td class="vacc_title">RV1</td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="RV1_1차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1차 {DBVALUE}</td>
			 		<td class="vacc_prev" id ="RV1_2차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 		<tr>
			 		<td class="vacc_title">RV5</td>
			 		<td></td>
			 		<td></td>
			 		<td class="vacc_prev" id="RV5_1차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">1차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="RV5_2차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">2차 {DBVALUE}</td>
			 		<td class="vacc_prev" id="RV5_3차" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">3차 {DBVALUE}</td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 	</tbody>
			 </table>
		 </div>
</body>
</html>