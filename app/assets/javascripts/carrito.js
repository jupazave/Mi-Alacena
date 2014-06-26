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
				bootbox.alert("Hubo un error, porfavor intentalo de nuevo.");
			};
		});
	});
});

$(document).ready(function () {
	$(".items").change(function () {
		var price = $(this).parent().closest('tr').data("price");
		var items = $(this).val();

		var total = price*items;

		//console.log(total);

		$(this).parent().parent().children("td.total").html("$<span>"+total+".00</span> MXN");

		var total_carrito = 0;

		$("tbody tr").each(function () {
			var precio_indivitual = $(this).data("price") * $(this).children("td").children("input").val();
			total_carrito += precio_indivitual;
		});



		$("div.total > strong").html("$"+total_carrito+".00 MXN");
	});
});

//actualizar el carrito

$(document).ready(function(){
	$("#actualizar").click(function () {
		var arry =  new Array();

		$("tbody tr").each(function () {
			var precio_individual = $(this).data("price");
			var cantidad_items = $(this).children("td").children("input").val();
			var id_producto = $(this).data("id");

			var objet = {
				"id": id_producto,
				"cantidad": cantidad_items
			}

			arry.push(objet);
		});

		console.log(arry);

		$.post("carrito/update", {productos: arry}, function (data) {
			if (data.status) {
				window.reload();
			}else{
				bootbox.alert("Hubo un error, porfavor intentalo de nuevo.");
			};
		});
	});
});

$(document).ready(function () {
	$("#continuar").click(function () {
		var arry =  new Array();

		$("tbody tr").each(function () {
			var precio_individual = $(this).data("price");
			var cantidad_items = $(this).children("td").children("input").val();
			var id_producto = $(this).data("id");

			var objet = {
				"id": id_producto,
				"cantidad": cantidad_items
			}

			arry.push(objet);
		});

		console.log(arry);

		$.post("carrito/update", {productos: arry}, function (data) {
			if (data.status) {
				window.location = "carrito/pago"
			}else{
				bootbox.alert("Hubo un error, porfavor intentalo de nuevo.");
			};
		});
	})
});