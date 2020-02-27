var exit = document.querySelector('.modal__exit')
var modal = document.querySelector('.modal')
var upload = document.querySelector('.control__upload')
exit.addEventListener('click',function(event){
    modal.style.display= 'none'
})
upload.addEventListener('click',function(event){
   modal.style.display='block'
})

window.onkeydown = function(event){
    if(event.keyCode==27){
      modal.style.display='none'
    }
}
var reader = new FileReader();
var fileInput = document.querySelector(".modal__image--display-none");
var img = document.querySelector(".modal__image--after");
var imgbefore = document.querySelector(".modal__image--before");
var text = document.querySelector(".modal__image--before-text");

reader.onload = e => {
  img.src = e.target.result;
}
fileInput.addEventListener('change', e => {
  var f = e.target.files[0];
  reader.readAsDataURL(f);
  imgbefore.style.display='none'
  text.style.display='none'
})