function ShrineIndex() {
  const shrineIndex = document.getElementById('shrine_tori');
  const shrineContent = document.getElementById('shrine_contents');
  const offset = document.documentElement.scrollTop;;
  if(offset >= 115){
    shrineIndex.setAttribute('class', 'offset_top');
    shrineContent.setAttribute('class', 'shrineContent');
  }else if(offset <= 114){
    shrineIndex.removeAttribute('class', 'offset_top');
    shrineContent.removeAttribute('class', 'shrineContent');
  };
}

window.addEventListener('scroll',ShrineIndex);
