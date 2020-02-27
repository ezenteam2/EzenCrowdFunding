function target($category,$property){
    let last_known_scroll_position = 0;
    let ticking = false;

    function doSomething(scroll_pos) {
    let target = document.querySelector($category);
        target.style.transform = $property;
        target.style.transition = '2s'
    }

    window.addEventListener('scroll', function(e) {
    last_known_scroll_position = window.scrollY;

    if (!ticking) {
        window.requestAnimationFrame(function() {
        doSomething(last_known_scroll_position);
        ticking = false;
        });
        ticking = true;
    }
    });
};
target('.reward','translateX(-100px)');
target('.recommend','translateX(100px)');
target('.security','translateX(100px)');

// var reward = document.querySelector('.reward')
// var recommend = document.querySelector('.recommend')
// var security = document.querySelector('.security')
// window.addEventListener('scroll',function(event){
    
//     if(window.scrollY>=420){
//         reward.style.transform = 'translateX(-100px)'
//     }
//     if(window.scrollY>=920){
//         recommend.style.transform = 'translateX(100px)'
//     }
//     if(window.scrollY>=1520){
//         security.style.transform = 'translateX(-100px)'
//     }
// })


