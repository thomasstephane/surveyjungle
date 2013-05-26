$(document).ready(function() {

  $('form[name="signin"]').on('submit', function(e) {
    e.preventDefault();
    $('#signin span').remove();
    console.log($(this).serialize());
    $.ajax({
      type: 'post',
      url: '/signin',
      data: $(this).serialize()
    }).done(function(data) {
      if (data.msg === "logged in!") {
        $('#signin').html("<div id='logout'><a href='/logout'>Logout</a></div>");
      } else {
        $('#signin').append("<span>" + data.msg + "</span>");
      }
    });
  });

  $('form[name="signup"]').on('submit', function(e) {
    e.preventDefault();
    $('#signup span').remove();
    console.log(this);
    $.ajax({
      type: 'post',
      url: '/signup',
      data: $(this).serialize()
    }).done(function(data) {
      if (data.msg === "Welcome in!") {
        $('#signin').html("<div id='logout'><a href='/logout'>Logout</a></div>");
        $('#signup').html("<div id='logout'><a href='/logout'>Logout</a></div>");
      } else {
        $('#signup').append("<span>" + data.msg + "</span>");
      }
    });
  });
});