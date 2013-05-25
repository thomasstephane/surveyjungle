$(document).ready(function(){

  var addDiv = $('#addinput');

  var i = $('#addinput p').size() + 1;

  $('#addQuestion').on('click', function() {
    $('<p><li><input id="question" type="text" name="question_new_' + i +'" value="" placeholder="Question" /><a href="#" id="remNew">Remove</a> </li><p>').appendTo(addDiv);
    i++;

  return false;

});

$(document).on("click", "#remNew", function(event){
event.preventDefault();
    console.log(this);
if( i > 2 ) {

$(this).parents('li').remove();
console.log(this);
i--;
}
return false;
});
});
