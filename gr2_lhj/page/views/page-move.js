const basicInformation = document.querySelector('.basic_information');
const storyInformation = document.querySelector('.story_information');
const rewardInformation = document.querySelector('.reward_information');
const makerInformation = document.querySelector('.maker_information');
const loadingPage = document.querySelector('.loading_page');
const leftMenu = document.querySelectorAll('.navi_menu_list>li');

const pages=[basicInformation, storyInformation, rewardInformation, makerInformation];

function pageTo1(event){
    leftMenu.forEach(li=>{
        li.style.color='black';
    })
    leftMenu[0].style.color='red';
    loading();
    setTimeout(()=>{
        basicInformation.classList.remove('none');
    }, 500);
}

function pageTo2(event){
    leftMenu.forEach(li=>{
        li.style.color='black';
    })
    leftMenu[1].style.color='red';
    loading();
    setTimeout(()=>{
        storyInformation.classList.remove('none');
    }, 500);
}

function pageTo3(event){
    leftMenu.forEach(li=>{
        li.style.color='black';
    })
    leftMenu[2].style.color='red';
    loading();
    setTimeout(()=>{
        rewardInformation.classList.remove('none');
    }, 500);
}

function pageTo4(event){
    leftMenu.forEach(li=>{
        li.style.color='black';
    })
    leftMenu[3].style.color='red';
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
