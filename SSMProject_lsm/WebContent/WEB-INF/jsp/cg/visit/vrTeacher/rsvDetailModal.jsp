<%@page import="ssm.cg.vo.Edu_ScheduleVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>���</title>
	</head>
	<script src="/include/js/jquery-1.11.3.min.js"></script>
	<script src="/include/fullcalendar/moment.min.js"></script>
	<script type="text/javascript">
		
		// ���� ��¥���� ����
		var date = new Date();
		var today = moment(date).format('YYYY-MM-DD');
		
        $(document).ready(function() {
        	
        	$("#vcUpdate").hide();
        	
        	// �󼼺���
        	$(".goDetail").click(function(){
				var vrNo = $(this).parents("tr").attr("vrNo");
				$("#vrNo").val(vrNo);
				console.log("(log)vrNo : " + vrNo);
				$.ajax({
					url : '/eduSchedule/esRsvDetail.ssm',
					type : 'POST',
					headers : {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					dataType : 'JSON',
					data : JSON.stringify({
						vrNo : vrNo	
					}),
					success : function(data){
						
						var vrNo = data.vrNo;
						var ssNo = data.ssNo;
						var vrDate = data.vrDate;
						var vrField = data.vrField;
						var vrTime = data.vrTime;
						var vrStatus = data.vrStatus;
						var vrContents = data.vrContents;
						var vcComments = data.vcComments;
						
						$(".modalTr").children("#vNo").html(vrNo);
						$(".modalTr").children("#sNo").html(ssNo);
						$(".modalTr").children("#vrDate").html(vrDate);
						$(".modalTr").children("#vrField").html(vrField);
						$(".modalTr").children("#vrTime").html(vrTime);
						$(".modalTr").children("#vrStatus").html(vrStatus);
						$(".modalTr").children("#vrContents").html(vrContents);
						
						if(vrStatus == "�Ϸ�"){
							if(vcComments==null){
								$(".modalTr").children("#vrComments")
								.html("<textarea id='vcComments' name='vcComments' rows=3; style='width : 96%; border : 0;' placeholder='������� �ۼ��ϼ���.'></textarea>");
							} else {
								$(".modalTr").children("#vrComments").html(vcComments).css("color", "black");
							}
						} else {
							$(".modalTr").children("#vrComments").html("��� �ۼ� ���Դϴ�.").css("color", "red");
							
						}
						$("#myModal").show();
					},
					error :  function(){
						alert("����");
					}
				});
			});
        	
        	// ��� ����
        	$("#saveResult").click(function(){
        		
	        	var ssNo = $(".modalTr").children("#sNo").html();
	        	var vrNo = $(".modalTr").children("#vNo").html();
	        	var vcComments = $("#vcComments").val();
	        	console.log(vrComments);
	        	console.log(ssNo);
	        	console.log(vrNo);
	        	$.ajax({
	        		url : "/vrComment/vcInsert.ssm",
	        		type : "post",
					headers : {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						vrNo : vrNo,	
						ssNo : ssNo,
						vcComments : vcComments
					}),
					success : function(result){
						if(result != null){
							$(".modalTr").children("#vrComments").html(result);
							history.go(0);
						} else {
							alert("����ȵ�");
						}
					},
					error : function(){
						alert ("�����Դϴ�. �����ڿ��� �����ϼ���.");
					}
	        	});
        	});
        }); // ready
        
        // ������� ����
        function vcUpdateForm(){
    
        	var vrDate = $(".modalTr").children("#vrDate").html();
        	var vrStatus = $(".modalTr").children("#vrStatus").html();
   			
        	if(vrDate > today) {
   				alert("����� �����Դϴ�."); return
   				}
   			else {
   				if(vrStatus == "�Ϸ�"){
   					$(".modalTr").children("#vrComments")
					.html("<textarea id='vcComments' name='vcComments' rows=3; style='width : 96%; border : 0;' placeholder='������� �ۼ��ϼ���.'></textarea>");
		        	$(".popBtn").hide();
		        	$("#vcUpdate").show();
   				} else {
   					alert("��� ���¸� ���� �� �ۼ��ϼ���");
   				}
   			}
        }
        
        // ��� ����� ����
		function vcUpdate(){
			
        	var vrNo = $(".modalTr").children("#vNo").html();
        	var vcComments = $("#vcComments").val();
        	
        	$.ajax({
        		url : "/vrComment/vcUpdate.ssm",
        		type : "post",
        		headers : {
        			"Content-Type":"application/json",
        			"X-HTTP-Method-Override":"POST",
        		},
        		dataType : "text",
        		data : JSON.stringify({
        			vrNo : vrNo,
        			vcComments : vcComments
        		}),
        		success : function(result){
        			$(".modalTr").children("#vrComments").html(result);
        			history.go(0);
        		}
        	});
        }
		
        // ��� ����� ����
        function vcDelete(){
        	var vrDate = $(".modalTr").children("#vrDate").html();
   			if(vrDate < today) {
   				alert("����� �����Դϴ�."); return
   			}
        }
        
        // ��� �˾� �ݱ�
        function close_pop(flag) {
             $("#myModal").hide();
             $("#resultModal").hide();
        }
        
        $(document).keyup(function(e){
			if(e.keyCode == 27) {
				 $("#myModal").hide();
	             $("#resultModal").hide();
			}	
		});
	</script>
    <style>
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
	</style>
	<body>
		<div id="myModal" class="modal">
	    	<!-- Modal content -->
	      	<div class="modal-content">
	      		<div class="modalTb">
	      			<h5 class="modal-title popup_tit" id="myModalLabel"> �л� ���� �󼼺���</h5>
	      			<form id="vrComment" name="vrComment">
	      				<input type="hidden" id="vrNo" name="vrNo"/>
			      		<table border="1" style="width: 100%" class="view_box2">	
			      			<colgroup>
								<col width="30%">
								<col width="70%">
							</colgroup>
			      			<tr class="modalTr">
			      				<th>�����ȣ</th>
			      				<td style="text-align:left;" id="vNo"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>�����</th>
			      				<td style="text-align:left;" id="vrDate"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>������</th>
			      				<td style="text-align:left;" id="vrStatus"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>�л��̸�</th>
			      				<td style="text-align:left;" id="sNo"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>���о�</th>
			      				<td style="text-align:left;" id="vrField"></td>
			      			</tr>
			      			<tr class="modalTr">
			      				<th>���ð�</th>
			      				<td style="text-align:left;" id="vrTime"></td>
			      			</tr>
			      			<tr class="modalTr" height="30px">
			      				<th>��㳻��<br>(�л��ۼ�)</th>
			      				<td style="text-align:left;" id="vrContents"></td>
			      			</tr>
				      		<tr class="modalTr" height="60px">
			      				<th>��㳻��<br>(�����ۼ�)</th>
			      				<td style="text-align:left;" id="vrComments">
			      				</td>
			      			</tr>
			      		</table>
			      	</form>
		      	</div>
	            <div style="cursor:pointer;">
	            	<hr/>
	                <input type="button" onClick="close_pop();" class="popBtn" value="�ݱ�"/>
	                <input type="button" onClick="vcUpdateForm();" class="popBtn" value="����"/>
	               	<input type="button" id= "vcUpdate" onClick="vcUpdate();" class="popBtn" value="����"/>
	             	<input type="button" onClick="vcDelete();" class="popBtn" value="����"/>
	                <input type="button" id="saveResult" class="popBtn" value="����" style="background:red;"/>
	            </div>
	    	</div>
	    </div>
	</body>
</html>