<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.BabySession" %>
<%
	request.setCharacterEncoding("EUC-KR");
	Object obj  = request.getAttribute("dataS");
	Object obj2 = request.getAttribute("dataT");
	String no = "";
	String na = "";
	String id = "";
	String au = "";
	String date = "";
	
	if(obj != null){
		SMemberVO svo = (SMemberVO)obj;
		no = svo.getSsNo();
		na = svo.getSsName();
		id = svo.getSsId();
		date = svo.getSsUpdatedate();
	}
	if(obj2 != null){
		TMemberVO tvo = (TMemberVO)obj;
		no = tvo.getTtNo();
		na = tvo.getTtName();
		id = tvo.getTtId();
		date = tvo.getTtUpdatedate();
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#m").click(function(){
					location.href = "/smember/mainForm.ssm";
				});
			});
		</script>
	</head>
	<body>
		<form action="">
			<table border="1" align="center">
				<tr>
					<th align="center" colspan="8">���Խ��� ������Դϴ�.</th>
				</tr>
				<tr>
					<td>��ȣ : <%=no %></td>
					<td>�̸� : <%=na %></td>
					<td>���̵� : <%=id %></td>
					<td>������ : <%=date %></td>
				</tr>
				<tr>
					<td align="center" colspan="8">
						<input type="button" id="m" name="m" value="��������">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>