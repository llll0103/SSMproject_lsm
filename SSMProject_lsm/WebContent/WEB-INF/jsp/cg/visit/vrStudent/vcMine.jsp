<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ssm.cg.vo.VisitCounsel_RsvVO"%>
<%@ page import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<%
	Object obj1 = request.getAttribute("vcMineList");
	System.out.println("obj1 >>> : " +obj1);
	ArrayList<VisitCounsel_RsvVO> rsvList = (ArrayList<VisitCounsel_RsvVO>)obj1;
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��㳻�� �� ����</title>
<script src="/include/js/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
<link rel="stylesheet" href="/common/ssmCss/oaBoardList.css">

<link rel="stylesheet" href="/common/ssmCss/s_base.css">
<link rel="stylesheet" href="/common/ssmCss/s_content.css">
<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
<script src="/common/ssmJs/index.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script>
	$(document).ready(
			function() {
				// ��ư Ŭ���� Row �� ��������
				$(".btnDetail").click(
						function() {
							var str = ""
							var tdArr = new Array(); // �迭 ����
							var checkBtn = $(this);
							var tr = checkBtn.parent().parent();
							var td = tr.children();
							var conText = $(this).parents("tbody").children()
									.eq(1).find('td:eq(0)').text();//���� �Է�ĭ�� ��
							console.log("conTitle: " + conText);
							console.log("Ŭ���� Row�� ��� ������ : " + tr.text());
							var vrNo = td.eq(0).text();
							var ssName = td.eq(1).text();
							var ttAuthority = td.eq(2).text();
							var ttName = td.eq(3).text();
							var vrField = td.eq(4).text();
							var vrDate = td.eq(5).text();
							var vrStatus = td.eq(6).text();
							var vrContents = $(this).parents("tbody")
									.children().eq(1).find('td:eq(0)').text();
							// �ݺ����� �̿��ؼ� �迭�� ���� ��� ����� �� �� �ִ�.
							td.each(function(i) {
								tdArr.push(td.eq(i).text());
							});
							console.log("�迭�� ��� �� : " + tdArr);
							str += " * Ŭ���� Row�� td�� = No. : <font color='red'>"
									+ vrNo + "</font>"
									+ ", ���̵� : <font color='red'>" + ssName
									+ "</font>" + ", �̸� : <font color='red'>"
									+ ttAuthority + "</font>"
									+ ", �̸��� : <font color='red'>" + ttName
									+ "</font>";
							$(".modalTr").children("#vNo").html(vrNo);
							$(".modalTr").children("#sNo").html(ssName);
							$(".modalTr").children("#vrDate").html(vrDate);
							$(".modalTr").children("#vrField").html(vrField);
							$(".modalTr").children("#ttName").html(ttName);
							$(".modalTr").children("#ttAuthority").html(
									ttAuthority);
							$(".modalTr").children("#vrStatus").html(vrStatus);
							$(".modalTr").children("#vrContents").html(
									vrContents);
							$('#myVrList').show();
						});
				$(".resultDetail").click(
						function() {
							var conText = $(this).parents("tbody").children()
									.eq(1).find('td:eq(1)').text();//���� �Է�ĭ�� ��
							console.log("conText: " + conText);
							$(".modalTr").children("#vrComment").html(conText);
							$('#myVrResult').show();
						});
				$('#myModal').on('shown.bs.modal', function() {
					$('#myInput').focus()
				})
				$(".cancelBooking").click(
						function() {
							var vrNo = $(this).parents("tbody").children()
									.eq(0).find('td:eq(0)').text();
							console.log("vrNo: " + vrNo);
							//var vrNo = $(this).parents("tr").attr("vrNo");
							alert("vrno" + vrNo);
							if (confirm("������ ������ ����Ͻðڽ��ϱ�?")) {
								$.ajax({
									url : '/visitCounsel/' + vrNo + ".ssm",
									type : 'put',
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Override" : "PUT"
									},
									data : JSON.stringify({
										vrNo : vrNo
									}),
									dataType : 'text',
									success : function(result) {
										console.log("result:" + result);
										if (result == 'SUCCESS') {
											alert("��ҿϷ�!!!");
											window.location.reload();
										}//if
									}//success
								});//ajax
							}//if		
						});
				
				
				
				
			});//ready

	function goReserve() {
		location.href = "/visitCounsel/vcSchedule.ssm";
	}

	function allT() {
		$('#vrMineList td').show();
		document.getElementById('tab01').className = "on";
		document.getElementById('tab02').className = "";
		document.getElementById('tab03').className = "";

	}
	function counselT() {
		var text = $("#vrMineList tr td input").eq(0).val();
		console.log("11" + text);
		var data = $('tr:eq(3)>td:eq(0)').text();
		console.log(data);
		$('#vrMineList tr').each(function() {
			var day = $(this).find('td').eq(2).text();
			console.log(day);
			if (day == "���ӱ���") {
				$(this).find('td').hide();
			} else {
				$(this).find('td').show();
			}
			document.getElementById('tab01').className = "";
			document.getElementById('tab02').className = "on";
			document.getElementById('tab03').className = "";
		});
	};//classT

	function classT() {
		//var text = $("#vrMineList tr td input").eq(0).val();
		//console.log("11"+text);
		//var data = $('tr:eq(3)>td:eq(0)').text();
		//console.log(data);
		$('#vrMineList tr').each(function() {
			var day = $(this).find('td').eq(2).text();
			console.log(day);
			if (day == "��㱳��") {
				$(this).find('td').hide();
			} else {
				$(this).find('td').show();

			}
			document.getElementById('tab01').className = "";
			document.getElementById('tab02').className = "";
			document.getElementById('tab03').className = "on";
		});
	};//classT		
	//�˾� Close ���
	function close_pop(flag) {
		$('#myVrList').hide();
		$('#myVrResult').hide();
	}
</script>

</head>
<style>

.popBtn {
	margin-top: 10px;
}
.view_box2 td {
	color : black;
}

.list_box td {
	border-bottom:1px solid #ebebeb;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}

.popBtn {
	margin : 5px 0;
	padding : 5px;
	color : black !important;
	background-color: #fead09;
	border-radius : 10px;
}

h4, th {
	color : black;
}
}
</style>
<body>
	<div id="wrap">

		<%@include file="/common/ssmMain/header_.jsp"%>

		<div class="subWrap">
			<nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
			<section>
			<div id="tit">
				<h1>���� �湮 ��� ���</h1>
				<p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">���/�˻�</a> > <a
					href="#�ּҰɱ�" class="on">��� ���</a>
				</p>
			</div>
			<div class="container">
				<div id="content">
				<div class="table-container">
				<!-- �ǹ�ư -->
					<div class="tab_list" style="width: 100%;">
						<ul>
							<li class="on" id="tab01" style="cursor: pointer;"
								onclick="allT()">��ü����</li>
							<li id="tab02" style="cursor: pointer;" onclick="counselT()">��㱳�縸����</li>
							<li id="tab03" style="cursor: pointer;" onclick="classT()">���ӱ��縸����</li>
						</ul>
					</div>
					<!-- // �ǹ�ư -->
					<table cellpadding="0" cellspacing="0" border="0" summary=""
						class="list_box mt_20" id="vrMineList">
						<colgroup>
								<col width="10%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="14%">
								<col width="14%">
								<col width="14%">
						</colgroup>
						<thead>
							<tr>
								<th>�����ȣ</th>
								<th>�л���</th>
								<th>��������</th>
								<th>�����</th>
								<th>���з�</th>
								<th>�湮�Ͻ�</th>
								<th>��û�Ͻ�</th>
								<th>��û��Ȳ</th>
								<th>�󼼺���</th>

							</tr>
						</thead>
						<%
							if (rsvList == null) {
						%>
						<tbody>
							<tr>
								<td colspan="7" align="center">������ �����ϴ�.</td>
							</tr>
							<%
								} else {
																																							for (int i = 0; i < rsvList.size(); i++) {
																																								VisitCounsel_RsvVO vcMine = rsvList.get(i);
							%>

							<tr id="<%=vcMine.getVrNo()%>">
								<td id="a"><%=vcMine.getVrNo()%></td>
								<td id="b"><%=vcMine.getSmemberVO().getSsName()%></td>
								<td id="c"><%=vcMine.getTmemberVO().getTtAuthority()%></td>
								<td id="d"><%=vcMine.getTmemberVO().getTtName()%></td>
								<td id="e"><%=vcMine.getVrField()%></td>
								<td id="f"><%=vcMine.getVrDate()%> <%=vcMine.getVrTime()%></td>
								<td id="g"><%=vcMine.getVrInsertdate()%></td>
								<td id="h"><%=vcMine.getVrStatus()%></td>
								<td class="content_left">
									<button class="tbl_btn_3 btnDetail">�󼼺���</button> &nbsp; 
<!-- 								</td> -->
<!-- 								<td> -->
							 <%
							 	if (vcMine.getVrStatus().equals("���") 
							 		|| vcMine.getVrStatus().equals("����")) {
							 %>
									<button class="tbl_btn_1 cancelBooking">�������</button>
							 <%
							 	} // if 
							 	if (!vcMine.getVcCommentVO().getVcComments().equals("-")) {
							 %>
									<button class="tbl_btn_2 resultDetail">�������</button> 
							<%
							 	} // if(!vcMine.getVcCommentVO().getVcComments().equals("-"))
							 %>
								</td>
							</tr>
							<tr id="hidden" id="hidden" style="display: none;">
								<td><%=vcMine.getVrContents()%></td>
								<td><%=vcMine.getVcCommentVO().getVcComments()%></td>
							</tr>
						</tbody>
						<%
								}																								
							} // if
						%>
					</table>
				</div>
				<!-- // .table-container -->
			</div>
			<!-- // .container -->
			</div>
			</section>
		</div>
		<!-- // .subWrap -->
		<footer include-html="/common/ssmMain/footer.html"></footer>

		<!-- Modal -->
		<div id="myVrList" class="modal popup">
			<div class="modal-content">
				<h5 class="modal-title popup_tit" id="myModalLabel">���� �󼼺���</h5>

				<div class="modalTb">
					<form id="vrMine" name="vrMine">

						<table border="1" style="width: 100%" class="view_box2">
							<tr class="modalTr" style="display: none;">
								<th>�����ȣ</th>
								<td colspan="2" id="vNo"></td>
							</tr>
							<tr class="modalTr">
								<th>�����</th>
								<td colspan="2" id="vrDate"></td>
							</tr>
							<tr class="modalTr">
								<th>��������</th>
								<td colspan="2" id="ttAuthority"></td>
							</tr>
							<tr class="modalTr">
								<th>�����</th>
								<td colspan="2" id="ttName">������</td>
							</tr>

							<tr class="modalTr">
								<th>���о�</th>
								<td colspan="2" id="vrField"></td>
							</tr>

							<tr class="modalTr" height="30px">
								<th>��㳻��<br>(�л��ۼ�)
								</th>
								<td colspan="2" id="vrContents"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<input type="button" onClick="close_pop();" class="popBtn"
						value="�ݱ�" />
				</div>
				<!-- // .modal-footer -->
			</div>
			<!-- // .modal-content -->
		</div>
		<!-- // .modal popup #myVrList -->
		
		<div id="myVrResult" class="modal">
			<div class="modal-content">
				<!--   <h5 class="modal-title" id="myModalLabel">���� �󼼺���</h5>-->
				<div class="modalTb">
					<table border="1" style="width: 100%" class="view_box">
						<tr>
							<th colspan="3" align="center"><h4>���</h4></th>
						</tr>
						<tr class="modalTr">
							<th>���������</th>
							<td colspan="2" id="vrComment" style="color : black; text-indent : 10px;"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<input type="button" onClick="close_pop();" class="popBtn"
						value="�ݱ�" />
				</div>
			</div>
			<!-- // .modal-content -->
		</div>
		<!-- // .modal #myVrResult -->
	</div>
	<!-- // #wrap -->
	<script>
		includeHTML();
	</script>
</body>
</html>