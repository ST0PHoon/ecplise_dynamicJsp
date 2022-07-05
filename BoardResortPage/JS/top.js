let muCnt = 5;
function fncShow(pos) {
  let i = 0;
  for (i; i < muCnt; i++) {
    let obj = document.getElementById("menu" + i);
    let obj2 = document.getElementById("m" + i);
    if (i == pos) {
      obj.style.display = '';
      obj2.style.color = "#ff0000";
    } else {
      obj.style.display = 'none';
      obj2.style.color = "#000000";
    }
  }
}

function fncHide(pos) {
  let obj = document.getElementById("menu" + pos);
  obj.style.display = 'none';
}