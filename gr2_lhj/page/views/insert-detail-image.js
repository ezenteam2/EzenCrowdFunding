{
const imageWrap = document.querySelector('.image_wrap');
const detailImgInput=document.getElementById('detail_img_input');
let detailImg = [document.querySelector('.detail_img')];
let imgCnt=0;

console.log(detailImg);

function createImageBox(){
    const imageBox=document.createElement('div');
    const inputFile=document.createElement('input');
    const newImg=document.createElement('img');
    imageBox.classList.add('image_box');
    inputFile.type='file';
    inputFile.accept='image/*';
    inputFile.addEventListener('change', handleDetailFiles);
    detailImg.push(newImg);
    imageBox.appendChild(newImg);
    imageBox.appendChild(inputFile);

    return imageBox;
}

function insertImageBox(){
    imageWrap.appendChild(createImageBox());
}

function handleDetailFiles(event){
    console.log(event);
    previewFile(event.target.files[0]);
    detailImg[0].classList.remove('none');
    insertImageBox();
}

function previewFile(file){
    const reader = new FileReader();
    reader.readAsDataURL(file);
    if(file.type==='image/jpeg'||file.type==='image/png'){
        reader.onloadend=function(){
            detailImg[0].src = reader.result;
            detailImg.width='200';
            detailImg.height='200';
    } 
    } else{
    alert("그림파일은 jpg, png형식만 가능합니다.")
    }
}
detailImgInput.addEventListener('change', handleDetailFiles);

}