$(document).ready(function(){
  var addDiv = $('.addinput');
  var i = $('.addinput p').size() + 1;
  $('.addQuestion').on('click', function() {
    $('<div class="question_section"><span class="question_add"><p><li><input class="question" type="text" name="question_new_' + i +'" placeholder="Question" /><a href="#" class="remNew">Remove</a> </li><p></span><span class="choice_add"><p><input class="choice" type="text" name="choice_new" placeholder="Choice"><a href="#" class="addChoice">Add Choice</a></p></span></div>').appendTo(addDiv);
    i++;
  return false;
});

$(document).on("click", ".remNew", function(event){
event.preventDefault();
    console.log(this);
if( i > 2 ) {

$(this).parents('.question_section').remove();

console.log(this);
i--;
}
return false;
});
});

$(document).ready(function(){
  var addChoice = $('.choice_add');
  var i = $('.choice_add p').size() + 1;
  $('form').on('click', '.addChoice',function() {
    $('<p><input class="choice" type="text" name="choice_new_' + i +'" placeholder="Choice"><a href="#" class="remChoice">Remove</a></p>').appendTo($(this).parents('p'));
    i++;
  return false;
});

$(document).on("click", ".remChoice", function(event){
event.preventDefault();
    console.log(this);
if( i > 2 ) {
$(this).parents('p').remove();
console.log(this);
i--;
}
return false;
});
});
