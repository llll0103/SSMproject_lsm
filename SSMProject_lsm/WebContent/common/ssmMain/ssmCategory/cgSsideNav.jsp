<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.common.utils.BabySession" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<%
	
	String sessionAU = BabySession.getSessionAU(request);
	String sessionID = BabySession.getSessionID(request);
	String sessionNO = BabySession.getSessionNO(request);
	if(sessionAU == null){
		sessionAU = "";
	}
	String you ="";
	if(sessionAU.equals("1")){
		you="�л�";
	}
	if(sessionAU.equals("2")){
		you="������";
	}
%>
</head>

<body>
	<div class="wrapSide">
<!-- 					<div class="menuTit"><h2>���â��</h2></div> -->
	<div id="sideLink">
		<div id="userImg">
			<img src="/file/G1.gif" alt="�����">
		</div>
		<div id="goMypage">
			<ul class="userLink">	
				<li>
					<a href="#">����������</a>
				</li>
				<li>
					<a href="/user/logout.ssm">�α׾ƿ�</a>
				</li>
			</ul>
		</div>
		<div id="sideDiv">
			<ul class="sideList">
				<li class="i"><a href="#">�湮���</a></li>
				<ul class="subList">
					<li><a href="/visitCounsel/vcSchedule.ssm">> ����û</a></li>	
					<li><a href="/visitCounsel/vcMineList.ssm">> ��㳻�� �� ����</a></li>	
				</ul>	
				<li class="i"><a href="/onlineApplication/oaBoardList.ssm">�¶��λ��</a></li>
				<ul class="subList">
					<li><a href="/onlineApplication/oaInsertForm.ssm">> ����û</a></li>	
					<li><a href="/onlineApplication/oaBoardList.ssm">> ��㳻�� �� ����</a></li>	
				</ul>			
			</ul>
		</div>
	</div>
</div>
</body>
</html>