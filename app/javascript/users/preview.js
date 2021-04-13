document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list-first');

  // 選択した画像を表示する関数
  const createImageHTML = (blob) => {
     // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');

    // 表示する画像を生成
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('id', 'profImage');
    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
  };

  document.getElementById('avatar').addEventListener('change', function(e){
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const imageContent = document.getElementById('profImage');
    if (imageContent){
      imageContent.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
  });
});

document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list-second');

  // 選択した画像を表示する関数
  const createImageHTML = (blob) => {
     // 画像を表示するためのdiv要素を生成
    const imageElement = document.createElement('div');

    // 表示する画像を生成
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('id', 'backImage');
    // 生成したHTMLの要素をブラウザに表示させる
    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement);
  };

  document.getElementById('backimage').addEventListener('change', function(e){
    // 画像が表示されている場合のみ、すでに存在している画像を削除する
    const imageContent = document.getElementById('backImage');
    if (imageContent){
      imageContent.remove();
    }

    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    createImageHTML(blob);
  });
});