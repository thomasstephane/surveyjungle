
$(document).ready(function(){
  var addDiv = $('.addinput');


  $('.addQuestion').on('click', function() {
    $('<div class="question_section"><span class="question_add"><p><li><input class="question" type="text" name="questions[][question]" placeholder="Question" /><a href="#" class="remNew">Remove</a> </li></p></span><span class="choice_add"><p><input class="choice" type="text" name="questions[][choices][]" placeholder="Choice"><a href="#" class="addChoice">Add Choice</a></p></span></div>').appendTo(addDiv);
    i++;
    return false;
  });

  $(document).on("click", ".remNew", function(event){
    event.preventDefault();
    console.log(this);



    $(this).parents('.question_section').remove();

    console.log(this);

    return false;
  });
});

$(document).ready(function(){
  var addChoice = $('.choice_add');


  $('form').on('click', '.addChoice',function() {
    $('<p><input class="choice" type="text" name="questions[][choices][]" placeholder="Choice"><a href="#" class="remChoice">Remove</a></p>').appendTo($(this).parents('p'));

    return false;
  });

  $(document).on("click", ".remChoice", function(event){
    event.preventDefault();
    console.log(this);

    $(this).closest('p').remove();
    console.log(this);

    return false;

  });
});


