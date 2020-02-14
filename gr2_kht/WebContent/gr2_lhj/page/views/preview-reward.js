{
    const registerBtn = document.querySelector("#register_reward");
    const rewardTable = document.querySelector(".reward_table");
    const previewContainer=document.querySelector('.preview_container');
    const dataArray=[];


    function makeRewardPreview(data){
        const preview=document.createElement('div');
        const priceTitle=document.createElement('h3');
        const kinds=document.createElement('div');
        const titleHeader=document.createElement('h4');
        const title=document.createElement('div');
        const content=document.createElement('p');
        const _edit=document.createElement('span');
        const _delete=document.createElement('span');
        priceTitle.innerHTML=`${data.price}원 펀딩`;
        kinds.innerHTML='reward';
        titleHeader.innerHTML='리워드명';
        title.innerHTML=`${data.title}`;
        content.innerHTML=`${data.content}`;
        _edit.innerHTML='수정';
        _delete.innerHTML='삭제';
        preview.classList.add('preview');
        kinds.classList.add('indicator');
        title.classList.add('title');
        _edit.classList.add('edit');
        _delete.classList.add('delete');

        preview.appendChild(priceTitle);
        preview.appendChild(kinds);
        preview.appendChild(titleHeader);
        preview.appendChild(title);
        preview.appendChild(content);
        preview.appendChild(_edit);
        preview.appendChild(_delete);
        previewContainer.appendChild(preview);
    }
    function isDelivery(){
        const radioes=rewardTable.querySelectorAll('.btn-group-toggle input[type=radio]');
        if(radioes[0].checked){
            return true;
        } else {
            return false;
        }
    }

    function saveRewardData(callback){
        const data={};
        data.price=rewardTable.querySelector('#reward_price').value;
        data.title=rewardTable.querySelector('#reward_title').value;
        data.content=rewardTable.querySelector('#reward_content').value;
        data.delivery=isDelivery();
        dataArray.push(data);
        rewardTable.querySelector('#reward_price').value='';
        rewardTable.querySelector('#reward_title').value='';
        rewardTable.querySelector('#reward_content').value='';
        callback(data);
    }

    function handleClick(){
        if(rewardTable.querySelector('#reward_price').value!==''&&
        rewardTable.querySelector('#reward_title').value!==''&&
        rewardTable.querySelector('#reward_content').value!==''){
            saveRewardData(makeRewardPreview);
        }
    }

    registerBtn.addEventListener('click', handleClick);
}