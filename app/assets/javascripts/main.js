var myTemplateModal = "template/modal-body.html";

var myTemplateProducto = "template/producto.html";

var myTemplateSinProducto = "template/sin-productos.html";

$(document).ready(function(){
    
    $.get(myTemplateProducto, function(template) {

        var source = template;

        myTemplateProducto = Handlebars.compile(source);

    });

    $.get(myTemplateModal, function(template) {

        var source = template;

        myTemplateModal = Handlebars.compile(source);

    });

    $.get(myTemplateSinProducto, function(template) {

        var source = template;

        myTemplateSinProducto = source;

    });



    if ($(".yay").length == 0) {

        $("#pagar").attr("disabled","disabled");

    }else{

        $("#pagar").removeAttr("disabled");

    }

});



$(function() {
    $('a[href*=#]:not([href=#]).ani-link').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') 
        || location.hostname == this.hostname) {

            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) +']');

            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 1000);

                return false;
            }
        }
    });
});