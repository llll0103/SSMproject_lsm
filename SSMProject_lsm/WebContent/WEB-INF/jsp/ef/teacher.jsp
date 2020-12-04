<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.List"%> 
<%@ page import ="ssm.mi.vo.SMemberVO"%> 
    
<% List<SMemberVO> eftlist = (List<SMemberVO>)request.getAttribute("eflist"); %>    
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
   
   $(document).ready(function(){
      
      //tr Ŭ���� ������ �̵�
      $(".list_box tr").click(function(){
         var ssNo= $(this).attr("data-num");
         $("#ssNo").val(ssNo);
         $("#tForm").attr('action','/eportfolio/student.ssm')
         .submit();
         
      });
      
   });
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
         }
         
         .list
         {
            width : 500px;
            text-align : left;
            margin : auto;
         }   */
         
         h1 {
         	margin : 10px 0;
         }
         .list_box {
       	    margin: 0 auto;
         }
         .left-box {
		   float: left;
		   width: 50%;
		   height: 100%;
		   margin-bottom : 10px;
		}

		.right-box {
		   float: right;
		   width: 50%;
		   height: 100%;
		   margin-bottom : 10px;
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
				<h1>�б� ��� ����</h1>
				<p>
					<a href="#">Ȩ</a> > <a href="co01.asp">E-��Ʈ������</a> > <a
						href="co03.asp" class="on">�б� ��� ����</a>
				</p>
			</div>
            <div class="container">
   <%if(eftlist.size()!=0){
   SMemberVO svo = eftlist.get(0); 
               String grade = svo.getFmMembervo().getFmGrade();
               String class_= svo.getFmMembervo().getFmClass();%>
                  
               
               <h1><%=grade%> <%=class_ %>�� �л�����</h1>
               <%
               }%>
   <div class="list" style="text-align:center">
   <div class='left-box'>
    <table style="width:90%;" id="kdhtable1" class="list_box" cellpadding="0" cellspacing="0" border="0"> 
            <thead>
               <tr>
                  <th>����</th>
                  <th>�̸�</th>
                  <th>��ȣ</th>
                  <th>����о�</th>
                  <th>�������</th>
                  <th>��ġ��</th>
               </tr>
            </thead>
            <tbody>
               <%
               System.out.println("eftlist.size()>>>:" + eftlist.size());
               if(eftlist.size()==0){
               %>
               
               <tr>
                  <td>0</td>
                  <td>�л������ �����ϴ�.</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
               </tr>
               <%
               }else{
                  
                  int count = eftlist.size();
                  for (int i=0; i<count/2; i++){
                     SMemberVO svo = eftlist.get(i);
                     String no = svo.getSsNo();
                     no= no.substring(2);
                     String image = svo.getSsImage();
               %>   
                  
                  <tr data-num=<%=svo.getSsNo() %>>
                     
                     <td style=" padding-top: 2px;    padding-bottom: 2px;">
                     <span class="efstudent"><img style="width:70px; height:80px; " src="/file/<%=image%>.gif""></span></td>
                     <td><%=svo.getSsName() %></td>
                     <td><%=svo.getFmMembervo().getFmNum()%>��</td>
                     <td><%=svo.getBasicInpormationvo().getBiWf()%></td>
                     <td><%=svo.getBasicInpormationvo().getBiWi()%></td>
                     <td><%=svo.getValueSettingvo().getVsFirst()%></td>
                  </tr>
                  
               <%       
                  }
               }
                  %>
            </tbody>
         </table>
         </div>
         <div class='right-box'>
         <table style="width:90%;" id="kdhtable2" class="list_box" cellpadding="0" cellspacing="0" border="0"> 
            <thead>
               <tr>
                  <th>����</th>
                  <th>�̸�</th>
                  <th>��ȣ</th>
                  <th>����о�</th>
                  <th>�������</th>
                  <th>��ġ��</th>
               </tr>
            </thead>
            <tbody>
               <%
               System.out.println("eftlist.size()>>>:" + eftlist.size());
               if(eftlist.size()==0){
               %>
               
               <tr>
                  <td>0</td>
                  <td>�л������ �����ϴ�.</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
               </tr>
               <%
               }else{
                  
                  int count = eftlist.size();
                  for (int i=count/2; i<count; i++){
                     SMemberVO svo = eftlist.get(i);
                     String no = svo.getSsNo();
                     no= no.substring(2);
                     String image = svo.getSsImage();
               %>   
                  
                  <tr data-num=<%=svo.getSsNo() %>>
                     
                     <td style=" padding-top: 2px;    padding-bottom: 2px;">
                     <span class="efstudent"><img style="width:70px; height:80px; " src="/file/<%=image%>.gif""></span></td>
                     <td><%=svo.getSsName() %></td>
                     <td><%=svo.getFmMembervo().getFmNum()%>��</td>
                     <td><%=svo.getBasicInpormationvo().getBiWf()%></td>
                     <td><%=svo.getBasicInpormationvo().getBiWi()%></td>
                     <td><%=svo.getValueSettingvo().getVsFirst()%></td>
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