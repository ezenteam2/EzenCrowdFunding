{
const imageWrap = document.querySelector('.image_wrap');
const detailImgInput=document.getElementById('detail_img_input');
const initialCloseIcon=document.querySelector('.detail_img_delete .close_icon');
let deleteDivs = [document.querySelector('.detail_img_delete')];
let detailImg = [document.querySelector('.detail_img')];
let Cnt=0;

function clickDeleteBtn(event){
    const _imgBox=event.target.parentNode.parentNode;
    imageWrap.removeChild(_imgBox);
}

function createDeleteDiv(){
    const deleteDiv=document.createElement('div');
    const closeIcon=document.createElement('img');
    const fileName=document.createElement('div');

    closeIcon.addEventListener('click', clickDeleteBtn);
    closeIcon.src='./cross.png';
    closeIcon.width='30';
    closeIcon.height='30';

    closeIcon.onclick=clickDeleteBtn;
    closeIcon.classList.add('close_icon')
    deleteDiv.classList.add('detail_img_delete');
    deleteDiv.classList.add('none');
    fileName.classList.add('detail_img_file_name');

    deleteDiv.appendChild(closeIcon);
    deleteDiv.appendChild(fileName);
    deleteDiv.addEventListener('mouseenter', handleMouseIn);
    deleteDiv.addEventListener('mouseleave', handleMouseOut);
    deleteDivs.push(deleteDiv);

    return deleteDiv;
}

function createImageBox(){
    const imageBox=document.createElement('div');
    const inputFile=document.createElement('input');
    const newImg=document.createElement('img');
    const deleteDiv=createDeleteDiv();

    imageBox.classList.add('image_box');
    inputFile.type='file';
    inputFile.accept='image/*';
    inputFile.addEventListener('change', handleDetailFiles);
    detailImg.push(newImg);
    Cnt++;
    imageBox.appendChild(newImg);
    imageBox.appendChild(inputFile);
    imageBox.appendChild(deleteDiv);
    return imageBox;
}

function insertImageBox(){
    imageWrap.appendChild(createImageBox());
}

function handleMouseIn(event){
    event.target.style.opacity=1;
}

function handleMouseOut(event){
    event.target.style.opacity=0;
}


function handleDetailFiles(event){
    previewFile(event.target.files[0], insertImageBox);
    event.target.disabled=true;
}

function previewFile(file, callback){
    const reader = new FileReader();
    reader.readAsDataURL(file);
    if(file.type==='image/jpeg'||file.type==='image/png'){
        reader.onloadend=function(){
        detailImg[Cnt].src = reader.result;
        detailImg[Cnt].width='200';
        detailImg[Cnt].height='200';
        detailImg[Cnt].classList.remove('none');
        deleteDivs[Cnt].classList.remove('none');
        deleteDivs[Cnt].lastElementChild.innerHTML=file.name;
        callback();
    } 
    } else{
    alert("그림파일은 jpg, png형식만 가능합니다.")
    }
}

deleteDivs[0].addEventListener('mouseenter', handleMouseIn);
deleteDivs[0].addEventListener('mouseleave', handleMouseOut);
detailImgInput.addEventListener('change', handleDetailFiles);
initialCloseIcon.addEventListener('click', clickDeleteBtn);

}