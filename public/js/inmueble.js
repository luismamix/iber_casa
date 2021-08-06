window.addEventListener('load', init);

function init() {

    //crear el campo "porcentaje construido"
    $( "#status2" ).change(function() {
       if ($("#status2").val() == 3){
           let porcentaje= " <label class='col-sm-4 col-form-label' for='rutaimagen'>% Construido</label>" +
           "<div class='col-sm-8'>" +
           "<input type='number' class='form-control form-control-md' name='porcentajeconstruido' placeholder='% construido' min='1' max='100' step='0.01' required>" +    
           "</div>";
           $('#div_porcentaje_construido').html(porcentaje);
       } else{
            $('#div_porcentaje_construido').html("");
       }
      });

    //cambiar el texto del label y place holder (alquiler / precio) dependiendo de si seleccionas comercializacion (alquiler / venta).
    $("#comercializacion").change(function (e) { 
        if(this.value == 1){
            $('#label_precio').text('Importe');
            $('#precio').attr('placeholder', 'Importe');
        }else if(this.value == 2){
            $('#label_precio').text('Precio');
            $('#precio').attr('placeholder', 'Precio');
        }
        
    });

    //detectar cuando se selecciona algun archivo y mostrar l num de archivos seleccionados.
    $("input[type=file]").on('change',function(){
        if(this.files.length == 1){
            $('#nfiles').html(this.files.length + " archivo.");
        }else if(this.files.length > 1){
            $('#nfiles').html(this.files.length + " archivos.");
        }else{
            $('#nfiles').html("Ningún archivo seleccionado.");
        }
    });
}