<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@ page import="ssm.cm.vo.QnABoardVO" %>
<%@ page import="ssm.common.utils.BabySession" %>  

<%  String sessionAU = BabySession.getSessionAU(request);%>      
<%  String sessionNO = BabySession.getSessionNO(request);%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
   <title>qnaanswer(���������)</title>
            <script src="/include/js/jquery-1.11.3.min.js"></script>
      <link rel="stylesheet" href="/common/ssmCss/default.css">
      <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
      
      <link rel="stylesheet" href="/common/ssmCss/s_base.css">
      <link rel="stylesheet" href="/common/ssmCss/s_content.css">
      <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
       <script src="/common/ssmJs/index.js"></script>
        <script type="text/javascript">
        <%
        QnABoardVO qvo =(QnABoardVO)request.getAttribute("qbdetail");
        String qbNo=qvo.getQbNo();
        
        
        %>
        
        
        $(function(){
           
           //�л������̸� ��۾����ư�� ���ܶ�
           var sessionAU="<%=sessionAU%>";
            if(sessionAU==1){
               $("#replywritediv").hide();
            }
           
              //�⺻ ��� ��� �ҷ�����
              var qbNo = "<%=qvo.getQbNo()%>";
              listAll(qbNo); // ��� ����Ʈ ��û�Լ�
              
              $('#qnaanswerContainer').hide();
 
              if(true){//���缼���� ������ 
                 $('#qnaanswerContainer').show();
              }
              
              // ��� ���� ���� �̺�Ʈ
              $('#qaInsert').click(function(){
                 
               var insertUrl = "/qnaanswer/qaInsert.ssm";
               //�� ������ ���� POST ����� Ajax ���� ó��
               $.ajax({
                  url : insertUrl, // ���� URL
                  type : "post",
                  headers : {
                        "Content-Type":"application/json",
                        "X-HTTP-Method-Override":"POST"},
                  dataType : "text",
                  data : JSON.stringify({
                     qbNo : qbNo,
                     ttNo : $("#ttNo").val(),
                     qaContents : $("#qaContents").val()
                  }),
                  success : function(resultData){
                     if(resultData == "SUCCESS"){
                        alert("����� ��ϵǾ����ϴ�!");
                        dataReset(); // input �±׵鿡 ���� �ʱ�ȭ �Լ�
                        listAll(qbNo); // ����Ʈ ��û �Լ�
                     }
                  },
                  error : function(){
                     alert("�ý��� ����! ");
                  }
                  
                  
               });
                 
                 
              });
              
              
              // ������ư Ŭ���� ������ ���
              $(document).on("click","#updatebutton",function(){
                 $(".reset_btn").click();
                 
                 var conText = $(this).parents("li").children().eq(1).html();
                 console.log("conText >>> : "+conText);
                 $(this).parents("li").find("input[type='button']").hide();
                 $(this).parents("li").children().eq(0).html();
                 var conArea = $(this).parents("li").children().eq(1);
                 
                 conArea.html("");
                 var data = "<textarea name='content' id='content'>"+conText+"</textarea>";//�ؽ�Ʈ�ڽ�����
                 data += "<input type='button' class='update_btn' value='�����Ϸ�'>";//������ư����
                 data += "<input type='button' class='reset_btn' value='�������'>";//������ҹ�ư����
                 conArea.html(data);
              });
              
              
              //�ʱ�ȭ ��ư
              $(document).on("click",".reset_btn",function(){//������Ҵ�����
                 var conText = $(this).parents("li").find("textarea").html();
                 $(this).parents("li").find("input[type=button]").show();
                 var conArea = $(this).parents("li").children().eq(1);
                 conArea.html(conText);
              });
              
              
              //�� ������ ���� Ajax ���� ó��
              $(document).on("click",".update_btn",function(){//�����Ϸ� ������
                 alert("��ư�� ������ �ȴ�����");
                 var qaNo = $(this).parents("li").attr("data-num");
                 var qaContents = $("#content").val();
                 
                  $.ajax({
                     url : "/qnaanswer/"+qaNo+".ssm",
                     type : 'put',
                     headers : {
                              "Content-Type" : "application/json",
                              "X-HTTP-Method-Override":"PUT"},
                     data : JSON.stringify({
                        qaContents:qaContents}),
                     dataType : "text",
                     success : function(result){
                        console.log("result >>> : "+result);
                        if(result == "SUCCESS"){
                           alert("�����Ϸ�!");
                           listAll(qbNo);
                        }
                     },
                     error : function(){
                        alert("error");
                     }
                  })
                 
              });
              
              
              // �� ������ ���� Ajax ���� ó��
              $(document).on("click","#deletebutton",function(){
                 
                 var qaNo = $(this).parents("li").attr("data-num");
                 console.log("qaNo >>> : "+qaNo);
                 
                 if(confirm("�����Ͻ� ����� ���� �Ͻðڽ��ϱ�?")){
                    $.ajax({
                       type : "patch",
                       url : "/qnaanswer/delete/"+qaNo+".ssm",
                       headers : {
                          "Content-Type" : "application/json",
                          "X-HTTP-Method-Override" : "PATCH"
                       },
                       dataType : "text",
                       success : function(result){
                          console.log("result >>> : "+result);
                          if(result == "SUCCESS"){
                             alert("�����Ϸ�!");
                             listAll(qbNo);
                          }
                       },
                       error : function(){
                          alert("error");
                       }
                    });
                 }
                 
              });
              
           });
        
           function listAll(qbNo){
              $("#comment_list").html("");
              var url = "/qnaanswer/all/"+qbNo+".ssm";
              $.getJSON(url,function(data){
                 console.log(data.length);
                 
                 $(data).each(function(){
                    var qaNo = this.qaNo;
                    var ttNo = this.ttNo;
                    var ttImage = this.ttImage;
                    var ttName = this.ttName;
                    var qaContents = this.qaContents;
                    var qaInsertdate = this.qaInsertdate;
                    var qaUpdatedate = this.qaUpdatedate;
                    addNewItem(qaNo,ttNo,ttImage,ttName,qaContents,qaInsertdate,qaUpdatedate);
                 });
              }).fail(function(){
                 alert("��� ����� �ҷ����µ� �����Ͽ����ϴ�. ����Ŀ� �ٽ� �õ� ���ּ���!.");
              });
           }
           
           // ���ο� ���� ȭ�鿡 �߰��ϱ� ���� �Լ�
           function addNewItem(qaNo,ttNo,ttImage,ttName,qaContents,qaInsertdate,qaUpdatedate){
              
              // ���ο� ���� �߰��� li�±� ��ü
              var new_li = $("<table cellspacing='0' cellpadding='0' class='commentlist_box' width='100%;'>");
              new_li.attr("data-num",qaNo);
              new_li.addClass("comment_item");
              
              // �ۼ��� ������ ������ <p>�±�
              var writer_p = $("<tr>");
              writer_p.addClass("writer");
              
              // �ۼ����� �̹���
              var image_span = $("<td align='left' width='15%'>");
              image_span.addClass("image");
              image_span.html("<img id='ttImg' style=width:30px; heigth:30px;  src='/file/"+ttImage+".png'>");
              
              // �ۼ����� �̸�
              var name_span = $("<td  align='left'>");
              name_span.addClass("name");
              name_span.html(ttName+" ������");
              
              //�ۼ��Ͻ�, �����Ͻ�
              var date_span = $("<td  align='right'>");
              date_span.html("   "+qaInsertdate+" ");
              
              // �����ϱ� ��ư
              var up_input = $("<input>");
              up_input.attr({"type":"button","id":"updatebutton","class":"buttons","value":"�����ϱ�"});
              
              //����
              var content_p = $("<td class='com' colspan='3' >");
              content_p.addClass("con");
              content_p.html("<div class='combox'>"+qaContents+"</div>");
              
              //�����ϱ� ��ư
              var del_input = $("<input>");
              del_input.attr({"type":"button","id":"deletebutton","class":"buttons","value":"�����ϱ�"});
              
              //�����ϱ�
              writer_p.append(image_span).append(name_span).append(date_span).append(up_input).append(del_input);
              new_li.append(writer_p).append(content_p);
              $("#comment_list").append(new_li);
              
              buttonsHide(ttNo);
           }
           
           // INPUT �±׵鿡 ���� �ʱ�ȭ �Լ�
           function dataReset(){
              $("#qaContents").val("");
              
           }
           
           //�����Ƿ� ���ֱ�
            function buttonsHide(ttNo){
               var myttno= "<%=sessionNO%>";
                 if(myttno!=ttNo){
                    $(".buttons").hide();
                 }
           }
           
        </script>
        <style type="text/css">
           li {
           list-style: none;
              overflow: hidden;
           }
           
           textarea {
           		width : 90%;
           		height : 70px;
           		margin : 0 auto;
           }
           
           #qaInsert {
           	margin : 10px 0;
           }
        </style>
   </head>
   <body>
      <div class="clear_div"></div>
      <div id="content">
       <div class="comm_titmin mt_30">
         <span>�亯 :</span>
      </div>
      <div class="container" id="qnaanswerContainer" >
         <div id="qnawrite">
            <div id="comment_list">
               <!-- ���⿡ ���� ���� ��Ұ� ���� �˴ϴ�. -->
            </div>
            <form id="qnaform" name="qnaform">
               <input type="hidden" name="ttNo" id="ttNo" value="<%=sessionNO%>">
               <div id="replywritediv">
                  <!--  ���ǰ� ���� �ֱ� -->
<!--                   <label for="qaContents">����</label> -->
                  <textarea name="qaContents" id="qaContents"></textarea>
                  <br><br><span class="bt_search" id="qaInsert">�����ϱ�</span>
               </div>
            </form>
         </div>
      </div>
      </div>
   </body>
</html>