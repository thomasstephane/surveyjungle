
$(document).ready(function(){

  var addDiv = $('#addinput');

  var i = $('#addinput p').size() + 1;

  $('#addNew').on('click', function() {
    $('<p><input id="question" type="text" name="p_new_' + i +'" value="" placeholder="I am New" /><a href="#" id="remNew">Remove</a> </p>').appendTo(addDiv);
    i++;

    
    });
});
