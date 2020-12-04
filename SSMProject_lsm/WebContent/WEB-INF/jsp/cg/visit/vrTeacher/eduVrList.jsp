<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "ssm.cg.vo.Edu_ScheduleVO" %>
<%@ page import = "ssm.cg.vo.VisitCounsel_EduRsvVO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	Object pageObj = request.getAttribute("page");
	Object dataObj = request.getAttribute("data");
	System.out.println(dataObj);
	VisitCounsel_EduRsvVO data_vo = (VisitCounsel_EduRsvVO)dataObj;
	Object rsvObj = request.getAttribute("RsvList");
	ArrayList<Edu_ScheduleVO> rsvList = (ArrayList<Edu_ScheduleVO>)rsvObj;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
		<title>�湮��� ����ȭ��</title>
	</head>
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<link rel="stylesheet" href="/common/ssmCss/css/ssm_base.css">
   	<link rel="stylesheet" href="/common/ssmCss/css/ssm_content.css">
   	<link rel="stylesheet" href="/common/ssmCss/css/ssm_layout.css">
	<script src="/common/ssmJs/index.js"></script>
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<script src="/include/fullcalendar/moment.min.js"></script>
	<script>
		
		$(document).ready(function(){
			
			// ���� ��¥���� ����
			var date = new Date();
			var today = moment(date).format('YYYY-MM-DD');
			$("#week").text(today);

			// �о� �˻� ǥ��
			<%
			if(data_vo.getKeyword() != "" && data_vo.getKeyword() != null){
			%>
				$("input:radio[name='keyword'][value='<%=data_vo.getKeyword() %>']").prop('checked', true);
			<%
			} 
			
			// ���� �˻� ǥ��
			if(data_vo.getSearch() != "" && data_vo.getSearch() != null) {
			%>
				$("#search").val('<%=data_vo.getSearch() %>').prop('selected', true);
			<%
			}
			%>
			
			// �˻�
			$("#vrSearchBtn").click(function(){
				goPage(1);
			});
			
			// ����, ��� ���� ���� ����
			$("select#vrStatus").change(function(){
				var vrNo = $(this).parents("tr").attr("vrNo");
				$("#vrNo").val(vrNo);
				var vrStatus = $(this).val();
				var vrDate = $(this).parents("tr").children().eq(2).html();
				var vrTime = $(this).parents("tr").children().eq(3).html();
				var ssName = $(this).parents("tr").children().eq(4).html();
			
				// ������� ���� ��¥���� �̷��϶� �Ϸ� ���� �Ұ�
				if(vrStatus == "04"){
					if(vrDate > today){
						alert("����� �����Դϴ�. ����� �Ϸ� �Ŀ� �����ϼ���.");
						return;
					}
				}
				
				// ���� ���� ajax
				$.ajax({
					url : '/eduSchedule/vrStatusUpdate.ssm',
					type : 'POST',
					headers : {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					dataType : "text",
					data : JSON.stringify({
						vrNo : vrNo,
						vrTime : vrTime,
						vrDate : vrDate,
						vrStatus : vrStatus
					}),
					success : function(result){
						if(result=="SUCCESS"){
							alert("���� ���� �Ϸ�");
							$("#vrStatus").val(vrStatus);
						} else {
							alert("����ȵ�");
						}
					},
					error : function(){
						alert ("����");
					}
				});
			});
		}); // ready
		
		function setOrder() {
			if ($("#orderSc").val() == 'DESC') {
				$("#orderSc").val('ASC');
			} else {
				$("#orderSc").val('DESC');
			}
			goPage(1);
		}
		
		// ����¡ �� �˻��̵�
		function goPage(page){
			$("#page").val(page);
			$("#pagingForm").attr({
				"method":"post",
				"aciton":"/eduSchedule/eduRsvList.ssm"
			});
			$("#pagingForm").submit();
		} // goPage()
		
	</script>
	<style>
		#keyword input[type=radio]{
			margin : 0 10px;
		}
		
		.fc-title {
			margin : 10px;
		}
	</style>
	<body>
		<div id="wrap">
			<%@include file="/common/ssmMain/header_.jsp"%>
			<div class="subWrap">

			<nav include-html="/common/ssmMain/ssmCategory/cgTsideNav.jsp"></nav>
			<section>
				<div id="tit">
					<h1>�湮��� �������</h1>
					<p>
						<a href="#">Ȩ</a> > <a href="co01.asp">��û/����</a> > <a
							href="co03.asp" class="on">�湮���</a>
					</p>
				</div>
				<div class="container">
					<div id="content">
						<div style="text-align:left;">
							<br>
							* <span style="font-weight:bold; color:#fead09;" id="week"></span>���� 4�ְ��� ������ ��ȸ �˴ϴ�.
						</div>
						<div id="calendar">
							<jsp:include page="eduCalendar.jsp"></jsp:include>
							<p> <!--  <input type="button" id="calClose" value="�޷�����"/>-->
							<div class="status" style="text-align:left; margin-top:3px;">
								<div class="tbl_btn_1"></div>
								&nbsp;���డ��&nbsp;&nbsp;
								<div class="tbl_btn_2"></div>
								&nbsp;����Ұ�&nbsp;&nbsp;
								<div class="status_1"></div>
								&nbsp;������&nbsp;&nbsp;
								<div class="status_2"></div>
								&nbsp;�������
							</div>
						</div>
						<%@include file="rsvDetailModal.jsp"%>
						<div id="rsv">
							<!-- �������� �̵� form -->
							<form id="goRsvDetail" name="rsvDetail">
								<input type="hidden" id="vrNo" name="vrNo" />
							</form>
							<!-- ����¡/ �˻� form -->
							<form id="pagingForm">
								<input type="hidden" id="page" name="page" value=<%=pageObj%>/>
								<input type="hidden" id="orderSc" name="orderSc" value="<%=data_vo.getOrderSc() %>"/>
								<input type="hidden" id="rsvsearch" name="rsvsearch">
								<div class="searchGuide">
									<table class="search_box_app mt_10" id="content01">
										<colgroup>
											<col width="20%">
											<col width="15%">
											<col width="40%">
											<col width="10%">
										</colgroup>
										<tr>
											<th>��� ����/ �о� �˻�</th>
											<td>
												<select id="search" name="search" style="width:75%;">
													<option value="all">��ü</option>
													<option value="01">���</option>
													<option value="02">����</option>
													<option value="04">�Ϸ�</option>
												</select>
											</td>
											<td id="keyword" align="left">
												<input type="radio" name="keyword" value="all" checked/>��ü
												<input type="radio" name="keyword" value="���λ��" />���λ��
												<input type="radio" name="keyword" value="��Ȱ���" />��Ȱ���
												<input type="radio" name="keyword" value="�н����" />�н����
											</td>
											<td>
												<span class="bt_search" id="vrSearchBtn" name="vrSearchBtn">&nbsp;&nbsp;�˻�&nbsp;&nbsp;</span>
		<!-- 										<input type="button"  class="q_btn" id="vrSearchBtn" name="vrSearchBtn" value="�˻�" /> -->
											</td>
											
										</tr>
									</table>
								</div>
							</form>
							<table  id="rsvTable" class="list_box" cellpadding="0" cellspacing="0" border="0"> 
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th onclick="setOrder()">�����ȣ
										<%
											if(data_vo.getOrderSc().equals("DESC")) {
												%>��<%	
											} else {
												%>��<%
											}
										%>
										</th>
										<th>��������</th>
										<th>��������</th>
										<th>�������ð�</th>
										<th>����л���</th>
										<th>���о�</th>
										<th>����������</th>
										<th>�����º���</th>
									</tr>
								</thead>
				<%
								if(rsvList != null){
									for(int i = 0; i < rsvList.size(); i++){
										Edu_ScheduleVO esvo = rsvList.get(i);
				%>
								<tbody>
									<tr vrNo=<%=esvo.getVrNo() %> >
										<td class="goDetail"><%=esvo.getVrNo()%></td>
										<td class="goDetail"><%=esvo.getVrInsertdate()%></td>
										<td class="goDetail"><%=esvo.getVrDate()%></td>
										<td class="goDetail"><%=esvo.getVrTime()%></td>
										<td class="goDetail"><%=esvo.getSsNo()%></td>
										<td class="goDetail"><%=esvo.getVrField()%></td>
										<td class="goDetail"><%=esvo.getCode()%></td>
										<td>
											<select id="vrStatus" name="vrStatus">
												<option value="01" <%if(esvo.getVrStatus().equals("01")){%>selected<%}%>>���</option>
												<option value="02" <%if(esvo.getVrStatus().equals("02")){%>selected<%}%>>����</option>
												<option value="03" <%if(esvo.getVrStatus().equals("03")){%>selected<%}%>>�ݷ�</option>
												<option value="04" <%if(esvo.getVrStatus().equals("04")){%>selected<%}%>>�Ϸ�</option>
											</select>
										</td>
									</tr>
				<%
								}
							} else {
				%>
									<tr><td colspan="7" align="center">������ �����ϴ�.</td></tr>
				<%				
							}
				%>
								</tbody>
							</table>
							<!--  <input type="button" id="calBtn" value="�޷���ġ��" />-->
							<%@include file="paging.jsp" %>
						</div>
						<!-- // #rsv -->
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