<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,ssm.br.vo.Non_ApplicationVO,ssm.common.utils.BabySession" %>
<% 	
	request.setCharacterEncoding("EUC-KR");
	String userAuthoriry = BabySession.getSessionAU(request);
	Object obj = request.getAttribute("list");
	List list = null;
	Non_ApplicationVO navo = new Non_ApplicationVO();
	String naNo = "";
	if(obj != null){
		list = (List)obj;
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>naStudentMain</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js""></script>
	
    <link rel="stylesheet" href="/common/ssmCss/default.css">
    <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
    <link rel="stylesheet" href="/common/ssmCss/npMainBoard.css">
    <link rel="stylesheet" href="/common/ssmCss/npModal.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
	<style type="text/css">
		
		table {
			color : black;
		}
		
		#modal {
		    display: none; /* Hidden by default */
	        position: fixed; /* Stay in place */
	        z-index: 1; /* Sit on top */
	        left: 0;
	        top: 0;
	        width: 100%; /* Full width */
	        height: 100%; /* Full height */
	        overflow: auto; /* Enable scroll if needed */
	        background-color: rgb(0,0,0); /* Fallback color */
	        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
		}
		
		#modal h2 {
			margin:0;   
		}
		
		#modal button {
			display:inline-block;
			width:100px;
			margin-left:calc(100% - 100px - 10px);
		}
		
		#modal .modal_content {
			width:600px;
			margin:100px auto;
		  	padding:20px 10px;
		  	background:#fff;
		  	border:2px solid #666;
		}
		
		#modal .modal_layer {
		  	position:fixed;
		  	top:0;
		  	left:0;
		 	width:100%;
		  	height:100%;
		  	background:rgba(0, 0, 0, 0.5);
		  	z-index:-1;
		}   
	</style>
	<script type="text/javascript">
		$(function(){
			$("#cancel").hide();
			$("#naFile").hide();
			 $(".detail").click(function(){
				 //var ssNo=����ó���� �ۼ�
				 var ss = $(this).next();
				 var npNo = $(this).next().val();
				 var naNo = ss.next().val();

				 //alert("������Ŭ��");
					$.ajax({
						type:"get",
						url:"/non_Application/non_ApplicationDetail.ssm",
						data:{"ssNo":"S7180001","npNo": npNo},	
						success: function(data){
						console.log(data);		
						$(".naNo2").val(data[0].naNo);
						$("#ssNo").val(data[0].ssNo);
						$("#ssEmail").val(data[0].ssEmail);
						$("#ssName").val(data[0].ssName);
						$("#npTitle").val(data[0].npTitle);
						$("#naContents").val(data[0].naContents);
						$("#naFile1").html(data[0].naFile);
						$("#naFile1").val(data[0].naFile);
						$("#modal").fadeIn(300); // ���â �����ֱ�
						},
						error : function(e){
							console.log(e);
						}
					});
				
			});
			// ��� â �ȿ� �ִ� Ȯ�� ��ư�� �̺�Ʈ �ɱ�
		 	$("#close").click(function() {
		 	    $("#modal").fadeOut(300); // ���â �����ֱ�
				$("#ssNo").prop("readonly",true);
		 	});	
			$("#delete").click(function(){
				$("#modalForm").attr("encType","application/x-www-form-urlencoded").attr("action","/non_Application/non_ApplicationDelete.ssm").submit();
			});
			$("#update").click(function(){
				$("#naContents").prop("readonly",false);
				var EE = $("#update").val();
				if(EE == "�����ϱ�"){
					$("#update").val("�����ϱ�");
					$("#delete").hide();
					$("#cancel").show();
					$("#a").val($("#naContents").val());
					$("#naFile1").hide();
					$("#naFile").show();
					$("#naFile").value("naFile1");
				}else{
					$("#modalForm").attr("action","/non_Application/non_ApplicationUpdate.ssm").submit();
				}
			});
			$("#cancel").click(function(){
				$("#update").val("�����ϱ�");
				$("#delete").show();
				$("#cancel").hide();
				$("#naFile").hide();
				$("#naContents").val($("#a").val());
				$("#naContents").prop("readonly",true);
				$("#naFile1").show();
			});
			
			
			
		});
		function File(){
			var fileName = $("#naFile1").val();		
				//alert(fileName);
				location.href="/non_Application/downLoad.ssm?fileName="+fileName;
		}
	</script>	
</head>
<body>
	<div id="wrap">
		<%@include file= "/common/ssmMain/header_.jsp" %>
		<div class="subWrap">
		<nav include-html="/common/ssmMain/ssmCategory/brSsideNav.html"></nav>
		<section>
			<div id="tit">
					<h1>���� ���α׷� ��û ���</h1>
					<p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">�񱳰� ���α׷�</a> > <a
						href="#�ּҰɱ�" class="on">���� ���α׷� ��û ���</a>
				</p>
			</div>
			<div class="container">
				<div id="nbTable">
				<form>
					<table>
						<thead>
						<tr id="tableTit">
							<th>���α׷���</th>
							<th>��û��</th>
							<th>������Ȳ</th>
							<th>���</th>
						</tr>
						</thead>
						<tbody>
						<%if(list==null&&list.size()==0){%>
							<tr>
							<td>��û�� ���α׷��� �����ϴ�</td>
							</tr>
							<%
								} else {
									for(int i=0;i<list.size();i++){
									navo=(Non_ApplicationVO)list.get(i);
								%>
							<tr>
								<td><%=navo.getNpTitle() %></td>
								<td><%=navo.getNaInsertdate() %></td>
								<td align="center">
								<%if(navo.getNaStatus().equals("01")) out.print("���");
								  if(navo.getNaStatus().equals("04")) out.print("�Ϸ�");
								  %>
								</td>
								<td>
									<input type="button" class="detail" id="detail" name = "detail" value="�󼼺���">
									<input type="hidden" class="npNo" id="npNo" name ="npNo" value=<%=navo.getNpNo() %>>
									<input type="hidden" class="naNo" id="naNo" name ="naNo" value=<%=navo.getNaNo() %>>
								</td>
							</tr>
						<%	
								}
							} 
						%>
						</tbody>
					</table>
				</form>
				</div>
			</div>
		</section>
		</div>
		<footer include-html="/common/ssmMain/footer.html"></footer>
	</div>
	<script type="text/javascript">
		includeHTML();
	</script>
	<div id="modal">
		<div class="modal_content">
		<form id = "modalForm" name="modalForm" encType="multipart/form-data" method="POST">
			<h4>��û ��� �󼼺���</h4>
			<hr>
			<table>
				<tr>
					<th>�й�</th>
					<td><input type="text" id="ssNo" name="ssNo" readonly></td>
					<th>�̸���</th>
					<td><input type="text" id="ssEmail" name="ssEmail" readonly></td>
				</tr>
				<tr>
					<th>�̸�</th>
					<td><input type="text" id="ssName" name="ssNname" readonly></td>
					<th>���α׷�</th>
					<td><input type="text" id="npTitle" name="npTitle" readonly></td>
				</tr>
				<tr>
				<th>��û����</th>
				<td colspan ='3'><input type="text" id="naContents" name="naContents" readonly style="width:450px;height:250px;" ></td>
				</tr>
				<tr>
				<th>÷������</th>
				<td colspan='3'><a id="naFile1" href="javascript:File()"></a>
				<input type="file" id=naFile name="naFile">
				</td>
				</tr>
			</table>
			<input type="button" class="modal_closd_btn" id="close" name="modal_closd_btn" value = â�ݱ�>
			<input type="button" class="modal_closd_btn" id="update" name="update" value = "�����ϱ�">
			<input type="button" class="modal_closd_btn" id="delete" name="delete" value = "�����ϱ�">
			<input type="button" class="modal_closd_btn" id="cancel" name="cancel" value = "�������">
			<input type="hidden" class="modal_closd_btn" id="a" name="a">
			<input type="hidden" class="naNo2" id="naNo" name="naNo">
		</form>
		</div>
	</div>
</body>
</html>