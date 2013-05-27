function dotted(classname) {
  return '.' + classname;
}

function blacked(classname) {
  return classname + '-black';
}

function blackedDotted(classname) {
  return '.' + classname + '-black';
}


$(document).ready(function() {
  var classnames = ['create', 'take', 'visualize', 'share'];

  $('#welcome-text').delay(800).slideDown(1500);
  $('#answer-results').delay(800).slideDown(801);
  $('.survey_ask_choice').hide();
  $('.survey_ask_choice').delay(1600).slideDown('slow');
  $('.survey_display_question').delay(800).slideDown(801);
  $('.survey_display_choice').hide();
  $('.survey_display_choice').delay(1600).slideDown('slow');
  $('.survey-fields').delay(800).slideDown('slow');
  $('.new-mail').delay(800).slideDown('slow');
  $('.section').delay(1600).slideDown('slow');

  $.each(classnames, function(index, classname) {
    var others = classnames.slice();
    delete others[index];
    $.each(others, function(index, subclassname) {
      $(dotted(classname)).hover(function() {
        $(dotted(subclassname)).addClass(blacked(subclassname)).removeClass(subclassname);
      }, function() {
        $(blackedDotted(subclassname)).addClass(subclassname).removeClass(blacked(subclassname));
      });
    });
  });

  $('img[name="user"]').hover(function(){
    $('#signin').slideDown("slow");
    $('#signup').slideUp("slow");
  });

  $('.container').hover(function(){
    $('#signin').slideUp("slow");
    $('#signup').slideUp("slow");
    $('#signin span').slideUp("slow");
  });
  $('#signin p').on('click',function(){
    $('#signup').slideDown("slow");
    $('#signin').slideUp("slow");
  });

  $('#signup p').on('click',function(){
    $('#signin').slideDown("slow");
    $('#signup').slideUp("slow");
  });

  $(dotted(classnames[0])).on('click', function(){
   $(location).attr('href','/survey');
  });

  $(dotted(classnames[1])).on('click', function(){
   $(location).attr('href','/answer');
  });

  $(dotted(classnames[2])).on('click', function(){
   $(location).attr('href','/analyze');
  });

  $(dotted(classnames[3])).on('click', function(){
   $(location).attr('href','/share');
  });

});
