<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<title>INDEX ù ������</title>
		<style type="text/css">
		div{
			font: 15px "����";
		}
		
		a{text-decoration: none;}
		#wrap {
			width: 1000px;
			margin: 0 auto 0 auto;
		}
		
		#header {
			text-align: center;
			width: 1000px;
			height: 50px;
			background-color: #FFCA6C;
			padding: 30px 0px;
		}
		
		#main {
			float: left;
			width: 1000px;
			height: 500px;
			background-color: #49BEAA;
			text-align:left;
			vertical-align: middle;
		}
		#footer {
			clear: left;
			width: 1000px;
			height: 60px;
			background-color: #7DFE74;
		}
		</style>
	</head>
	<body> 
	<div id="wrap">
		<div id="header">
		</div>
		<div id="main">
		<br><Br>
			<a href="/onlineApplication/oaBoardList.ssm">�¶��λ�� �л�������</a><br>
			<a href="/onlineApplication/oaListCLT.ssm">�¶��� ��� ���ӱ���������</a><br><br><Br>
			<a href="/visitCounsel/vcSchedule.ssm">�湮��� �л� ����</a><br>
			<a href="/visitCounsel/vcMineList.ssm">�湮��� �л� ������Ȳ</a><br>
		<a href="/eduSchedule/eduRsvList.ssm">�湮��� ����������</a><br><br><br><br><br>
		
			<a href="/admin/insertFormTMember.ssm">[������ ���� �Է�]</a>&nbsp;&nbsp;<br>
			<a href="/admin/listTMemberN.ssm">[������ �̰��Ա��� Ȯ��]</a>&nbsp;&nbsp;<br><!-- �������� -->
			<a href="/admin/listTMemberY.ssm">[������ ���Ա��� ����]</a>&nbsp;&nbsp; <!--������ ȭ�鿡�� ������ ajax --><br><br>
			<a href="/admin/listTMember.ssm">[������ ����������ȸ ��ġ��]</a>&nbsp;&nbsp; <!--������ ȭ�鿡�� ������ ajax --><br><br>
			
			
[���� ȸ������]&nbsp;&nbsp;  <!--�ݼ��ÿ� �ߺ�Ȯ��-->
			
			<!--<a href="/tMember/loginForm.ssm">[T�α���]</a>  ���ǹ޾Ƽ������������ͼ�Ʈ/�α׾ƿ��� header/jstl�ٲٱ�  -->
			<a href="/user/loginForm.ssm">[�α���]</a>
			<br><br>
		<!-- 	<a href="/reserve/reserveDateForm.ssm">[����]</a> -->
			
			
			<br><br>
			<a href="/jsp/cg/cgMain.ssm"/>[cgMain]</a>
					<br><br>
			<a href="/NonCenter/ncList.ssm"/>[����ü����������]</a>
			
			
			<br><br><br>
				<a href="/smember/mainForm.ssm">���ΰ���</a>
	<a href="/smember/approveForm.ssm">������������(���Խ���)</a>
		</div>
	</div>
	</body>
</html>