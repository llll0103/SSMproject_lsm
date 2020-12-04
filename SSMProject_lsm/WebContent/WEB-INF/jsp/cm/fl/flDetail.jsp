<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.FamilyLetterVO" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>�� �� ����</title>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js?ver=1"></script>
 	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		var butChk =0; //������ư�� ������ư�� �����ϱ� ���� ����
		$(function(){
			$("#pwdChk").hide();
			
			
			/*���� ��ư Ŭ���� ó�� �̺�Ʈ*/
			$("#updatebutton").click(function(){
				$("#pwdChk").show();
				$("#buttons").hide();
				$("#msg").text("�ۼ��� �Է��� �����ȣ�� �Է��� �ּ���").css("color","#000099");
				butChk=1;
			});
			
			$("#cancelBut").click(function(){
				$("#pwdChk").hide();
				$("#buttons").show();
			});
			
			/*���� ��ư Ŭ���� ó�� �̺�Ʈ*/
			$("#deletebutton").click(function(){
				$("#pwdChk").show();
				$("#buttons").hide();
				$("#msg").text("�ۼ��� �Է��� �����ȣ�� �Է��� �ּ���").css("color","#000099");
				butChk=2;
			});
			

			/* ��й�ȣ Ȯ�� ��ư Ŭ�� �� ó�� �̺�Ʈ*/
			$("#pwdBut").click(function(){
				pwdConfirm();
			});
			
		});//end of ���
		
		/* ��й�ȣ Ȯ�� ��ư Ŭ���� �������� ó�� �Լ�*/
		
		function pwdConfirm(){
			
				$.ajax({
					url:"/familyletter/pwdConfirm.ssm",
					type:"POST",
					data:$("#pwcheckform").serialize(),
					error:function(){
						alert('�ý��� �����Դϴ� �����ڿ��� �����ϼ���');
					},
					success:function(resultData){
						var goUrl="";
						if(resultData ==0){
							$("#msg").text("�ۼ��� �Է��� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.").css("color","red");
						}else if(resultData ==1){ //��ġ�� ���
							$("#msg").text("");
							if(butChk==1){
								goUrl="/familyletter/flupdateForm.ssm";
							}else if(butChk==2){
								goUrl="/familyletter/flDelete.ssm";
							}
							$("#f_data").attr("action",goUrl);
							$("#f_data").submit();
						}
					}
				});	
				
		
		}
		
		/* �л���ȣ�������� �۾����ư�� ���ܶ� (����)
		var ssno = "S7180001"; */
		if(ssno != "null" && ssno != ""){
			$("#buttons").hide();
		}
	</script>
	
	<style>
		html, body {
			  margin: 0;
			  padding: 0;
			  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
			  font-size: 4px;
			}
			
			table  {
				width : 500px;
				text-align : center;
				margin : auto;
			}
			
			.list
			{
				width : 500px;
				text-align : left;
				margin : auto;
			}	
	</style>
	
</head>
<body>
<div id="wrap">
			<header include-html="/common/ssmMain/header.html?ver=1"></header>
			<nav include-html="/common/ssmMain/ssmCategory/cmwrapSide.html"></nav>
			<section>
				<div class="container">
	<div id="boardContainer">
	<%
	FamilyLetterVO fvo =(FamilyLetterVO)request.getAttribute("fldetail");
	String flFile=fvo.getFlFile();
	System.out.println(flFile);
	flFile = flFile.substring(10);
	%>
	<h3>�ۻ�</h3>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" id="flNo" name="flNo" value="<%=fvo.getFlNo() %>" />
		<input type="hidden" name="flfile" value="<%=fvo.getFlFile() %>" />
	</form>
	
	<%-- ========================��й�ȣ Ȯ�� ��ư �� ��ư �߰� ���� ================================ --%>
	
	<%-- ======================�� ���� �����ֱ� ���� ========================================== --%>
	<div id="boardDetail">
		<table border="1">
			<colgroup>
				<col width="100px" />
				<col width="100px" />
				<col width="300px" />
				<col width="300px" />
				</colgroup>
			<tbody>
				<tr>
					<td>�ۼ���</td>
					<td><%=fvo.gettMembervo().getTtName() %></td>
					<td>�ۼ���:<%=fvo.getFlInsertdate() %></td>
					<td>������:<%=fvo.getFlUpdatedate() %></td>
				</tr>
				<tr>
					<td>����</td>
					<td colspan="3"><%=fvo.getFlTitle() %></td>
				</tr>
				<tr>
					<td>÷������</td>
					<td colspan="3">
					<%
					if(flFile.equals("null")){
					%>
					÷������ �����ϴ�.</td>
					<%
					}else{
					%>
					<p><%=flFile%>&nbsp;&nbsp;&nbsp;<a href="/familyletter/flDownload.ssm?file=<%=flFile%>">�ٿ�ε�</a></p></td>
					<%	
					}
					%>
				</tr>
				<tr height="300px">
					<td>����</td>
					<td colspan="3" ><%=fvo.getFlContents() %></td>
				</tr>
			</tbody>
		</table>
	</div>
	<%-- ======================�� ���� �����ֱ� ���� ========================================== --%>
	<%--===============================��й�ȣ Ȯ�� ��ư �� ��ư �߰� ����======================== --%>
	<table id="boardPwdBut">
		<tr>
			<td>
				<div id="pwdChk">
					<form name="pwcheckform" id="pwcheckform">
						<label for="ttpw" id="l_pwd">��й�ȣ : </label>
						<input type="password" name="ttPw" id="ttPw" />
						<input type="hidden" name="flNo" id="flNo" value="<%=fvo.getFlNo()%>"/>
						<input type="button" name="pwdBut" id="pwdBut" value="Ȯ��" />
						<input type="button" name="cancelBut" id="cancelBut" value="���" />
						
						<span id="msg"></span>
					</form>
				</div>
			</td>
			<td>
				<div id="buttons">
					<input type="button" value="����" id="updatebutton">
					<input type="button" value="����" id="deletebutton">
				</div>	
			</td>
		</tr>
	</table>
	</div>
			</section>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script>
			includeHTML();
		</script>	
</body>
</html>