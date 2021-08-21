window.addEventListener('load', init);
let finicio;
function init() {
  
    establecer_FechaActual_Alquiler();
    establecer_FechaActual_Venta();

    $('#fecha_inicio').change(function (e) { 
         //guardar la fecha_inicio en una var global.
         finicio = $('#fecha_inicio').val();
         //establecer lim inferior fecha_fin de alquiler
         $('#fecha_fin').prop('min',finicio); 
         //establecer por defecto la misma fecha_fin q la fecha_inicio
         $('#fecha_fin').val(finicio);
    });

    document.getElementById('reserva').addEventListener('input',function(){
      //precio - reserva
      let totalsiniva = $('#precio').val() - this.value ;
      // +IVA
      let totalconiva= totalsiniva + (totalsiniva * ($('#iva').val()/100));
      //total
      $('#total').val(totalconiva);
    });
}

function establecer_FechaActual_Alquiler(){
  let fhoy = new Date();   

  //construir una cadena con el formato de un datetime
  let dia = ("0" + fhoy.getDate()).slice(-2);
  let mes = ("0" + (fhoy.getMonth() + 1)).slice(-2);
  let año = fhoy.getFullYear();
  let horas = ("0" + fhoy.getHours()).slice(-2);
  let minutos = ("0" + fhoy.getMinutes()).slice(-2);
  let segundos = ("0" + fhoy.getSeconds()).slice(-2);
  let custom = año + "-" + mes + "-" + dia + "T" + horas + ":" + minutos + ":" + segundos;

  //establecer la fecha hora actual
  $('#fecha_inicio').val(custom);
  //limite inferior para establecer la fecha_inicio de alquiler
  $('#fecha_inicio').prop('min',custom);

  //establecer por defecto la misma fecha_fin q la fecha_inicio
  $('#fecha_fin').val(custom);
  //limite inferior para establecer la fecha_fin de alquiler
  $('#fecha_fin').prop('min',custom);

}

function establecer_FechaActual_Venta(){
  let fhoy = new Date();   

  //construir una cadena con el formato de un datetime
  let dia = ("0" + fhoy.getDate()).slice(-2);
  let mes = ("0" + (fhoy.getMonth() + 1)).slice(-2);
  let año = fhoy.getFullYear();
  let horas = ("0" + fhoy.getHours()).slice(-2);
  let minutos = ("0" + fhoy.getMinutes()).slice(-2);
  let segundos = ("0" + fhoy.getSeconds()).slice(-2);
  let custom = año + "-" + mes + "-" + dia + "T" + horas + ":" + minutos + ":" + segundos;

  //establecer la fecha hora actual
  $('#fecha_venta').val(custom);
  //limite inferior para establecer la fecha_venta 
  $('#fecha_venta').prop('min',custom);

}