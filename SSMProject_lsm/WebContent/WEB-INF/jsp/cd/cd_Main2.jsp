<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="ssm.mi.vo.*"%>
<%@ page import="ssm.cd.vo.*"%>
<%
   request.setCharacterEncoding("EUC-KR");
   Object obj = null;
   Object obj2 = null;
   List list = null;
   List list2 = null;
   TestVO tvo = null;
   SMemberVO svo = null;
   String ssNo = "";
   String ssGrade = "";
   String ssGrade2 = "";
   String cdGrade = "";
   String cdValue = "";
   String cdUrl = "";
   String cdInsertdate = "";
   String ssNo2 = "";
   int intGrade = 0;
   String cdUrlJA1 = "";
   String cdUrlCM1 = "";
   String cdUrlJI1 = "";
   String cdUrlIH1 = "";
   String cdUrlVA1 = "";

   String cdUrlJA2 = "";
   String cdUrlCM2 = "";
   String cdUrlJI2 = "";
   String cdUrlIH2 = "";
   String cdUrlVA2 = "";

   String cdUrlJA3 = "";
   String cdUrlCM3 = "";
   String cdUrlJI3 = "";
   String cdUrlIH3 = "";
   String cdUrlVA3 = "";
   obj2 = request.getAttribute("list2");
   if (obj2 != null) {
      list2 = (List) obj2;
      if (list2.size() > 0 && list2 != null) {
         svo = (SMemberVO) list2.get(0);
         ssGrade = svo.getSsGrade(); //�����г�
         ssGrade2 = svo.getSsGrade(); //�����г�
         if (ssGrade.equals("FM")) {
            ssGrade = "1";
            intGrade = Integer.parseInt(ssGrade);
         } else if (ssGrade.equals("JR")) {
            ssGrade = "2";
            intGrade = Integer.parseInt(ssGrade);
         } else {
            ssGrade = "3";
            intGrade = Integer.parseInt(ssGrade);
         }
      }
   }

   obj = request.getAttribute("list");
   if (obj != null) {
      list = (List) obj;
      if (list.size() > 0 && list != null) {
         for (int i = 0; i < list.size(); i++) {
            tvo = (TestVO) list.get(i);
            if (tvo.getCdGrade().equals("FM")) {
               if (tvo.getCdValue().equals("JA")) {
                  cdUrlJA1 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("CM")) {
                  cdUrlCM1 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("JI")) {
                  cdUrlJI1 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("IH")) {
                  cdUrlIH1 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("VA")) {
                  cdUrlVA1 = tvo.getCdUrl();
               }
            }
            if (tvo.getCdGrade().equals("JR")) {
               if (tvo.getCdValue().equals("JA")) {
                  cdUrlJA2 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("CM")) {
                  cdUrlCM2 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("JI")) {
                  cdUrlJI2 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("IH")) {
                  cdUrlIH2 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("VA")) {
                  cdUrlVA2 = tvo.getCdUrl();
               }
            }
            if (tvo.getCdGrade().equals("SR")) {
               if (tvo.getCdValue().equals("JA")) {
                  cdUrlJA3 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("CM")) {
                  cdUrlCM3 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("JI")) {
                  cdUrlJI3 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("IH")) {
                  cdUrlIH3 = tvo.getCdUrl();
               }
               if (tvo.getCdValue().equals("VA")) {
                  cdUrlVA3 = tvo.getCdUrl();
               }
            }

         }
      } else {

      }

   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>cd_Main</title>
<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
<link rel="stylesheet" href="/common/ssmCss/s_base.css">
<link rel="stylesheet" href="/common/ssmCss/s_content.css">
<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
<link rel="stylesheet" href="/common/ssmCss/cd.css">
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="/common/ssmJs/goCategory.js"></script>
<script src="/common/ssmJs/index.js"></script>
<script src="/common/ssmJs/goBoard.js"></script>
<script src="/common/ssmJs/goLogin.js"></script>
<script type="text/javascript">
         $(function(){
            console.log("<%=ssGrade%>");
            val();
            valGrade();
            has();
            $(".tab").click(function(){
               var id = $(this).attr('id');
               sah(id);
            });   
            
            $(".result").click(function(){
               var vall = $(this).val();
               if(vall == "�˻��Ϸ�����"){
                  var type = $(this).attr("id");
                  if(type == "JA1" || type == "JA2" || type == "JA3"){
                     
                     
                     location.href="/test/go_test.ssm?page=test_Job_Aptitude";
                  }
                  if(type == "CM1" || type == "CM2" || type == "CM3"){
                     location.href="/test/go_test.ssm?page=test_Career_Maturity";
                  }
                  if(type == "JI1" || type == "JI2" || type == "JI3"){
                     location.href="/test/go_test.ssm?page=test_Job_InterestK";
                  }
                  if(type == "IH1" || type == "IH2" || type == "IH3"){
                     location.href="/test/go_test.ssm?page=test_Job_InterestH";
                  }
                  if(type == "VA1" || type == "VA2" || type == "VA3"){
                     location.href="/test/go_test.ssm?page=test_Job_Value";
                  }
               }else{
                  var url = "";
                  var type = $(this).attr("id");
                  if(type == "JA1"){url = $("#JAURL1").val();}if(type == "JA2"){url = $("#JAURL2").val();}if(type == "JA3"){url = $("#JAURL3").val();}
                  if(type == "CM1"){url = $("#CMURL1").val();}if(type == "CM2"){url = $("#CMURL2").val();}if(type == "CM3"){url = $("#CMURL3").val();}
                  if(type == "JI1"){url = $("#JIURL1").val();}if(type == "JI2"){url = $("#JIURL2").val();}if(type == "JI3"){url = $("#JIURL3").val();}
                  if(type == "IH1"){url = $("#IHURL1").val();}if(type == "IH2"){url = $("#IHURL2").val();}if(type == "IH3"){url = $("#IHURL3").val();}
                  if(type == "VA1"){url = $("#VAURL1").val();}if(type == "VA2"){url = $("#VAURL2").val();}if(type == "VA3"){url = $("#VAURL3").val();}
                  window.open("","pop","width=1000,height=1000");
                  $("#def").attr("action",url).attr("target","pop").submit();
               }
            });
            butColor();
         });      
         
         function val(){
            $("#JAURL1").val("<%=cdUrlJA1%>");
            $("#CMURL1").val("<%=cdUrlCM1%>");
            $("#JIURL1").val("<%=cdUrlJI1%>");
            $("#IHURL1").val("<%=cdUrlIH1%>");
            $("#VAURL1").val("<%=cdUrlVA1%>");
            
            $("#JAURL2").val("<%=cdUrlJA2%>");
            $("#CMURL2").val("<%=cdUrlCM2%>");
            $("#JIURL2").val("<%=cdUrlJI2%>");
            $("#IHURL2").val("<%=cdUrlIH2%>");
            $("#VAURL2").val("<%=cdUrlVA2%>");
            
            $("#JAURL3").val("<%=cdUrlJA3%>");
            $("#CMURL3").val("<%=cdUrlCM3%>");
            $("#JIURL3").val("<%=cdUrlJI3%>");
            $("#IHURL3").val("<%=cdUrlIH3%>");
            $("#VAURL3").val("<%=cdUrlVA3%>");
            
         }
         
         function valGrade(){
            var ssGrade2 = "<%=ssGrade2%>";
            if($("#JAURL1").val() == "null" || $("#JAURL1").val() == ""){$("#JA1").val("�˻��Ϸ�����");}else{$("#JA1").val("�˻�������");}
            if($("#CMURL1").val() == "null" || $("#CMURL1").val() == ""){$("#CM1").val("�˻��Ϸ�����");}else{$("#CM1").val("�˻�������");}
            if($("#JIURL1").val() == "null" || $("#JIURL1").val() == ""){$("#JI1").val("�˻��Ϸ�����");}else{$("#JI1").val("�˻�������");}
            if($("#IHURL1").val() == "null" || $("#IHURL1").val() == ""){$("#IH1").val("�˻��Ϸ�����");}else{$("#IH1").val("�˻�������");}
            if($("#VAURL1").val() == "null" || $("#VAURL1").val() == ""){$("#VA1").val("�˻��Ϸ�����");}else{$("#VA1").val("�˻�������");}
            
            if($("#JAURL2").val() == "null" || $("#JAURL2").val() == ""){$("#JA2").val("�˻��Ϸ�����");}else{$("#JA2").val("�˻�������");}
            if($("#CMURL2").val() == "null" || $("#CMURL2").val() == ""){$("#CM2").val("�˻��Ϸ�����");}else{$("#CM2").val("�˻�������");}
            if($("#JIURL2").val() == "null" || $("#JIURL2").val() == ""){$("#JI2").val("�˻��Ϸ�����");}else{$("#JI2").val("�˻�������");}
            if($("#IHURL2").val() == "null" || $("#IHURL2").val() == ""){$("#IH2").val("�˻��Ϸ�����");}else{$("#IH2").val("�˻�������");}
            if($("#VAURL2").val() == "null" || $("#VAURL2").val() == ""){$("#VA2").val("�˻��Ϸ�����");}else{$("#VA2").val("�˻�������");}
            
            if($("#JAURL3").val() == "null" || $("#JAURL3").val() == ""){$("#JA3").val("�˻��Ϸ�����");}else{$("#JA3").val("�˻�������");}
            if($("#CMURL3").val() == "null" || $("#CMURL3").val() == ""){$("#CM3").val("�˻��Ϸ�����");}else{$("#CM3").val("�˻�������");}
            if($("#JIURL3").val() == "null" || $("#JIURL3").val() == ""){$("#JI3").val("�˻��Ϸ�����");}else{$("#JI3").val("�˻�������");}
            if($("#IHURL3").val() == "null" || $("#IHURL3").val() == ""){$("#IH3").val("�˻��Ϸ�����");}else{$("#IH3").val("�˻�������");}
            if($("#VAURL3").val() == "null" || $("#VAURL3").val() == ""){$("#VA3").val("�˻��Ϸ�����");}else{$("#VA3").val("�˻�������");}
            
            if(ssGrade2 == "FM"){
               $(".tab2").remove();
               $(".tab3").remove();
               $("#tab2").remove();
               $("#tab3").remove();
            }
            if(ssGrade2 == "JR"){
               if($("#JAURL1").val() == "null" || $("#JAURL1").val() == ""){$("#JA1").val("�˻� �Ұ�"); $("#JA1").prop("disabled",true);}
               if($("#CMURL1").val() == "null" || $("#CMURL1").val() == ""){$("#CM1").val("�˻� �Ұ�"); $("#CM1").prop("disabled",true);}
               if($("#JIURL1").val() == "null" || $("#JIURL1").val() == ""){$("#JI1").val("�˻� �Ұ�"); $("#JI1").prop("disabled",true);}
               if($("#IHURL1").val() == "null" || $("#IHURL1").val() == ""){$("#IH1").val("�˻� �Ұ�"); $("#IH1").prop("disabled",true);}
               if($("#VAURL1").val() == "null" || $("#VAURL1").val() == ""){$("#VA1").val("�˻� �Ұ�"); $("#VA1").prop("disabled",true);}
               $(".tab3").remove();
               $("#tab3").remove();
            }
            if(ssGrade2 == "SR"){
               if($("#JAURL1").val() == "null" || $("#JAURL1").val() == ""){$("#JA1").val("�˻� �Ұ�"); $("#JA1").prop("disabled",true);}
               if($("#CMURL1").val() == "null" || $("#CMURL1").val() == ""){$("#CM1").val("�˻� �Ұ�"); $("#CM1").prop("disabled",true);}
               if($("#JIURL1").val() == "null" || $("#JIURL1").val() == ""){$("#JI1").val("�˻� �Ұ�"); $("#JI1").prop("disabled",true);}
               if($("#IHURL1").val() == "null" || $("#IHURL1").val() == ""){$("#IH1").val("�˻� �Ұ�"); $("#IH1").prop("disabled",true);}
               if($("#VAURL1").val() == "null" || $("#VAURL1").val() == ""){$("#VA1").val("�˻� �Ұ�"); $("#VA1").prop("disabled",true);}
               
               if($("#JAURL2").val() == "null" || $("#JAURL2").val() == ""){$("#JA2").val("�˻� �Ұ�"); $("#JA2").prop("disabled",true);}
               if($("#CMURL2").val() == "null" || $("#CMURL2").val() == ""){$("#CM2").val("�˻� �Ұ�"); $("#CM2").prop("disabled",true);}
               if($("#JIURL2").val() == "null" || $("#JIURL2").val() == ""){$("#JI2").val("�˻� �Ұ�"); $("#JI2").prop("disabled",true);}
               if($("#IHURL2").val() == "null" || $("#IHURL2").val() == ""){$("#IH2").val("�˻� �Ұ�"); $("#IH2").prop("disabled",true);}
               if($("#VAURL2").val() == "null" || $("#VAURL2").val() == ""){$("#VA2").val("�˻� �Ұ�"); $("#VA2").prop("disabled",true);}
            }
         }
   function has(){
      var ssGrade2 = "<%=ssGrade2%>";
      $(".tab1").hide();
      $(".tab2").hide();
      $(".tab3").hide();
      //$("#tab1").attr("style", "background-color: transparent");
      //$("#tab2").attr("style", "background-color: transparent");
      //$("#tab3").attr("style", "background-color: transparent");
      if (ssGrade2 == "FM") {
         $(".tab1").show();
         $("#tab1").attr("class", "tab on");
         //$("#tab1").attr("style", "background-color:orange");
      } else if (ssGrade2 == "JR") {
         $(".tab2").show();
         $("#tab2").attr("class", "tab on");
         //$("#tab2").attr("style", "background-color:orange");
      } else {
         $(".tab3").show();
         $("#tab3").attr("class", "tab on");
         //$("#tab3").attr("style", "background-color:orange");
      }
   }
   function sah(data) {
      $(".tab1").hide();
      $(".tab2").hide();
      $(".tab3").hide();
      $("#tab1").attr("class", "");
      $("#tab2").attr("class", "");
      $("#tab3").attr("class", "");
      $("#" + data).attr("class", "tab on");

      $("." + data).show();
   }
   function butColor(){
      for(var i=1;i<=3;i++){
         var JA = $("#JA"+i).val();
         var CM = $("#CM"+i).val();
         var JI = $("#JI"+i).val();
         var IH = $("#IH"+i).val();
         var VA = $("#VA"+i).val();
         if(JA == "�˻�������"){$("#JA"+i).attr("style","background-color:orange");}else if(JA == "�˻� �Ұ�"){$("#JA"+i).attr("style","background-color:lightgrey", "");}else{$("#JA"+i).attr("style","background-color:red");}
         if(CM == "�˻�������"){$("#CM"+i).attr("style","background-color:orange");}else if(CM == "�˻� �Ұ�"){$("#CM"+i).attr("style","background-color:lightgrey");}else{$("#CM"+i).attr("style","background-color:red");}
         if(JI == "�˻�������"){$("#JI"+i).attr("style","background-color:orange");}else if(JI == "�˻� �Ұ�"){$("#JI"+i).attr("style","background-color:lightgrey");}else{$("#JI"+i).attr("style","background-color:red");}
         if(IH == "�˻�������"){$("#IH"+i).attr("style","background-color:orange");}else if(IH == "�˻� �Ұ�"){$("#IH"+i).attr("style","background-color:lightgrey");}else{$("#IH"+i).attr("style","background-color:red");}
         if(VA == "�˻�������"){$("#VA"+i).attr("style","background-color:orange");}else if(VA == "�˻� �Ұ�"){$("#VA"+i).attr("style","background-color:lightgrey");}else{$("#VA"+i).attr("style","background-color:red");}
      }
   }
</script>
</head>
<style>
/* button */
.btn_wrap{text-align: center;clear:both;overflow:hidden;padding-top:20px;}
.btn_wrap a + a{margin-left:0;}
.btn_wrap .btn01{min-width:80px;}
a.btn01:hover{opacity: 0.8;}
a.btn01{padding:11px 12px;font-weight:400; display:inline-block;min-width:50px;border-radius:5px; text-align:center;font-size:16px;color: #303030;background: #ffffff;border: 1px solid #868686;opacity:1;}
a.btn01:active{transform:scale(0.95)}

a.btn01.col09{color: #fff;background:#179fec; border:1px solid #179fec;}


</style>


<body>
   <div id="wrap">

      <%@include file="/common/ssmMain/header_.jsp"%>

      <div class="subWrap">
         <nav include-html="/common/ssmMain/ssmCategory/cdSsideNav.html"></nav>
          <section>
          <div id="tit">
            <h1>���ΰ˻�</h1>
            <p>
               <a href="#">Ȩ</a> > <a href="co01.asp">���μ���</a> > <a
                  href="co03.asp" class="on">���ΰ˻�</a>
            </p>
         </div>
         <div class="container">
            <div class="content">



            <form name="form" id="form">
               <input type="hidden" id="JAURL1" name="JAURL1"> 
               <input type="hidden" id="CMURL1" name="CMURL1"> 
               <input type="hidden" id="JIURL1" name="JIURL1"> 
               <input type="hidden" id="IHURL1" name="IHURL1"> 
               <input type="hidden" id="VAURL1" name="VAURL1"> 
               <input type="hidden" id="JAURL2" name="JAURL2"> 
               <input type="hidden" id="CMURL2" name="CMURL2"> 
               <input type="hidden" id="JIURL2" name="JIURL2">
               <input type="hidden" id="IHURL2" name="IHURL2"> 
               <input type="hidden" id="VAURL2" name="VAURL2"> 
               <input type="hidden" id="JAURL3" name="JAURL3"> 
               <input type="hidden" id="CMURL3" name="CMURL3"> 
               <input type="hidden" id="JIURL3" name="JIURL3"> 
               <input type="hidden" id="IHURL3" name="IHURL3"> 
               <input type="hidden" id="VAURL3" name="VAURL3">
                  
                  
               <!-- �ǹ�ư -->
               <div class="tab_list" style="width: 100%;">
                  <ul>
                     <li id="tab1" class="tab" style="cursor: pointer;" value="1�г�">1�г�</li>
                     <li id="tab2" class="tab" style="cursor: pointer;"  value="2�г�">2�г�</li>
                     <li id="tab3" class="tab" style="cursor: pointer;" value="3�г�">3�г�</li>
                  </ul>
               </div>
         	   <!-- �ǹ�ư -->   
               <table cellpadding="0" cellspacing="0" border="0" summary="����" class="list_box mt_5">
                  <thead>
                     <tr class="tab1">
                        <th>���������˻�</th>
                        <th><input type="button" class="result" id="JA1" name="JA1"   value="JA1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                       <td colspan="2" style="text-align:left;">
                           �����̶�, Ư�� ����(�о�, ���� ��)���� �ɷ��� �����ϴ� �������� ���ɼ��� ���մϴ�.��
                           �˻�� ������ ���õ� �پ��� �ɷ��� �������� ��� ���� ������ �ִ°��� ������ �����ϴ� �˻��Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab1">
                        <th>���μ������˻�</th>
                        <th><input type="button" class="result" id="CM1" name="CM1" value="CM1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                       <td colspan="2" style="text-align:left;">
                           ���μ����� �˻�� �������� ���ΰ��� ������ �ذ��ϰ� ��ó�� ���� �� �ֵ��� �غ�Ǿ�
                           �ִ����� �˾ƺ��� ���� ���Դϴ�.���μ������� �������� ���� ���ð� ������ ���� �µ�, �ɷ�,�ൿ�� ���� ������,
                           ���μ����� �˻� ����� ���� �����������ιߴ��� ���� ��� ������ �����ϴµ� ����� ��￩�� �ϴ��� Ȯ���ϴµ�
                           ������ �� ���Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab1">
                        <th>������̰˻�(K)</th>
                        <th><input type="button" class="result" id="JI1" name="JI1" value="JI1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                        <td colspan="2" style="text-align:left;">
                           ��̶� � ������ Ȱ���� ���ؼ� ������ ������ �ִ� ��, ����, ����, �ź���
                           ���⼺�� ���ϸ� Ư�� ������̴� ������ ����, ������ ����, ���������� ������, ���������� ������� ������
                           ���õ˴ϴ�.�� �˻�� �������� � ������ �Ͽ� �󸶳� ��̸� ������ �ִ°��� �˾ƺ����ν�, �巡�� �ڽſ��� �˸���
                           ������ Ž���ϴµ� ������ �ֱ� ���� ���Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab1">
                        <th>������̰˻�(H)</th>
                        <th><input type="button" class="result" id="IH1" name="IH1" value="IH1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                        <td colspan="2" style="text-align:left;">
                        ��̶� � ������ Ȱ���� ���ؼ� ������ ������ �ִ� ��, ����, ����, �ź���
                        ���⼺�� ���ϸ� Ư�� ������̴� ������ ����, ������ ����, ���������� ������, ���������� ������� ������
                        ���õ˴ϴ�.�� �˻�� �������� � ������ �Ͽ� �󸶳� ��̸� ������ �ִ°��� �˾ƺ����ν�, �巡�� �ڽſ��� �˸���
                        ������ Ž���ϴµ� ������ �ֱ� ���� ���Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab1">
                        <th>������ġ���˻�</th>
                     	<th><input type="button" class="result" id="VA1" name="VA1" value="VA1"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab1">
                        <td colspan="2" style="text-align:left;">
                        ������ġ�� ������Ȱ�� ���Ͽ� �����ϰ��� �ϴ� �屸 �Ǵ� ��������� �߿���ϴ� ����
                        �ǹ��մϴ�.�� �˻�� ������ ���õ� �پ��� �屸 �� ��ġ�鿡 ���� �������� ��������� ������ �󸶳� �� �߿��ϰ�
                        ����°��� ���캸��, �� ��ġ�� ������ ���ɼ��� ���� ������ Ž���� �� �ֵ��� ������ �ִ� �˻��Դϴ�
                     </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>���������˻�</th>
                        <th><input type="button" class="result" id="JA2" name="JA2"   value="JA2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
                           �����̶�, Ư�� ����(�о�, ���� ��)���� �ɷ��� �����ϴ� �������� ���ɼ��� ���մϴ�.��
                           �˻�� ������ ���õ� �پ��� �ɷ��� �������� ��� ���� ������ �ִ°��� ������ �����ϴ� �˻��Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>���μ������˻�</th>
                        <th><input type="button" class="result" id="CM2" name="CM2" value="CM2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
                           ���μ����� �˻�� �������� ���ΰ��� ������ �ذ��ϰ� ��ó�� ���� �� �ֵ��� �غ�Ǿ�
                           �ִ����� �˾ƺ��� ���� ���Դϴ�.���μ������� �������� ���� ���ð� ������ ���� �µ�, �ɷ�,�ൿ�� ���� ������,
                           ���μ����� �˻� ����� ���� �����������ιߴ��� ���� ��� ������ �����ϴµ� ����� ��￩�� �ϴ��� Ȯ���ϴµ�
                           ������ �� ���Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>������̰˻�(K)</th>
                        <th><input type="button" class="result" id="JI2" name="JI2" value="JI2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
                           ��̶� � ������ Ȱ���� ���ؼ� ������ ������ �ִ� ��, ����, ����, �ź���
                           ���⼺�� ���ϸ� Ư�� ������̴� ������ ����, ������ ����, ���������� ������, ���������� ������� ������
                           ���õ˴ϴ�.�� �˻�� �������� � ������ �Ͽ� �󸶳� ��̸� ������ �ִ°��� �˾ƺ����ν�, �巡�� �ڽſ��� �˸���
                           ������ Ž���ϴµ� ������ �ֱ� ���� ���Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>������̰˻�(H)</th>
                        <th><input type="button" class="result" id="IH2" name="IH2" value="IH2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
                        ��̶� � ������ Ȱ���� ���ؼ� ������ ������ �ִ� ��, ����, ����, �ź���
                        ���⼺�� ���ϸ� Ư�� ������̴� ������ ����, ������ ����, ���������� ������, ���������� ������� ������
                        ���õ˴ϴ�.�� �˻�� �������� � ������ �Ͽ� �󸶳� ��̸� ������ �ִ°��� �˾ƺ����ν�, �巡�� �ڽſ��� �˸���
                        ������ Ž���ϴµ� ������ �ֱ� ���� ���Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab2">
                        <th>������ġ���˻�</th>
                        <th><input type="button" class="result" id="VA2" name="VA2" value="VA2"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab2">
                        <td colspan="2" style="text-align:left;">
	                        ������ġ�� ������Ȱ�� ���Ͽ� �����ϰ��� �ϴ� �屸 �Ǵ� ��������� �߿���ϴ� ����
	                        �ǹ��մϴ�.�� �˻�� ������ ���õ� �پ��� �屸 �� ��ġ�鿡 ���� �������� ��������� ������ �󸶳� �� �߿��ϰ�
	                        ����°��� ���캸��, �� ��ġ�� ������ ���ɼ��� ���� ������ Ž���� �� �ֵ��� ������ �ִ� �˻��Դϴ�
                     	</td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>���������˻�</th>
                         <th><input type="button" class="result" id="JA3" name="JA3"   value="JA3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                           �����̶�, Ư�� ����(�о�, ���� ��)���� �ɷ��� �����ϴ� �������� ���ɼ��� ���մϴ�.��
                           �˻�� ������ ���õ� �پ��� �ɷ��� �������� ��� ���� ������ �ִ°��� ������ �����ϴ� �˻��Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>���μ������˻�</th>
                        <th><input type="button" class="result" id="CM3" name="CM3" value="CM3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                           ���μ����� �˻�� �������� ���ΰ��� ������ �ذ��ϰ� ��ó�� ���� �� �ֵ��� �غ�Ǿ�
                           �ִ����� �˾ƺ��� ���� ���Դϴ�.���μ������� �������� ���� ���ð� ������ ���� �µ�, �ɷ�,�ൿ�� ���� ������,
                           ���μ����� �˻� ����� ���� �����������ιߴ��� ���� ��� ������ �����ϴµ� ����� ��￩�� �ϴ��� Ȯ���ϴµ�
                           ������ �� ���Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>������̰˻�(K)</th>
                        <th><input type="button" class="result" id="JI3" name="JI3" value="JI3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                           ��̶� � ������ Ȱ���� ���ؼ� ������ ������ �ִ� ��, ����, ����, �ź���
                           ���⼺�� ���ϸ� Ư�� ������̴� ������ ����, ������ ����, ���������� ������, ���������� ������� ������
                           ���õ˴ϴ�.�� �˻�� �������� � ������ �Ͽ� �󸶳� ��̸� ������ �ִ°��� �˾ƺ����ν�, �巡�� �ڽſ��� �˸���
                           ������ Ž���ϴµ� ������ �ֱ� ���� ���Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>������̰˻�(H)</th>
                        <th><input type="button" class="result" id="IH3" name="IH3" value="IH3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                        ��̶� � ������ Ȱ���� ���ؼ� ������ ������ �ִ� ��, ����, ����, �ź���
                        ���⼺�� ���ϸ� Ư�� ������̴� ������ ����, ������ ����, ���������� ������, ���������� ������� ������
                        ���õ˴ϴ�.�� �˻�� �������� � ������ �Ͽ� �󸶳� ��̸� ������ �ִ°��� �˾ƺ����ν�, �巡�� �ڽſ��� �˸���
                        ������ Ž���ϴµ� ������ �ֱ� ���� ���Դϴ�.
                        </td>
                     </tr>
                  </tbody>
                  <thead>
                     <tr class="tab3">
                        <th>������ġ���˻�</th>
                        <th><input type="button" class="result" id="VA3" name="VA3" value="VA3"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr class="tab3">
                        <td colspan="2" style="text-align:left;">
                        ������ġ�� ������Ȱ�� ���Ͽ� �����ϰ��� �ϴ� �屸 �Ǵ� ��������� �߿���ϴ� ����
                        �ǹ��մϴ�.�� �˻�� ������ ���õ� �پ��� �屸 �� ��ġ�鿡 ���� �������� ��������� ������ �󸶳� �� �߿��ϰ�
                        ����°��� ���캸��, �� ��ġ�� ������ ���ɼ��� ���� ������ Ž���� �� �ֵ��� ������ �ִ� �˻��Դϴ�
                     </td>
                     </tr>
                  </tbody>
               </table>
            </form>



            <form name="def" id="def" method="post"></form>


</div>
</div>
         
         </section>
      </div>
      <footer include-html="/common/ssmMain/footer.html"></footer>
      <script type="text/javascript">
         includeHTML();
      </script>
   </div>
</body>
</html>