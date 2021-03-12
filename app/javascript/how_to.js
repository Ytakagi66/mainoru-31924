function how_to() {
  const firstPhoto = document.getElementById("first_photo");
  const secondPhoto = document.getElementById("second_photo");

  firstPhoto.addEventListener('mouseover', function(){
    this.setAttribute("style", "opacity: 0.7;");
  })
  firstPhoto.addEventListener('mouseout', function(){
    this.removeAttribute("style", "opacity: 0.7;");
  })

  secondPhoto.addEventListener('mouseover', function(){
    this.setAttribute("style", "opacity: 0.7;");
  })
  secondPhoto.addEventListener('mouseout', function(){
    this.removeAttribute("style", "opacity: 0.7;");
  })
}

window.addEventListener('DOMContentLoaded', how_to)