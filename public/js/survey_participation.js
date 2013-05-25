$(document).ready(function() {
  var choices = [];
  $('button[value="select"]').on('click', function(e){
    e.preventDefault();
    var context = this;
    choices.push($(context).attr('name'));
    $(context).parent().toggle("slow", function() {
      var choice = $(context).parent().parent().find('.answer');
      choice.append($(context).attr('label'));
      choice.toggle("slow");
    });
    console.log(choices);
  });
});