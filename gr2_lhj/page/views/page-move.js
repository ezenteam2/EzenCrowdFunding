const basicInformation = document.querySelector('.basic_information');
const storyInformation = document.querySelector('.story_information');
const rewardInformation = document.querySelector('.reward_information');
const makerInformation = document.querySelector('.maker_information');
const loadingPage = document.querySelector('.loading_page');

const pages=[basicInformation, storyInformation, rewardInformation, makerInformation];

function pageTo1(event){
    loading();
    setTimeout(()=>{
        basicInformation.classList.remove('none');
    }, 500);
}

function pageTo2(event){
    loading();
    setTimeout(()=>{
        storyInformation.classList.remove('none');
    }, 500);
}

function pageTo3(event){
    loading();
    setTimeout(()=>{
        rewardInformation.classList.remove('none');
    }, 500);
}

function pageTo4(event){
    loading();
    setTimeout(()=>{
        makerInformation.classList.remove('none');
    }, 500);
}

function loading(){
    pages.forEach(el=>{
        el.classList.add('none');
    })
    loadingPage.classList.remove('none');
    setTimeout(()=>{
        loadingPage.classList.add('none')
    }, 500);
}
