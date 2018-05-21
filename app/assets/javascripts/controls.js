  $('.close').on("click",function(){
    $('.modal').fadeOut();
    $('input').val('');
    $('textarea').val('');
  });

  $(".contact-form").on("ajax:success", function(e, data, status, xhr){
    show_modal(this);
  }).on("ajax:error", function(e, xhr, status, error){
    show_modal(this);
  });

  function show_modal(it){
    alert('show');
    $('#show_modal').submit();
  }   