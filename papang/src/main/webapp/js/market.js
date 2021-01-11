$(function(){
	$("#marketTable .tableTh:eq(0)").trigger("click");
	$("#usedTable .tableTh:eq(0)").trigger("click");
	
	//페이지네이션 크기 조절
	$("#marketListBoard .custom-select").empty();
	$("#marketListBoard .custom-select").append("<option value='9'>9</option>");
	$("#marketListBoard .custom-select").trigger("change"); 
					

});
