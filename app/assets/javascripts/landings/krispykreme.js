
$(document).ready(function () {

	
	$("#pedido_glaseadas").change(function () {
		if (($("#pedido_glaseadas").val() == "0") && ($("#pedido_surtidas").val() == "0")) {
			console.log($("#pedido_glaseadas").val());
			console.log($("#pedido_surtidas").val());
			$("#pedido_form input[type=submit]").addClass("disabled");
		}else{
			$("#pedido_form input[type=submit]").removeClass("disabled");
		}
	});

	$("#pedido_surtidas").change(function () {
		if (($("#pedido_glaseadas").val() == "0") && ($("#pedido_surtidas").val() == "0")) {
			$("#pedido_form input[type=submit]").addClass("disabled");
		}else{
			$("#pedido_form input[type=submit]").removeClass("disabled");
		}

		if($("#pedido_surtidas").val() == "0"){
			$("#no_quiero").hide();
		}else{
			$("#no_quiero").show();
			

		}
	});


});