const checkBox = document.querySelector('#jb-checkbox');


function handleClick(evnet){
    event.preventDefault();
    event.stopPropagation();
    event.returnValue=false;
}

checkBox.addEventListener('change', ()=>{
    if(checkBox.checked){
        const bankDiv = document.querySelectorAll('.select-items div');
        bankDiv[0].click();

        document.querySelector('#bank_account_number').value='301-1552-2432-26';
        document.querySelector('#bank_account_number').disabled=true;
        document.querySelector('#bank_account_owner').value='홍길동';
        document.querySelector('#bank_account_owner').disabled=true;
        document.querySelector('.select-selected').addEventListener('click' ,handleClick);
    } else {
        document.querySelector('#bank_account_number').value='';
        document.querySelector('#bank_account_owner').value='';
        document.querySelector('#bank_account_number').disabled=false;
        document.querySelector('#bank_account_owner').disabled=false;
        document.querySelector('.select-selected').innerHTML='은행을 선택해주세요';
        document.querySelector('.select-selected').removeEventListener('click', handleClick);
    }
    
});