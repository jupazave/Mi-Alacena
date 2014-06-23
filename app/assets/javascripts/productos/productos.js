function getProductos (id_estado) {
	$.post("productos/listado",{estado_id : parseInt( id_estado ) },function(data){

		if (data.length > 0) {

			$("#pedidos").show("fast");

			productos = {productos: data};

			console.log(productos);

			$("#productos").html(myTemplateProducto(productos)).show("fast");

			$(".product").click(function () {

				if ($(this).hasClass( "yay" )) {

					$(this).removeClass("yay");

				}else{

					$(this).addClass("yay");
				};

				if ($(".yay").length == 0) {

					$("#pagar, #pagar-fixed").attr("disabled","disabled");

				}else{

					$("#pagar, #pagar-fixed").removeAttr("disabled");

				}

			});

		}else{

			$("#pedidos").hide("fast");

			$("#productos").html(myTemplateSinProducto).show("fast");

		};

	});
}