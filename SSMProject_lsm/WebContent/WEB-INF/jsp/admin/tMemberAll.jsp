<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import= "ssm.common.utils.FilePath" %>
<% 
		Object obj1 = request.getAttribute("tmemberList"); 
		System.out.println("obj >>> : " +obj1);
		String result="";
		
		result = (String)request.getAttribute("result");
		if(result != null){
		
			System.out.println("result >>> : " +result);
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>	
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				var result = "<%=result%>";
				if (result!=""){
					console.log(result);
				}
				$("#index").click(function(){
					alert("INDEX�� >>>");
					location.href="/default.jsp";
				});

				$("#chkAll").click(function(){
					//Ŭ���Ǿ����� 
					if($("#chkAll").prop("checked")){ //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� true�� ����
						$("input[name=chkInNo]").prop("checked",true); //Ŭ���� �ȵ������� 
					}else{ //input�±��� name�� chk�� �±׵��� ã�Ƽ� checked�ɼ��� false�� ���� 
						$("input[name=chkInNo]").prop("checked",false);
					} 
				});
				
			});
		</script>
	</head>
	
	<body>
		<%@include file="tModal.jsp"%>
		<div id="allMember">
			<!-- �������� �̵� form -->
			<form id="allMember" name="allMember">
		
<%		
		if (obj1 != null){
			ArrayList<TMemberVO> aList = (ArrayList<TMemberVO>) obj1;
			
			if (aList.size() == 0){
	
			%>	
			<div class="table-container">
				<table border="1">
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
						<td colspan="18" align="center"><h3>���� ���� ȸ������  </h3></td>
					</tr>	
					<tr>
						<td colspan="18" align="left">	
																	
							<input type="button" value="�ε������ư���" name="index" id="index">
							<input type="button" value="��������" id="D">	
											
						</td>					
					</tr>
					<tr>
					 	<td>������ȣ</td>
						<td>�̸�</td>
						<td>�������</td>
						<td>����</td>
						<td>����  </td>
					<!-- 	<td>������  </td>
						<td>���̵�</td>
						<td>��й�ȣ</td> -->
						<td>�� �ٹ��� ���Գ⵵ </td>
						<td>�޴�����ȣ</td>
					<!--	<td>�̸���</td>
						<td>ȸ������</td>-->
						<td>�ۼ���</td>
						<td>������</td> 
					</tr>
				 		
			<% 		for(int i =0; i<aList.size(); i++){  
					TMemberVO tvo = aList.get(i);
					String chNo = "tMemberList["+i+"].ttNo";
					String chAu = "tMemberList["+i+"].ttAuthority";
					System.out.println("getTtAuthority >> : " + tvo.getTtAuthority());
			%>
					<tr ttNo="<%=tvo.getTtNo()%>">
					
						<td class="goDetail"><%=tvo.getTtNo()%></td>
						<td class="goDetail"><%=tvo.getTtName()%></td>
						<td class="goDetail"><%=tvo.getTtBirth()%></td>
						<td class="goDetail"><%=tvo.getTtGender()%></td>
						
						<td class="goDetail"><%=tvo.getTtAuthority()%><br>				
							<%if(tvo.getTtAuthority().equals("���ӱ���")){%>
								<br><%=tvo.getTtGrade()%> <%=tvo.getTtClass()%>��
							<%} %></td>
							
					<!--  	<td ><%=tvo.getSjtCode()%></td>	
						<td><%=tvo.getTtId()%></td>	
						<td><%=tvo.getTtPw()%></td>	 -->
						<td class="goDetail"><%=tvo.getTtTransferyear()%></td>	
						<td class="goDetail"><%=tvo.getTtPn()%></td>	
					<!-- 	<td><%=tvo.getTtEmail()%></td>				
						<td><img src = "/upload/<%=tvo.getTtImage()%>" border=0 width="50" height="50"></td> -->
						<td class="goDetail"><%=tvo.getTtInsertdate()%></td>					
						<td class="goDetail"><%=tvo.getTtUpdatedate()%></td>		
					</tr>
					
			<%			} //for��
					} //aList.size if ��
				}//object if ��%>
				</table>	
			</div>
			</form>
		</div>
	</body>
</html>