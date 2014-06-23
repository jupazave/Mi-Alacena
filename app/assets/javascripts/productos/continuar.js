$(document).ready(function () {
	$("#pagar-form").submit(function(event) {
		//event.preventDefault();
    var $form;
    $form = $(this);

		/* Previene hacer submit más de una vez */
    $form.find("button").prop("disabled", true);

    $form.find("button").html("Cargando...");

    enviarForm();
    
		/* Previene que la información de la forma sea enviada al servidor */
    return false;
  });
});

function enviarForm () {

	var $form;
  $form = $("#pagar-form");
  var productos = "";

  $(".yay").each(function() {
  	productos += $(this).data("id");
  	productos += ",";
  	
  });
  
	/* Proceso los paquetes seleccionados  */

  $form.append(
  	$("<input type=\"hidden\" name=\"productos\" />").val(productos.slice(0,-1))
  );

	/* and submit */
  $form.get(0).submit();
	
};

$(window).scroll(function () {

  if ($(".products").length == 0) {
    if (isScrolledIntoView("#pagar-form")) {

      $(".fixed-pagar").hide("slow");

    }else{
      $(".fixed-pagar").show("hide");

    };
  };
})