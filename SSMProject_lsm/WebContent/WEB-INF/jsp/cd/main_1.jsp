<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.BabySession" %>
<% 
   request.setCharacterEncoding("EUC-KR"); 
   Object obj = request.getAttribute("alert");
   String alertt ="";
   if(obj != null){
      alertt = (String)obj;
   }
   String sessionAU = BabySession.getSessionAU(request);
   System.out.println("sessionAU>>>:"+ sessionAU);
   if(sessionAU == null){
      sessionAU = "";
   }
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>�޸�</title>
      <link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
      <link rel="stylesheet" href="/common/ssmCss/default.css">
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
      <script src="/common/ssmJs/goCategory.js?ver=1"></script>
      <script src="/common/ssmJs/index.js"></script>
      
      
      <script type="text/javascript">
         function goLogin(){
            $("#loginForm")
            .attr("action","/user/loginCheck.ssm")
            .submit();
         }
      </script>
   </head>
   <body>
   
      <div id="wrap">
      <header include-html="/common/ssmMain/header_.jsp"></header>
         <!-- ��� -->
      
         <!-- ���� -->
         <!-- ȭ�� ������/ �α��� �ڽ�, �б����� -->
         <section>
            <div class="subWrap_1">
               <div id="loginBox">
                  <!-- �α����� -->
                  <form id="loginForm" name="loginForm" method="POST">
                      <ul class="list">
                         <li>
<!--                          <button class="imgBtn" value="A"><img src="include/img/sick.png" alt="������"></button> -->
                            <input type="radio" id="userA" name="userAuthority" value="A" />
                            <span class="wrapRadio">
                               <label for="user01">������</label>
                            </span>
                         </li>
                         <li>
                            <input type="radio" id="userT" name="userAuthority" value="T" />
                            <span class="wrapRadio">
                               <label for="user02">������</label>
                            </span>
                            </li>
                         <li>
                           <input type="radio" id="userS" name="userAuthority" value="S" />
                            <span class="wrapRadio">
                               <label for="user03">�л�</label>
                            </span>
                        </li>
                      </ul>
                      <input type="text" id="loginId" name="userId" placeholder="ID" /><br>
                      <input type="password" id="loginPw" name="userPw" placeholder="PASSWORD" /><br>
                      <a id="loginBtn" href="javascript:goLogin()">LOGIN</a><br>
                      <a href="#">ȸ������</a>
                   </form>
               </div>
               <!-- �б����� -->
               <div id="noticeBox">
                   <h2><a href="/WEB-INF/cg/">�б�����</a></h2>
                   <div class="wrapTit">
                      <ul class="linkList">
                         <li><a href="/link/noticeBoard.ssm"><span class="titleTxt">����1</span></a></li>
                         <li><a href="#"><span class="titleTxt">��zl</span></a></li>
                         <li><a href="#"><span class="titleTxt">0g</span></a></li>
                      </ul>
                   </div>
               </div>
            </div>
            <!-- ȭ�� �߾� �����̹���/ �ϴ� �ܺ� ��ũ -->
            <div class="subWrap_2">
               <div id="mainImg" style="background:url('/include/img/pengpeng.png')">
                  <ul class="mainImgList">
                     <li>
                        <h2>���ѷѷ�</h2>
                        <!-- <img src="include/img/mint.jpg" alt="�����̹���"> -->
                     </li>
                  </ul>
               </div>
               <nav>
                  <div class="navWrap">
                     <div id="outLink">
                        <ul class="etcList">
                            <li><a href="#"><img src="/include/img/link.png"></a></li>
                            <li><a href="#"><img src="/include/img/link.png"></a></li>
                            <li><a href="#"><img src="/include/img/link.png"></a></li>
                            <li><a href="#"><img src="/include/img/link.png"></a></li>
                         </ul>
                     </div>
                  </div>
               </nav>
            </div>
            <!-- ȭ�� ������/ �񱳰�Ȱ��, ����, ��ũ -->
            <div class="subWrap_3">
               <div id="nonSubject">
               <h2><a href="#">�񱳰�Ȱ��</a></h2>
                   <div class="wrapTit">
                      <!-- <ul class="linkList">
                         <li><a href="#"><span class="titleTxt">�񱳰�Ȱ��</span></a></li>
                         <li><a href="#"><span class="titleTxt">Ȱ���ֳ���</span></a></li>
                         <li><a href="#"><span class="titleTxt">Ȱ�����ҷ���</span></a></li>
                      </ul>
                       -->
                   </div>
               </div>
               <div id="schoolLink">
                  <a id="exLink" href="#">��ũ1</a>
                  <a id="school" href="http://bitcamp.co.kr/index.php?main_page=home">��ũ2/ �б�Ȩ������</a>
                  <div id="goVideo">
                     <video autoplay>
                        <source src="   "/>
                     </video>
                  </div>
               </div>
            </div>
         </section>
         <!-- ȭ�� �ϴ� -->
         <footer>
            <div class="footerTxt">
               <hr/>
               <p>
                  �����η�����<br>2019-2020Java142:ProjectSSM
               </p>
            </div>
         </footer>
      </div>
      <script>
      includeHTML();
      </script>
   </body>
</html>