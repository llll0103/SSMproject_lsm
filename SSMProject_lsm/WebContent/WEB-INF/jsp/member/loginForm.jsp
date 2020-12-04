<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.BabySession" %>
<% request.setCharacterEncoding("EUC-KR"); 
	Object obj = request.getAttribute("alert");
	String alertt ="";
	if(obj != null){
		alertt = (String)obj;
	}
	String sessionID = BabySession.getSessionID(request);
	if(sessionID == null){
		sessionID = "";
	}
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>mainForm.jsp</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				if("<%=alertt%>".length > 0){
					alert("<%=alertt%>");
				}
				if("<%=sessionID%>".length > 0 && "<%=sessionID%>" != "" ){
					$("#table1").hide();
					$("#table2").show();
				}else{
					$("#table2").hide();
					$("#table1").show();
				}
				$("#join").click(function(){
					$("#loginform")
					.attr("action","/user/joinCheckForm.ssm")
					.submit();
				});
				$("#login").click(function(){
					if($("input[name='userAuthority']:checked").val() == null){
						alert("������ �������ּ���.");
					}else{
						alert("login");
						$("#loginform").attr("action","/user/loginCheck.ssm").submit();
					}
				});
				
				$("#logout").click(function(){
					$("form").attr("action","/user/logout.ssm").submit();
				});
			});
			
			
		</script>
	</head>
	<body>
		<form id="loginform" name="loginform" method="post">
			<div id="table1">
				<table border="1" align="center">
					<tr>
						<td colspan="2">
							<input type="radio" name="userAuthority" id="userAuthorityS" value="S">�л�
							<input type="radio" name="userAuthority" id="userAuthorityT" value="T">������
							<input type="radio" name="userAuthority" id="userAuthorityA" value="A">������
						</td>
					</tr>
					<tr>
						<th>ID : </th><td><input type="text" id="userId" name="userId" placeholder="ID"></td>
					</tr>
					<tr>
						<th>PW : </th><td><input type="password" id=userPw name="userPw" placeholder="Password"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" name="login" id="login" value="�α���">
							<input type="button" name="join" id="join" value="ȸ������">
						</td>
					</tr>
				</table>
			</div>
		</form>
		<form name="form" id="form" method="post">
			<div id="table2">
				<table border="1" align="center">
					<tr>
						<td><%=sessionID%>��</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="��ư��ư">
							<input type="button" value="��ư��ư">
							<input type="button" id="logout" name="logout" value="�α׾ƿ�">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</body>
</html>