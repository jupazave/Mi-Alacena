$(document).ready(function(){

    $.get("/estados",function(data){

        if (data.length == 32) {

            var estados = data;

            $(estados).each(function (i, value) {

                $("#estados").append("<option value=\"" + value.id + "\">" + value.name + "</option>");

            });

            

            // $("#estados").val(31).trigger("change");

            /*

            $("#estados").change(function() {

                $("#productos").hide("fast");

                var id_estado = $( this ).val();

                $.post("api.php?rquest=getProductos",{estado : id_estado},function(data){
                            
                    if (data.status) {
                                
                        productos = data.data;

                        productos = {productos: productos};

                        $("#productos").html(myTemplateProducto(productos)).show("fast");

                        $(".product").click(function () {

                            if ($(this).hasClass( "yay" )) {

                                $(this).removeClass("yay");

                            }else{

                                $(this).addClass("yay");
                            };

                            if ($(".yay").length == 0) {

                                $("#pagar").attr("disabled","disabled");

                            }else{

                                $("#pagar").removeAttr("disabled");

                            }

                        });

                    }else{

                        $("#productos").html(myTemplateSinProducto).show("fast");

                    };

                });
                        
            }); // Check input( $( this ).val() ) for validity here

            */

            $("#estados").val(31).change(); //Auto Seleccion de yucatán

        };

    });

});