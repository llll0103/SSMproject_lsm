function goCareerDesign(sessionAU){
   if(sessionAU == "1"){
      location.href = "/test/goMainPage.ssm";
   }else if(sessionAU == "2"|| sessionAU == "3"){
      location.href = "/testTeacher/listStudent.ssm";
   }else if(sessionAU == null){
      //alert("로그인 부탁드립니다요요요ㅛㅇ요요요요요요요요요요요요요용요요요요요요요요요요요요");
   }
}

function goCounseling(sessionAU){
   if(sessionAU == "1"){
      location.href = "/onlineApplication/cgMain.ssm";
   }else if(sessionAU == "2"|| sessionAU == "3"){
      location.href = "/eduSchedule/eduRsvList.ssm";
   }else if(sessionAU == null){
      //alert("로그인 부탁드립니다요요요ㅛㅇ요요요요요요요요요요요요요용요요요요요요요요요요요요");
   }
/*   if(you != ""){
      location.href = "/onlineApplication/cgMain.ssm";
   } else {
      //alert("로그인 먼저");
      return;
   }
*/   
}

function goBigyogwaRecommend(you){
   if(you != ""){
      location.href = "/nonprogram/np_Main.ssm?var=1";
   } else {
      //alert("로그인 먼저");
      return;
   }
}

function goEportfolio(sessionAU, you){
   if(sessionAU ==1){
      location.href = "/eportfolio/student.ssm";
   }
   if(sessionAU==2){
      location.href = "/eportfolio/teacher.ssm";
   }
   
}

function goCommunity(){
   location.href = "/noticeboard/nblist.ssm";
}