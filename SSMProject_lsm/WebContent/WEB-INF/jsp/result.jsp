<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.mi.vo.*" %>
<%@ page import="ssm.common.utils.BabySession" %>
<% request.setCharacterEncoding("EUC-KR"); 

   Object result = (String)request.getAttribute("result");
   Object message =(String)request.getAttribute("message");

      
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>���ȭ��</title>
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js">
      </script>
      <script type="text/javascript">
         
<%--          alert("<%=result%>"); --%>
      
         if("<%=result%>".indexOf("failed")>-1){
<%--            alert("<%=message%>"); --%>
            //openner.location.reload();
            //history.go(-1);   
            location.href="/main_1.jsp";
         }else{
<%--             alert("else"+":"+"<%=result%>"); --%>
            //history.go(-1);
            location.href="/main_1.jsp";
          //  window.close();            
         }
      </script>
      
   <body>

   </body>
</html>