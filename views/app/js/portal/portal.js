/**
 * Ajax action to api rest
*/
function Resetpass(){
  $.ajax({
    type : "POST",
    url : "api/resetpass",
    data : $('#resetpass_form').serialize(),
    success : function(json) {
      if(json.success == 1) {
        $.dialog({
          title: 'Reset Password',
          type: 'green',
          typeAnimated: true,
          content: json.message,
        });
        setTimeout(function(){
            location.reload();
        },1000);
      }else{
        $.dialog({
          title: 'Reset Password',
          type: 'orange',
          typeAnimated: true,
          content: json.message,
        });
      }
    },
    error : function(/*xhr, status*/) {
      $.dialog({
        title: 'Reset Password',
        type: 'red',
        typeAnimated: true,
        content: 'Ha ocurrido un problema.',
      });
    }
  });
}

/**
 * Events
 */
$('#reset_pass').click(function(e) {
  e.defaultPrevented;
  Resetpass();
});
$('#resetpass_form').keypress(function(e) {
    e.defaultPrevented;
    if(e.which == 13) {
        Resetpass();
        return false;
    }
});
