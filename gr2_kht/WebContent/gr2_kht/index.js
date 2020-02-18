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
target('.reward','translateX(-200px)');
target('.recommend','translateX(200px)');
target('.security','translateX(200px)');


