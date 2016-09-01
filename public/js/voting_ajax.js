$(document).ready(function() {

  $('.upvote').on('click', function(event){
    event.preventDefault();

    $.ajax({
       method: 'GET',
       url: $(event.target).parent().attr('href')
     }).done(function(response){
      $($(event.target).parent().parent().next()).replaceWith('<div class="vote_count">'+response+'</div>');

    });
  });

  $('.downvote').on('click', function(event){
    event.preventDefault();

      // debugger
    $.ajax({
       method: 'GET',
       url: $(event.target).parent().attr('href')
     }).done(function(response){
    $($(event.target).parent().parent().prev()).replaceWith('<div class="vote_count">'+response+'</div>');
    });
  });
});
