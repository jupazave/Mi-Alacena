
$(document).ready(function () {

	$("#pedido_form").validate({
		rules: 
			'pedido_glaseadas' : {
        required: true,
        number : true
      }, 
      parent: {
      	required: function(element) {
        	return pedido_glaseadas < 0 ;
      	}
      } 
	});
	$("#pedido_glaseadas").change(function () {
		if (($("#pedido_glaseadas").val() == "0") && ($("#pedido_surtidas").val() == "0")) {
			console.log($("#pedido_glaseadas").val());
			console.log($("#pedido_surtidas").val());
			$("#pedido_donas").attr("disabled");
		}else{
			$("#pedido_donas").removeAttr( "disabled" );
		}
	});

	$("#pedido_surtidas").change(function () {
		if (($("#pedido_glaseadas").val() == "0") && ($("#pedido_surtidas").val() == "0")) {
			$("#pedido_donas").attr("disabled");
		}else{
			$("#pedido_donas").removeAttr( "disabled" );
		}
	});
});