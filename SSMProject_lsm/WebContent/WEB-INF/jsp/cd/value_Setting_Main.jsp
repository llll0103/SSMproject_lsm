<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cd.vo.Value_SettingVO,java.util.List" %>
<% request.setCharacterEncoding("EUC-KR");
	String ssNo="";
	String vsFirst="";
	String vsSecond="";
	String vsThird="";
	String isud = "";
	Value_SettingVO vsvo = new Value_SettingVO();
	Object obj = request.getAttribute("list");
	String resultStr= (String)request.getAttribute("resultStr");
	if(obj!=null&&obj!=""){
	 List list = (List)request.getAttribute("list");
	 vsvo = (Value_SettingVO)list.get(0);
	 ssNo=vsvo.getSsNo();
	 vsFirst=vsvo.getVsFirst();
	 vsSecond=vsvo.getVsSecond();
	 vsThird=vsvo.getVsThird();
	isud = "U";
	}else{
		isud = "I";
	}
	

%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>valueSetting</title>
		 <link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
	      <link rel="stylesheet" href="/common/ssmCss/default.css">
	      <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	      <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
	      <script src="/common/ssmJs/goCategory.js"></script>
	      <script src="/common/ssmJs/index.js"></script>
	      <script src="/common/ssmJs/goBoard.js"></script>
	      <script src="/common/ssmJs/goLogin.js"></script>
	      <link rel="stylesheet" href="/common/ssmCss/s_base.css">
		<link rel="stylesheet" href="/common/ssmCss/s_content.css">
		<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
		<link rel="stylesheet" href="/common/ssmCss/cd.css">
<script type="text/javascript">
	$(function(){
		if("<%=resultStr%>" != 'null') alert("<%=resultStr%>");
		
		$("#ISUD").val("<%=isud%>");
		if("<%=vsFirst%>"=="HE") $("#select1").val("����");
		if("<%=vsFirst%>"=="CH") $("#select1").val("��ȭ");
		if("<%=vsFirst%>"=="SU") $("#select1").val("����");
		if("<%=vsFirst%>"=="LE") $("#select1").val("����");
		if("<%=vsFirst%>"=="MN") $("#select1").val("��");
		if("<%=vsFirst%>"=="CO") $("#select1").val("����");
		if("<%=vsFirst%>"=="CR") $("#select1").val("â��");
		if("<%=vsFirst%>"=="KN") $("#select1").val("����");
		
		if("<%=vsSecond%>"=="HE") $("#select2").val("����");
		if("<%=vsSecond%>"=="CH") $("#select2").val("��ȭ");
		if("<%=vsSecond%>"=="SU") $("#select2").val("����");
		if("<%=vsSecond%>"=="LE") $("#select2").val("����");
		if("<%=vsSecond%>"=="MN") $("#select2").val("��");
		if("<%=vsSecond%>"=="CO") $("#select2").val("����");
		if("<%=vsSecond%>"=="CR") $("#select2").val("â��");
		if("<%=vsSecond%>"=="KN") $("#select2").val("����");
		
		if("<%=vsThird%>"=="HE") $("#select3").val("����");
		if("<%=vsThird%>"=="CH") $("#select3").val("��ȭ");
		if("<%=vsThird%>"=="SU") $("#select3").val("����");
		if("<%=vsThird%>"=="LE") $("#select3").val("����");
		if("<%=vsThird%>"=="MN") $("#select3").val("��");
		if("<%=vsThird%>"=="CO") $("#select3").val("����");
		if("<%=vsThird%>"=="CR") $("#select3").val("â��");
		if("<%=vsThird%>"=="KN") $("#select3").val("����");
		
		$("#saveValueSetting").click(function(){
			var valueK = $("#select1").val();
			if(valueK=="����") var valueE = "HE";
			if(valueK=="��ȭ") var valueE = "CH";
			if(valueK=="����") var valueE = "SU";
			if(valueK=="����") var valueE = "LE";
			if(valueK=="��") var valueE = "MN";			
			if(valueK=="����") var valueE = "CO";
			if(valueK=="â��") var valueE = "CR";
			if(valueK=="����") var valueE = "KN";
			$("#select1").val(valueE);

			var valueK2 = $("#select2").val();
			if(valueK2=="����") var valueE2 = "HE";
			if(valueK2=="��ȭ") var valueE2 = "CH";
			if(valueK2=="����") var valueE2 = "SU";
			if(valueK2=="����") var valueE2 = "LE";
			if(valueK2=="��") var valueE2= "MN";			
			if(valueK2=="����") var valueE2 = "CO";
			if(valueK2=="â��") var valueE2 = "CR";
			if(valueK2=="����") var valueE2 = "KN";
			$("#select2").val(valueE2);
			
			var valueK3 = $("#select3").val();
			if(valueK3=="����") var valueE3 = "HE";
			if(valueK3=="��ȭ") var valueE3 = "CH";
			if(valueK3=="����") var valueE3 = "SU";
			if(valueK3=="����") var valueE3 = "LE";
			if(valueK3=="��") var valueE3= "MN";			
			if(valueK3=="����") var valueE3 = "CO";
			if(valueK3=="â��") var valueE3 = "CR";
			if(valueK3=="����") var valueE3 = "KN";
			$("#select3").val(valueE3);
			

			$("#select_Info").attr("action","/value_Setting/saveValueSetting.ssm").submit();
		});
		
		
		$(".HE").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		$(".CH").click(function(){
			//alert("��ȭŬ��");
			select("��ȭ");
		});
		
		$(".SU").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		
		$(".LE").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		
		$(".MN").click(function(){
			//alert("��Ŭ��");
			select("��");
		});
		
		$(".CO").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		
		$(".CR").click(function(){
			//alert("â��Ŭ��");
			select("â��");
		});
		
		$(".KN").click(function(){
			//alert("����Ŭ��");
			select("����");
		});
		
	});
	
	function select(vs){ 
		for(var i =1 ; i<4;i++){
			if($("#select"+i).val()== vs){
				$("#select"+i).val("");
				//alert("�̹� �ִ°��� ����Կ�");
				return;
			}
		}
		//alert("select�Լ� ����");
		if($("#select1").val()==""){
			//alert("select1����!!");
			$("#select1").val(vs);
			//alert($('#select1').val());
			return;
		}

		if($("#select2").val()==""){
			//alert("select2����!!");
	
			$("#select2").val(vs);
			//alert($('#select2').val());
			return;
		}
		
		if($("#select3").val()==""){
			//alert("select3����!!");
			$("#select3").val(vs);
			//alert($('#select3').val());
			return;
		}
		
		
		
		alert("3�����̻� �����Ҽ� �����ϴ�");
		return;
		
		
		
					
	}
</script>

</head>
<body>
<div id="wrap">
		<%@include file="/common/ssmMain/header_.jsp"%>

		<div class="subWrap">
			<nav include-html="/common/ssmMain/ssmCategory/cdSsideNav.html"></nav>
			<section>
			<div id="tit">
				<h1>��ġ�� ����</h1>
				<p>
					<a href="#">Ȩ</a> > <a href="co01.asp">���μ���</a> > <a
						href="co03.asp" class="on">��ġ������</a>
				</p>
			</div>
			<div class="container">
				<div id="content">
					<div class="contentbox" align="center">
						<form id="select_Info" name="select_Info">
							<table class="view_box mt_5"  cellspacing="0" cellpadding="0" style="color:black; margin:auto;" >
								<colgroup>
									<col width="33%">
									<col width="33%">
									<col width="33%">
								</colgroup>
								<tr>
									<th align='center'>1����</th>
									<th align='center'>2����</th>
									<th align='center'>3����</th>
								</tr>
								<tr>
									<td>
										<input type="text" id="select1" name="vsFirst" readonly >
									</td>
									<td>
										<input type="text" id="select2" name="vsSecond" readonly >
									</td>		
									<td>
										<input type="text" id="select3" name="vsThird" readonly >
									</td>
								</tr>
							</table>
							<input type="hidden" id="ISUD" name="ISUD">
						</form>
						<div class="compbox">
							<table style="margin:auto;">
								<tr>
									<td>
										<div class="comp HE" id="HE" name="HE" value="����" 
											 style="padding-top: 5px;width: 110px;" >
											<img src="/images/HE.png">
										</div>
									</td>
									<td>
										<div class="comp CH" id="CH" name="CH" value="��ȭ"
											 style="padding-top: 5px;width: 110px;" >
											<img src="/images/CH.png">
										</div>
									</td>
									<td>
										<div class="comp SU" id="SU" name="SU" value="����"
											 style="padding-top: 5px;width: 110px;" >
											<img src="/images/SU.png">
										</div>
									</td>
									<td>
										<div class="comp LE" id="LE" name="LE" value="����"
											 style="padding-top: 5px;width: 110px;" >
											<img src="/images/LE.png">
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="comp MN" id="MN" name="MN" value="��"
						   					 style="padding-top: 5px;width: 110px;" >
											<img src="/images/MN.png">
										</div>
									</td>
									<td>
										<div class="comp CO" id="CO" name="CO" value="����"
						   					 style="padding-top: 5px;width: 110px;" >
											<img src="/images/CO.png">
										</div>
									</td>
									<td>
										<div class="comp CR" id="CR" name="CR" value="â��"
						   					 style="padding-top: 5px;width: 110px;" >
											<img src="/images/CR.png">
										</div>
									</td>
									<td>
										<div class="comp KN" id="KN" name="KN" value="����"
							   				 style="padding-top: 5px;width: 110px;" >
											<img src="/images/KN.png">
										</div>
									</td>
								</tr>
							</table>
						</div>
						<!-- // .compbox -->
						<div class=" board_btn float_right">
							<a href="" id="saveValueSetting" name="saveValueSetting"><span>�����ϱ�</span></a>
						</div>
						<!-- // .board_btn -->
					</div>
					<!-- //.contentbox -->
				</div>
				<!-- // .content -->
			</div>
			<!-- // .container -->
		</section>
	</div>
	<!-- // .subWrap -->
	<footer include-html="/common/ssmMain/footer.html"></footer>
	<script type="text/javascript">
		includeHTML();
	</script>
</div>
</body>
</html>