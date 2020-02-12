{
    const registerBtn = document.querySelector("#register_reward");
    const rewardTable = document.querySelector(".reward_table");

    const dataArray=[];


    function makeRewardPreview(data){
        console.log(data);
        
    }
    function isDelivery(){
        const radioes=rewardTable.querySelectorAll('.btn-group-toggle input[type=radio]');
        if(radioes[0].checked){
            return true;
        } else {
            return false;
        }
    }

    function saveRewardData(){
        const data={};
        data.price=rewardTable.querySelector('#reward_price').value;
        data.title=rewardTable.querySelector('#reward_title').value;
        data.content=rewardTable.querySelector('#reward_content').value;
        data.delivery=isDelivery();
        dataArray.push(data);
        makeRewardPreview(data);
    }

    function handleClick(){
        saveRewardData();
        
    }

    registerBtn.addEventListener('click', handleClick);
}