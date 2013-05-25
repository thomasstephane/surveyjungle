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
});
