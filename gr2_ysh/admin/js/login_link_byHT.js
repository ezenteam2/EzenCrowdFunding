var redirectTime = "1500";
var redirectURL = "./index_link_byHT.html";
function login_process() {
        document.querySelector('.form').style.display='none';
        document.querySelector('.title').style.transform='translateY(110px)';
        document.querySelector('.title').style.transition='2s';    
        setTimeout("location.href = redirectURL;",redirectTime);
}    
