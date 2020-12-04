<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
		<title>�¶��λ�� ��û</title>
	</head>
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<link rel="stylesheet" href="/common/ssmCss/css/ssm_base.css">
	<link rel="stylesheet" href="/common/ssmCss/css/ssm_content.css">
    <link rel="stylesheet" href="/common/ssmCss/css/ssm_layout.css">
	
	<script src="/common/ssmJs/index.js"></script>
	<script>

		// ��Ϻ���
		function oaListBtn() {
			location.href = "/onlineApplication/oaBoardList.ssm";
		}
	
		// �Խñ� ����
		function oaInsertBtn() {
			if (confirm("������ �����Ͻðڽ��ϱ�?")) {
				$("#oaInsertForm").attr("action", "/onlineApplication/oaBoardInsert.ssm").submit();
			} 
		} 
		
		$(document).ready(function(){
			$("#ttName").hide();
			$("input:radio[name='ttNo']:input[value='3']").click(function(){
				$("#ttName").show();
			});
		});
		
	</script>
	<style>
		.input{height:15px; padding:1%; border:1px solid #d9d9d9;}
	</style>
	<body>
		<div id="wrap">
			<%@include file="/common/ssmMain/header_.jsp"%>
			<!-- 			<header include-html="/common/ssmMain/header_.jsp"></header> -->
			<div class="subWrap">
				<nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
				<section>
					<div id="tit">
						<h1>�¶��� ��� ��û</h1>
						<p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">���/�˻�</a> 
							> <a href="#�ּҰɱ�" class="on">��� ��û</a>
						</p>
					</div>
					<div class="container">
						<div id="content">
						<br> <br>
							<div id="oaInsert">
								<form id="oaInsertForm" name="oaInsertForm" method="POST"
								enctype="multipart/form-data">
									<table cellpadding="0" cellspacing="0" border="0" class="view_box" style="margin:auto;">
										<colgroup>
											<col width="18%" />
											<col width="35%" />
											<col width="18%" />
											<col width="35%" />
										</colgroup>
										<tr>
											<th>����</th>
											<td>
												<input type="radio" name="ttNo" value="2" />���ӱ��� 
												<input type="radio" name="ttNo" value="3" />��㱳��
												<select id="ttName" name="ttName">
													<option value="ȫ����">ȫ����</option>
													<option value="����">����</option>
												</select>
											</td>
											<th>���о�</th>
											<td id="oaField">
												<input type="radio" name="oaField" value="CAC" />����   
												<input type="radio" name="oaField" value="LIC" />��Ȱ   
												<input type="radio" name="oaField" value="LEC" />�н�  
											</td>
										</tr>
										<tr>
											<th >����</th>
											<td colspan="3"><input class="input" type="text" id="oaTitle"
												name="oaTitle"  style="width:98%; float:left;"/></td>
										</tr>
										<tr>
											<th>��㳻��</th>
											<td colspan="3"><textarea class="input" id="oaContents" name="oaContents" cols="50" 
													rows="10" style="width:98%; height:150px;"></textarea></td>
										</tr>
										<tr>
											<th scope="row">÷������</th>
											<td colspan="3"><input type="file" id="oaFile" name="oaFile" title="÷������ã��"></td>
										</tr>
									</table>
								</form>
								<div class="board_btn">
									<div style="float:right;">
										<a href="#" onclick="oaInsertBtn()" style="">
											<span>����/���</span>
										</a>
										<a href="/onlineApplication/oaBoardList.ssm">
											<span class="back">���</span>
										</a>
										
									</div>
								</div>
								<!--��ư-->
							</div>
							<!-- // div_oaInsert -->
						</div>	
					</div>
				</section>
			</div>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script>
			includeHTML();
		</script>
	</body>
</html>