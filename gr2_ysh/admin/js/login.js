var redirectTime = "1500";
var redirectURL = "./index.html";
function login_process() {
        history.replaceState({}, null, location.pathname);
        document.querySelector('.form').style.display='none';
        document.querySelector('.title').style.transition='2s';
        document.querySelector('.title').style.transform='translateY(110px)';    
        setTimeout("location.href = redirectURL;",redirectTime);
}    
