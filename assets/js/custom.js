let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})

const setVisible = (elementOrSelector, visible) =>
  (typeof elementOrSelector === 'string'
    ? document.querySelector(elementOrSelector)
    : elementOrSelector
  ).style.display = visible ? 'block' : 'none';

$(document).ready(function () {
  $("#toTop").on('click', function (event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function () {

        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if

  });
  const togglers = document.querySelectorAll('.toggler')

  for (let i = 0; i < togglers.length; i++) {
    togglers[i].addEventListener("click", function () {
      let divtoshow = togglers[i].attributes.getNamedItem("data-section").value
      setVisible('#cart17', false);
      setVisible('#cart18', false);
      setVisible('#cart39', false);
      setVisible('#' + divtoshow, true);
    });
  };
});

$(document).scroll(function () {
  var y = $(this).scrollTop();
  if (y > 300) {
    $('#toTop').fadeIn();
  } else {
    $('#toTop').fadeOut();
  }
});