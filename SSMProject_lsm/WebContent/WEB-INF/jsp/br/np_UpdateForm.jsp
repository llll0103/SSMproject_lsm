<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ssm.br.vo.Non_ProgramVO,ssm.common.utils.BabySession"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%  request.setCharacterEncoding("EUC-KR");
String userAuthoriry = BabySession.getSessionAU(request);
	Object obj = request.getAttribute("list");
	List list = null;
	Non_ProgramVO npvo =null;
	String date1="";
	String date2="";
	String date3="";
	String date4="";
	if(obj!=null){
		list = (List)obj;
		npvo = (Non_ProgramVO)list.get(0);
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpRsdate());
		date1 = new SimpleDateFormat("yyyy-MM-dd").format(date);
		Date date11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpRedate());
		date2 = new SimpleDateFormat("yyyy-MM-dd").format(date11);
		Date date22 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpPsdate());
		date3 = new SimpleDateFormat("yyyy-MM-dd").format(date22);
		Date date33 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(npvo.getNpPedate());
		date4 = new SimpleDateFormat("yyyy-MM-dd").format(date33);
	}
	


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
<script src="/common/ssmJs/goCategory.js?ver=2"></script>
<script src="/common/ssmJs/index.js"></script>
<script type="text/javascript">
			$(function(){
				alert("������Ʈ�� ��������");
				$("#npIo").val("<%=npvo.getNpIo()%>");
				$("#Acode").val("<%=npvo.getAcode()%>");
				if("<%=npvo.getNpObject()%>".indexOf("FM")){
					$("#npObject1").attr("checked","true");
				}
				if("<%=npvo.getNpObject()%>".indexOf("JR")){
					$("#npObject2").attr("checked","true");
				}
				if("<%=npvo.getNpObject()%>".indexOf("SR")){
					$("#npObject3").attr("checked","true");
				}
				$("#update").click(function(){
					if($("#npObject1").is(":checked")){
						if($("#npObject2").is(":checked")){
							if($("#npObject3").is(":checked")){
								npo="FM,JR,SR";
							}else{
								npo="FM,JR";
							}
						}else{
							if($("#npObject3").is(":checked")){
								npo="FM,SR";
							}else{
								npo="FM";
							}
						}	
					}else{
						if($("#npObject2").is(":checked")){
							if($("#npObject3").is(":checked")){
								npo="JR,SR";		
							}else{
								npo="JR";
							}
						}else{
							npo="SR"
						}
					}

					$("#npObject").val(npo);
					alert("�̹���>"+$("#npImage").val());
					$("#detailForm").attr("action","/nonprogram/np_DetailUpdate.ssm").submit()
				})
					
			});
		</script>
</head>
<body>
	<header include-html="/common/ssmMain/header.html"></header>
	<%
	if(userAuthoriry.equals("1")){%>
	<nav include-html="/common/ssmMain/ssmCategory/brSideStudents.html"></nav>
	<%}else if(userAuthoriry.equals("2") || userAuthoriry.equals("3")){%>
	<nav include-html="/common/ssmMain/ssmCategory/brSideTeachers.html"></nav>
	<%
		}
	%>

	<form id="detailForm" name="detailForm" encType="multipart/form-data"
		method="POST">

		<table border='3'>
			<tr>
				<td>���α׷� ����</td>
				<td><input type="text" id="npTitle" name="npTitle"
					value="<%=npvo.getNpTitle() %>"></td>
			</tr>
			<tr>
				<td>���α׷� ����</td>
				<td><input type="text" id="npContents" name="npContents"
					value="<%=npvo.getNpContents() %>"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" id="npCenter" name="npCenter"
					value="<%= npvo.getNpCenter()%>"></td>
			</tr>
			<tr>
				<td>�̹��� ��ü</td>
				<td><input type="file" id="NEW_npImage" name="NEW_npImage">
				</td>
			</tr>
			<tr>
				<td>��������</td>
				<td><input type="text" id="npRsdate" name="npRsdate"
					value="<%=date1%>">~ <input type="text" id="npRedate"
					name="npRedate" value="<%=date2 %>"></td>
			</tr>
			<tr>
				<td>���α׷� ������</td>
				<td><input type="text" id="npPsdate" name="npPsdate"
					value="<%=date3 %>">~ <input type="text" id="npPedate"
					name="npPedate" value="<%=date4 %>"></td>
			</tr>
			<tr>
				<td>��û���</td>
				<td><input type="checkbox" class="2" id="npObject1" name="npObject1" value="FM">1�г� 
				    <input type="checkbox" class="2" id="npObject2" name="npObject2" value="JR">2�г� 
				    <input type="checkbox" class="2" id="npObject3" name="npObject3" value="SR">3�г� 
				    <input type="hidden" id="npObject" name="npObject"/></td>
			</tr>
			<tr>
				<td>�ο�����</td>
				<td><input type="text" id="npPersonnel" name="npPersonnel"
					value="<%=npvo.getNpPersonnel() %>"></td>
			</tr>
			<tr>
				<td>�ۼ���</td>
				<td><%=npvo.getTtName() %></td>
			</tr>
			<tr>
				<td>���� ���</td>
				<td><select id="npIo" name="npIo">
						<option value="I">����</option>
						<option value="O">����</option>
				</select></td>
			</tr>
			<tr>
				<td>Ȱ�� ����</td>
				<td><select id="Acode" name="Acode">
						<option value="SA">����</option>
						<option value="CA">���Ƹ�</option>
						<option value="VA">����</option>
						<option value="DA">����</option>
				</select></td>
			</tr>
			<tr>
				<td colspan='2' align='right'><input type="button" id="update"
					name="update" value="����"></td>
			</tr>
		</table>
		<input type="hidden" id="npImage" name="npImage"
			value="<%= npvo.getNpImage()%>"> <input type="hidden"
			id="npNo" name="npNo" value="<%=npvo.getNpNo()%>">
	</form>

	<script type="text/javascript">
	includeHTML();
	</script>

</body>
</html>