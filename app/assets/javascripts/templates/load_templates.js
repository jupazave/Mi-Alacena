var myTemplateModal = "/template/modal";

var myTemplateProducto = "/template/productos";

var myTemplateSinProducto = "/template/sin-productos";

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

});
