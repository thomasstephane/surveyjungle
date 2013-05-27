$(document).ready(function(){

  
  var addDiv = $('.addinput');


  $('.addQuestion').on('click', function() {
    var newQuestion = $('<div class="question_section"><span class="question_add"><p><li><img src="../images/create.jpg"><input class="question" type="text" name="questions[][question]" placeholder="Question" /><a href="#" class="remNew">Remove</a> </li></p></span><span class="choice_add"><p><input class="choice" type="text" name="questions[][choices][]" placeholder="Choice"><a href="#" class="addChoice">Add Choice</a></p></span></div>').hide();
    newQuestion.appendTo(addDiv).slideDown("slow");
  });

  $(document).on("click", ".remNew", function(event){
    event.preventDefault();
    console.log(this);



    $(this).parents('.question_section').remove();

    console.log(this);
  });
  var addChoice = $('.choice_add');


  $('form').on('click', '.addChoice',function() {
    var newChoice = $('<p><input class="choice" type="text" name="questions[][choices][]" placeholder="Choice"><a href="#" class="remChoice">Remove</a></p>').hide();
    newChoice.appendTo($(this).parents('p')).slideDown("slow");
  });

  $(document).on("click", ".remChoice", function(event){
    event.preventDefault();
    console.log(this);

    $(this).closest('p').remove();
    console.log(this);

  });
});

