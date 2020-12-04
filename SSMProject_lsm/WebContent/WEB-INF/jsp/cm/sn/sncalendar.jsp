<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.common.utils.BabySession" %> 
<%  String sessionAU = BabySession.getSessionAU(request);%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%request.setCharacterEncoding("EUC-KR"); %>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>��������</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js?ver=2"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
	<!-- css�� ī�װ�js���� -->
	<link rel="stylesheet" href="/common/ssmCss/default.css?ver=2">
	<link rel="stylesheet" href="/common/ssmCss/nbBoard.css">
	<link rel="stylesheet" href="/common/ssmCss/npModal.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css?ver=2">
	
	<script src="/common/ssmJs/goCategory.js?ver=1"></script>
	<script src="/common/ssmJs/index.js?ver=1"></script>
	
	<!-- ǮĶ����  api -->
	<link href='/include/fullcalendar-4.4.0/packages/core/main.css' rel='stylesheet' />
	<link href='/include/fullcalendar-4.4.0/packages/daygrid/main.css' rel='stylesheet' />
	<link href='/include/fullcalendar-4.4.0/packages/timegrid/main.css' rel='stylesheet' />
	<link href='/include/fullcalendar-4.4.0/packages/list/main.css' rel='stylesheet' />
	<script src='/include/fullcalendar-4.4.0/packages/core/main.js'></script>
	<script src='/include/fullcalendar-4.4.0/packages/interaction/main.js'></script>
	<script src='/include/fullcalendar-4.4.0/packages/daygrid/main.js'></script>
	<script src='/include/fullcalendar-4.4.0/packages/timegrid/main.js'></script>
	<script src='/include/fullcalendar-4.4.0/packages/list/main.js'></script>
	
	<!-- ���˾�  -->
	
	<script src="/include/js/jquery.bpopup.min.js"></script>
	
	<!-- �������� -->
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js?"></script>
	
	
	<script>
	//ǮĶ������ ��������Ŀ�� �浹������ ���� �ذ��ڵ�
	jQuery.browser = {};
		(function () {
		jQuery.browser.msie = false;
		jQuery.browser.version = 0;
		if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
			jQuery.browser.msie = true;
			jQuery.browser.version = RegExp.$1;
		}
	})();
	</script>
	<script>
	
	$(document).ready(function(){
		//���Է¹�ư
		$("#snInsert").click(function(){
			$("#sninsertForm").attr('action','/schedulnotice/snInsert.ssm')
			.submit();
		});
		//�ۼ�����ư
		$("#snUpdate").click(function(){
			$("#snupdateForm").attr('action','/schedulnotice/snUpdate.ssm')
			.submit();
		});
		//�ۻ�����ư
		$("#snDelete").click(function(){
			if(confirm("�����Ͻðڽ��ϱ�?")){
				$("#snupdateForm").attr('action','/schedulnotice/snDelete.ssm')
				.submit();
			}
		});
		
		//�˾� �ݱ��ư
		$(".layer_close").click(function(){
			$('#insert_popup').bPopup().close();
			$('#update_popup').bPopup().close();
		});
	});	
	
	//ǮĶ���� �Լ�
	document.addEventListener('DOMContentLoaded', function() {
		var sessionAU ="<%=sessionAU%>"
		var events = [];
		
		//������ �ҷ��ͼ� events �� ���
		$.ajax({
			url:"/schedulnotice/snlistajax.ssm",							
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override":"post"
			},
			dataType:'json',							
			success:function(data){		
			//alert(">>>>");
				$.each(data, function (i,snlist) {
					events.push({
						title    : snlist.title,
						start    : snlist.start,
						end	     : snlist.end,
						id	     : snlist.no
					});
				});
				
				//ǮĶ���� ���
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'dayGridMonth,listMonth'
					},
					locale: 'ko',
					defaultDate: '2020-03-12',
					navLinks: true, 
					businessHours: true, 
					editable: true,
					selectable: true,
					fixedWeekCount : false,
					buttonText :{
						today : '����',
						next : '������',
						prev : '������',
						dayGridMonth : '������',
						listMonth : '�����'
					},
					allday:true,
					
					events : events,//events�� �Ʊ� �ҷ��� ��ü
					   
					//����Ŭ����(�� ����,����)
					eventClick: function(info){
						
						//�л��� �� �������� ����
						if(sessionAU ==1){
							return;							
						}
						
						sndatapicker();
						var title=info.event.title;
						var startdate=info.event.start;
						var enddate=info.event.end;
						var no=info.event.id;
						
						//startdate �� enddate�� date��ü�� yyyy-mm-dd�������� �ȵǾ��־�  ������ �۾���
						var syy = startdate.getFullYear();
						var smm = Number(startdate.getMonth()+1);
						if(smm<10){
							smm = "0"+smm
						}
						var sdd = Number(startdate.getDate());
						if(sdd<10){
							sdd = "0"+sdd
						}
						startdate = syy+"-"+smm+"-"+sdd;
						
						var eyy = enddate.getFullYear();
						var emm = Number(enddate.getMonth()+1);
						if(emm<10){
							emm = "0"+emm
						}
						var edd = Number(enddate.getDate()-1);
						if(edd<10){
							edd = "0"+edd
						}
						enddate = eyy+"-"+emm+"-"+edd;
						//alert(startdate);
						//alert(enddate);
						//���â���� ���ֱ�
						$('#update_popup').bPopup();
						$('#snNo').val(no);
						$('#snTitle').val(title);
						$('#snStartdate').val(startdate);
						$('#snEnddate').val(enddate);
							 
							  
					},
					//�޷��� ��ĭ Ŭ���� (���Է�)
					dateClick: function(info) {
						
						//�л��� �� �Է� ����
						if(sessionAU ==1){
							return;							
						}
						
						//alert("zz");
						sndatapicker();
						 
						var startdate=info.dateStr;
						//alert(startdate);
						$('#insert_popup').bPopup();
						$('#snStartdate_').val(startdate);
						
					}
				});
				
				
				calendar.render();
			}
		});
	});
		
	function sndatapicker(){
		$( ".snStartdate" ).datepicker({
			dateFormat: 'yy.mm.dd',
			prevText: '���� ��',
			nextText: '���� ��',
			monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
			monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
			dayNames: ['��','��','ȭ','��','��','��','��'],
			dayNamesShort: ['��','��','ȭ','��','��','��','��'],
			dayNamesMin: ['��','��','ȭ','��','��','��','��'],
			showMonthAfterYear: true,
			changeMonth: true,
			changeYear: true,
			yearSuffix: '��'
		});
		$( ".snEnddate" ).datepicker({
			dateFormat: 'yy.mm.dd',
			prevText: '���� ��',
			nextText: '���� ��',
			monthNames: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
			monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
			dayNames: ['��','��','ȭ','��','��','��','��'],
			dayNamesShort: ['��','��','ȭ','��','��','��','��'],
			dayNamesMin: ['��','��','ȭ','��','��','��','��'],
			showMonthAfterYear: true,
			changeMonth: true,
			changeYear: true,
			yearSuffix: '��'
		});
	}
		
	</script>
	
	
	
	
	<style type="text/css">
	
	.button_style {
		opacity: 5;
		display: none;
		position: relative;
		padding: 30px;
		background-color: #fff;
	}
	
	.layer_close {
		position: absolute;
		right: 3px;
		top: 1px;
		padding: 10px;
		cursor: pointer;
	}
	
	h2 {
		color : black;
	}
	</style>
</head>
<body>
	<!--  ���Է¸��â -->
	<div id="insert_popup" class="button_style">
		<span class="layer_close">�ݱ�</span>
		<div class="modal_content">
			<form id="sninsertForm" autocomplete=off>
				<table>
					<tr><th colspan="2"><h2>���� ���</h2></th></tr>
					<tr>
						<th>���� ����</th>
						<td><input Type="text" name="snTitle"></td>
					</tr>
					<tr>
						<th>���� ��¥</th>
						<td><input Type="text" class="snStartdate" id="snStartdate_" name="snStartdate"></td>
					</tr>
					<tr>
						<th>��ħ ��¥</th>
						<td><input Type="text"  class="snEnddate" id="snEnddate_"name="snEnddate"></td>
					</tr>
				</table>
				<input Type="button" id="snInsert" name="snInsert" value="���� ���" class="modal_closd_btn">
			</form>
		</div>
	</div>
	
	<!-- �ۼ��� ���â -->
	<div id="update_popup" class="button_style">
	<span class="layer_close">�ݱ�</span>
		<div class="modal_content">
			<form id="snupdateForm" autocomplete=off>
			<input Type="hidden" id="snNo" name="snNo">
				<table>
					<tr><th colspan="2"><h2>���� ����</h2></th></tr>
					<tr>
						<th>���� ����</th>
						<td><input Type="text" id="snTitle" name="snTitle"></td>
					</tr>
					<tr>
						<th>���� ��¥</th>
						<td><input Type="text" id="snStartdate" class="snStartdate" name="snStartdate"></td>
					</tr>
					<tr>
						<th>��ħ ��¥</th>
						<td><input Type="text" id="snEnddate" class="snEnddate" name="snEnddate"></td>
					</tr>
				</table>
				<input Type="button" id="snUpdate" value="���� ����" class="modal_closd_btn">
				<input Type="button" id="snDelete" value="���� ����" class="modal_closd_btn">
			</form>
		</div>
	</div>
	
	<!-- ��ü -->
	<div id="wrap">
		
		<!-- ��� -->
		<header include-html="/common/ssmMain/header_.jsp?ver=2"></header>
		<div class="subWrap">
		<!-- �׺���̼� -->
			<%
			if(sessionAU.equals("1")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmSSideNav.html"></nav><%
			}
			if(sessionAU.equals("2")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmTSideNav.html"></nav><%
			}
			%>
			<section>
			<div id="tit">
	            <h1>�б�����</h1>
	            <p>
	               <a href="#">Ȩ</a> > <a href="co01.asp">��������</a> > <a
	                  href="co03.asp" class="on">�б�����</a>
	            </p>
	         </div>
			<div class="container">
				<!-- �����̳� -->
				<div id="boardContainer">
				
				<!-- ���� �� -->
		<!-- 		<section include-html="/common/ssmMain/ssmCategory/section_sub_title_wrap.html"></section> -->
				
				<!-- �̸��� -->
				<div id='calendar' style=" margin-left:10px; margin-right:10px;"></div>
					
				</div>
				<!-- // #baordContainer -->
			</div>
			<!-- // container -->
			</section>
		</div>
		<!-- // .subWrap -->
		
		<!-- Ǫ�� -->
		<footer include-html="/common/ssmMain/footer.html"></footer>
	</div>
	<script>
		includeHTML();
	</script>
</body>
</html>
