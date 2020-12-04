<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="ssm.common.utils.BabySession" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>Insert title here</title>
      <script src="/common/ssmJs/goCategory.js?ver=1"></script>
      <script src="/common/ssmJs/index.js"></script>
      <script src="/common/ssmJs/goBoard.js"></script>
      <script src="/common/ssmJs/goLogin.js"></script>
   </head>
<%
   
   String sessionAU = BabySession.getSessionAU(request);
   String sessionID = BabySession.getSessionID(request);
   String sessionNO = BabySession.getSessionNO(request);
   if(sessionAU == null){
      sessionAU = "";
   }
   String you ="";
   if(sessionAU.equals("1")){
      you="학생";
   }
   if(sessionAU.equals("2")){
      you="선생님";
   }

   Boolean bSession = sessionAU != "";
%>
   <body>
      <header>
         <div id="bitHigh">
            <a href="/main_1.jsp"><img src="/mainImg/bitHigh2.png"></a>
         </div>
      <hr>
      <nav>
         <div class="wrapMenu">
            <ul class="menuList">
               <li><a href="javascript:goCareerDesign('<%=sessionAU%>')">진로설계</a></li>
         <li><a href="javascript:goCounseling('<%=sessionAU%>')">상담창구</a></li>
         <li><a href="javascript:goBigyogwaRecommend()">비교과추천</a></li>
         <li><a href="javascript:goEportfolio('<%=sessionAU%>','<%=you%>')">E-포트폴리오</a></li>
         <li><a href="javascript:goCommunity()">커뮤니티</a></li>
            </ul>
         </div>
      </nav>
      <hr>
      </header>
   </body>
</html>