<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUR-KR">
		<title>�湮��� ���� ����</title>
		
		<script src="/include/fullcalendar/main.js"></script>
		<script src="/include/js/jquery-1.11.3.min.js"></script>
		<script src="/include/fullcalendar/moment.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>
		<script src="/include/fullcalendar/dayGrid/main.min.js"></script>
		<link href="/include/fullcalendar/main.css" rel="stylesheet"/>
		<link href="/include/fullcalendar/dayGrid/main.min.css" rel="stylesheet"/>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					
					eventSources : 
						[{
		                	url : '/eduSchedule/esList.ssm',
		                	type : 'POST',
		                	dataType : 'JSON',
		                	success : function(data){
		                		
		                	},
		                	error : function(){
		                		alert("����");
		                	},
		                }],
					plugins: [ 'dayGrid' ],
					timeZone: 'local', // �ð� <- �������� �ð����� ����
				    locale : 'ko',
					defaultView: 'dayGridWeek',
					contentHeight : 'auto',
					buttonText :{
						today : '�̹���',
						next : '������',
						prev : '������'
					},
					eventClick : function(info){
						var time = info.event.title;
						var id = info.event.id;
						var groupId = info.event.groupId;
						var start = moment(info.event.start).format('YYYY-MM-DD');
						/*
						console.log("(log)title : " + time);
						console.log("(log)id : " + id);
						console.log("(log)groupId : " + groupId);
						console.log("(log)start : " + start);
						*/
						esUpdate(time, id, groupId, start);
					},
					defaultDate : new Date(),
					weekends : false
					
					/* jquery ajax ���
					
					events : function(start, end, timezone, callback){
						$.ajax({
							url : '/eduSchedule/eduScheduleList.ssm',
							type : 'POST',
							dataType : 'JSON',
							success : function(data){
								var events = [];
								$.each(data, function(i, obj){
									events.push({
										title:obj.title,
										start:obj.start,
										textColor:obj.textColor,
										color:obj.color,
									});
								});
								callback(events);
							},
							error : function(){
							}
						});
					},
					*/
				}); 
				calendar.render();
				
				// ���ð�ǥ ����
				function esUpdate(time, id, groupId, start){
					
					console.log("(log)�������� ����");
					if(confirm("���õ� �ð��� ��㰡�� ���θ� �����մϴ�.")){
						console.log(time + "/ " +  id + "/ " + groupId + "/ " + start);
						$.ajax({
							url : '/eduSchedule/esUpdate.ssm',
							type : 'POST',
							headers : {
								"Content-Type":"application/json",
								"X-HTTP-Method-Override":"POST"
							},
							dataType:"text",
							data : JSON.stringify({
								esTime : time,
								esNo : id,
								ttNo : groupId,
								vrDate : start,
							}),
							error : function(){
								alert("��������");
							},
							success : function(result){
								if(result=="SUCCESS"){
									alert("������ �����Ǿ����ϴ�.");
									calendar.refetchEvents ();
								}
							}
						});
					} else {alert("���������� ��ҵǾ����ϴ�");}
				} // esUpdate()
			calendar.render();
			}); // ready()
		</script>
	</head>
	<style>
		.fc-time {
			display: none;
		}
	
		.fc-day-header{
		    padding-top: 10px;
		    padding-bottom: 0px;
			height : 30px;
			inline-height : 30px;
			font-size: 15px;
		 	vertical-align: middle;
		}
		
		.fc-event-container {
			margin-top: 35px;
		    padding-top: 30px;
		    padding-bottom: 0px;
		}
		
		.fc-day-grid-event {
		
			padding-left: 0px;
			padding-right: 0px;
			margin-left: 10px;
			margin-right: 10px;
			margin-top: 5px;
			font-size: 12px;
			font-style: normal /* em, dfn, var, cite, address */;
			font-family: "�������", "NanumGothic" , "����", dotum, sans-serif;
			font-weight: bold;
			text-align: center;
		 	vertical-align: middle;
		}
		
		#calendar {
			max-width: 900px;
			width : 700px;
			margin: 40px auto;
			font-size: 10px;
			align:center;
		}	
	</style>
	<body>
	</body>
</html>


					
					
					
					
					
					
					
					
					