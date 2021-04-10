  let map;
  let marker = []; // マーカーを複数表示させたいので、配列化

  // コントローラーで定義したインスタンス変数を変数に代入
  let markerDataS = gon.shrines; 
  let markerDataT = gon.temples;
  let markerDataShrineFes = gon.shrine_festival;
  let markerDataShrineGos = gon.shrine_goshuin;
  let markerDataShrineBui = gon.shrine_build;
  let markerDataShrineHis = gon.shrine_history;
  let markerDataShrineNat = gon.shrine_nature;
  let markerDataTempleFes = gon.temple_festival;
  let markerDataTempleGos = gon.temple_goshuin;
  let markerDataTempleBui = gon.temple_build;

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

    // 祭りや神事についてコメント投稿をした神社のマーカー情報
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

     // 御朱印についてコメント投稿をした神社のマーカー情報
    for (var i = 0; i < markerDataShrineGos.length; i++) {
      let id = markerDataShrineGos[i]['id']

      // 各地点の緯度経度を算出
      markerLatLng = new google.maps.LatLng({
        lat: markerDataShrineGos[i]['latitude'],
        lng: markerDataShrineGos[i]['longitude']
      });

    // 各地点のマーカーを作成
      marker[i] = new google.maps.Marker({
        position: markerLatLng,
        map: map,
      });
    }

  // 建築についてコメント投稿をした神社のマーカー情報
  for (var i = 0; i < markerDataShrineBui.length; i++) {
    let id = markerDataShrineBui[i]['id']

    // 各地点の緯度経度を算出
    markerLatLng = new google.maps.LatLng({
      lat: markerDataShrineBui[i]['latitude'],
      lng: markerDataShrineBui[i]['longitude']
    });

    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });
  }

  // 歴史についてコメント投稿をした神社のマーカー情報
  for (var i = 0; i < markerDataShrineHis.length; i++) {
    let id = markerDataShrineHis[i]['id']
  
    // 各地点の緯度経度を算出
    markerLatLng = new google.maps.LatLng({
      lat: markerDataShrineHis[i]['latitude'],
      lng: markerDataShrineHis[i]['longitude']
    });
  
    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });
  }

  // 自然についてコメント投稿をした神社のマーカー情報
  for (var i = 0; i < markerDataShrineNat.length; i++) {
    let id = markerDataShrineNat[i]['id']

    // 各地点の緯度経度を算出
    markerLatLng = new google.maps.LatLng({
      lat: markerDataShrineNat[i]['latitude'],
      lng: markerDataShrineNat[i]['longitude']
    });

    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });

  }

   // 祭りや神事についてコメント投稿をした寺院のマーカー情報
   for (var i = 0; i < markerDataTempleFes.length; i++) {
    let id = markerDataTempleFes[i]['id']
  
    // 各地点の緯度経度を算出
    markerLatLng = new google.maps.LatLng({
      lat: markerDataTempleFes[i]['latitude'],
      lng: markerDataTempleFes[i]['longitude']
    });
  
    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });
  }  

  // 御朱印についてコメント投稿をした寺院のマーカー情報
  for (var i = 0; i < markerDataTempleGos.length; i++) {
    let id = markerDataTempleGos[i]['id']

    // 各地点の緯度経度を算出
    markerLatLng = new google.maps.LatLng({
      lat: markerDataTempleGos[i]['latitude'],
      lng: markerDataTempleGos[i]['longitude']
    });

    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });
  }

  // 建築についてコメント投稿をした寺院のマーカー情報
  for (var i = 0; i < markerDataTempleBui.length; i++) {
    let id = markerDataTempleBui[i]['id']

    // 各地点の緯度経度を算出
    markerLatLng = new google.maps.LatLng({
      lat: markerDataTempleBui[i]['latitude'],
      lng: markerDataTempleBui[i]['longitude']
    });

    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });
  }

  // 歴史についてコメント投稿をした寺院のマーカー情報
  for (var i = 0; i < markerDataTempleHis.length; i++) {
    let id = markerDataTempleHis[i]['id']

    // 各地点の緯度経度を算出
    markerLatLng = new google.maps.LatLng({
      lat: markerDataTempleHis[i]['latitude'],
      lng: markerDataTempleHis[i]['longitude']
    });

    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });
  }

  // 自然についてコメント投稿をした寺院のマーカー情報
  for (var i = 0; i < markerDataTempleNat.length; i++) {
    let id = markerDataTempleNat[i]['id']

    // 各地点の緯度経度を算出
    markerLatLng = new google.maps.LatLng({
      lat: markerDataTempleNat[i]['latitude'],
      lng: markerDataTempleNat[i]['longitude']
    });

    // 各地点のマーカーを作成
    marker[i] = new google.maps.Marker({
      position: markerLatLng,
      map: map
    });
  }
}

window.addEventListener('load', initMap);