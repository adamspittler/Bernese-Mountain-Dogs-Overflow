$(document).ready(function(){
 $('#answer_button').click(function(event){
  event.preventDefault();
  $.ajax({
    url: $(event.target).attr('href'),
    method: 'get'
  })
  .done(function(response){
    $(event.target).hide();
    $('.answer_form').prepend(response);
  });
 });

 $('.answer_form').on("submit", "form", function(event) {
    event.preventDefault();
    $.ajax({
      method: 'post',
      url: '/answers',
      data: $(event.target).serialize()

    }).done(function(response){

    });
  });


});
