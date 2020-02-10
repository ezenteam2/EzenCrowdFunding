const insertVideo = document.getElementById('insert_video');
const videoWrap = document.querySelector('.video_wrap')

function makeVideoLink(event){
    console.log(event.target.value);
}


insertVideo.addEventListener('keyup', makeVideoLink);