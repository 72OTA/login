/**
 * Ajax action to api rest
*/
function execute_accion_administracion(method,api_rest,formulario,accion,accion_redirect){
  switch(api_rest) {
    case "registra_nuevo_usuario":
      title='Registro de usuario';
      break;
    case "registra_nuevo_perfil":
      title='Registro de nuevo perfil';
      break;
    case "delete_perfil":
      title='Elimina Perfil';
      break;
    case "resetpass":
      title='Actualiza Password Usuario';
      break;
    case "update_usuario":
      title='Actualiza Usuario';
      break;
    case "update_peril_usuario":
      title='Actualiza Perfil Usuario';
      break;
  }
  $.ajax({
    type : method,
    url : 'api/'+api_rest,
    data : $('#'+ formulario).serialize(),
    success : function(json) {
      msg_box_alert(json.success,title,json.message,accion,accion_redirect);
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
  execute_accion_administracion("POST","registra_nuevo_usuario",'register_user_form','reload');
});
$('#register_user_form').keypress(function(e) {
    e.defaultPrevented;
    if(e.which == 13) {
        execute_accion_administracion("POST","registra_nuevo_usuario",'register_user_form','reload');
        return false;
    }
});
$('#update_user').click(function(e) {
  e.defaultPrevented;
  execute_accion_administracion("POST","update_usuario",'update_user_form','redirect','administracion/usuario');
});
$('#update_user_form').keypress(function(e) {
    e.defaultPrevented;
    if(e.which == 13) {
        execute_accion_administracion("POST","update_usuario",'update_user_form','redirect','administracion/usuario');
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
$('#reset_pass_user_form').keypress(function(e) {
    e.defaultPrevented;
    if(e.which == 13) {
        execute_accion_administracion("POST","resetpass",'reset_pass_user_form','reload')
        return false;
    }
});
$('#btn_reset_pass_user').click(function(e) {
  e.defaultPrevented;
  execute_accion_administracion("POST","resetpass",'reset_pass_user_form','reload')
});
$('#update_perfil_user').click(function(e) {
  e.defaultPrevented;
  execute_accion_administracion("POST","update_peril_usuario",'form_user_perfil','redirect','administracion/usuario')
});

//funciones varias
function carga_modal_reset_pass(id_user){
  $('#modal_reset_pass_user').modal('show');
  document.getElementById('id_user').value=id_user
}
function update_estado_user(estado_actual,id_user){
  $('#modal_reset_pass_user').modal('show');
  document.getElementById('id_user').value=id_user
}
