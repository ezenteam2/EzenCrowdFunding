var correctId='ezenteam2';
var correctPassword='1234';
var redirectTime = "1500";
var redirectURL = "https://www.quackit.com";
function login_process() {
        document.querySelector('.form').style.display='none';
        document.querySelector('.title').style.transition='2s';
        document.querySelector('.title').style.transform='translateY(110px)';    
        setTimeout("location.href = redirectURL;",redirectTime);
}    
