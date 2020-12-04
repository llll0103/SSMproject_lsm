<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ssm.cg.vo.OnlineApplication_BoardVO"%>
<%@ page import="ssm.mi.vo.TMemberVO"%>
<%@ page import="ssm.mi.vo.SMemberVO"%>
<%
	request.setCharacterEncoding("EUC-KR");
		Object dataObj = request.getAttribute("data");
		OnlineApplication_BoardVO oa_Vo = (OnlineApplication_BoardVO)dataObj;
		Object ssNo = request.getAttribute("ssNo");
		Object commentCnt = request.getAttribute("commentCnt");
		
		String SessionAU = BabySession.getSessionAU(request);
      	String SessionID = BabySession.getSessionID(request);
      	String SessionNO = BabySession.getSessionNO(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>��㳻�� �� ����</title>
	</head>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<link rel="stylesheet" href="/common/ssmCss/css/ssm_base.css">
	<link rel="stylesheet" href="/common/ssmCss/css/ssm_content.css">
    <link rel="stylesheet" href="/common/ssmCss/css/ssm_layout.css">
	<script src="/common/ssmJs/index.js"></script>
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<script>
		function oaInsertBtn(){
			location.href = "/onlineApplication/oaInsertForm.ssm";
		}
		function oaListBtn(){
			location.href = "/onlineApplication/oaBoardList.ssm";
		}
			
		$(document).ready(function(){
			// �˻� ���濡 ����
			<%if(oa_Vo.getKeyword() != "" && oa_Vo.getKeyword() != null){%>
				$("#keyword").val("<%=oa_Vo.getKeyword()%>");
				$("#search").val("<%=oa_Vo.getSearch()%>");
			<%}%>
			
			// �˻���ư Ŭ��
			$("#oaSearchBtn").click(function() {
				goPage(1);
			});

			// ���� Ŭ�� �� ���������� �̵�
			$(".goDetail").click(function() {
				var oaNo = $(this).parents("tr").attr("dataNo");
				console.log("(log)no : " + oaNo);
				$("#oaNo").val(oaNo);
				$("#goDetailForm").attr({
					"method" : "post",
					"action" : "/onlineApplication/oaDetailForm.ssm"
				});
				$("#goDetailForm").submit();
			});
		}); // ready()

		// ���Ĺ�ư Ŭ��
		function setOrder() {
			if ($("#orderSc").val() == 'DESC') {
				$("#orderSc").val('ASC');
			} else {
				$("#orderSc").val('DESC');
			}
			goPage(1);
		}

		// �˻��� ����¡�� ���� ������ ó���Լ�
		function goPage(page) {
			$("#page").val(page);
			$("#oaSearchForm").attr({
				"method" : "get",
				"action" : "/onlineApplication/oaBoardList.ssm"
			});
			$("#oaSearchForm").submit();
		}
	</script>
	<style>
		.board_btn {
			text-align: end;
		}
	</style>
	<body>
		<div id="wrap">
			<%@include file="/common/ssmMain/header_.jsp"%>
			<div class="subWrap">
				<nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
				<section>
					<div id="tit">
						<h1>���� �¶��� ��� ���</h1>
						<p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">���/�˻�</a> > <a
						href="#�ּҰɱ�" class="on">�¶��λ��</a>
						</p>
					</div>
					<div class="container">
						<div id="content">
							<div class="mt_10">
								<div class="detail_list">
									<ul>
										<li>* ����� ������ �̸��Ϸ� Ȯ�� �� �� �ֽ��ϴ�.</li>
										<li>��� ������ ����� ó�� �˴ϴ�.</li>
									</ul>
								</div>
							</div>
							<form id="oaSearchForm" name="oaSearchForm" action="">
								<input type="hidden" id="page" name="page" value=<%=oa_Vo.getPage()%> /> 
<%-- 								<input type="hidden" id="orderBy" name="orderBy" value=<%=oa_Vo.getOaNo()%> />  --%>
								<input type="hidden" id="orderSc" name="orderSc" value="<%=oa_Vo.getOrderSc()%>" />
								<table class="search_box_app mt_20" id="content01">
									<colgroup>
										<col width="9%" />
										<col width="9%" />
										<col width="50%"/>
									</colgroup>
									<tr>
										<td>&nbsp;</td>
										<td>
											<select name="search" id="search" title="��㱸��" class="select" >
												<option value="oaTitle">����</option>
												<option value="oaField">���о�</option>
											</select>
										</td>
										<td align="left">
											<input type="text" name="keyword" id="keyword" placeholder="�˻�� �Է��ϼ���" maxlength="50" class="input" />&nbsp;&nbsp;&nbsp;
											<span class="bt_search" id="oaSearchBtn" name="oaSearchBtn">&nbsp;&nbsp;�˻�&nbsp;&nbsp;</span>
										</td>
									</tr>
								</table>
							</form>
							<!-- ��������Ʈ -->
							<div id="oaBoardList"  >
								<table class="list_box" cellpadding="0" cellspacing="0" border="0">
									<colgroup>
										<col width="10%">
										<col width="8%">
										<col width="8%">
										<col width="8%">
										<col width="/%">
										<col width="8%">
										<col width="20%">
									</colgroup>
									<thead>
										<tr>
											<th onclick="setOrder()">
												�۹�ȣ
												<%
												if(oa_Vo.getOrderSc().equals("DESC")){
													%>��<%	
												} else {
													%>��<%
												}
												%>
											</th>
											<th>��㱳��</th>
											<th>�亯����</th>
											<th>���о�</th>
											<th>����</th>
											<th>�ۼ���</th>
											<th>��û��</th>
										</tr>
									</thead>
									<%
										Object obj = request.getAttribute("oaBoardList");
																			ArrayList<OnlineApplication_BoardVO> aList = (ArrayList<OnlineApplication_BoardVO>)obj;
																			if(aList != null){
																				for(int i=0; i<aList.size(); i++){
																					OnlineApplication_BoardVO oaVo = aList.get(i);
									%>
									<tbody>
										<tr align="center" dataNo=<%=oaVo.getOaNo()%>>
											<td><%= oaVo.getOaNo() %></td>
											<td><%=oaVo.getTmemberVO().getTtName()%></td>
											<td>�亯<%=oaVo.getOaStatus()%></td>
											<td><%=oaVo.getOaField()%></td>
											<td style="cursor: pointer;" class="content_left goDetail"><%=oaVo.getOaTitle()%></td>
											<td><%=oaVo.getSmemberVO().getSsName()%></td>
											<td><%=oaVo.getOaInsertdate()%></td>
										</tr>
									</tbody>
		
									<%
										} // for
																				} else {
									%>
									<tr>
										<td>NO DATA</td>
									</tr>
									<%
										} // if
									%>
								</table>
							</div>
							<div class="board_btn">
								<a href="/onlineApplication/oaInsertForm.ssm">
									<span>��û</span>
								</a>
							</div>
							<form id="goDetailForm" name="goDetailForm">
								<input type="hidden" id="ssNo" name="ssNo" value="<%=SessionID%>" />
								<input type="hidden" id="oaNo" name="oaNo" />
							</form>
							<div class="list" id="oaPaging">
								<%@include file="../visit/vrTeacher/paging.jsp"%>
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