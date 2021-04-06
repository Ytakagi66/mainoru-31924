function festival (){
  $("#tab1").click(moveToFirst);
  $("#tab2").click(moveToSecond);
  $("#tab3").click(moveToThird);
  $("#tab4").click(moveToFour);
  $("#tab5").click(moveToFive);
  
  function moveToFirst() {
      $("#slide").attr('class', 'move-to-first');
      $(".tab").attr('class', 'tab');
      $("#tab1").attr('class', 'tab selected');
  }
  
  function moveToSecond() {
      $("#slide").attr('class', 'move-to-second');
      $(".tab").attr('class', 'tab');
      $("#tab2").attr('class', 'tab selected');
  }
  
  function moveToThird() {
      $("#slide").attr('class', 'move-to-third');
      $(".tab").attr('class', 'tab');
      $("#tab3").attr('class', 'tab selected');
  }
  
  function moveToFour() {
      $("#slide").attr('class', 'move-to-four');
      $(".tab").attr('class', 'tab');
      $("#tab4").attr('class', 'tab selected');
  }

  function moveToFive() {
    $("#slide").attr('class', 'move-to-five');
   $(".tab").attr('class', 'tab');
   $("#tab5").attr('class', 'tab selected');
}
}


window.addEventListener('load', festival);