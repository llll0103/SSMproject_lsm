<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ssm.cg.vo.VisitCounsel_RsvVO"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>방문상담 일정조회 및 신청</title>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/default.css">
		<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
		
		<link rel="stylesheet" href="/common/ssmCss/css/ssm_base.css">
	   	<link rel="stylesheet" href="/common/ssmCss/css/ssm_content.css">
	   	<link rel="stylesheet" href="/common/ssmCss/css/ssm_layout.css">
		<script src="/common/ssmJs/index.js"></script>
		<script>
			$(document).ready(function() {
				$("#calendar").show();
				
				// 현재 날짜형식 설정
				var date = new Date();
				var today = moment(date).format('YYYY-MM-DD');
				$("#week").text(today);
			});
		</script>
	</head>
	
	<body>
		<div id="wrap">
			<%@include file="/common/ssmMain/header_.jsp"%>
			<div class="subWrap">
				<nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
				<section>
				<div id="tit">
						<h1>방문상담 일정조회 및 신청 </h1>
						<p><a href="/chwc/index.asp">홈</a> > <a href="#메인주소">상담/검사</a> > <a
							href="#주소걸기" class="on">상담 신청</a>
					</p>
				</div>
				<div class="container">
					<div id="content">
						<div style="text-align:left;">
							<br>
							* <span style="font-weight:bold; color:#fead09;" id="week"></span>부터 4주간의 일정이 조회 됩니다.
						</div>
						<form name="vcSchedule" id="vcSchedule" method="post">
							<table cellpadding="0" cellspacing="0" border="0" class="view_box"
								style="margin: auto;">
								<div id="calendar">
									<div class = "btn btn-primary" data-toggle="modal" data-target="#myModal"> 
										<input type=hidden name="vrDate" id="vrDate"> 
										<input type=hidden name="vrTime" id="vrTime"> 
										<input type=hidden name="ttNo" id="ttNo"> 
										<input type=hidden name="ssNo" id="ssNo" value="<%=sessionNO%>">
									</div>
									<div class="status" style="text-align:left; margin-top:3px;">
										<div class="tbl_btn_1"></div>
										&nbsp;예약가능&nbsp;&nbsp;
										<div class="tbl_btn_2"></div>
										&nbsp;예약불가&nbsp;&nbsp;
									</div>
								</div>
							</table>
						</form>
						<%@include file="vcTimeTable.jspf"%>
						<%@include file="vcModal.jspf"%>
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