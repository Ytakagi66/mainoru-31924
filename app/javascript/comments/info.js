function Show() {
  const info = document.getElementById('info');
  const offset = document.documentElement.scrollTop;

  if (!info){ return false;}

  if(offset >= 111.25){
    info.setAttribute('style', 'top: 0;');
  }else if(offset <= 111.24){
    info.setAttribute('style', 'top: 111.25;');
  };
}

window.addEventListener('scroll',Show);
