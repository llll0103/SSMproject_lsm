<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.br.vo.Non_ProgramVO,java.util.List" %>
<%	
	String npNo="";
	Object obj = null;
	Non_ProgramVO npvo = new Non_ProgramVO();
	if((obj=request.getAttribute("npNo"))!=null){
		npNo = (String)request.getAttribute("npNo");
	}
	request.setCharacterEncoding("EUC-KR");
	String resultStr = (String)request.getAttribute("resultStr");
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>��� ȭ��</title>
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				if("<%=resultStr%>" != ""){
					if("${resultStr}".indexOf("����")>-1){
						alert("����");
						if("${resultStr}".indexOf("���ۼ�")>-1) location.href="/nonprogram/np_Main.ssm";
						if("${resultStr}".indexOf("������Ʈ")>-1) location.href="/nonprogram/np_detailData.ssm?npNo=<%=npNo%>";
						if("${resultStr}".indexOf("np���� ����")>-1) location.href="/nonprogram/np_Main.ssm";
						if("${resultStr}".indexOf("��û���ۼ�")>-1) location.href="/nonprogram/np_Main.ssm";
						if("${resultStr}".indexOf("������")>-1) location.href="/non_Application/non_ApplicationList.ssm";
						if("${resultStr}".indexOf("��û������")>-1) location.href="/non_Application/non_ApplicationList.ssm";
						if("${resultStr}".indexOf("������ �Խ�")>-1) location.href="/Non_Video/VideoMain.ssm";
						if("${resultStr}".indexOf("������ ����")>-1) location.href="/Non_Video/VideoMain.ssm";
						if("${resultStr}".indexOf("������ ����")>-1) location.href="/Non_Video/VideoMain.ssm";
					}else{
						alert("<%=resultStr%>");
						history.go(-1);
						
						
					}
					
					
				}
				
				
			});

		</script>
	</head>
	<body>
		<form name="def" id="def" method='POST'>

		</form>
	</body>
</html>