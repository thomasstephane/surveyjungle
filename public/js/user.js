$(document).ready(function() {

  $('form[name="signin"]').on('submit', function(e) {
    e.preventDefault();
    console.log($(this).serialize());
    $.ajax({
      type: 'post',
      url: '/signin',
      data: $(this).serialize()
    }).done(function(data) {
      console.log(data);
    });
  });

  $('form[name="signup"]').on('submit', function(e) {
    e.preventDefault();
    console.log(this);
    $.ajax({
      type: 'post',
      url: '/signup',
      data: $(this).serialize()
    }).done(function(data) {
      console.log(data);
    });
  });
});
