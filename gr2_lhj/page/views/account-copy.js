{
    const dropArea=document.querySelector('.account_copy');
    const closeIcon=document.querySelector('.account_copy .close_icon');
    const deleteDiv=document.querySelector('.account_copy .delete');
    const thumbnailImage=document.querySelector('.account_copy .account_copy_thumbnail');
    const _input = document.querySelector('.account_copy input[type=file]');
    
    function preventDefaults(event){
        event.preventDefault();
        event.stopPropagation();
    }
    
    function previewFile(file){
        const reader = new FileReader();
        reader.readAsDataURL(file);
        if(file.type==='image/jpeg'||file.type==='image/png'){
            reader.onloadend=function(){
                const thumbImg = thumbnailImage;
                const thumbnailFileName=document.querySelector('.account_copy .thumbnail_file_name');
                thumbImg.classList.remove('none');
                thumbImg.src = reader.result;
                thumbImg.width='200';
                thumbImg.height='200';
                thumbnailFileName.innerHTML=file.name;
                deleteDiv.classList.remove('none');
                
        } 
        } else{
        alert("그림파일은 jpg, png형식만 가능합니다.")
        }
    }
    
    function handleFiles(files){
        [...files].forEach(file=>{
            previewFile(file);
        })
    }
    
    function handleDrop(event){
        const data=event.dataTransfer;
        const files=data.files;
        handleFiles(files);
    }
    
    function clickCloseIcon(){
        _input.value=null;
        thumbnailImage.classList.add('none');
        deleteDiv.classList.add('none');
    }
    
    function handleMouseIn(){
        deleteDiv.style.opacity=1;
    }
    
    function handleMouseOut(){
        deleteDiv.style.opacity=0;
    }
    
    ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName=>{
        dropArea.addEventListener(eventName, preventDefaults);
    })
    dropArea.addEventListener('drop', handleDrop);
    dropArea.addEventListener('mouseenter',handleMouseIn);
    dropArea.addEventListener('mouseleave',handleMouseOut);
    closeIcon.addEventListener('click', clickCloseIcon);
    
    }