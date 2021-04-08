let map;
  let marker = []; // マーカーを複数表示させたいので、配列化
  let markerData = gon.users; // コントローラーで定義したインスタンス変数を変数に代入

  function initMap() {
    geocoder = new google.maps.Geocoder()

    map = new google.maps.Map(document.getElementById('map'), {
      center: { lat: 35.6585, lng: 139.7486 }, // 東京タワーを中心に表示させている
      zoom: 12,
    });

    // 繰り返し処理でマーカーと吹き出しを複数表示させる
    for (var i = 0; i < markerData.length; i++) {
      let id = markerData[i]['id']

      // 各地点の緯度経度を算出
      markerLatLng = new google.maps.LatLng({
        lat: markerData[i]['latitude'],
        lng: markerData[i]['longitude']
      });

      // 各地点のマーカーを作成
      marker[i] = new google.maps.Marker({
        position: markerLatLng,
        map: map
      });

      // 各地点の吹き出しを作成
      infoWindow[i] = new google.maps.InfoWindow({
        // 吹き出しの内容
        content: markerData[i]['address']
      });

      // マーカーにクリックイベントを追加
      markerEvent(i);
    }
  }

window.addEventListener('load', initMap);