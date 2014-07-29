var paypal_image, compropago_image;

$(document).ready(function(){

	paypal_image = $("#paypal_image").attr("src");

	compropago_image = $("#compropago_image").attr("src");

	$("[data-payment]").click(function (e) {
		e.preventDefault();

		bootbox.dialog({
			message: '<div class="row"><div class="col-md-6"><a href="'+ $(this).data("compropago") +'" id="compropago"><img src="' + compropago_image + '" alt="Compro Pago" class="img-responsive img-center"></a></div><div class="col-md-6"><a href="'+ $(this).data("paypal") +'" id="paypal"><img src="' + paypal_image +'" alt="Paypal" class="img-responsive img-center"></a></div></div>',
			title: "ELIGE TU FORMA DE PAGO:"
		});

		return false;

	});


});