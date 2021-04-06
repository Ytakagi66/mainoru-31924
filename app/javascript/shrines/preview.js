if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-list');
    const ImagePreview = document.getElementById('image_preview');
    ImagePreview.setAttribute('style','display:flex;');
    const InputShrine = document.getElementById('input_shrine');

    const createImageHTML = (blob) => {
       // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length
      if (imageElementNum == 4){
        imageElement.setAttribute('style','display: none')
      }
      if (imageElementNum == 3){
        const element = document.querySelector('i')
        element.remove()
      }

      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.className = 'cls_image'
      blobImage.setAttribute('src', blob);

      // ファイル選択ボタンを生成
        const inputHTML = document.createElement('input')
        inputHTML.setAttribute('id', `shrine_image_${imageElementNum}`)
        inputHTML.setAttribute('name', 'shrine[images][]')
        inputHTML.setAttribute('class', 'input_image')
        inputHTML.setAttribute('type', 'file') 
        inputHTML.setAttribute('style','display: none;')
        ImageList.setAttribute('class', `image_num_${imageElementNum}`)
        ImagePreview.setAttribute('class', `preview_num_${imageElementNum}`)

        // 削除ボタンを生成
        const spanHTML = document.createElement('span')
        spanHTML.setAttribute('id', `shrine_span_${imageElementNum}`)
        spanHTML.setAttribute('class', 'span_delete')     

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      imageElement.appendChild(inputHTML);
      imageElement.appendChild(spanHTML);
      ImagePreview.appendChild(imageElement);
    

      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    };

    document.getElementById('shrine_image').addEventListener('change', function(e){

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}