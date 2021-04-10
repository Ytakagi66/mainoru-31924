function ShrineIndex() {
  const templeIndex = document.getElementById('temple_tori');
  const templeContent = document.getElementById('temple_contents');
  const offset = document.documentElement.scrollTop;

  if (!templeIndex){ return false;}

  if(offset >= 115){
    templeIndex.setAttribute('class', 'offset_top');
    templeContent.setAttribute('class', 'templeContent');
  }else if(offset <= 114){
    templeIndex.removeAttribute('class', 'offset_top');
    templeContent.removeAttribute('class', 'templeContent');
  };
}

window.addEventListener('scroll',ShrineIndex);
