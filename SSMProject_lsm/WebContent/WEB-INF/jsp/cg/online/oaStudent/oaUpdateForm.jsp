<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import = "ssm.cg.controller.OnlineApplication_BoardController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>update</title>
	</head>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<link rel="stylesheet" href="/common/ssmCss/css/ssm_base.css">
	<link rel="stylesheet" href="/common/ssmCss/css/ssm_content.css">
    <link rel="stylesheet" href="/common/ssmCss/css/ssm_layout.css">
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script>
		function oaListBtn(){
				location.href = "/onlineApplication/oaBoardList.ssm";
			} 
			
		function oaUpdateBtn(){if(confirm("������ �����Ͻðڽ��ϱ�?")){
				$("#oaUpdateForm").attr({
					"action":"/onlineApplication/oaBoardUpdate.ssm",
					"method":"post"
				});
				$("#oaUpdateForm").submit();
			} 
		}
	</script>
	<body>
		<div id="wrap">
			<%@include file="/common/ssmMain/header_.jsp"%>
			<div class="subWrap">
				<nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
				<section>
					<div id="tit">
						<h1>�¶��� ����û ����</h1>
						<p>
							<a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">���/�˻�</a> 
							> <a href="#�ּҰɱ�" class="on">�Խù� ����</a>
						</p>
					</div>
					<div class="container">
						<div id="content">
							<br><br>
							<div id="oaUpdate">
								<form id="oaUpdateForm" name="oaUpdateForm">
									<table cellpadding="0" cellspacing="0" border="0" class="view_box" style="margin:auto;">
										<colgroup>
											<col width="10%">
											<col width="40%">
											<col width="10%">
											<col width="40%">
										</colgroup>
										<%
											Object obj = request.getAttribute("oaUpdateList");
											OnlineApplication_BoardVO oaVo = (OnlineApplication_BoardVO)obj;	
											if(obj == null){
										%>
										<tr><td>���õ� ���� �����ϴ�. ������� ���ư�����.</td></tr>
										<%
											} else {
										%>
										<tr>
											<th>��û��ȣ</th>
											<td colspan="3"><%=oaVo.getOaNo()%></td>
										</tr>
										<tr>
											<th>�ۼ���</th>
											<td colspan="3">
												<input type="hidden" id="oaNo" name="oaNo" value="<%= oaVo.getOaNo()%>"><%=oaVo.getSsNo()%>
											</td>
										</tr>
										<tr>
											<th>���о�</th>
											<td>
											<%
												String oaField = oaVo.getOaField();
												System.out.println("(log)oaField : " + oaField);
											%>
												<input type="radio" name="oaField" value="CAC" <%if("CAC".equals(oaField)){%>checked<%}%> />����
												<input type="radio" name="oaField" value="LIC" <%if("LIC".equals(oaField)){%>checked<%}%> />��Ȱ
												<input type="radio" name="oaField" value="LEC" <%if("LEC".equals(oaField)){%>checked<%}%> />�н�
											</td>	
											<th>����</th>
											<td><%=oaVo.getTtNo() %>										</td>
										</tr>
										<tr>
											<th>�������</th>
											<td colspan="3"><input type="text" class="input" id="oaTitle" name="oaTitle" value="<%=oaVo.getOaTitle() %>"  style="width:98%;"></td>
										</tr>
										<tr>
											<th>��㳻��</th>
											<td colspan="3"><textarea class="input" id="oaContents" name="oaContents" style="width:98%; height:150px;"><%=oaVo.getOaContents() %></textarea></td>
										</tr>
										<tr>
											<th>÷������</th>
											<td colspan="3"><input type="file" id="oaFile" name="oaFile" /></td>
										</tr>	
									</table>
									<%
										}
									%>
								</form>
								<div class="board_btn">
									<a href="#" onclick="oaUpdateBtn()"><span>����</span></a>
									<a><span class="back" onclick="oaListBtn()">���</span></a>
								</div>
							</div>
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