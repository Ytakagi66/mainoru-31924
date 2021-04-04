function Show() {
  const nav = document.getElementById('shrine_nav');
  const offset = document.documentElement.scrollTop;

  if (!nav){ return false;}

  if(offset >= 111.25){
    nav.setAttribute('style', 'top: 0;');
  }else if(offset <= 111.24){
    nav.setAttribute('style', 'top: 111.25;');
  };
}

window.addEventListener('scroll',Show);
