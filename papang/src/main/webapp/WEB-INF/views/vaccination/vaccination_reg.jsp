<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial;
}

/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid rgb(249, 196, 94);
	background-color: rgb(249, 196, 94);
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: rgb(236 155 155 / 76%);
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: rgb(238, 140, 140);
}

/* Style the tab content */
.tabcontent {display: none;padding: 6px 12px;border: 5px solid rgb(249, 196, 94);border-top: none;border-radius: 0 0 8px 8px;
    text-align: center;}
li {margin:20px 0 10px 0;}
ul {margin: 10px 0 0 0;font-size: 16px;list-style: none;}
.tablinks{width: 50%;}
.Bigtitle {color: rgb(249, 196, 94);font-size: 35px;font-weight: bold;margin: 20px 0 0 0;}
p {
    margin-top: 50px;
    margin-bottom: 1rem;
    font-size: 22px;
}
</style>
</head>
<body>
    <div class="Bigtitle"> 예방접종 주의해주세요</div>
	<p>예방접종 주의사항 및 금기사항</p>

	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'before')">접종전
			주의사항</button>
		<button class="tablinks" onclick="openCity(event, 'after')">접종후
			주의사항</button>
	</div>

	<div id="before" class="tabcontent">
		<ul>
			<li>아이의 건강상태를 가장 잘 알고있는 사람이 데리고 옵니다.</li>
			<li>집에서 아이의 체온을 측정하고 열이 없는 것을 확인하고 방문합니다.</li>
			<li>보건수첩 또는 아기수첩을 지침하고 방문합니다.</li>
			<li>접종 전날 목욕을 시키고,깨끗한 옷을 입혀서 데리고 옵니다.</li>
			<li>가능하면 예방접종을 하지 않을 아이는 데리고 방문하지 않습니다.</li>
		</ul>
	</div>

	<div id="after" class="tabcontent">
		<ul>
			<li>접종후 20~30분간 접종기관에 머물러 아이의 상태를 관찰합니다.</li>
			<li>귀가후 적어도 3시간이상 주의 깊게 관찰합니다.</li>
			<li>접종당일과 다음날은 과격한 운동을 하지 않습니다.</li>
			<li>접종부위는 청결하게 합니다.</li>
			<li>접종후 최소 3일간은 특별한 관심을 가지고 관찰하며<br>
			    고열,경련이 있을 때에는 곧 의사진찰을 받도록 합니다.  
			</li>
			<li>접종부위에 발적,통증,부종이 생기면 찬 물수건을 대 줍니다.</li>
			<li>아이는 반드시 바로 눕혀 재웁니다.</li>
		</ul>
	</div>

	<script>
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}
	</script>

</body>
</html>
