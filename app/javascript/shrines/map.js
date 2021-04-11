
  var map;
  var marker;
  function initMap() {
    shrine = JSON.parse(document.getElementById('map').dataset.json);
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: shrine.latitude, lng: shrine.longitude},
      zoom: 16.9,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      navigationControl: false
    });
    marker = new google.maps.Marker({ // マーカーの追加
      position: {lat: shrine.latitude, lng: shrine.longitude}, // マーカーを立てる位置を指定
      map: map // マーカーを立てる地図を指定
  });
}

window.addEventListener('load', initMap);