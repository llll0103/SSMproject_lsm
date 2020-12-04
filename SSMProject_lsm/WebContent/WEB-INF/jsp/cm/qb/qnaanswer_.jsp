<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>    
    
<!DOCTYPE html>
<html>
<head>
   <meta charset="EUC-KR">
   <title>�� �� ����</title>
   <link rel="stylesheet" href="/common/ssmCss/default.css">
   <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
   <%--<link rel="stylesheet" href="/common/ssmCss/nbBoard.css"> --%>
   
       <link rel="stylesheet" href="/common/ssmCss/s_base.css">
      <link rel="stylesheet" href="/common/ssmCss/s_content.css">
      <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
     <script src="/include/js/jquery-1.11.3.min.js"></script>
   <script src="/common/ssmJs/goCategory.js"></script>
   <script src="/common/ssmJs/index.js"></script>
   <script type="text/javascript">
      var butChk =0; //������ư�� ������ư�� �����ϱ� ���� ����
      $(function(){
         $("#pwdChk").hide();

         
         $("#cancelBut").click(function (){
            $("#pwdChk").hide();
            $("#buttons").show();
         });

         /* ��й�ȣ Ȯ�� ��ư Ŭ�� �� ó�� �̺�Ʈ*/
         $("#pwdBut").click(function(){
            pwdConfirm();
         });
         
      });//end of ���
      
      /*���� ��ư Ŭ���� ó�� �̺�Ʈ*/
       function updatebutton(){
         $("#pwdChk").show();
         $("#buttons").hide();
         $("#msg").text("�����ȣ�� �Է��� �ּ���").css("color","#000099");
         butChk=1;
      }
      
      /*���� ��ư Ŭ���� ó�� �̺�Ʈ*/
      function deletebutton(){
         $("#pwdChk").show();
         $("#buttons").hide();
         $("#msg").text("�����ȣ�� �Է��� �ּ���").css("color","#000099");
         butChk=2;
      }
      
      /* ��й�ȣ Ȯ�� ��ư Ŭ���� �������� ó�� �Լ�*/
      function pwdConfirm(){
         
            $.ajax({
               url:"/qnaboard/pwdConfirm.ssm",
               type:"POST",
               data:$("#pwcheckform").serialize(),
               error:function(){
                  alert('�ý��� �����Դϴ� �����ڿ��� �����ϼ���');
               },
               success:function(resultData){
                  var goUrl="";
                  if(resultData ==0){
                     $("#msg").text("�ۼ��� �Է��� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.").css("color","red");
                  }else if(resultData ==1){ //��ġ�� ���
                     $("#msg").text("");
                     if(butChk==1){
                        goUrl="/qnaboard/qbupdateForm.ssm";
                     }else if(butChk==2){
                        goUrl="/qnaboard/qbDelete.ssm";
                     }
                     $("#f_data").attr("action",goUrl);
                     $("#f_data").submit();
                  }
               }
            });   
            
      
      }
      
      
   </script>
   <!-- 
   <style>
      html, body {
           margin: 0;
           padding: 0;
           font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
           font-size: 4px;
         }
         
         .list
         {
            width : 500px;
            text-align : left;
            margin : auto;
         }   
   </style> -->
   
</head>
<body>
<div id="wrap">
         <header include-html="/common/ssmMain/header_.jsp?ver=1"></header>
         <div class="subWrap">
         <nav include-html="/common/ssmMain/ssmCategory/cmSideNav.html"></nav>
         <section>
            <div id="tit">
               <h1>���� ������ �亯</h1>
               <p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">Ŀ�´�Ƽ</a> > <a
                  href="#�ּҰɱ�" class="on">������ �亯 ����ȸ</a>
               </p>
            </div>
            
            <div class="container">
   <%
   QnABoardVO qvo =(QnABoardVO)request.getAttribute("qbdetail");
   %>
   <form name="f_data" id="f_data" method="POST">
      <input type="hidden" name="qbNo" value="<%=qvo.getQbNo() %>" />
   </form>
   <br><br><br>
   <%-- ========================��й�ȣ Ȯ�� ��ư �� ��ư �߰� ���� ================================ --%>
   
   <%-- ======================�� ���� �����ֱ� ���� ========================================== --%>
   <div id="boardDetail">
       <div class="clear_div"></div>
       <table cellpadding="0" cellspacing="0" border="0" style="margin:auto;" class="view_box mt_5" >
         <colgroup>
            <col width="18%">
                        <col width="35%">
                        <col width="18%">
                        <col width="35%">
         </colgroup>
         <tbody>
            <tr>
               <th>�ۼ���</th>
               <td><%=qvo.getsMembervo().getSsName() %></td>
               <th>����</th>
               <td colspan="3"><%=qvo.getQbType() %></td>
            </tr>
            <tr>
               <th>�ۼ���</th>
               <td><%=qvo.getQbInsertdate() %></td>
               <th>������</th>
               <td><%=qvo.getQbUpdatedate() %></td>
            </tr>
            <tr>
               <th>����</th>
               <td colspan="3"><%=qvo.getQbTitle() %></td>
            </tr>
            <tr height="300px">
               <th>����</th>
               <td colspan="3" ><%=qvo.getQbContents() %></td>
            </tr>
         </tbody>
      </table>
   </div>
   <%-- ======================�� ���� �����ֱ� ���� ========================================== --%>
   
   <%--===============================��й�ȣ Ȯ�� ��ư �� ��ư �߰� ����======================== --%>
   <table id="boardPwdBut" width="100%">
      <tr>
         <td colspan ="4">
            <div id="pwdChk">
               <form name="pwcheckform" id="pwcheckform">
                  <label for="sspw" id="l_pwd">��й�ȣ : </label>
                  <input type="password" name="ssPw" id="ssPw" />
                  <input type="hidden" name="qbNo" id="qbNo" value="<%=qvo.getQbNo() %>"/>
                  <input type="button" name="pwdBut" id="pwdBut" value="Ȯ��" />
                  <input type="button" name="cancelBut" id="cancelBut" value="���" />
                  
                  <span id="msg"></span>
               </form>
            </div>
         </td>
         <td colspan ="4">
         <div class="board_btn">
               <div class="float_right" id="buttons">
                  <a href="javascript:updatebutton()"><span>����</span></a>
                  <a href="javascript:deletebutton()"><span>����</span></a>
                  <a href="javascript:#��ġ��"><span class="print">���</span></a>
               <!-- <input type="button" value="����" id="updatebutton">
               <input type="button" value="����" id="deletebutton"> -->
            </div>
            </div>
         </td>
      </tr>
   </table>
   <br><br><br>
   <jsp:include page="qnaanswer.jsp"></jsp:include>
   
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