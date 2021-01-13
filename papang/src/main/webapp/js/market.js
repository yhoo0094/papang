$(function(){

	//페이지네이션 크기 조절
	$("#marketListBoard .custom-select").empty();
	$("#marketListBoard .custom-select").append("<option value='9'>9</option>");
	$("#marketListBoard .custom-select").trigger("change"); 
	$("#marketListBoard th:eq(0)").trigger("click");
	$("#usedBoardTable th:eq(0)").trigger("click");
	
});
