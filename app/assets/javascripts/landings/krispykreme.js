$(document).ready(function () {
	$("#pedido_surtidas").change(function (){

		if ($("#pedido_surtidas").val() > 0){

			$("#no_quiero").show();

		}else{

			$("#no_quiero").hide();
		}

	});

	$("#pedido_surtidas").change(function (){

		alert("1")

	});

// body...
})