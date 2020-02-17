{
const titleLengthIndicator = document.querySelector('.title_length_indicator');
const projectTitle = document.getElementById("project_title");
const rightPriceIndicator = document.querySelector('.right_price_indicator');
const projectTargetFund = document.getElementById('project_target_fund');

function handleTitleLength(event){
    const titleLength =event.target.value.length;
    titleLengthIndicator.innerHTML=`${titleLength>=40? `40/40` : `${titleLength}/40`}`;
}

function handleTargetFund(event){
    const targetFund = event.target.value;
    if(!Number.isNaN(Number(targetFund))){
        if(Number(targetFund)>=100000){
            rightPriceIndicator.innerHTML='입력하신 금액은 '+
            targetFund.replace(/\B(?=(\d{3})+(?!\d))/g,',')+
            '원입니다.';
        } else {
            rightPriceIndicator.innerHTML='최소 금액은 100,000원입니다.';
        }
    } else {
        rightPriceIndicator.innerHTML='올바른 금액을 입력해주세요.';
    }
}

function onDragOver(event){
    event.preventDefault();
}

function onDrop(event){
    event.preventDefault();
}

projectTitle.addEventListener("keyup", handleTitleLength);
projectTargetFund.addEventListener("keyup", handleTargetFund);

}