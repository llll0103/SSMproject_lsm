<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,ssm.br.vo.Non_ApplicationVO,ssm.common.utils.BabySession" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String userAuthoriry = BabySession.getSessionAU(request);
	Non_ApplicationVO navo = new Non_ApplicationVO();
	List list =null;
	Object obj = request.getAttribute("list");
	if(obj!=null){
		list = (List)obj;
	}
	String npNo= (String)request.getAttribute("npNo");



%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
     <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
     <link rel="stylesheet" href="/common/ssmCss/npDetail.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
		<script type="text/javascript">
			$(function(){

			});
			function approval(naNo,npNo){
	
 				location.href="/non_Application/approval.ssm?naNo="+naNo+"&npNo="+npNo;
			}
			function approvalCancel(naNo,npNo){			
 				location.href="/non_Application/approvalCancel.ssm?naNo="+naNo+"&npNo="+npNo;
			}
		</script>
	</head>
	<body>
		<div id="wrap">
			<%@include file= "/common/ssmMain/header_.jsp" %>
			<div class="subWrap"></div>
				<nav include-html="/common/ssmMain/ssmCategory/brTsideNav.html"></nav>
				<section>
				<div id="container">
					<form>
						<table border='1'>
							<tr>
								<td>�й�</td>
								<td>�̸�</td>
								<td>�̸���</td>
								<td>����</td>
								<td>÷������</td>
								<td>���</td>	
							</tr>
							
							<%if(list.size()!=0){
								for (int i=0;i<list.size();i++){
									navo=(Non_ApplicationVO)list.get(i);
								%>
							<tr>
								<td><%=navo.getSsNo() %></td>
								<td><%=navo.getSsName() %></td>
								<td><%=navo.getSsEmail() %></td>
								<td><%=navo.getNaContents() %></td>
								<td><a href="/nonprogram/downLoad.ssm?filename=<%=navo.getNaFile() %>"><%=navo.getNaFile() %></a></td>	
								<%	if(navo.getNaStatus().equals("01")){ %>
								<td><input type="button" id="bb" name="bb" value="����" onclick="approval('<%=navo.getNaNo()%>','<%=npNo%>')"></td>
								<%}else{ %>
								<td>
								<input type="button" id="aa" name="aa" value="�������" onclick="approvalCancel('<%=navo.getNaNo()%>','<%=npNo%>')">
								</td>
							</tr>
							
							<%	}
								}
							}else{
								
							%>
								<tr>
								<td colspan='6'>��û�� ����� �����ϴ�</td>
								</tr>
							<%
							}
							%>
						</table>
					</form>
				</div>
				</section>
			</div>
			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<script type="text/javascript">
			includeHTML();
		</script>
	</body>
</html>