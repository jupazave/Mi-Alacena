var test;

$(document).ready(function(){

    $("#pagar").click(function () {

        $.get("click", function() {});

        var pagar = $(this);

        pagar.attr("data-loading-text","Cargando...").button('loading');

        var total=0;

        var productosTemplate = new Array;

        $(".yay").each(function (index, value){

            var titulo = $(value).data("nombre");
            var id = $(value).data("id");
            var precio = parseInt($(value).data("precio"));

            productosTemplate.push({titulo: titulo, id: id, precio: precio});

            total += precio;

        });

        total += 160; // se añade precio de envio

        var context = {productos: productosTemplate, total: total};

        bootbox.dialog({

            message: myTemplateModal(context),

            title: "Confirma tu pedido de compra:",

            onEscape: function() {bootbox.hideAll()},

            buttons: {

                main: {

                    label: "¡Mare, Lo quiero!",

                    className: "btn-success my-btn",

                    callback: function() {

                        var btnModal = $(".my-btn");

                        $(btnModal).attr("data-loading-text","Cargando...");

                        btnModal.button('loading');

                        productos = new Array();

                        $(".fila.row").each(function (index, value){

                            select_item = $(value).children("div").children("select");

                            id = $(select_item).attr("id").split("cantidad_")[1];

                            cantidad = $(select_item).val();

                            productos.push( {id: id, cantidad: cantidad} );

                        });

                        var sendArray = 
                            {name: $("#name").val(), 
                            email: $("#email").val(), 
                            productos: productos 
                        };

                        console.log(sendArray);

                        test = sendArray;

                        $.post("pedido", sendArray, function(data){

                            console.log(data);

                            if (!data.status) {

                                // console.log(data.errores);

                                if(data.errores.indexOf("name") != -1) { 

                                    $("#name").closest(".form-group").addClass("has-error");

                                } else{

                                    $("#name").closest(".form-group").removeClass("has-error");

                                }

                                if(data.errores.indexOf("email") != -1) { 

                                    $("#email").closest(".form-group").addClass("has-error");

                                } else{

                                    $("#email").closest(".form-group").removeClass("has-error");

                                }

                                if(data.errores.indexOf("mail") != -1) { 

                                    alert("Hubo un error al enviar tu pedido, porfavor intentalo de nuevo.");

                                }

                                btnModal.button("reset");

                                return false;


                            }else{

                                btnModal.button("reset");

                                bootbox.hideAll();

                                window.location.href = './gracias.html';

                            };


                        });

                        return false;
                    }
                },
            }
        });

        

        $(".items-producto").change(function () {

            id = $(this).attr("id").split("cantidad_")[1];

            precio = $("*[data-id="+ id +"]").data("precio");

            precio = parseInt($(this).val()) * parseInt(precio);

            $("#precio_"+ id + " span").html("$"+precio+"MXN");

            total = 0;

            $(".precio-list").each(function (index, value){
                total += parseInt($(value).html().split("$")[1].split("MXN")[0]);
            });

            total += 160;

            $(".total").html("Total: $" + total + "MXN");

        });

        pagar.button('reset');

    }); 

}); 