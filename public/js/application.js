$(document).ready(function(){
 $('#answer_button').click(function(event){
  event.preventDefault();
  $.ajax({
    url: $(event.target).attr('href'),
    method: 'get'
  })
  .done(function(response){
    $(event.target).hide();
    $('.comments').prepend(response);

  });
 });
});
