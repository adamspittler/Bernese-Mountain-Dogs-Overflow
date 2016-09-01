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
      $('#answer_list').append(response);
      $(event.target).hide();
    });
  });

  $('#comment_button').click(function(event){
    event.preventDefault();
      $.ajax({
        method: 'get',
        url: $(event.target).attr('href')
      })
      .done(function(response){
        $(event.target).hide();
        $('.comments').append(response);
    });
  });
  $('.comments').on('submit', 'form', function(event){
    event.preventDefault();
    $.ajax({
      method: 'post',
      url: $('.comments').children('form').attr('action'),
      data: $(event.target).serialize()
    })
    .done(function(response){
      $(event.target).hide();
      $('#question_comment_list').append(response);
    });
  });

  $('#answer_comment_button').click(function(event){
    event.preventDefault();
    $.ajax({
      method: 'get',
      url: $(event.target).attr('href')
    }).done(function(response){
      $(event.target).hide();
      $('#answer_comment_form_placeholder').append(response);
    });
  });

  $('#answer_comment_form_placeholder').on('submit', 'form', function(event){
      event.preventDefault();
      $.ajax({
        method: 'post',
        url: $('#answer_comment_form_placeholder').children('form').attr('action'),
        data: $(event.target).serialize()

      })
      .done(function(response){
        $(event.target).hide();
        $('#answer_comment_list').append(response);
      });
  });
});
