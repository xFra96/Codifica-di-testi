let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
})

lightbox.option({
    'alwaysShowNavOnTouchDevices': true
})

$(".zona").on("hover", function (e) {
    e.preventDefault();
    console.log(e);
});