<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.BabySession" %>
<% 
//    request.setCharacterEncoding("EUC-KR"); 
//    Object obj = request.getAttribute("alertssttt");
//    String alertt ="";
//    if(obj != null){
//       alertt = (String)obj;
//    }
//    String sessionAU = BabySession.getSessionAU(request);
//    System.out.println("sessionAU>>>:"+ sessionAU);
//    if(sessionAU == null){
//       sessionAU = "";
//    }
   
// 	Boolean bSession = sessionAU != "";
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>��Ʈ����б�</title>
      <link rel="stylesheet" href="/common/ssmCss/ssmMain.css?ver=1">
      <link rel="stylesheet" href="/common/ssmCss/default.css">
      <link rel="stylesheet" href="/common/ssmCss/css/ssm_layout.css">
      <script src="/include/js/jquery-1.11.3.min.js"></script>   
      <script>
      </script>
   </head>
   <body>
      <div id="wrap">
      	<!-- ��� -->
      	<%@include file= "/common/ssmMain/header_.jsp" %>
<!--       	<header include-html="./common/ssmMain/header_.jsp"></header> -->
         <!-- ���� -->
         <!-- ȭ�� ������/ �α��� �ڽ�, �б����� -->
       	<section>
				<div class="subWrap_1">
					<div id="loginBox">
				<%
					if(!bSession){
				%>
						<!-- �α����� -->
						<form id="loginForm" name="loginForm" method="POST">
					 		<ul class="list">
				 				<li>
						 			<img class="imgBtn" value="A"><img src="/mainImg/a.png" alt="������">
					 				<input type="radio" id="userA" name="userAuthority" value="A" />
					 				<span class="wrapRadio">
					 					<label for="user01">������</label>
					 				</span>
					 			</li>
					 			<li>
						 			<img class="imgBtn" value="A"><img src="/mainImg/t.png" alt="������">
					 				<input type="radio" id="userT" name="userAuthority" value="T" />
					 				<span class="wrapRadio">
					 					<label for="user02">������</label>
					 				</span>
				 				</li>
					 			<li>
					 				<img class="imgBtn" value="A"><img src="/mainImg/s.png" alt="�л�">
									<input type="radio" id="userS" name="userAuthority" value="S" />
					 				<span class="wrapRadio">
					 					<label for="user03">�л�</label>
					 				</span>
								</li>
				 			</ul>
				 			<ul id="loginContents">
				 				<li><input type="text" id="loginId" name="userId" placeholder="ID" /></li>
				 				<li><input type="password" id="loginPw" name="userPw" placeholder="PASSWORD" /></li>
				 				<li><a id="loginBtn" href="javascript:goLogin()">�α���</a></li>
				 			</ul>
					 		<a href="javascript:goJoin()" style="font-size:12px;">ȸ������</a>
					 	</form>
				<%
					} else if(bSession) {
				%>	
						<div id="userBox">
							<form id="userForm">
								<p>�ȳ��ϼ���. <%=sessionID %>��!</p>
								<%if(sessionAU.equals("1")){%>
								<div id="userImg"><img src="/file/G1.gif" alt="�����"></div>	
								<%}%>
								<%if(sessionAU.equals("2")){%>
								<div id="userImg"><img src="/file/T1.png" alt="�����"></div>	
								<%}%>
								<div id="afterLogin">
									<a class="afterLoginBtn" href="/smember/basicInformation.ssm">����������</a>
									<a class="afterLoginBtn" href="javascript:goLogout()">�α׾ƿ�</a>
								</div>
							</form>
						</div>
				<%
					}
				%>
					</div>
					<!-- �б����� -->
					<div id="noticeBox">
				 		<h2><a href="javascript:goCommunity()">�б�����</a></h2>
				 		<hr>
				 		<div class="wrapTit">
				 			<ul class="linkList" id="noticeList">
				 			</ul>
				 		</div>
					</div>
				</div>
				<!-- ȭ�� �߾� �����̹���/ �ϴ� �ܺ� ��ũ -->
				<div class="subWrap_2">
					<div id="mainImg">
						<ul class="mainImgList">
							<li>
								<img src="/mainImg/bitHighMain.png" alt="�����̹���">
							</li>
						</ul>
					</div>
					<nav>
						<div class="navWrap">
							<ul class="etcList">
						 		<li><a href="#"><img src="/mainImg/link1.png"></a></li>
						 		<li><a href="#"><img src="/mainImg/link2.jpeg"></a></li>
						 		<li><a href="#"><img src="/mainImg/link4.png"></a></li>
						 		<li><a href="#"><img src="/mainImg/pengpeng.png"></a></li>
						 	</ul>
						</div>
					</nav>
				</div>
				<!-- ȭ�� ������/ �񱳰�Ȱ��, ����, ��ũ -->
				<div class="subWrap_3">
					<div id="nonSubject">
						<h2><a href="javascript:goBigyogwaRecommend()">�񱳰�Ȱ��</a></h2>
						<hr>
			 			<div class="wrapTit">
		 					<ul class="linkList"  id="programList">
			 				</ul>
			 			</div>
					</div>
					<div id="schoolLink">
						<a id="exLink" href="#" style="background:url('/mainImg/link11.png'); background-size : 100%;"></a>
						<a id="school" href="http://bitcamp.co.kr/index.php?main_page=home" style="background:url('/mainImg/link22.png'); background-size : 100%;"></a>
						<div id="goVideo">
						
							<video controls>
						 		<source id="videoView" type="video/mp4" src="/video/�ݷ�����������.mp4"/>
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
						�ش� �ý����� IE10, ũ�ҿ� ����ȭ�Ǿ��ֽ��ϴ�.<br>2019-2020Java142:ProjectSSM
					</p>
				</div>
			</footer>
		</div>
		<script>
			includeHTML();
		</script>
	</body>
</html>