<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.List" %>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="java.util.Date" %>
<%
   request.setCharacterEncoding("EUC-KR");
   Object obj      = null;
   List list       = null;
   String ssNo     = "";
   String ssName   = "";
   String ssEmail  = "";
   String schName  = "��Ʈ����б�";
   String ssGender = "";
   String ssGrade  = "";
   String ssGrade2  = "";
   String trgetSe  = "100207";
   String time = "";
   long tl = 0;
   Date date = null;
   obj = request.getAttribute("list");
   if(obj != null){
      list = (List)obj;
      if(list.size() > 0){
         SMemberVO svo = (SMemberVO)list.get(0);
         ssNo     = svo.getSsNo();
         ssName   = svo.getSsName();
         ssEmail  = svo.getSsEmail();
         ssGender = svo.getSsGender();
         ssGrade  = svo.getSsGrade();
         ssGrade2  = svo.getSsGrade();
         if(ssGender.equals("7")){
            ssGender = "100324";
         }else{
            ssGender = "100323";
         }
         if(ssGrade.equals("FM")){
            ssGrade = "1";
         }else if(ssGrade.equals("JR")){
            ssGrade = "2";
         }else{
            ssGrade = "3";
         }
         date = new Date();
         tl = date.getTime();
         time = tl+"";
      }else{
         
      }
   }else{
      
   }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type = "text/javascript"
			src= "http://
			code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/include/js/val_check.js"></script>
<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
     <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
     <link rel="stylesheet" href="/common/ssmCss/npMainBoard.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>						
</head>
<body>
	<header include-html="/common/ssmMain/header_.jsp"></header>
	<nav include-html="/common/ssmMain/ssmCategory/brSideStudents.html"></nav>

		<form id="outQuestion">
		<table border="1" align="center" id="aaa">
			
		
			<script type="text/javascript">
			
	$(document).ready(function(){
	
		function oneCheckbox(a){

	        var obj = document.getElementsByName("anwser");

	        for(var i=0; i<obj.length; i++){

	            if(obj[i] != a){

	                obj[i].checked = false;
	            }
	        }
	    }
	alert("�̻����");	

	var data
	alert("��ưŬ��");
	$.ajax({
		type:"GET",//��� get put delete����
		headers:{"Content-Type":"application/json"}, 
		url: "http://inspct.career.go.kr/openapi/test/questions?apikey=961f47ce54cb960e4f6929a39c6b83dc&q=5",//������ ����url
			     
		success : function(data){
			console.log(data);
			
			for(var i=0 ;i<data.RESULT.length ; i++){
				var qNo = data.RESULT[i].qitemNo;
				var an01 =  data.RESULT[i].answer01;
				var an02 =  data.RESULT[i].answer02;
				var an03 =  data.RESULT[i].answer03;
				var an04 =  data.RESULT[i].answer04;
				var an05 =  data.RESULT[i].answer05;
				var an06 =  data.RESULT[i].answer06;
				var an07 =  data.RESULT[i].answer07;
				var aval01 =  data.RESULT[i].answerScore01;
				var aval02 =  data.RESULT[i].answerScore02;
				var aval03 =  data.RESULT[i].answerScore03;
				var aval04 =  data.RESULT[i].answerScore04;
				var aval05 =  data.RESULT[i].answerScore05;
				var aval06 =  data.RESULT[i].answerScore06;
				var aval07 =  data.RESULT[i].answerScore07;
				if(an01 != null){
					
					var ar01 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' value = '"+aval01+"'checked>"+an01;
				}else{
					var ar01 = "";
				}
				
				if(an02 != null){
					var ar02 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' value = '"+aval02+"'>"+an02;
				}else{
					var ar02 = "";
				}
				
				if(an03 != null){
					var ar03 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' value = '"+aval03+"'>"+an03;
				}else{
					var ar03 = "";
				}
				
				if(an04 != null){
					var ar04 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' value = '"+aval04+"'>"+an04;
				}else{
					var ar04 = "";
				}
				
				if(an05 != null){
					var ar05 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' value = '"+aval05+"'>"+an05;
				}else{
					var ar05 = "";
				}
				
				if(an06 != null){
					var ar06 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' value = '"+aval06+"'>"+an06;
				}else{
					var ar06 = "";
				}
				
				if(an07 != null){
					var ar07 = "<input type='radio' id='"+qNo+"' name='"+(i+1)+"' value = '"+aval07+"'>"+an07;
				}else{
					var ar07 = "";
				}
				var ss = $("<div>");
				ss.attr({"id" : "qwe"+qNo});
				ss.append(i+1+".")
				.append("<strong>"+data.RESULT[i].question+"</strong>"+"<br>")
				.append(ar01+ar02+ar03+ar04+ar05+ar06+ar07+"<br><hr>");
				$("#aaa").append(ss);
				
			}
			var ss = Number(1);
			defaultPage(ss);
		},
		
		error : function(e){
			console.log(e);
		}
	
		});
		
	

	$("#next").click(function() {
		var page = $("#page").val();
		
		var bool = validation(page);
		if(bool){
			$("#page").attr("value",(Number(page)+1));
			page2 = $("#page").val();
			if(page2>5){
				var page = $("#page").val();
				alert("������ �������Դϴ�.");
				$("#page").attr("value",(Number(page)-1));
				alert($("#page").val());
			}else{
				alert($("#page").val());
				defaultPage(page2);  	
			}
		}else{
			
		}
		
		return bool;
		
	});
	
	$("#prev").click(function() {
		var page = $("#page").val();
		$("#page").attr("value",(Number(page)-1));
		
		page2 = $("#page").val();
		if(page2 < 1){
			var page = $("#page").val();
			alert("ù �������Դϴ�.");
			$("#page").attr("value",(Number(page)+1));
			alert($("#page").val());
		}else{
			alert($("#page").val());
			defaultPage(page2);
		}
		
		
	});
	
	
	$("#send").click(function() {
		alert("��ưŬ��");
		var a = sendAnswer();
		$.ajax({
			type:"POST",//��� get put delete����
			headers:{"Content-Type":"application/json"}, 
			url: "http://inspct.career.go.kr/openapi/test/report",//������ ����url
			
			data : JSON.stringify({ "apikey": "961f47ce54cb960e4f6929a39c6b83dc",//����Ű
				     "qestrnSeq": "5",//�˻��ȣ 4������̰˻�(k) 18������̰˻�(h), ���������˻� ����л� 21
				     "trgetSe": "100207",//�˽���Ÿ�� 100205 �ʵ�,110206 �ߵ�,110207 ���,100208 �н�
				     "name": " <%=ssName %>",//�̸�
				     "gender": "<%=ssGender %>",//����
				     "school": "<%=schName %>",//�б���
				     "grade": "<%=ssGrade%>",//�г�
				     "email" : "<%=ssEmail %>",//�̸���
				     "startDtm" : "<%=time%>",//��¥(�������𸣰���)
				     "answers": a
				     }),
				     
			success : function(data){
				console.log(data);
				alert(data.RESULT.url);
				console.log(data.RESULT.url);
				//location.href=data.RESULT.url;
				
				//������ ����� ����Լ�
				//window.open("","pop","width=1000,height=1000");
				
				//$("#def")
				//.attr("action", data.RESULT.url)
				//.attr("target","pop")
				//.submit();
				

				var url = data.RESULT.url;
				$("#cdUrl").attr("value",url);
				$("#ssNo").val("<%=ssNo%>");
				$("#cdGrade").val("<%=ssGrade%>");
				$("#def").attr("action","/test/jobAptitudeInsert.ssm").submit();

			},
			
			error : function(){
				alert("���������");
				console.log(e);
			}
		
			})
			
		});
	
	});

	function sendAnswer(){
			
			var answer = "";
			var id = "";
			var val = "";
			for(var i=1;i<=96;i++){
				id=$('#'+i).attr('id');
				val = $('input[id='+i+']:checked').val();
				str = "A"+id+"="+val+" ";
				answer += str;
			}
			console.log(answer);
		return answer;
	}
	

	function defaultPage(data){
		alert("�����׾ѻ�󸻶��̱�");
		var sta = 0;
		var end = 0;
		if(data==1){sta = Number(1); end = Number(20);}
		if(data==2){sta = Number(21); end = Number(40);}	
		if(data==3){sta = Number(41); end = Number(60);}
		if(data==4){sta = Number(61); end = Number(80);}
		if(data==5){sta = Number(81); end = Number(96);}
		for(var i=1;i<=96;i++){
			$("#qwe"+i).hide();	
		}
		for(var i=sta;i<=end;i++){
			$("#qwe"+i).show();	
		}
	}
	
	function goMain(){
		location.href="/career_Design/goMainPage.ssm";
	}
	
	function validation(data){
		var sta = 0;
		var end = 0;
		var bool = false;
		if(data==1){sta = Number(1); end = Number(20);}
		if(data==2){sta = Number(21); end = Number(40);}	
		if(data==3){sta = Number(41); end = Number(60);}
		if(data==4){sta = Number(61); end = Number(80);}
		if(data==5){sta = Number(81); end = Number(96);}
		
			var id = "";
			var val = "";
			var divId = "";
			for(var i=sta;i<=end;i++){
				val = $('input[name='+i+']:checked').val(); 
				bool = val_check(val,i);
				if(bool){
					bool = true;
				}else{
					bool = false;
					break;
				} 
			}
			
		    return bool;
		
	}
	</script>
			
		</table>
			<table align="center">
				<tr>
					<td>

						<input type="hidden" id="page" name="page"  value="1">
						<input type="button" id="prev" name="prev"  value="����������">
						<input type="button" id="send" name="send"  value="������">
						<input type="button" id="next" name="next"  value="����������">
						<input type="button" value="goMain" onclick="goMain()">
							<img border="0" src="">
						</td>
					</tr>
				</table>
		</form>
			<form name="def" id="def" method='POST'>
				<input type="hidden" id="cdValue" name="cdValue" value="JI">
				<input type="hidden" id="cdGrade" name="cdGrade">
				<input type="hidden" name="ssNo" id="ssNo">
				<input type="hidden" id="cdUrl"  name="cdUrl">
			</form>
		<script type="text/javascript">
	includeHTML();
	</script>
	</body>
</html>