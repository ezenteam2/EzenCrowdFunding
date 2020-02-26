var exit = document.querySelector('.modal__exit')
var modal = document.querySelector('.modal')
exit.addEventListener('click',function(event){
    modal.style.display= 'none'
})

const reader = new FileReader();
const fileInput = document.querySelector(".modal__image--display-none");
const img = document.querySelector(".modal__image--after");
const imgbefore = document.querySelector(".modal__image--before");
const text = document.querySelector(".modal__image--before-text");

reader.onload = e => {
  img.src = e.target.result;
}
fileInput.addEventListener('change', e => {
  const f = e.target.files[0];
  reader.readAsDataURL(f);
  imgbefore.style.display='none'
  text.style.display='none'
})