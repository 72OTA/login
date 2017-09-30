/**
 * Ajax action to api rest
*/
function register(){
  $.ajax({
    type : "POST",
    url : "api/register",
    data : $('#register_form').serialize(),
    success : function(json) {
      if(json.success == 1) {
        $.dialog({
          title: 'Registro de usuario',
          type: 'green',
          typeAnimated: true,
          content: json.message,
        });
        setTimeout(function(){
            location.reload();
        },1000);
      }else{
        $.dialog({
          title: 'Registro de usuario',
          type: 'orange',
          typeAnimated: true,
          content: json.message,
        });
      }
    },
    error : function(/*xhr, status*/) {
      $.dialog({
        title: 'Registro de usuarios',
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
$('#register').click(function(e) {
  e.defaultPrevented;
  register();
});
$('#register_form').keypress(function(e) {
    e.defaultPrevented;
    if(e.which == 13) {
        register();
    }
});


function inserta_html(div_result,web_mostrar){
  var divResultado = document.getElementById(div_result);

  $.ajax({
        url: web_mostrar,
        type: 'POST',
        dataType: 'html',
        data: { },
    })
    .done (function(result){
        $('#' + divResultado).html(result)
    })
    .error(function(xhr, ajaxOptions, thrownError) {
        $('#'+ divResultado).html(xhr.responseText)
    })

}
