var map;
var marker;
var shrines = '<%= @shrines %>';

function initMap() {
  users_map = JSON.parse(document.getElementById('users_map').dataset.json);
  map = new google.maps.Map(document.getElementById('users_map'), {
    center: {lat: users_map.latitude, lng: users_map.longitude},
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    navigationControl: false
  });
  marker = new google.maps.Marker({ // マーカーの追加
    position: {lat: users_map.latitude, lng: users_map.longitude}, // マーカーを立てる位置を指定
    map: map // マーカーを立てる地図を指定
});
}

window.addEventListener('load', initMap);