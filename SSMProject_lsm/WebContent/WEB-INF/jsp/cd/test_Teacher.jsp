<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cd.vo.TestTeacherVO" %>
<%@ page import="java.util.List"  %>
<%  request.setCharacterEncoding("EUC-KR");
	Object obj = request.getAttribute("list");
	String loadGrade = (String)request.getAttribute("loadGrade");
	String loadClass = (String)request.getAttribute("loadClass");
	String loadName = (String)request.getAttribute("loadName");
	List list = null;
	int listSize=0;
	TestTeacherVO ttvo = null;
	double totalCountJsp =0.0;
	int listSizeJsp2 = 0;
	double listSizeJsp = 0.0;
	int pageCount = 0;
	listSizeJsp2 = Integer.parseInt((String)request.getAttribute("listSize"));
	if(obj != null){
		list = (List<TestTeacherVO>)request.getAttribute("list");
		if(list.size()>0){
			listSize=list.size();
			ttvo = (TestTeacherVO)list.get(0);
			totalCountJsp = (double)Integer.parseInt(ttvo.getTotalCount());
			
			listSizeJsp = (double)listSizeJsp2;
			pageCount = (int)Math.ceil(totalCountJsp/listSizeJsp);
			
			
		}
	}
	//out.print("��>>>"+listSizeJsp2);
	if(loadName==null){
		loadName="";
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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


	<script type="text/javascript">
	
	$(function(){
			//refrash���� �г� �����ڽ� ����

			$("#ssGrade").val("<%=loadGrade%>");

			//refrash���� �ݼ����ڽ� ����

			$("#ssClass").val("<%=loadClass%>");

			
			//refrash���� �����ڽ� ������Ű��
			$("#howmany").val("<%=listSizeJsp2%>");
			
			$("#ssName").val("<%=loadName%>");
			
			//���� Ŭ����
			$("#reFresh").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val());//howmany=listSize������ ���Ĺ�ư�̾ƴ� �ٸ���ưŬ���� ���������ʱ����� ������ 
				$("#teacher_board").attr("action","/testTeacher/listStudent.ssm").submit();
			});
			
			
			//��������ȣ Ŭ���� �̵��Լ�
			$(".pageNo").click(function(){
			
				var ss = $(this).val();
				$("#pageNo").val(ss);
				$("#teacher_board").attr("action","/testTeacher/listStudent.ssm").submit();
				
			});
			//��ü �г� ���ý� �� ���ɱ� �Լ�
			
			
			//�˻��� �����Լ�
			$("#choice").click(function(){
				$("#pageNo").val("1");
				$("#listSize").val($("#howmany").val())
				$("#teacher_board").attr("action","/testTeacher/listStudent.ssm").submit();
				
			});	
		
		
	});
	
	$(document).on('click', '#ssGrade', function(){
		 if($("#ssGrade").val()!=""){
			 $("#ssClass").attr("disabled",false);
		 }else{
			 $("#ssClass").val("");
			 $("#ssClass").attr("disabled",true);	 
		 }
		});
	</script>
</head>
<body>
	<div id="wrap">

		<%@include file="/common/ssmMain/header_.jsp"%>

		<div class="subWrap">
			<nav include-html="/common/ssmMain/ssmCategory/cdSideNav2.html"></nav>
			<div id="tit">
				<h1>�л�����</h1>
				<p>
					<a href="#">Ȩ</a> > <a href="co01.asp">���μ���</a> > <a
						href="co03.asp" class="on">�л�����</a>
				</p>
			</div>

			<section>
			<div class="container">
				<div class="contentbox">
	<form id="teacher_board">
		<br><br>
		<table class="search_box_app mt_20" id="content01">
							<colgroup>
								<col width="30%" />
								<col width="60%" />
								<col width="10%"/>
							</colgroup>
							<tr>
								
								<td>
									�г�
		<select class ="ssGrade" id="ssGrade" name="ssGrade">
			<option value="DD">��ü</option>
			<option value="FM">1�г�</option>
			<option value="JR">2�г�</option>
			<option value="SR">3�г�</option>			
		</select>
								
								��
		<select class ="ssClass" id="ssClass" name="ssClass">
			<option value="DD">��ü</option>
			<option value="01">1��</option>
			<option value="02">2��</option>
			<option value="03">3��</option>
			<option value="04">4��</option>
			<option value="05">5��</option>			
		</select>
								</td>
								
								<td>
								�̸�
								<input type="text" id="ssName" name="ssName" maxlength="50" class="input"/>								
								</td><td>
								<span class="bt">
								<span class="bt_search" id="choice" name="choice">&nbsp;&nbsp;�˻�&nbsp;&nbsp;</span></span>
								</td>
							</tr>
						</table>
		
		<div class="search_box" style="float:left;">
				<select class="select" id="howmany" name="howmany" style="width:150px;">
						<option value="10">10��</option>
						<option value="20">20��</option>
						<option value="30">30��</option>
						<option value="50">50��</option>
						<option value="70">70��</option>
						<option value="100">100��</option>
					</select> 
					<input type="button" name="reFresh" id="reFresh" value="����">	
			</div>
	<%-- 
		�г�
		<select class ="ssGrade" id="ssGrade" name="ssGrade">
			<option value="DD">��ü</option>
			<option value="FM">1�г�</option>
			<option value="JR">2�г�</option>
			<option value="SR">3�г�</option>			
		</select>
		��
		<select class ="ssClass" id="ssClass" name="ssClass">
			<option value="DD">��ü</option>
			<option value="01">1��</option>
			<option value="02">2��</option>
			<option value="03">3��</option>
			<option value="04">4��</option>
			<option value="05">5��</option>			
		</select>
		�̸�
		<input type="text" id="ssName" name="ssName" value="">
		<input type="button" id="choice" name="choice" value="�˻�">
		
		
		<br><br>
		����������
		<select id="howmany" name="howmany">
			<option value="10">10��</option>
			<option value="20">20��</option>
			<option value="30">30��</option>
			<option value="50">50��</option>
			<option value="70">70��</option>
			<option value="100">100��</option>			
		</select>
		<input type="button" id="reFresh" name="reFresh" value="����">--%> 
     <table class="list_box" cellpadding="0" cellspacing="0" border="0"> 
       <colgroup>
			<col width="10%">
			<col width="5%">
			<col width="5%">
			<col width="10%">
			<col width="14%">
			<col width="14%">
			<col width="14%">
			<col width="14%">
			<col width="14%">
		</colgroup>
      	<thead>
         <tr>
            <th>�й�</th>
            <th>�г�</th>
            <th>��</th>
            <th>�̸�</th>
            <th>���������˻�</th>
            <th>�������K�˻�</th>
            <th>�������H�˻�</th>
            <th>������ġ���˻�</th>
            <th>���μ������˻�</th>
         </tr>
         </thead>
         
<%			if(obj == null){
			
			%>
			<tr>
				<td colspan ='9' align='center'>�����Ͱ� �����ϴ�.</td>
			</tr>
			<%	
			}		
			else {
				
				for(int i=0;i<listSize;i++){
				 ttvo = (TestTeacherVO)list.get(i); %>
				
			<tr>
            <td><%=ttvo.getSsNo() %></td>
            <td><%=ttvo.getSsGrade() %></td>
            <td><%=ttvo.getSsClass() %></td>
            <td><%=ttvo.getSsName() %></td>
            <% if(ttvo.getJa_Url()==null){ %>
            <td> ��� ���� </td>
            <% }else{%>
            <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=ttvo.getJa_Url()%>'"></td>
            <% } %>
            <% if(ttvo.getJi_Url()==null){ %>
            <td> ��� ���� </td>
            <% }else{%>
            <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=ttvo.getJi_Url()%>'"></td>
            <% } %>
            <% if(ttvo.getIh_Url()==null){ %>
            <td> ��� ���� </td>
            <% }else{%>
            <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=ttvo.getIh_Url()%>'"></td>
            <% } %>
            <% if(ttvo.getVa_Url()==null){ %>
            <td> ��� ���� </td>
            <% }else{%>
            <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=ttvo.getVa_Url()%>'"></td>
            <% } %>
            <% if(ttvo.getCm_Url()==null){ %>
            <td> ��� ���� </td>
            <% }else{%>
            <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=ttvo.getCm_Url()%>'"></td>
            <% } %>
             </tr>
            <%	}//for�� ����
			}//else�� ����%>
        
      </table>
	<input type="hidden" id="listSize" name="listSize" value="<%=listSizeJsp2 %>">
    <input type="hidden" id="pageNo" name="pageNo" value='1'>
   <%for(int i=1 ; i<=pageCount;i++){%>
			<input type="button" class="pageNo" id="pageNo2" name="pageNo2" value="<%=i%>">
	<%}
	%>
   
   </form>  
    </section>
		</div>
		<footer include-html="/common/ssmMain/footer.html"></footer>
		<script type="text/javascript">
			includeHTML();
		</script>
	</div>
</body>
</html>