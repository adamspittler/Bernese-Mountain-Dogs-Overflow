$(document).ready(function() {

  $('.upvote').on('click', function(event){
    event.preventDefault();


    $.ajax({
       method: 'GET',
       url: $(event.target).parent().attr('href')
     }).done(function(response){

      $(event.target).parent()
      debugger
    })

    //   var pointsPar = $(event.target).parent().next().next();
    //   pointsPar.children().first().remove();
    //   pointsPar.prepend(response);
    //   $(event.target).css("color", "red");
    // });
  });
});
