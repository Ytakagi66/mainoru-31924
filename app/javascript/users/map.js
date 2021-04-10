  let map;
  let marker = []; // マーカーを複数表示させたいので、配列化

  // コントローラーで定義したインスタンス変数を変数に代入
  let markerDataS = gon.shrines; 
  let markerDataT = gon.temples;
  let markerDataShrineFes = gon.markerDataShrineFes;

  // 座標の初期化
  function initMap() {
    geocoder = new google.maps.Geocoder()

    map = new google.maps.Map(document.getElementById('user_map'), {
      center: { lat: 38.1585, lng: 139.7486 }, 
      zoom: 5.8,
    });

    // 繰り返し処理で投稿した神社のマーカーを複数表示させる
    for (var i = 0; i < markerDataS.length; i++) {
      let id = markerDataS[i]['id']

      // 各地点の緯度経度を算出
      markerLatLng = new google.maps.LatLng({
        lat: markerDataS[i]['latitude'],
        lng: markerDataS[i]['longitude']
      });

      // 各地点のマーカーを作成
      marker[i] = new google.maps.Marker({
        position: markerLatLng,
        map: map
      });
    }

    // 投稿したお寺のマーカー情報
    for (var i = 0; i < markerDataT.length; i++) {
      let id = markerDataT[i]['id']

      // 各地点の緯度経度を算出
      markerLatLng = new google.maps.LatLng({
        lat: markerDataT[i]['latitude'],
        lng: markerDataT[i]['longitude']
      });

      // 各地点のマーカーを作成
      marker[i] = new google.maps.Marker({
        position: markerLatLng,
        map: map
      });
    }

    // 投稿したお寺のマーカー情報
    for (var i = 0; i < markerDataShrineFes.length; i++) {
      let id = markerDataShrineFes[i]['id']

      // 各地点の緯度経度を算出
      markerLatLng = new google.maps.LatLng({
        lat: markerDataShrineFes[i]['latitude'],
        lng: markerDataShrineFes[i]['longitude']
      });

      // 各地点のマーカーを作成
      marker[i] = new google.maps.Marker({
        position: markerLatLng,
        map: map
      });
    }
  }

window.addEventListener('load', initMap);