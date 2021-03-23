
  var map;
  function initMap() {
    shrine = JSON.parse(document.getElementById('map').dataset.json);
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: shrine.latitude, lng: shrine.longitude},
      zoom: 19
    });
  }

window.addEventListener('load', initMap);