$(document).ready(function(){

            var modalmaker = bootbox;

            $("#pagar").click(function () {
                var some_html ="1";
                some_html += "";
                some_html += "";
                some_html += "";
                some_html += "";

                modalmaker.dialog({
                    message: "I am a custom dialog",
                    title: "Custom title",
                    buttons: {
                        success: {
                            label: "Success!",
                            className: "btn-success",
                            callback: function() {
                                Example.show("great success");
                            }
                        },
                    }

                });

            });



            $.post("http://localhost/freelanceL/Productos/api.php?rquest=getEstados",null,function(data){
                if (data.status) {
                    estados = data.data;
                    html = "";

                    $(estados).each(function (index , value) {
                        id = index +1;
                        html = html + "<option value=\"" + id + "\">" + value + "</option>";
                    });

                    $("#estados").html(html);

                    // $("#estados").val(31).trigger("change");

                    $("#estados").change(function() {

                        var id_estado = $( this ).val();

                        $.post("http://localhost/freelanceL/Productos/api.php?rquest=getProductos",{estado : id_estado},function(data){
                            if (data.status) {
                                productos = data.data;
                                html = "<div class=\"row\">";
                                primera = false;

                                $(productos).each(function (index , value) {

                                    if (index%3 == 0 && primera) {
                                        html = html + "</div>";
                                        html = html + "<div class=\"row\">";
                                    };
                                    id = index +1;



                                    html = html + "<div class=\"col-md-4 producto-a\" ><a href=\"#\"><div style=\"width:250px; height:250px\" class=\"item box effect img-thumbnail prod-imagen\"><img class=\"img-responsive\" src=\"" + value.imagen + "\"></div></a><h4 class=\"prod-tit\">" + value.nombre + "</h4><h5 class=\"prod-precio\">$" + value.precio + " MXN</h5>";

                                    primera = true;

                                    html = html + "</div>";
                                });

                                html = html + "</div>";

                                $("#productos").html(html);
                            }else{

                                $("#productos").html("<div class=\"row\">" + "<h3> No tenemos productos del estado que seleccionaste <span class=\"carita\"> :(</span></h3>" + "</div>");
                            };
                        });
                        // Check input( $( this ).val() ) for validity here
                    });
                
                    $("#estados").val(31).change(); //Auto Seleccion de yucatán
                };
            });

            

        });
