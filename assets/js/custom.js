let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})

$(document).ready(function () {
  $("#toTop").on('click', function (event) {
    if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function () {
        window.location.hash = hash;
      });
    }
  });

  $('.toggler').on("click", function () {
    $(".toggler").removeClass("active");
    $(this).addClass("active");
    $(".tei").hide();
    let divtoshow = $(this).data('section')
    $('#' + divtoshow).show();
  });
});

$(document).scroll(function () {
  var isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
  if (isMobile) {
    var y = $(this).scrollTop();
    if (y > 150) {
      $('#toTop').fadeIn();
    } else {
      $('#toTop').fadeOut();
    }
  }
});