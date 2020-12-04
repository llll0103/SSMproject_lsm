<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,ssm.br.vo.Non_ApplicationVO" %>
<%
	request.setCharacterEncoding("EUC-KR");
	Non_ApplicationVO navo = new Non_ApplicationVO();
	List list =null;
	Object obj = request.getAttribute("list");
	if(obj!=null){
		list = (List)obj;
	}
	String npNo= (String)request.getAttribute("npNo");



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(function(){
					
			});
			function approval(naNo){
				alert("��");
				location.href="/non_Application/approval.ssm?naNo="+naNo;
			}
			function approvalCancel(naNo){
				alert("��");
				location.href="/non_Application/approvalCancel.ssm?naNo="+naNo;
				
			}
		</script>
	</head>
	<body>
		<form>
			<table border='1'>
				<tr>
					<td>�й�</td>
					<td>�̸�</td>
					<td>�̸���</td>
					<td>����</td>
					<td>÷������</td>
					<td>���</td>	
				</tr>
				
				<%if(list.size()!=0){
					for (int i=0;i<list.size();i++){
						navo=(Non_ApplicationVO)list.get(i);
					%>
				<tr>
					<td><%=navo.getSsNo() %></td>
					<td><%=navo.getSsName() %></td>
					<td><%=navo.getSsEmail() %></td>
					<td><%=navo.getNaContents() %></td>
					<td><%=navo.getNaFile() %></td>	
					<%	if(navo.getNaStatus()=="00"){ %>
					<td><input type="button" id="approval" name="approval" value="����" onclick="approval('<%=navo.getNaNo()%>')"></td>
					<%}else{ %>
					<td>
					<input type="button" id="approvalCancel" name="approvalCancel" value="�������" onclick="approvalCancel('<%=navo.getNaNo()%>')">
					</td>
				</tr>
				
				<%	}
					}
				}else{
					
				%>
					<tr>
					<td colspan='5'>��û�� ����� �����ϴ�</td>
					</tr>
				<%
				}
				%>
			</table>
		</form>
	</body>
</html>