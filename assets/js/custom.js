let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})

const wait = (delay = 0) =>
  new Promise(resolve => setTimeout(resolve, delay));

const setVisible = (elementOrSelector, visible) =>
  (typeof elementOrSelector === 'string'
    ? document.querySelector(elementOrSelector)
    : elementOrSelector
  ).style.display = visible ? 'block' : 'none';
setVisible('.page', false);
setVisible('#loading', true);

document.addEventListener('DOMContentLoaded', () => {
  wait(300).then(() => {
    setVisible('.page', true);
    setVisible('#loading', false);
  })
  const togglers = document.querySelectorAll('.toggler')
  for (let i = 0; i < togglers.length; i++) {
    togglers[i].addEventListener("click", function () {
      let divtoshow = togglers[i].attributes.getNamedItem("data-section").value
      setVisible('#cart17', false);
      setVisible('#cart18', false);
      setVisible('#cart39', false);
      setVisible('#home', false);
      setVisible('#' + divtoshow, true);
    });
  }
});