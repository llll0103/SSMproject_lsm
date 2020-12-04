<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.common.utils.BabySession" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String userAuthoriry = BabySession.getSessionAU(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�񱳰� ���α׷� �Խ���</title>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
     <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
		<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
		<script>
		$(function() {
			var npo = "";
			$("#insert").click(function(){
				if(1==1){
					alert("���´�");
					
				}
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
				alert($("#npObject").val());
				
				
				
				$("#npInfo").attr("action","/nonprogram/np_InsertData.ssm").submit();
			});
			$("#npRsdate").datepicker({
				  dateFormat: 'yy-mm-dd',
				  prevText: '���� ��',
				  nextText: '���� ��',
				  monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
				  monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
				  dayNames: ['��','��','ȭ','��','��','��','��'],
				  dayNamesShort: ['��','��','ȭ','��','��','��','��'],
				  dayNamesMin: ['��','��','ȭ','��','��','��','��'],
				  showMonthAfterYear: true,
				  changeMonth: true,
				  changeYear: true,
				  yearSuffix: '��'
			});
			
			
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
	<div id="tit">
				<h1>�񱳰� ���α׷�</h1>
				<p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">�񱳰� ���α׷�</a> > <a
					href="#�ּҰɱ�" class="on">���α׷� �۾���</a>
				</p>
			</div>
		<form id="npInfo" name="npInfo"  encType="multipart/form-data" method="POST">
			<table border='3'>
				<tr>
					<td>���α׷� ����</td>
					<td><input type="text" id="npTitle" name="npTitle"></td>
				</tr>
					<tr>
					<td>���α׷� ����</td>
					<td><input type="text" id="npContents" name="npContents"></td>
				</tr>
					<tr>
					<td>����</td>
					<td><input type="text" id="npCenter" name="npCenter"></td>
				</tr>
					<tr>
					<td>������ ÷��</td>
					<td><input type="file" id="npImage" name="npImage"><td>
				</tr>
					<tr>
					<td>��������</td>
					<td><input type="text" id="npRsdate" name="npRsdate">~
						<input type="text" id="npRedate" name="npRedate"></td>
				</tr>
					<tr>
					<td>���α׷� ������</td>
					<td><input type="text" id="npPsdate" name="npPsdate">~
						<input type="text" id="npPedate" name="npPedate"></td>
				</tr>
					<tr>
					<td>��û���</td>
					<td>
						<input type="checkbox" class="2" id="npObject1" name="npObject1" value="FM">1�г�
						<input type="checkbox" class="2" id="npObject2" name="npObject2" value="JR">2�г�
						<input type="checkbox" class="2" id="npObject3" name="npObject3" value="SR">3�г�
						<input type="hidden" id="npObject" />
					</td>
				</tr>
					<tr>
					<td>�ο�����</td>
					<td><input type="text" id="npPersonnel" name="npPersonnel"></td>
				</tr>
					<tr>
					<td>�ۼ���</td>
					<td></td>
				</tr>
					<tr>
					<td>���� ���</td>
					<td><select id="npIo" name="npIo">
						<option value="I">����</option>
						<option value="O">����</option>
						</select>
					</td>
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
				<td>��û�� ���</td>
				<td><input type="file" id="npFile" name="npFile" ></td>
				</tr>
				<tr>
				<td colspan='2' align='right'>
				<input type="button" id="insert" name="insert" value="�Խ��ϱ�" >
				</td>		
				</tr>
			</table>
		</form>
		
			<script type="text/javascript">
	includeHTML();
	</script>
		
	</body>
</html>