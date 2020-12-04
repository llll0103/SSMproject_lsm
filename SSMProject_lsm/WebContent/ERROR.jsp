<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>비트고등학교</title>
	</head>
	<link rel="stylesheet" href="/common/ssmCss/ssmMain.css?ver=1">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
    <link rel="stylesheet" href="/common/ssmCss/css/ssm_layout.css">
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<script>
		function windowOnload(){
			setTimeout('moveError()', 3000);
		}
		
		function moveError(){
			location.href = "/main_1.jsp"
		}
	</script>
	<style>
		#error {
			margin : 10% auto;
			width : 50%;
			color : red !important;
			font-weight : bold;
		}
		
		.subWrap {
			background: #2b475e;
			padding : 10% 0;
		}
		
	</style>
	<body onload="javascript:windowOnload();">
		<div id="wrap">
			<%@include file= "/common/ssmMain/header_.jsp" %>
			<section>
					<div class="subWrap">
						<div id="error">
			<%
						if(sessionAU != null && sessionAU != "") {
			%>
							<p>문제가 발생하였습니다. 메인화면으로 이동중...</p>
			<% 		
						} else {
			%>
							<p>로그인 시간이 만료되었습니다. 메인화면으로 이동중...</p>			
			<%
						}
			%>
					</div>
				</div>
			</section>
		</div>
	</body>
</html>