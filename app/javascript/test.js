function memo() {
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => { // イベント発火
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    console.log(formData.entries());
  });
 };
window.addEventListener("load", memo);