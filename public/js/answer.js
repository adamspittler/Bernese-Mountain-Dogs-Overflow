$(document).ready(function(){
 $('#answer_list').on("click",'.answer_edit',function(event){
  event.preventDefault();
  $.ajax({
    url: $(event.target).attr('href'),
    method: 'get'
  })
  .done(function(response){
    $(event.target).parent().next().next().append(response);
    $(event.target).hide();

  });
 });

 $('#answer_list').on("submit", ".answering_editing", function(event) {
    event.preventDefault();
    $.ajax({
      method: 'post',
      url: $(event.target).attr('action'),
      data: $(event.target).serialize()

    }).done(function(response){

      $(event.target).parent().parent().parent().parent().parent().replaceWith(response);
       $(event.target).hide();
    });
  });


 $('#answer_list').on("submit", ".delete-answer-form", function(event) {
    event.preventDefault();

    $.ajax({
      method: 'DELETE',
      url: $(event.target).attr('action')
    })
      .done(function(response) {
        $('#answer_list').find('#'+response).remove();
      });

  });
});
