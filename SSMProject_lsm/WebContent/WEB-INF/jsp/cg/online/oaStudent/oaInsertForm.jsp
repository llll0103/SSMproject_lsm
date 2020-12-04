<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
		<title>온라인상담 신청</title>
	</head>
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<link rel="stylesheet" href="/common/ssmCss/css/ssm_base.css">
	<link rel="stylesheet" href="/common/ssmCss/css/ssm_content.css">
    <link rel="stylesheet" href="/common/ssmCss/css/ssm_layout.css">
	
	<script src="/common/ssmJs/index.js"></script>
	<script>

		// 목록보기
		function oaListBtn() {
			location.href = "/onlineApplication/oaBoardList.ssm";
		}
	
		// 게시글 저장
		function oaInsertBtn() {
			if (confirm("상담글을 저장하시겠습니까?")) {
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
						<h1>온라인 상담 신청</h1>
						<p><a href="/chwc/index.asp">홈</a> > <a href="#메인주소">상담/검사</a> 
							> <a href="#주소걸기" class="on">상담 신청</a>
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
											<th>상담사</th>
											<td>
												<input type="radio" name="ttNo" value="2" />담임교사 
												<input type="radio" name="ttNo" value="3" />상담교사
												<select id="ttName" name="ttName">
													<option value="홍은현">홍은현</option>
													<option value="김상담">김상담</option>
												</select>
											</td>
											<th>상담분야</th>
											<td id="oaField">
												<input type="radio" name="oaField" value="CAC" />진로   
												<input type="radio" name="oaField" value="LIC" />생활   
												<input type="radio" name="oaField" value="LEC" />학습  
											</td>
										</tr>
										<tr>
											<th >제목</th>
											<td colspan="3"><input class="input" type="text" id="oaTitle"
												name="oaTitle"  style="width:98%; float:left;"/></td>
										</tr>
										<tr>
											<th>상담내용</th>
											<td colspan="3"><textarea class="input" id="oaContents" name="oaContents" cols="50" 
													rows="10" style="width:98%; height:150px;"></textarea></td>
										</tr>
										<tr>
											<th scope="row">첨부파일</th>
											<td colspan="3"><input type="file" id="oaFile" name="oaFile" title="첨부파일찾기"></td>
										</tr>
									</table>
								</form>
								<div class="board_btn">
									<div style="float:right;">
										<a href="#" onclick="oaInsertBtn()" style="">
											<span>저장/등록</span>
										</a>
										<a href="/onlineApplication/oaBoardList.ssm">
											<span class="back">목록</span>
										</a>
										
									</div>
								</div>
								<!--버튼-->
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