var express = require('express');
var app = express();

app.get('/',function(req,res){
    res.render('user_w_hj_make_reward.html')
 });
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);
app.use(express.static('views'));

var server = app.listen(3000, function(){
    console.log("Express server has started on port 3000")
});

