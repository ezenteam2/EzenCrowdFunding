const listTable=document.querySelector('#list-table tbody');
const form = document.querySelector('#add-category-form');

console.dir(listTable);

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

fun

function sort(){
    handleEqual();
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

function makeList(){
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
        lastTd.appendChild(btn);
        tr.appendChild(firstTd);
        tr.appendChild(secondTd);
        tr.appendChild(lastTd);
        listTable.appendChild(tr);
    })
}

function addNewList(){
    let name=form.children[0].value;
    let priority=Number(form.children[1].value);
    if(name){
        categoryList.push({name, priority})
        makeList();
    }
    
}

function clickAddBtn(){
    form.hidden=!form.hidden;
}

function preventDefault(event){
    event.preventDefault();
}

let buttons=document.querySelectorAll('button');

buttons.forEach(el=>{
    el.addEventListener('click', preventDefault);
})

makeList();