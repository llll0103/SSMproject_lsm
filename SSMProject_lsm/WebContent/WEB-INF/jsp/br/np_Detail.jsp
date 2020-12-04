<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ssm.br.vo.Non_ProgramVO,ssm.common.utils.BabySession"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String userAuthoriry = BabySession.getSessionAU(request);
	Object obj = request.getAttribute("list");
	
	List list = null;
	Non_ProgramVO npvo = null;
	String date1 = "";
	String date2 = "";
	String date3 = "";
	String date4 = "";
	String ob = "";
	String io="";
	String acode="";

	if (obj != null) {
		list = (List) obj;
		npvo = (Non_ProgramVO) list.get(0);
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.parse(npvo.getNpRsdate());
		date1 = new SimpleDateFormat("yyyy-MM-dd").format(date);
		Date date11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.parse(npvo.getNpRedate());
		date2 = new SimpleDateFormat("yyyy-MM-dd").format(date11);
		Date date22 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.parse(npvo.getNpPsdate());
		date3 = new SimpleDateFormat("yyyy-MM-dd").format(date22);
		Date date33 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.parse(npvo.getNpPedate());
		date4 = new SimpleDateFormat("yyyy-MM-dd").format(date33);
		if (npvo.getNpObject().equals("FM"))
			ob = "1�г�";
		if (npvo.getNpObject().equals("JR"))
			ob = "2�г�";
		if (npvo.getNpObject().equals("SR"))
			ob = "3�г�";
		if (npvo.getNpObject().equals("FM,JR"))
			ob = "1�г�,2�г�";
		if (npvo.getNpObject().equals("FM,SR"))
			ob = "1�г�,3�г�";
		if (npvo.getNpObject().equals("JR,SR"))
			ob = "2�г�,3�г�";
		if (npvo.getNpObject().equals("FM,JR,SR"))
			ob = "1�г�,2�г�,3�г�";
		
		if(npvo.getNpIo().equals("I")) io="���� ���";
		if(npvo.getNpIo().equals("O")) io="���� ���";
		if(npvo.getAcode().equals("SA")) acode="����";
		if(npvo.getAcode().equals("CA")) acode="���Ƹ�";
		if(npvo.getAcode().equals("VA")) acode="����";
		if(npvo.getAcode().equals("DA")) acode="����";
		
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>
<style type="text/css">

#modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#modal .modal_content {
	width: 700px;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

.modal_content textarea {
	border : 1px solid #d5d5d5;
	width: 450px;
	height: 250px
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
<link rel="stylesheet" href="/common/ssmCss/npDetail.css">
<link rel="stylesheet" href="/common/ssmCss/npModal.css">
<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
<link rel="stylesheet" href="/common/ssmCss/s_content.css">
<script src="/common/ssmJs/goCategory.js?ver=2"></script>
<script src="/common/ssmJs/index.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		if("<%=userAuthoriry%>"=="1"){
			$("#teacherList").hide();
			$("#update").hide();
			$("#delete").hide();
		}else if("<%=userAuthoriry%>"=="2" || "<%=userAuthoriry%>"=="3"){
			$("#modal_open_btn").hide();
		} // if
		
		$("#modal_open_btn").click(function() {
			//alert("��");
			$("#modal").fadeIn(300); // ���â �����ֱ�
		});

		// ��� â �ȿ� �ִ� Ȯ�� ��ư�� �̺�Ʈ �ɱ�
		$("#modal_closd_btn").click(function() {
			//alert("��");
			$("#modal").fadeOut(300); // ���â �����ֱ�
		});

		$("#insert").click(function() {
					//alert("Ŭ��");
					$("#modalForm").attr("action",
							"/non_Application/non_ApplicationInsert.ssm")
							.submit();
		});
	});

	$("#registrationList").click(function() {
			var npNo = location.href = ""
		
	}); // click()

	function goUpdate(npNo) {
		location.href = "/nonprogram/updateForm.ssm?npNo=" + npNo;
	} // goUpdate()
	function goDelete(npNo) {
		location.href = "/nonprogram/np_Delete.ssm?npNo=" + npNo;
	} // goDelete()
	function applicationList(npNo) {
		location.href = "/non_Application/applicationList.ssm?npNo=" + npNo;
	} // applicationList()
	
</script>
</head>
<body>
	<div id="wrap">
		<%@include file= "/common/ssmMain/header_.jsp" %>
		<div class="subWrap">
			<%
					if(userAuthoriry.equals("1")){%>
						<nav include-html="/common/ssmMain/ssmCategory/brSsideNav.html"></nav>
			<%
				}
					else if(userAuthoriry.equals("2") || userAuthoriry.equals("3")){%>
					<nav include-html="/common/ssmMain/ssmCategory/brTsideNav.html"></nav>
			<%
				}
			%>
			<section>
				<div id="tit">
						<h1>���� ��û ���α׷� �󼼺���</h1>
						<p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">�񱳰� ���α׷�</a> > <a
							href="#�ּҰɱ�" class="on">���α׷� ���</a>
					</p>
				</div>
				<div class="container">
				<form id="detailForm" name="detailForm" encType="multipart/form-data" method="POST">
					<div class="contents">
							<div class='subject'><%=npvo.getNpTitle()%></div>
							<!-- ���� -->
							<div class='writer'>
								�ۼ��� :
								<%=npvo.getTtName()%></div>
							<!-- �ۼ��� �������̸� -->
						<div id="npApplication">
							��û�� : <a
								href="/nonprogram/downLoad.ssm?filename=<%=npvo.getNpFile()%>"><%=npvo.getNpFile()%></a>
						</div>
						<div class="img">
<!-- 						width="1000" height="1300" -->
							<img src="/file/<%=npvo.getNpImage()%>">
							<%
								System.out.println("(log)!!!" + npvo.getNpImage());
							%>
						</div>
						<!-- ����!@!$@$!# -->
						<div class="containerTable">
							<!-- 1��°�� -->
							<div class="row">
								<div class="left">
									<h4>�ְ�</h4>
								</div>
		
								<div class="middle1">
									<p><%=npvo.getNpCenter()%></p>
								</div>
		
								<div class="middle2">
									<h4>��û���</h4>
								</div>
								<div class="right">
									<p><%=ob%></p>
								</div>
							</div>
							<!-- 2��°�� -->
							<div class="row">
								<div class="left">
									<h4>��������</h4>
								</div>
		
								<div class="middle1">
									<p><%=date1%>~<%=date2%></p>
								</div>
		
								<div class="middle2">
									<h4>������</h4>
								</div>
								<div class="right">
									<p><%=date3%>~<%=date4%></p>
								</div>
							</div>
							<!-- 3��°�� -->
							<div class="row">
								<div class="left">
									<h4>�ο�����</h4>
								</div>
								<div class="middle1">
									<p><%=npvo.getNpPersonnel()%></p>
								</div>
		
								<div class="middle2">
									<h4>�������</h4>
								</div>
								<div class="right">
									<p><%=io%></p>
								</div>
							</div>
							<!-- 4��°�� -->
							<div class="row">
								<div class="left">
									<h4>Ȱ������</h4>
								</div>
		
								<div class="middle1">
									<p><%=acode%></p>
								</div>
		
								<div class="middle2">
								</div>
								<div class="right">
								</div>
							</div>
							<!-- 4��°�ٳ� -->
						</div>
					</div>
				 <div class="board_btn">
				 	<a href="javascript:applicationList('<%=npvo.getNpNo()%>')" id="teacherList">
				 		<span class="back">��û���</span>
				 	</a>
				 	<a href="javascript:goUpdate('<%=npvo.getNpNo()%>')" id="update" name="update">
				 		<span>����</span>
				 	</a>
				 	<a href="javascript:goDelete('<%=npvo.getNpNo()%>')" id="delete" name="delete">
				 		<span>����</span>
				 	</a>
					<span id="modal_open_btn" name="modal_open_btn">��û�ϱ�</span>
				</div>
			<input type="hidden" id="npNo" name="npNo" value="<%=npvo.getNpNo()%>">
			</form>
			</div>
		</div>
		</section>
		<footer include-html="/common/ssmMain/footer.html"></footer>
	</div>
	<!--���â��  -->
	<div id="modal">
		<div class="modal_content">
			<form id="modalForm" name="modalForm" encType="multipart/form-data"
				method="post">
				<h2>��û�� �ۼ�</h2>
				<table>
					<tr>
						<th>�̸�</th>
						<td><input type="text" id="ssName" name="ssName" value="ee"
							readonly></td>
						<th>�̸���</th>
						<td><input type="text" id="ssEmail" name="ssEmail" value="ee"
							disabled></td>
					</tr>
					<tr>
						<th>��ȭ��ȣ</th>
						<td>010-2285-4579</td>
						<th>���� ���α׷���</th>
						<td>�����ζٱ⼱����ȸ</td>
					</tr>
					<tr>
						<td colspan='4' style="font-size : 13px; text-align : center; color : grey;">* ���������� ���� ������ �� ���� ���� �������ּ���</td>
					</tr>
					<tr>
						<th>��û����</th>
<!-- 						<td colspan='3'><input type="text" id="naContents" -->
<!-- 							name="naContents" style="width: 450px; height: 250px; margin : auto;"></td> -->
							<td colspan='3'><textarea id="naContents" name="naContents"></textarea></td>
					</tr>
					<tr>
						<td colspan='4'><input type="file" id="naFile" name="naFile"></td>
					</tr>
				</table>
				<input
					type="button" class="modal_closd_btn" id="insert" name="insert"
					value="��û">

				<input type="hidden" id="npNo" name="npNo"
					value="<%=npvo.getNpNo()%>"> <input type="hidden"
					id="ssNo" name="ssNo" value="S7180001"> 
				<input
					type="button" class="modal_closd_btn" id="modal_closd_btn" name="modal_closd_btn"
					value="â�ݱ�">
			</form>
		</div>
		<!-- .modal_content -->
	</div>
	<!-- // #modal -->
	<script type="text/javascript">
		includeHTML();
	</script>
</body>
</html>