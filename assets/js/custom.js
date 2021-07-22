let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
})

lightbox.option({
    'alwaysShowNavOnTouchDevices': true
})

$(document).ready(function () {

    var canvas = document.getElementById('canvas');
    var ctx = canvas.getContext('2d');
    
    ctx.beginPath();
    ctx.arc(70, 80, 10, 0, 2 * Math.PI, false);
    ctx.fill();
    ctx.addHitRegion({id: 'circle'});
    
    canvas.addEventListener('mousemove', function(event) {
      if (event.region) {
        alert('hit region: ' + event.region);
      }
    });
});