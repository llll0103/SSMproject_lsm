<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.br.vo.Non_ProgramVO,ssm.common.utils.BabySession" %>
<%@ page import="java.util.List"  %>
<%  request.setCharacterEncoding("EUC-KR");
	Object obj = request.getAttribute("list");
	String resultStr = (String)request.getAttribute("resultStr");
	String userAuthoriry = BabySession.getSessionAU(request);
	
	
	double totalCountJsp =0.0;
	int listSizeJsp2 = 0;
	double listSizeJsp = 0.0;
	int pageCount = 0;
	Non_ProgramVO npvo = new Non_ProgramVO();
	Non_ProgramVO npvo2 = new Non_ProgramVO();
	String npTitle ="";
	String npContents="";
	String ob = "";
	String ob2 = "";
	Object npTitle1= request.getAttribute("npTitle");
	Object npContents1= request.getAttribute("npContents");
	
	if(npTitle1!=null) npTitle = (String)npTitle1;
	if(npContents1!=null) npContents = (String)npTitle1;

	List list = null;
	if(obj != null){
		 list = (List)request.getAttribute("list");	
		 int listSize=0;
			
			listSizeJsp2 = Integer.parseInt((String)request.getAttribute("listSize"));
			if(obj != null){
				list = (List)request.getAttribute("list");
				if(list.size()>0){
					listSize=list.size();
					npvo = (Non_ProgramVO)list.get(0);
					totalCountJsp = (double)Integer.parseInt(npvo.getTotalCount());
					listSizeJsp = (double)listSizeJsp2;
					pageCount = (int)Math.ceil(totalCountJsp/listSizeJsp);
					
					
				}
			}
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>npMain</title>
	<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
    <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
    <link rel="stylesheet" href="/common/ssmCss/npMainBoard.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script type="text/javascript">
		$(function(){
			//���� ����
<%-- 			alert("<%=userAuthoriry%>"); --%>
			
			//����¡
			$("#howmany").val("<%=listSizeJsp2 %>");
			if("<%=resultStr%>"!=null && <%=resultStr%>!=""){
			}
			if("<%=npTitle%>"!=null) $("#text").val("<%=npTitle%>");
			if("<%=npContents%>"!=null) $("#text").val("<%=npContents%>");
			$("#insert").click(function(){
				location.href="/nonprogram/np_InsertForm.ssm";
			});
			
			
			$(".pageNo").click(function(){
				
				var ss = $(this).val();
				$("#pageNo").val(ss);
				$("#howmany").val("<%=listSizeJsp2 %>");
				$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();
				
			});
			
			//���� Ŭ����
			$("#reFresh").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val());//howmany=listSize������ ���Ĺ�ư�̾ƴ� �ٸ���ưŬ���� ���������ʱ����� ������ 
				$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();
			});
			
			$("#text").keydown(function(key){
				if(key.keyCode==13){
					$("#pageNo").val("1");
					$("#listSize").val($("#howmany").val())
					if($("#where").val()==1) $("#npTitle").val($("#text").val());
					if($("#where").val()==2) $("#npContents").val($("#text").val());
					$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();	
				}
			});
			$("#search").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val())
				if($("#where").val()==1) $("#npTitle").val($("#text").val());
				if($("#where").val()==2) $("#npContents").val($("#text").val());
				$("#nonProgramList").attr("action","/nonprogram/np_Main.ssm").submit();			
			});	
		});
		function goDetail(npNo){
			location.href="/nonprogram/np_detailData.ssm?npNo="+npNo;

		}
		
		
		
	</script>
	
</head>
<body>
	<div id="wrap">
		<%@include file= "/common/ssmMain/header_.jsp" %>
		<div class="subWrap">
		<%
		if(userAuthoriry.equals("1")){%>
			<nav include-html="/common/ssmMain/ssmCategory/brSsideNav.html"></nav>
			<div id="containerTit">
	            <h1>�񱳰� ���α׷�</h1>
	            <p>
	               <a href="#">Ȩ</a> > <a href="co01.asp">�񱳰� ��õ</a> > <a
	                  href="co03.asp" class="on">���α׷� ���</a>
	            </p>
	        </div>
		<%
			}else if(userAuthoriry.equals("2") || userAuthoriry.equals("3")){%>
				<nav include-html="/common/ssmMain/ssmCategory/brTsideNav.html"></nav>
		<%
			}
		%>
		<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@�ּ�  -->
			
			<section>
				<div id="container">
					<form id="nonProgramList">
						<div class="searchGuide">
							����������
							<select id="howmany" name="howmany">
								<option value="10">10��</option>
								<option value="20">20��</option>
								<option value="30">30��</option>
								<option value="50">50��</option>
								<option value="70">70��</option>
								<option value="100">100��</option>			
							</select>
							<input type="button" id="reFresh" name="reFresh" value ="����">
							
							<!-- ==================================================== -->
							<select id="where" name="where">
								<option value="1">����</option>
								<option value="2">����</option>
							</select>
							<input type="text" id="text" name="text">
							<input type="button" id="search" name="search" value ="�˻�">
							<input type='button' id='insert' name='insert' value="���ۼ�">
							
							<!-- ==================================================== -->
							</div>
							<div class="allBox">
							<%if(obj!=null){
								for(int i =0 ; i<list.size();i++){
									npvo=(Non_ProgramVO)list.get(i);
									if((i%2) == 0){ %>
								<div class='box' onclick="goDetail('<%=npvo.getNpNo()%>')">
									<div class="imgPart" >
											<img src="/file/<%=npvo.getNpImage()%>"/>
									</div>
									<div class="notePart">
										<div class="subject"><%=npvo.getNpTitle()%><br></div>
										��         �� :<%=npvo.getNpCenter()%><br>
										<%
										if(npvo.getNpObject().equals("FM")) ob="1�г�";
										if(npvo.getNpObject().equals("JR")) ob="2�г�";
										if(npvo.getNpObject().equals("SR")) ob="3�г�";
										if(npvo.getNpObject().equals("FM,JR")) ob="1�г�,2�г�";
										if(npvo.getNpObject().equals("FM,SR")) ob="1�г�,3�г�";
										if(npvo.getNpObject().equals("JR,SR")) ob="2�г�,3�г�";
										if(npvo.getNpObject().equals("FM,JR,SR")) ob="1�г�,2�г�,3�г�";
										
										
										%>
										�� �� �� �� : <%=ob %><br>
										
										�� �� �� �� : <%=npvo.getNpPersonnel()%>��
									</div>
									<input type="hidden" class="npNo" id="npNo" name="npNo" value="<%=npvo.getNpNo()%>">
								</div>
								
								<!-- 2��°�� �������Ҹ��� -->
								<%} 
										if(i==list.size()-1){
											break;
											
										}else{
											i++;
										}
					
										npvo2=(Non_ProgramVO)list.get(i);%>
									<%if((i%2) == 1){ %>
								<div class="box" onclick="goDetail('<%=npvo2.getNpNo()%>')">
								
									<div class="imgPart">
										<img src="/file/<%=npvo2.getNpImage()%>"/>
									</div>
									
									<div class="notePart">
										<div class="subject"><%=npvo2.getNpTitle()%></div>
										��         �� : <%=npvo2.getNpCenter()%><br>
										<%
										if(npvo.getNpObject().equals("FM")) ob2="1�г�";
										if(npvo.getNpObject().equals("JR")) ob2="2�г�";
										if(npvo.getNpObject().equals("SR")) ob2="3�г�";
										if(npvo.getNpObject().equals("FM,JR")) ob2="1�г�,2�г�";
										if(npvo.getNpObject().equals("FM,SR")) ob2="1�г�,3�г�";
										if(npvo.getNpObject().equals("JR,SR")) ob2="2�г�,3�г�";
										if(npvo.getNpObject().equals("FM,JR,SR")) ob2="1�г�,2�г�,3�г�";
										%>
										�� �� �� �� : <%=ob2 %><br>
										�� �� �� ��: <%=npvo2.getNpPersonnel()%>��
									</div>
								<input type="hidden" class="npNo" id="npNo" name="npNo" value="<%=npvo2.getNpNo()%>">
								</div>
								
								
									<%} 
									
								}
								
							}else{%>
							<div>��������</div>
								<%
							}
							%>
							</div>
					 	<%for(int i=1 ; i<=pageCount;i++){%>
							<input type="button" class="pageNo" id="pageNo2" name="pageNo2" value="<%=i%>">
						<%
							}
						%>
						<input type="hidden" id="npTitle" name="npTitle">
						<input type="hidden" id="npContents" name="npContents">
						<input type="hidden" id="listSize" name="listSize" value="<%=listSizeJsp2 %>">
					    <input type="hidden" id="pageNo" name="pageNo" value='1'>
						</form>
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