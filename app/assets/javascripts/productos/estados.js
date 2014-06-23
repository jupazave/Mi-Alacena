$(document).ready(function(){

  $.get("productos/estados",function(data){

    if (data.length == 32) {
      var estados = data;
      $(estados).each(function (i, value) {
        $("#estados").append("<option value=\"" + value.id + "\">" + value.name + "</option>");
      });

      // $("#estados").val(31).trigger("change");
      
      $("#estados").change(function() {

        $("#productos").hide("fast");

        var id_estado = $( this ).val();

        getProductos(id_estado);
        
      }); // Check input( $( this ).val() ) for validity here

      $("#estados").val(31).change(); //Auto Seleccion de yucatán

    };

  });

});