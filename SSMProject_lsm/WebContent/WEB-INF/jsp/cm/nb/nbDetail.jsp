<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.NoticeBoardVO" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>�� �� ����</title>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
 	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		var butChk =0; //������ư�� ������ư�� �����ϱ� ���� ����
		$(function(){
			$("#pwdChk").hide();
			
			
			/*���� ��ư Ŭ���� ó�� �̺�Ʈ*/
			$("#updatebutton").click(function(){
				$("#pwdChk").show();
				$("#buttons").hide();
				$("#msg").text("��й�ȣ�� �Է��ϼ���").css("color","#000099");
				butChk=1;
			});
			
			//��ҹ�ư
			$("#cancelBut").click(function(){
				$("#pwdChk").hide();
				$("#buttons").show();
			});
			
			/*���� ��ư Ŭ���� ó�� �̺�Ʈ*/
			$("#deletebutton").click(function(){
				$("#pwdChk").show();
				$("#buttons").hide();
				$("#msg").text("��й�ȣ�� �Է��ϼ���").css("color","#000099");
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
					url:"/noticeboard/pwdConfirm.ssm",
					type:"POST",
					data:$("#pwcheckform").serialize(),
					error:function(){
						alert('�ý��� �����Դϴ� �����ڿ��� �����ϼ���');
					},
					success:function(resultData){
						var goUrl="";
						if(resultData ==0){
							$("#msg").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.").css("color","red");
						}else if(resultData ==1){ //��ġ�� ���
							$("#msg").text("");
							if(butChk==1){
								goUrl="/noticeboard/nbupdateForm.ssm";
							}else if(butChk==2){
								goUrl="/noticeboard/nbDelete.ssm";
							}
							$("#f_data").attr("action",goUrl);
							$("#f_data").submit();
						}
					}
				});	
				
		
		}
		
		/* �л���ȣ�������� ����, ������ư�� ���ܶ� (����)
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
			<header include-html="/common/ssmMain/header_.jsp?ver=1"></header>
			<nav include-html="/common/ssmMain/ssmCategory/cmwrapSide.html"></nav>
			<section>
				<div class="container">
	<%
	NoticeBoardVO nvo =(NoticeBoardVO)request.getAttribute("nbdetail");
	String NbFile=nvo.getNbFile();
	NbFile = NbFile.substring(10);
	%>
	<h3>�ۻ�</h3>
	<form name="f_data" id="f_data" method="POST">
		<input type="hidden" id="nbNo" name="nbNo" value="<%=nvo.getNbNo() %>" />
		<input type="hidden" name="nbfile" value="<%=nvo.getNbFile() %>" />
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
					<td><%=nvo.gettMembervo().getTtName() %></td>
					<td>�ۼ���:<%=nvo.getNbInsertdate() %></td>
					<td>������:<%=nvo.getNbUpdatedate() %></td>
				</tr>
				<tr>
					<td>����</td>
					<td colspan="3"><%=nvo.getNbTitle() %></td>
				</tr>
				<tr>
					<td>÷������</td>
					<td colspan="3">
					<%
					if(NbFile.equals("null")){
					%>
					÷������ �����ϴ�.</td>
					<%
					}else{
					%>
					<p><%=NbFile%>&nbsp;&nbsp;&nbsp;<a href="/noticeboard/nbDownload.ssm?file=<%=NbFile%>">�ٿ�ε�</a></p></td>
					<%	
					}
					%>
				</tr>
				<tr height="300px">
					<td>����</td>
					<td colspan="3" ><%=nvo.getNbContents() %></td>
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
						<input type="hidden" name="nbNo" id="nbNo" value="<%=nvo.getNbNo()%>"/>
						<input type="button" name="pwdBut" id="pwdBut" value="Ȯ��" />
						<input type="button" name="cancelBut" id="cancelBut" value="���" />
						
						<span id="msg"></span>
					</form>
				</div>
			</td>
			<td>
				<div id ="buttons">
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