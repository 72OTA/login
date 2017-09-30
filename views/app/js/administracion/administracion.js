/**
 * Ajax action to api rest
*/
function execute_accion_administracion(method,api_rest,formulario,accion){
  switch(api_rest) {
    case "registra_nuevo_usuario":
      title='Registro de usuario';
      break;
    case "registra_nuevo_perfil":
      title='Registro de usuario';
      break;
    case "delete_perfil":
      title='Elimina Perfil';
      break;
  }
  $.ajax({
    type : method,
    url : 'api/'+api_rest,
    data : $('#'+ formulario).serialize(),
    success : function(json) {
      msg_box_alert(json.success,title,json.message,accion);
    },
    error : function(/*xhr, status*/) {
      msg_box_alert(99,title,'Ha ocurrido un problema.');
    }
  });
}

/**
 * Events
 */
$('#register').click(function(e) {
  e.defaultPrevented;
  execute_accion_administracion("POST","registra_nuevo_usuario",'register_form','reload');
});
$('#register_form').keypress(function(e) {
    e.defaultPrevented;
    if(e.which == 13) {
        execute_accion_administracion("POST","registra_nuevo_usuario",'register_form','reload');
        return false;
    }
});
$('#btn_new_perfil').click(function(e) {
  e.defaultPrevented;
  execute_accion_administracion("POST","registra_nuevo_perfil",'new_perfil_form','reload');
});
$('#new_perfil_form').keypress(function(e) {
    e.defaultPrevented;
    if(e.which == 13) {
        execute_accion_administracion("POST","registra_nuevo_perfil",'new_perfil_form','reload');
        return false;
    }
});
$('#deleteperfil').click(function(e) {
  e.defaultPrevented;
  execute_accion_administracion("POST","delete_perfil",'form_select_perfil','reload')
});
