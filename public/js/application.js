$(document).ready(function() {

  $('#tweetform').on('submit', function(e) {
    e.preventDefault();
    $('#loader').show();
    console.log($(this));
    $.ajax({
      url: '/',
      method: 'POST',
      data: $(this).serialize()
    }).done(function(response) {
      // console.log(response);
      $('#loader').hide();
      $("#tweet_dropzone").html(response);
    });

  });

});
