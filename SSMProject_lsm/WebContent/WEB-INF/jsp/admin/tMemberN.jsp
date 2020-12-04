<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import= "ssm.common.utils.FilePath" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>tMemberN</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<%--<link href="/include/css/bulma.css" rel="stylesheet"/>
		<link href="/include/css/bulma.min.css" rel="stylesheet"/> --%>
		<script type="text/javascript">
		$(document).ready(function(){				
			$("#index").click(function(){
				alert("INDEX�� >>>");
				location.href="/default.jsp";
			});
			$("#I").click(function(){
				alert("�����ϰ��� >>>");
				location.href="/tMember/insertFormTMember.ssm";
			});
		});
		</script>
	</head>
	<body>
		<form name="mvcMember" id="mvcMember" action="/babyServlet/mvc/joinSelectAll.jsp" 
		method ="POST"
		enctype="multipart/form-data">
		<% 

		Object obj1 = request.getAttribute("tmemberList"); 
		System.out.println("obj1 >>> : " +obj1);
				
		if (obj1 != null){
			ArrayList<TMemberVO> aList = (ArrayList<TMemberVO>) obj1;
			if (aList.size() == 0){
	
			%>	
			<div class="table-container">
 				 <table class="table">
				<tr>
					<td>NO DATA</td>
				</tr>
			</table>
			</div>			
			<% 		
	 		}else{
			%>
			<div class="table-container">
 				 <table class="table is-bordered is-striped is-narrow is-hoverable" >
				<tr>
					<td colspan="18" align="center"><h3>�̰��� ����ȸ������  </h3></td>
				</tr>	
				<tr>
					<td colspan="18" align="left">	
						<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE">												
						<input type="button" value="�ε������ư���" name="index" id="index">
						<input type="button" value="������" id="I">
						<input type="button" value="��������" id="U">
						<input type="button" value="��������" id="D">					
					</td>					
				</tr>
				<tr>
					<td><input type="checkbox" name="chkAll" id="chkAll"></td>
				 	<td>������ȣ</td>
					<td>�̸�</td>
					<td>�������</td>
					<td>����</td>
					<td>�� �ٹ��� ���Գ⵵ </td>
					<td>�޴�����ȣ</td>
					<td>������ ������</td>
				</tr>
			 		
		<% 		for(int i =0; i<aList.size(); i++){  
				TMemberVO tvo = aList.get(i);
		%>
				<tr>
				    <td align="center">
						<input type="checkbox" name="chkInJno" 
								id="chkInJno"  value=<%=tvo.getTtNo()%>
						 	    onclick="checkOnly(this)">
					</td>
					<td><%=tvo.getTtNo()%></td>
					<td><%=tvo.getTtName()%></td>
					<td><%=tvo.getTtBirth()%></td>
					<td><%=tvo.getTtGender()%></td>
					<td><%=tvo.getTtTransferyear()%></td>	
					<td><%=tvo.getTtPn()%></td>			
					<td><%=tvo.getTtAdmindate()%></td>
	
				</tr>
				
		<%			} //for��
				} //aList.size if ��
			}//object if ��%>
			</table>	
			</div>
		</form>
	</body>
</html>