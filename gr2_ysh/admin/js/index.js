var menu = document.querySelector('.menu');
var button = document.querySelector('.admin-info__toggle');
var admin_info= document.querySelector('.admin-info');
var article = document.querySelector('.article');
var i = 1;
button.addEventListener('click',function(event){
    if(i ===1){
        menu.style.transform = 'translateX(-290px)'
        menu.style.transition = '0.5s'
        admin_info.style
        admin_info.style.transition = '0.5s'
        admin_info.style.marginRight = '-280px';
        admin_info.style.transform = 'translateX(-280px)'
        i = 0;
    }else{
        menu.style.transform = 'translateX(0px)'
        menu.style.transition = '0.5s'
        admin_info.style.transform = 'translateX(10px)'
        admin_info.style.transition = '0.5s'
        admin_info.style.marginRight = '10px';
        i = 1;
    }
})

// window.addEventListener('scroll',function(event){
//     if(window.scrollY >= 100){
//         alert('dafsdf');
//     }
//     window = null;
// })

var category_main = document.querySelector('.category__main');
var inner_main  = document.querySelector('.menu__inner--main');
category_main.addEventListener('click',function(event){
    if(inner_main.style.display === 'none'){
        inner_main.style.display ='block'
    }else{
        inner_main.style.display ='none'
    }
})
var category_community = document.querySelector('.category__community');
var inner_community  = document.querySelector('.menu__inner--community');
category_community.addEventListener('click',function(event){
    if(inner_community.style.display === 'none'){
        inner_community.style.display ='block'
    }else{
        inner_community.style.display ='none'
    }
})
var category_project = document.querySelector('.category__project');
var inner_project  = document.querySelector('.menu__inner--project');
category_project.addEventListener('click',function(event){
    if(inner_project.style.display === 'none'){
        inner_project.style.display ='block'
    }else{
        inner_project.style.display ='none'
    }
})

// 커뮤니티 이벤트
function moveNoctice(){
    document.querySelector("iframe").src="../../gr2_kkb/admin_w_kb_NocticeBoard.html";
}

function moveQnA(){
    document.querySelector("iframe").src="../../gr2_kkb/admin_w_kb_Q&ABoard.html";
}