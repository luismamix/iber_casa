window.addEventListener('load', init);

function init() {
    //crear el campo porcentaje construido 
    $( "#status2" ).change(function() {
       if ($("#status2").val() == 3){
           let porcentaje= " <label class='col-sm-4 col-form-label' for='rutaimagen'>Porcentaje Construido</label>" +
           "<div class='col-sm-8'>" +
           "<input type='number' class='form-control form-control-md' name='porcentajeconstruido' placeholder='Porcentaje construido' min='1' max='100' step='0.01' required>" +    
           "</div>";
           $('#div_porcentaje_construido').html(porcentaje);
       } else{
            $('#div_porcentaje_construido').html("");
       }
      });
}