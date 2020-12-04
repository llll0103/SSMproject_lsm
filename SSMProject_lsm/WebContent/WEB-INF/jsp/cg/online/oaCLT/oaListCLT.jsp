<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ssm.cg.vo.OnlineApplication_BoardVO"%>
<%@ page import="ssm.mi.vo.TMemberVO"%>
<%@ page import="ssm.mi.vo.SMemberVO"%>
<%
	//String sessionNO = "T8180001";
%>
<%
	Object obj1 = request.getAttribute("oaListCLT"); 
	System.out.println("obj >>> : " +obj1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�¶��λ�� ���ӱ��� 1������</title>
<script src="/include/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
		<link rel="stylesheet" href="/common/ssmCss/s_base.css">
		<link rel="stylesheet" href="/common/ssmCss/s_content.css">
		<link rel="stylesheet" href="/common/ssmCss/s_layout.css">

<script src="/common/ssmJs/index.js"></script>
<script>
	$(document).ready(function() {

		$("a[name='oaCount']").on("click", function(e) {
			fn_openOaDetail($(this));
		});
	});//ready

	function fn_openOaDetail(val) {
		var idx = val.parent().find("#IDX").val();
		//alert("idx>> : " + idx);
		$("#ssNo").val(idx);

		$("#oaListCLT").attr({
			"method" : "POST",
			"action" : "/onlineApplication/ssOaList.ssm"
		});
		$("#oaListCLT").submit();

	}
</script>
</head>
<style>
html, body, div, span, form, img, ul{
	text-align : center;
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    vertical-align: baseline;
}
</style>
<body>

	<div id="wrap">
		<%@include file="/common/ssmMain/header_.jsp"%>
		<div class="subWrap">

			<nav include-html="/common/ssmMain/ssmCategory/cgTsideNav.jsp"></nav>
			<section>
			<div id="tit">
				<h1>�¶��� ����û ����</h1>
				<p>
					<a href="#">Ȩ</a> > <a href="co01.asp">��û/����</a> > <a
						href="co03.asp" class="on">�¶��λ��</a>
				</p>
			</div>
			<div class="container" >
			<div id="content" >
				
					<br> <br><br> <br>

					<form name="oaListCLT" id="oaListCLT" method="POST"
						enctype="application/x-www-form-urlencoded">
					
						<%
							if (obj1 != null){
							ArrayList<OnlineApplication_BoardVO> aList = (ArrayList<OnlineApplication_BoardVO>) obj1;
							
							if (aList.size() == 0){
						%>
						
						<div class="comm_tit" style="margin:auto;">
						<span><h3>
										<%=aList.get(0).getSmemberVO().getSsGrade()%>
										<%=aList.get(0).getSmemberVO().getSsClass()%>�� �¶��λ�� ����Ʈ
									</h3></span>
					</div>
						
						<table cellpadding="0" cellspacing="0" border="0" summary="����" class="list_box mt_5" >
						
							<tr>
								<td>NO DATA</td>
							</tr>
						</table>
						<%
							}else{
						%> 
							<div class="comm_tit" style="margin:auto;">
						<span><h3>
										<%=aList.get(0).getSmemberVO().getSsGrade()%>
										<%=aList.get(0).getSmemberVO().getSsClass()%>�� �¶��λ�� ����Ʈ
									</h3></span>
					</div>
						<table cellpadding="0" cellspacing="0" border="0" summary="����" class="list_box mt_5" style="margin:auto; width:500px;" >
							
							<tr>
								<td colspan="18" align="left"><input type="hidden"
									name="ttNo" id="ttNo" value="<%=sessionNO%>"> <input
									type="hidden" name="ssNo" id="ssNo">


								</td>
							</tr>
							<tr>
	
								<th>�л���ȣ</th>
								<th>�л���</th>
								<th>�ݹ�ȣ</th>
								<th>���Ǽ�</th>
								<th>�ѻ���û�Ǽ�</th>
							</tr>
							<%
								for(int i =0; i<aList.size(); i++){  
									OnlineApplication_BoardVO oavo = aList.get(i);
							%>
							<tr>

								<td><%=oavo.getSmemberVO().getSsNo()%></td>
								<td><%=oavo.getSmemberVO().getSsName()%></td>
								<td><%=oavo.getSmemberVO().getSsNum()%>��</td>
								<td><input type="hidden" id="IDX"
									value="<%=oavo.getSmemberVO().getSsNo()%>" /> <a
									class="oaCount" href="#this" name="oaCount"><%=oavo.getOaCount()%>��</a>
								</td>
								<td><input type="hidden" id="IDX"
									value="<%=oavo.getSmemberVO().getSsNo()%>" /> ��<a
									class="oaCount" href="#this" name="oaCount"><%=oavo.getOaCountall()%>��</a>
							</tr>

							<%
								} //for��
									} //aList.size if ��
								}//object if ��
							%>
						</table>
					</form>
				</div>
			</div>
			</section>
		</div>
		<	<footer include-html="/common/ssmMain/footer.html"></footer> 
	</div>
	<script>
		includeHTML();
	</script>
</body>
</html>