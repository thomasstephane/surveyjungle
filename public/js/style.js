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

  $('img[name="logo"]').hover(function(){
    $('#signin').slideDown("slow");
    $('#signup').slideUp("slow");
  });

  $('.container').hover(function(){
    $('#signin').slideUp("slow");
    $('#signup').slideUp("slow");
  });
  $('#signin p').on('click',function(){
    $('#signup').slideDown("slow");
    $('#signin').slideUp("slow");
  });

  $('#signup p').on('click',function(){
    $('#signin').slideDown("slow");
    $('#signup').slideUp("slow");
  });

  $('.visualize').on('click', function(){
    console.log("hi");
    $.ajax({
      type: 'get',
      url: '/survey'
    }).done(function(data) {
      $('html').toggle(function() {
        $(this).html();
      }, function() {
        $(this).html(data);
      });
    });
  });
});
