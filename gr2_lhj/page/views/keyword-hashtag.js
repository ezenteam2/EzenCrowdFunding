{
const keywordTextInput=document.getElementById('project_key_words');
const keywordBar=document.querySelector('.keyword_bar');


function focusToTextBar(event){
    keywordTextInput.focus();
}
function clickDelete(event){
    const targetElement=event.target.parentNode;
    keywordBar.removeChild(targetElement);
}

function handleKeyUp(event){
    if(event.code==='Enter'||event.code==='Comma'){
        const keyword=keywordTextInput.value;
        const deleteComma=keyword.replace(',','');
        if(deleteComma!==''){
            keywordTextInput.value='';
            const element=document.createElement('span');
            const innerElement=document.createElement('span');
            element.innerText=deleteComma;
            element.appendChild(innerElement);
            innerElement.classList.add('remove_keyword_button')
            innerElement.onclick=event=>{
                clickDelete(event);
            }
            keywordBar.insertBefore(element, keywordTextInput);
        }
    }
    // if(event.code==='Enter'){
    //     const deleteBlank=keywordTextInput.value.replace(/\s/g,'');   
    //     const keywords=deleteBlank.split(',');
    //     keywordTextInput.value='';

    //     while(keywordList.hasChildNodes()){
    //         keywordList.removeChild(keywordList.firstChild);
    //     }
    //     keywords.forEach(keyword=>{
    //         if(keyword!==''){
    //             const li=document.createElement('li');
    //             const btnText=document.createElement('button');
    //             const btnDelete=document.createElement('button');
    //             btnText.classList.add('keyword_title');
    //             btnDelete.classList.add('keyword_delete_button');
    //             btnText.innerHTML=keyword;
    //             btnDelete.innerHTML='X';
    //             btnText.disabled=true;
    //             btnDelete.onclick=(event)=>{
    //                 event.preventDefault();
    //                 clickDelete(event);
    //             }
    //             li.appendChild(btnText);
    //             li.appendChild(btnDelete);
    //             keywordList.appendChild(li);
    //         }
    //     })
    // } 
}


keywordTextInput.addEventListener('keyup', handleKeyUp);
keywordBar.addEventListener('click', focusToTextBar);
}