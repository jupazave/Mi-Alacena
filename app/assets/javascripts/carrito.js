$(document).ready(function(){
	$(".bote").click(function(event){
		event.preventDefault();
		var id = $(this).data("id");
		
		$row = $(this).parent().closest('tr');

		$.post("carrito/delete", {producto_id: id}, function (data) {

			console.log(data)
			if (data.status) {
				$row.hide("fast",function () {
					$row.remove();
				});
			}else{
				bootbox.alert("Hubo un error, porfavor intentalo de nuevo.")
			};
		});
	});
});

$(document).ready(function () {
	$(".item").change(function () {
		var price = $(this).parent().closest('tr').data("price");
		var items = $(this).val();

		var total = price*items;

		console.log(total);

		$(this).closest('.price').html("$"+total+" MXN");
	});
});