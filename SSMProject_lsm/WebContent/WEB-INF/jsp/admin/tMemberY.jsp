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
		<title>tMemberY</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
				$("#U, #U2").click(function(){
					console.log("U >>>>> ");
					
					//var ttNo = $("#chAu").parents("tr").attr("data-num");
					//console.log("ttNo>>> : " + ttNo);
					//$("#ttNo").val(ttNo);
					//console.log("ttNo>>> : " + $("#ttNo").val());
					
					
					//var chAuthorityVal =$("#chAuthority").val();
					//console.log("chAuthority>> : "+chAuthorityVal);
					//$("#ttAuthority").val(chAuthorityVal);
					//console.log($("#ttAuthority").val());

					
					//$("#yMember").attr("action","/tMember/updateYTMember.ssm").submit();						
				
					$("#yMember").attr({
						"method":"POST",
						"action":"/tMember/updateYTMember.ssm"
					});
					$("#yMember").submit();	
				
				});	//UŬ��
				
				$("#D, #D2").click(function(){
					var checkL = $("input:checkbox[name=chkInJno]:checked").length
					alert("check�ڽ� ���� ���� >>> : " + checkL);
					if(checkL== 1){
						alert("D >>>>> ");
						$("#ISUD_TYPE").val("D");
						console.log("D >>> " + $("#ISUD_TYPE").val());
						$("#boardList").attr("action","/.ssm").submit();						
					}else{
						alert("���� : �ϳ��� üũ�ڽ��� �����Ͻÿ�");
					}//check�ڽ� if					
				});	//DŬ��
				
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
		<form name="yMember" id="yMember" 
		method ="POST"
		enctype="application/x-www-form-urlencoded">
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
							<input type="hidden" name="ttNo" id="ttNo">												
							<input type="button" value="�ε������ư���" name="index" id="index">
							<input type="button" value="���Ѽ���" id="U">
							<input type="button" value="��������" id="D">	
											
						</td>					
					</tr>
					<tr>
						<td><input type="checkbox" name="chkAll" id="chkAll"></td>
					 	<td>������ȣ</td>
						<td>�̸�</td>
						<td>�������</td>
						<td>����</td>
						<td>����  </td>
						<td>������  </td>
						<td>���̵�</td>
						<td>��й�ȣ</td>
						<td>�� �ٹ��� ���Գ⵵ </td>
						<td>�޴�����ȣ</td>
						<td>�̸���</td>
						<td>ȸ������</td>
						<td>�ۼ���</td>
						<td>������</td> 
					</tr>
				 		
			<% 		for(int i =0; i<aList.size(); i++){  
					TMemberVO tvo = aList.get(i);
					String chNo = "tMemberList["+i+"].ttNo";
					String chAu = "tMemberList["+i+"].ttAuthority";
					System.out.println("getTtAuthority >> : " + tvo.getTtAuthority());
			%>
					<tr>
					    <td align="center">
							<input type="checkbox" name="chkInNo" 
									id="chkInNo"  value=<%=tvo.getTtNo()%>
							 	    onclick="checkOnly(this)">
						</td>
						<td><%=tvo.getTtNo()%></td>
						<td><%=tvo.getTtName()%></td>
						<td><%=tvo.getTtBirth()%></td>
						<td><%=tvo.getTtGender()%></td>
						
						<td><input type="hidden" name="<%=chNo%>" id="<%=chNo%>" value="<%=tvo.getTtNo()%>">
							<select id="<%=chAu%>"  name="<%=chAu%>"  >
								<option value="<%=tvo.getTtAuthority()%>" selected="selected"><%=tvo.getTtAuthority()%></option>							
								<option value="2">���ӱ���</option>
								<option value="3">��㱳��</option>
								<option value="4">������</option>
								
							</select>
							<%if(tvo.getTtAuthority().equals("���ӱ���")){%>
								<br><%=tvo.getTtGrade()%> <%=tvo.getTtClass()%>��
							<%} %></td>
							
						<td><%=tvo.getSjtCode()%></td>	
						<td><%=tvo.getTtId()%></td>	
						<td><%=tvo.getTtPw()%></td>	
						<td><%=tvo.getTtTransferyear()%></td>	
						<td><%=tvo.getTtPn()%></td>	
						<td><%=tvo.getTtEmail()%></td>				
						<td><img src = "/upload/<%=tvo.getTtImage()%>" border=0 width="50" height="50"></td>
						<td><%=tvo.getTtInsertdate()%></td>					
						<td><%=tvo.getTtUpdatedate()%></td>		
					</tr>
					
			<%			} //for��
					} //aList.size if ��
				}//object if ��%>
				</table>	
			</div>
		</form>
	</body>
</html>