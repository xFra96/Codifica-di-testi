let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})

const setVisible = (elementOrSelector, visible) =>
  (typeof elementOrSelector === 'string'
    ? document.querySelector(elementOrSelector)
    : elementOrSelector
  ).style.display = visible ? 'block' : 'none';

document.addEventListener('DOMContentLoaded', () => {
  const togglers = document.querySelectorAll('.toggler')
  for (let i = 0; i < togglers.length; i++) {
    togglers[i].addEventListener("click", function () {
      let divtoshow = togglers[i].attributes.getNamedItem("data-section").value
      setVisible('#cart17', false);
      //setVisible('#cart18', false);
      //setVisible('#cart39', false);
      //setVisible('#home', false);
      setVisible('#' + divtoshow, true);
    });
  }
});