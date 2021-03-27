function comment() {
  const form = document.getElementById("form");
  form.addEventListener('submit', function(){
    let inputComment = document.getElementById('form-message').value;
    console.log(inputComment);
  })
}

window.addEventListener('load', comment);