const insertVideo = document.getElementById('insert_video');
const videoWrap = document.querySelector('.video_wrap')

function deletePrevVideo(){
    while(videoWrap.hasChildNodes()){
        videoWrap.removeChild(videoWrap.firstChild);
    }
}

function makeVideoFrame(videoURL){
    deletePrevVideo();
    const videoFrame = document.createElement('iframe');
    videoFrame.src=videoURL;
    videoFrame.width="560";
    videoFrame.height="315";
    videoFrame.style.border="none";
    videoWrap.appendChild(videoFrame);
}

function makeVideoLink(event){
    if(event.code==='Enter'){
        const urlSplit=insertVideo.value.split('/');
        const videoURL='https://www.youtube.com/embed/'+urlSplit[3];
        insertVideo.value='';
        makeVideoFrame(videoURL);
    }
}


insertVideo.addEventListener('keyup', makeVideoLink);