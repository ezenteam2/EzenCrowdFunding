 //데이트 피커 스크립트
 const today=new Date();
 const todayArray=[today.getFullYear(), today.getMonth(), today.getDate()];
 const todayFormat=new Date(todayArray[0], todayArray[1], todayArray[2]);

 $('#datePicker').datepicker({
     dateFormat: "yy.mm.dd",
     changeMonth: true,
     changeYear: true
 });
 $('#datePicker').change(event=>{
     const selectDate=event.target.value.split('.');
     const targetDayFormat=new Date(selectDate[0], selectDate[1]-1, selectDate[2]);
     const diff=targetDayFormat-todayFormat;
     const dayDiff=diff/24/3600/1000;
     dayDiffHandle(dayDiff);
 })

 function dayDiffHandle(dayDiff){
     const dateDiffIndicator=document.getElementById('dateDiffIndicator');
     if(dayDiff<0){
         alert('프로젝트 종료일이 올바르지 않습니다.');
         dateDiffIndicator.value=0;
     } else {
         dateDiffIndicator.value=dayDiff;
     }
 }