function select(){
  const selectImage0 = document.getElementById('select_image0');
  const selectImage1 = document.getElementById('select_image1');
  const swiperSlide = document.getElementById('swiper-slide_main');
  const swiperWrapper = document.getElementById('swiper-wrapper');  
  selectImage0.addEventListener('click', function() {
    const src0 = selectImage0.getAttribute('src')
    swiperSlide.setAttribute('src',src0)
    const swiperSrc = swiperSlide.getAttribute('src')
    console.log(swiperSrc)
  })
  selectImage1.addEventListener('click', function() {
    const src1 = selectImage1.getAttribute('src')
    swiperSlide.setAttribute('src',src1)
  })
}

window.addEventListener('load', select);