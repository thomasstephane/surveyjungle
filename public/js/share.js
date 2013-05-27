$(document).ready(function(){

  
  var addMail = $('.section-share');


  $('.add-email').on('click', function() {
    var newMail = $('<div class="new-mail"><img src="../images/share.jpg"><input class="email-share" type="text" name="survey[emails][]"  placeholder="Email"><a href="#" class="remMail">Remove</a></div>').hide();
    newMail.appendTo(addMail).slideDown("slow");
  });

  $(document).on("click", ".remMail", function(event){
    event.preventDefault();
    console.log(this);

    $(this).parent().remove();
  });
});

