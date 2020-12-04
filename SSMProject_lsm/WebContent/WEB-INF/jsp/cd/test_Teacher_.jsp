<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.List"%> 
<%@ page import ="ssm.mi.vo.SMemberVO"%> 
    
<% List<SMemberVO> mystudent = (List<SMemberVO>)request.getAttribute("mystudent"); %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
   <title>����</title>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <link rel="stylesheet" href="/common/ssmCss/default.css">
   <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
      <link rel="stylesheet" href="/common/ssmCss/s_base.css">
      <link rel="stylesheet" href="/common/ssmCss/s_content.css">
      <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
   <script src="/common/ssmJs/goCategory.js"></script>
   <script src="/common/ssmJs/index.js"></script>
   <script type="text/javascript">
   
   
   </script>
   
   <style>
      html, body {
/*            margin: 0; */
/*            padding: 0; */
/*            font-family: Arial, Helvetica Neue, Helvetica, sans-serif; */
/*            font-size: 4px; */
         }
/*         
         table  {
            width : 600px;
            text-align : center;
            margin : auto;
         }*/
         
         .list
         {
/*             width : 500px; */
            text-align : left;
            margin : auto;
         }   
          .left-box {
          		float: left;
				width: 49%;
				height: 100%;
				margin : 10px 0;
				margin-left : 1%;
			} 

 			.right-box { 
 				float: right; 
				width: 49%; 
			   	height: 100%; 
			   	margin : 10px 0;
		} 
		.list_box td {
			border-bottom: 1px solid #ebebeb;
		}
		
		.list_box input[type=button]{
			background-color: #fd333369;
			padding : 5px;
			color : #ffffff8a;
			line-height : 45px;
			border-radius : 100px;
		}
		
		h1 {
			margin : 10px auto;
		}
   </style>
   
</head>
<body>
<div id="wrap">
         <header include-html="/common/ssmMain/header_.jsp?ver=1"></header>
         <div class="subWrap">
         <nav include-html="/common/ssmMain/ssmCategory/ef_TsideNav.html"></nav>
         <section>
         <div id="tit">
				<h1>�б� ���� ����</h1>
				<p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">�񱳰� ���α׷�</a> > <a
					href="#�ּҰɱ�" class="on">�б� ���� ����</a>
			</p>
		</div>
            <div class="container">
   <%if(mystudent.size()!=0){
   SMemberVO svo = mystudent.get(0); 
               String grade = svo.getFmMembervo().getFmGrade();
               String class_= svo.getFmMembervo().getFmClass();%>
                  
               
               <h1><%=grade%> <%=class_ %>�� �л�����</h1>
               <%
               }%>
   <div class="list" style="text-align:center">
   <div class='left-box'>
    <table id="kdhtable1" class="list_box" cellpadding="0" cellspacing="0" border="0"> 
            <thead>
               <tr>
                  <th>����</th>
                  <th>�̸�</th>
                  <th>��ȣ</th>
                  <th>���������˻�</th>
                  <th>�������(K)�˻�</th>
                  <th>�������(H)�˻�</th>
                  <th>������ġ���˻�</th>
                  <th>���μ������˻�</th>
               </tr>
            </thead>
            <tbody>
               <%
               System.out.println("mystudent.size()>>>:" + mystudent.size());
               if(mystudent.size()==0){
               %>
               
               <tr>
                  <td>0</td>
                  <td>�л������ �����ϴ�.</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
               </tr>
               <%
               }else{
                  
                  int count = mystudent.size();
                  for (int i=0; i<count/2; i++){
                     SMemberVO svo = mystudent.get(i);
                     String image = svo.getSsImage();
                  
               %>   
                  
                  <tr>
                     <td style=" padding-top: 2px;    padding-bottom: 2px;">
                     <span class="efstudent"><img style="width:70px; height:80px; " src="/file/<%=image%>.gif"></span></td>
                     <td style="font-weight:bold;"><%=svo.getSsName() %></td>
                     <td><%=svo.getFmMembervo().getFmNum()%>��</td>
                     <% if(svo.getCdvaluevo().getJa_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getJa_Url()%>'"></td>
                   <% } %>
                   <% if(svo.getCdvaluevo().getJi_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getJi_Url()%>'"></td>
                   <% } %>
                   <% if(svo.getCdvaluevo().getIh_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getIh_Url()%>'"></td>
                   <% } %>
                   <% if(svo.getCdvaluevo().getVa_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getVa_Url()%>'"></td>
                   <% } %>
                   <% if(svo.getCdvaluevo().getCm_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getCm_Url()%>'"></td>
                   <% } %>
                   </tr>
                   <%   }
               }//for�� ����
                  %>
            </tbody>
         </table>
         </div>
         <div class='right-box'>
         <table id="kdhtable2" class="list_box" cellpadding="0" cellspacing="0" border="0"> 
            <thead>
               <tr>
                  <th>����</th>
                  <th>�̸�</th>
                  <th>��ȣ</th>
                  <th>���������˻�</th>
                  <th>�������(K)�˻�</th>
                  <th>�������(H)�˻�</th>
                  <th>������ġ���˻�</th>
                  <th>���μ������˻�</th>
               </tr>
            </thead>
            <tbody>
               <%
               System.out.println("mystudent.size()>>>:" + mystudent.size());
               if(mystudent.size()==0){
               %>
               
               <tr>
                  <td>0</td>
                  <td>�л������ �����ϴ�.</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
               </tr>
               <%
               }else{
                  int count = mystudent.size();
                  for (int i=count/2; i<count; i++){
                     SMemberVO svo = mystudent.get(i);
                     String image = svo.getSsImage();
                    
               %>   
                  
                 <tr>
                     <td style=" padding-top: 2px;    padding-bottom: 2px;">
                    <span class="efstudent"><img style="width:70px; height:80px; " src="/file/<%=image%>.gif"></span></td>
                     <td><%=svo.getSsName() %></td>
                     <td><%=svo.getFmMembervo().getFmNum()%>��</td>
                     <% if(svo.getCdvaluevo().getJa_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getJa_Url()%>'"></td>
                   <% } %>
                   <% if(svo.getCdvaluevo().getJi_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getJi_Url()%>'"></td>
                   <% } %>
                   <% if(svo.getCdvaluevo().getIh_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getIh_Url()%>'"></td>
                   <% } %>
                   <% if(svo.getCdvaluevo().getVa_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getVa_Url()%>'"></td>
                   <% } %>
                   <% if(svo.getCdvaluevo().getCm_Url().equals("�����;���")){ %>
                   <td> ��� ���� </td>
                   <% }else{%>
                   <td> <input type="button" value="��� Ȯ��" onclick="location.href='<%=svo.getCdvaluevo().getCm_Url()%>'"></td>
                   <% } %>
                   </tr>
                  
               <%     
                  }
               }
                  %>
            </tbody>
         </table>
         </div>
      </div>
      
      <form id="tForm" name="tForm">
         <input Type="hidden" id="ssNo" name="ssNo">
      
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