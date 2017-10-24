/**
 * Ajax action to api rest
*/
function execute_accion_rrhh(method,api_rest,formulario,accion,accion_redirect){
  switch(api_rest) {
    case "registra_nuevo_trabajador":
      title='Registro de Trabajador';
      break;
  }
  $.ajax({
    type : method,
    url : 'api/'+api_rest,
    data : $('#'+ formulario).serialize(),
    success : function(json) {
      msg_box_alert(json.success,title,json.message,accion,accion_redirect);
    },
    error : function(xhr, status) {
      msg_box_alert(99,title,xhr.responseText);
    }
  });
}
$('#register_personal').click(function(e) {
  e.defaultPrevented;
  execute_accion_rrhh("POST","registra_nuevo_trabajador",'register_trabajador_form','reload');
});
$('#register_trabajador_form').keypress(function(e) {
    e.defaultPrevented;
    if(e.which == 13) {
        execute_accion_rrhh("POST","registra_nuevo_trabajador",'register_trabajador_form','reload');
        return false;
    }
});


//funciones varias
function cargar_datos_personal_de_iduser(){
  var formData = new FormData();
  formData.append('id_user',document.getElementById('id_user').value);

  $.ajax({
    type : 'POST',
    url : 'api/search_user',
    contentType:false,
    processData:false,
    data : formData,
    success : function(json) {
        if ( json.success == 1 ){
          document.getElementById('nombres').value = json.message.name;
          document.getElementById('fono').value = json.message.fono;
        }
        document.getElementById('rut').focus();
    },
    error : function(xhr, status) {
      msg_box_alert(99,title,xhr.responseText);
    }
  });
}
