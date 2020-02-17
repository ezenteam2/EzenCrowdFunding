const listTable=document.querySelector('#list-table tbody');
const addForm = document.querySelector('#add-category-form');

let categoryList=[
    {name:'테크, 가전', priority:1},
    {name:'패션, 잡화', priority:2},
    {name:'뷰티', priority:3},
    {name:'푸드', priority:4},
    {name:'홈리빙', priority:5},
    {name:'디자인소품', priority:6},
    {name:'여행, 레저', priority:7},
    {name:'스포츠, 모빌리티', priority:8},
    {name:'반려동물', priority:9},
    {name:'모임', priority:10},
    {name:'공연, 컬쳐', priority:11},
    {name:'소셜, 캠페인', priority:12},
    {name:'교육, 키즈', priority:13},
    {name:'게임, 취미', priority:14},
    {name:'출판', priority:15},
]


function handlePush(){
    for(let i=categoryList.length-1; i>0; i--){
        if(categoryList[i].priority<=categoryList[i-1].priority){
            categoryList[i-1].priority++;
            [categoryList[i], categoryList[i-1]] = [categoryList[i-1], categoryList[i]];
        } else{
            break;
        }
    }
}

function handleDelete(li){
    for(let idx=li; idx<categoryList.length; idx++){
        categoryList[idx].priority--;
    }
    categoryList.splice(li,1);
}
function sort(){
    for(let i=0; i<categoryList.length; i++){
        for(let j=i+1; j<categoryList.length; j++){
            if(categoryList[i].priority>categoryList[j].priority){
                [categoryList[i], categoryList[j]] = [categoryList[j], categoryList[i]];
            }
        }
    }
}

function deleteOldList(){
    while(listTable.childElementCount!==1)
    {
        listTable.removeChild(listTable.lastChild);
    }
}

function updateList(){
    sort();
    deleteOldList();
    categoryList.forEach(el=>{
        let tr = document.createElement('tr');
        let firstTd=document.createElement('td');
        let secondTd=document.createElement('td');
        let lastTd=document.createElement('td');
        let btn=document.createElement('button');
        firstTd.innerHTML=el.priority;
        secondTd.innerHTML=el.name;
        btn.innerHTML='삭제';
        btn.classList.add('btn');
        btn.classList.add('btn-primary');
        btn.onclick=clickDeleteBtn;
        lastTd.appendChild(btn);
        tr.appendChild(firstTd);
        tr.appendChild(secondTd);
        tr.appendChild(lastTd);
        listTable.appendChild(tr);
    })
    console.log(categoryList);
}

function addSubmit(){
    let name=addForm.children[0].value;
    let priority=Number(addForm.children[1].value);
    if(name&&priority){
        if(priority>categoryList.length){
            priority=categoryList.length+1;
        }
        addForm.children[0].value=null;
        addForm.children[1].value=null;
        categoryList.push({name, priority})
        handlePush();
        updateList();
    }
    
}

function clickAddBtn(){
    addForm.hidden=!addForm.hidden;
}

function clickDeleteBtn(event){
    let priorityNum=Number(event.target.parentNode.parentNode.children[0].innerHTML);
    for (let li in categoryList){
        if(categoryList[li].priority===priorityNum){
            handleDelete(li);
            updateList();
        }
    }
}

function preventDefault(event){
    event.preventDefault();
}

let buttons=document.querySelectorAll('button');

buttons.forEach(el=>{
    el.addEventListener('click', preventDefault);
})

updateList();
addForm.hidden=true;