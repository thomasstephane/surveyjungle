$(document).ready(function() {
  var choices = [];
  $('button[value="select"]').on('click', function(e){
    e.preventDefault();
    var context = this;
    choices.push($(context).attr('name'));
    $(context).parent().parent().toggle("slow", function() {
      var choice = $(context).parent().parent().parent().find('.answer');
      choice.append($(context).attr('label'));
      choice.toggle("slow");
    });
    console.log(choices);
  });
  $('button[value="survey"]').on('click', function(){
    var context = this;
    $.each(choices, function(index, choice) {
      $.ajax({
        type: 'post',
        url: ('/response/' + choice)
      });
    });
    $.ajax({
      type: 'post',
      url: ('/survey/' + context.name + '/participation')
    });
  });
});