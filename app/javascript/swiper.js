function swiper() {
  var swiper = new Swiper('.swiper-container', {
    autoplay: {
      delay: 5000,
    },
    loop: true,
    spaceBetween: 30,
    effect: 'fade',
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    }
  });
};

window.addEventListener('load', swiper);