<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="ssm.mi.vo.SMemberVO"%>
<%@ page import="ssm.cd.vo.CareerdesignVO"%>
<%@ page import="ssm.br.vo.NonprogramVO"%>
<%@ page import="ssm.cg.vo.OnlineApplication_BoardVO"%>
<%@ page import="ssm.cd.vo.ValuesettingVO"%>

<!--  cdlist brlist cglist vslist�ޱ� -->
<%
   List<CareerdesignVO> cdlist =(List<CareerdesignVO>)request.getAttribute("cdlist");
%>
<%
   List<NonprogramVO> brlist =(List<NonprogramVO>)request.getAttribute("brlist");
%>
<%
   List<OnlineApplication_BoardVO> cglist =(List<OnlineApplication_BoardVO>)request.getAttribute("cglist");
%>
<%
   ValuesettingVO vvo =(ValuesettingVO)request.getAttribute("vslist");
%>

<!-- pageNO �޾ƿ°� ������ ���� -->
<%
   SMemberVO svo_ =(SMemberVO)request.getAttribute("pageNo");
%>
<%
   String brpageNo =svo_.getBrpageNo();
%>
<%
   String cgpageNo =svo_.getCgpageNo();
%>
<%
   String cdyearNo =svo_.getCdyearNo();
%>
<%
   String bryearNo =svo_.getBryearNo();
%>
<%
   String cgyearNo =svo_.getCgyearNo();
%>

<!--  mylist �޾ƿ°� ������ ���� -->
<%
   SMemberVO svo =(SMemberVO)request.getAttribute("mylist");
%>
<%
   String grade = svo.getSsGrade();
   String fmno=""; String jrno=""; String srno="";
   if(grade.equals("FM")){ grade="1�г�"; fmno="20";}
   else if(grade.equals("JR")){ grade="2�г�"; fmno="19"; jrno="20";}
   else if(grade.equals("SR")){ grade="3�г�"; fmno="18"; jrno="19"; srno="20";}
%>


<!--  brlist �޾ƿ°� ����¡ ������ ���� -->
<%
   int brpageCount = 0;
   if(brlist.size() >0){
      NonprogramVO nvo_ = brlist.get(0);
      double totalCount = (double)Integer.parseInt(nvo_.getTotalCount()); 
      int pagelistSize = (int)request.getAttribute("listSize");
      double dval = (double)pagelistSize;
      brpageCount = (int)Math.ceil(totalCount/dval); //pageCount ���� ���
   }
%>

<!--  cglist �޾ƿ°� ����¡ ������ ���� -->
<%
   int cgpageCount = 0;
   if(cglist.size() >0){
      OnlineApplication_BoardVO ovo_ = cglist.get(0);
      double totalCount = (double)Integer.parseInt(ovo_.getTotalCount()); 
      int pagelistSize = (int)request.getAttribute("listSize");
      double dval = (double)pagelistSize;
      cgpageCount = (int)Math.ceil(totalCount/dval); //pageCount ���� ���
   }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
<link rel="stylesheet" href="/common/ssmCss/efStudent.css">
<script src="/common/ssmJs/goCategory.js"></script>
<script src="/common/ssmJs/index.js"></script>
<script type="text/javascript">
   $(document).ready(
         function() {

            //���μ��� ��� ���� ��ư ��������
            $(".cdlinkbutton").click(function() {
               var url = $(this).parents("tr").attr("data-num");
               window.open(url);
            });

            //�񱳰� ���α׷� ������ ��������
            $(".brlinkbutton").click(function() {
               var npNo = $(this).parents("tr").attr("data-num");
               $("#npNo").val(npNo);
               $("#linkForm").attr('action', '/������̼�/������̼�.ssm').submit();

            });

            //����� �����ư �������� (�¶��ΰԽ��Ǳ۷ΰ��°�)
            $(".cgoalinkbutton").click(function() {
               var oaNo = $(this).attr("data-num");
               $("#oaNo").val(oaNo);
               window.open("", "pop1", "width=600,height=450");
               $("#linkForm").attr('action', '/������̼�/������̼�.ssm');
               $("#linkForm").attr('target', 'pop1');
               $("#linkForm").submit();
            });

            //����� ��ư��������  (�湮���Խ��ǽ� �۷ΰ��°�)
            $(".cgvrlinkbutton").click(function() {
               var vrNo = $(this).attr("data-num");
               $("#vrNo").val(vrNo);
               window.open("", "pop2", "width=600,height=450");
               $("#linkForm").attr('action', '/������̼�/������̼�.ssm');
               $("#linkForm").attr('target', 'pop2');
               $("#linkForm").submit();
            });

            //���μ��� �г��ư���� �˻�
            $(".cdgradebutton").click(function() {
               var cdyearNo = $(this).attr("data-num");
               $("#cdyearNo").val(cdyearNo);
               $("#pageNoForm").attr('action', '/eportfolio/student.ssm');
               $("#pageNoForm").submit();
            });

            //�񱳰����α׷� �г��ư���� �˻�
            $(".brgradebutton").click(function() {
               var bryearNo = $(this).attr("data-num");
               $("#bryearNo").val(bryearNo);
               $("#pageNoForm").attr('action', '/eportfolio/student.ssm');
               $("#pageNoForm").submit();
            });

            //��� �г��ư���� �˻�
            $(".cggradebutton").click(function() {
               var cgyearNo = $(this).attr("data-num");
               $("#cgyearNo").val(cgyearNo);
               $("#pageNoForm").attr('action', '/eportfolio/student.ssm');
               $("#pageNoForm").submit();
            });

            //�񱳰� ����¡ ���� ��ư
            $("#brpageleftbutton").click(
                  function() {
                     var brpageNo = $("#brpageNo").val();
                     if (brpageNo == 1) {
                        alert("ù��°�������Դϴ�!");
                     } else {
                        brpageNo = brpageNo - 1;
                        $("#brpageNo").val(brpageNo);
                        $("#pageNoForm").attr('action',
                              '/eportfolio/student.ssm').submit();
                     }
                  });

            //�񱳰� ����¡ ������ ��ư
            $("#brpagerightbutton").click(
                  function() {
                     var brpageNo = $("#brpageNo").val();
                     if (brpageNo >=
<%=brpageCount%>
   ) {
                        alert("�������������Դϴ�");
                     } else {
                        brpageNo = Number(brpageNo) + 1;
                        $("#brpageNo").val(brpageNo);
                        $("#pageNoForm").attr('action',
                              '/eportfolio/student.ssm').submit();
                     }
                  });

            //��� ����¡ ���� ��ư
            $("#cgpageleftbutton").click(
                  function() {
                     var cgpageNo = $("#cgpageNo").val();
                     if (cgpageNo == 1) {
                        alert("ù��°�������Դϴ�!");
                     } else {
                        cgpageNo = cgpageNo - 1;
                        $("#cgpageNo").val(cgpageNo);
                        $("#pageNoForm").attr('action',
                              '/eportfolio/student.ssm').submit();
                     }
                  });

            //��� ����¡ ������ ��ư
            $("#cgpagerightbutton").click(
                  function() {
                     var cgpageNo = $("#cgpageNo").val();
                     if (cgpageNo >=
<%=cgpageCount%>
   ) {
                        alert("�������������Դϴ�");
                     } else {
                        cgpageNo = Number(cgpageNo) + 1;
                        $("#cgpageNo").val(cgpageNo);
                        $("#pageNoForm").attr('action',
                              '/eportfolio/student.ssm').submit();
                     }
                  });

            //�񱳰����α׷� ��������ȣ ��ư 
            $(".brpageNobutton").click(
                  function() {
                     var brpageNo = $(this).attr("data-num");
                     $("#brpageNo").val(brpageNo);
                     $("#pageNoForm").attr('action',
                           '/eportfolio/student.ssm').submit();
                  });

            //��� ��������ȣ ��ư
            $(".cgpageNobutton").click(
                  function() {
                     var cgpageNo = $(this).attr("data-num");
                     $("#cgpageNo").val(cgpageNo);
                     $("#pageNoForm").attr('action',
                           '/eportfolio/student.ssm').submit();
                  });

         });
</script>

<!-- 
<style>
html, body {
   margin: 0;
   padding: 0;
   font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
   font-size: 4px;
}

table {
   width: 500px;
   text-align: center;
   margin: auto;
}

.list {
   width: 500px;
   text-align: left;
   margin: auto;
}
</style>

 -->


</head>
<body>
   <div id="wrap">

      <%@include file="/common/ssmMain/header_.jsp"%>

      <div class="subWrap">
         <nav include-html="/common/ssmMain/ssmCategory/efSsideNav.html"></nav>
         <section>
         <div id="tit">
				<h1>���� E-��Ʈ������</h1>
				<p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">E-��Ʈ������</a> > <a
					href="#�ּҰɱ�" class="on">E-��Ʈ������</a>
			</p>
		 </div>
         <div class="container">
			<div id="subTit">
	            <h3>-<%=grade%>&nbsp;<%=svo.getSsName()%>-</h3>
	        </div>
           	<div class="gridContainer">
	            <div class="cGrid">
		            <div id="aa">
		               <h2>���μ������</h2>
		               <%
		                  if(fmno.equals("20")){
		               %>
		               <input Type="button" class="cdgradebutton" value="1�г�"
		                  data-num="<%=fmno%>">
		               <%
		                  }
		                                    if(fmno.equals("19")){
		               %>
		               <input Type="button" class="cdgradebutton" value="1�г�"
		                  data-num="<%=fmno%>"> <input Type="button"
		                  class="cdgradebutton" value="2�г�" data-num="<%=jrno%>">
		               <%
		                  }
		                                    if(fmno.equals("18")){
		               %>
		               <input Type="button" class="cdgradebutton" value="1�г�"
		                  data-num="<%=fmno%>"> <input Type="button"
		                  class="cdgradebutton" value="2�г�" data-num="<%=jrno%>"> <input
		                  Type="button" class="cdgradebutton" value="3�г�"
		                  data-num="<%=srno%>">
		               <%
		                  }
		               %>
		               <table id="cGridTb">
		                  <thead>
		                     <tr>
		                        <th>�˻� ����</th>
		                        <th>�˻糯¥</th>
		                        <th>�˻���</th>
		                     </tr>
		                  </thead>
		                  <tbody>
		                     <%
		                        if(cdlist.size()==0){
		                     %>
		                     <tr>
		                        <td></td>
		                        <td>�����Ͱ������ϴ�.</td>
		                        <td></td>
		                     </tr>
		                     <%
		                        }else{
		                                                String ja="�˻� �̽ǽ�"; String ji= "�˻� �̽ǽ�"; String ih="�˻� �̽ǽ�"; String va ="�˻� �̽ǽ�"; String cm ="�˻� �̽ǽ�";
		                                                String jaurl="";    String jiurl="";      String ihurl="";    String vaurl="";      String cmurl="";
		                                                for(int i=0; i<cdlist.size(); i++){
		                                                   CareerdesignVO cvo = cdlist.get(i);
		                                                   if(cvo.getCdValue().equals("JA")) {ja = cvo.getCdInsertdate().substring(0,10); jaurl=cvo.getCdUrl();}   
		                                                   else if(cvo.getCdValue().equals("JI")){ji = cvo.getCdInsertdate().substring(0,10); jiurl=cvo.getCdUrl();}
		                                                   else if(cvo.getCdValue().equals("IH")){ih = cvo.getCdInsertdate().substring(0,10); ihurl=cvo.getCdUrl();}
		                                                   else if(cvo.getCdValue().equals("VA")){va = cvo.getCdInsertdate().substring(0,10); vaurl=cvo.getCdUrl();}
		                                                   else if(cvo.getCdValue().equals("CM")){cm = cvo.getCdInsertdate().substring(0,10); cmurl=cvo.getCdUrl();}
		                                                   
		                                                   
		                                                }
		                     %>
		                     <tr data-num="<%=jaurl%>">
		                        <td>���������˻�</td>
		                        <td><%=ja%></td>
		                        <td>
		                           <%
		                              if(ja !="�˻� �̽ǽ�"){
		                           %><input Type="button" class="cdlinkbutton" value="�������" />
		                           <%
		                              }
		                           %>
		                        </td>
		                     </tr>
		                     <tr data-num="<%=jiurl%>">
		                        <td>������̰˻�(K)</td>
		                        <td><%=ji%></td>
		                        <td>
		                           <%
		                              if(ji !="�˻� �̽ǽ�"){
		                           %><input Type="button" class="cdlinkbutton" value="�������" />
		                           <%
		                              }
		                           %>
		                        </td>
		                     </tr>
		                     <tr data-num="<%=ihurl%>">
		                        <td>������̰˻�(H)</td>
		                        <td><%=ih%></td>
		                        <td>
		                           <%
		                              if(ih !="�˻� �̽ǽ�"){
		                           %><input Type="button" class="cdlinkbutton" value="�������" />
		                           <%
		                              }
		                           %>
		                        </td>
		                     </tr>
		                     <tr data-num="<%=vaurl%>">
		                        <td>������ġ���˻�</td>
		                        <td><%=va%></td>
		                        <td>
		                           <%
		                              if(va !="�˻� �̽ǽ�"){
		                           %><input Type="button" class="cdlinkbutton" value="�������" />
		                           <%
		                              }
		                           %>
		                        </td>
		                     </tr>
		                     <tr data-num="<%=cmurl%>">
		                        <td>�����������˻�</td>
		                        <td><%=cm%></td>
		                        <td>
		                           <%
		                              if(cm !="�˻� �̽ǽ�"){
		                           %><input Type="button" class="cdlinkbutton" value="�������" />
		                           <%
		                              }
		                           %>
		                        </td>
		                     </tr>
		                  </tbody>
		                  <%
		                     }
		                  %>
		               </table>
		            </div>
		        </div>
		        <div class="nGrid">
		            <div id="bb">
		               <h2>�񱳰� Ȱ����Ȳ</h2>
		               <%
		                  if(fmno.equals("20")){
		               %>
		               <input Type="button" class="brgradebutton" value="1�г�"
		                  data-num="<%=fmno%>">
		               <%
		                  }
		                                    if(fmno.equals("19")){
		               %>
		               <input Type="button" class="brgradebutton" value="1�г�"
		                  data-num="<%=fmno%>"> <input Type="button"
		                  class="brgradebutton" value="2�г�" data-num="<%=jrno%>">
		               <%
		                  }
		                                    if(fmno.equals("18")){
		               %>
		               <input Type="button" class="brgradebutton" value="1�г�"
		                  data-num="<%=fmno%>"> <input Type="button"
		                  class="brgradebutton" value="2�г�" data-num="<%=jrno%>"> <input
		                  Type="button" class="brgradebutton" value="3�г�"
		                  data-num="<%=srno%>">
		               <%
		                  }
		               %>
		               <table id="nGridTb">
		                  <thead>
		                     <tr>
		                        <th>no</th>
		                        <th>Title</th>
		                        <th>Date</th>
		                        <th>����</th>
		                     </tr>
		                  </thead>
		                  <tbody>
		                     <%
		                        if(brlist.size()==0){
		                     %>
		                     <tr>
		                        <td></td>
		                        <td>�����Ͱ������ϴ�.</td>
		                        <td></td>
		                        <td></td>
		                     </tr>
		                     <%
		                        }else{
		                                                for(int i=0; i<brlist.size(); i++){
		                                                   NonprogramVO nvo = brlist.get(i);
		                                                   String no = "00"+ nvo.getRowNo();
		                                                   no = no.substring(no.length()-2,no.length());
		                     %>
		                     <tr data-num="<%=nvo.getNpNo()%>">
		                        <td><%=no%></td>
		                        <td><span class="brlinkbutton"><%=nvo.getNpTitle()%></span></td>
		                        <td><%=nvo.getNpPsdate().substring(0,10)%></td>
		                        <td><%=nvo.getNpCenter()%></td>
		                     </tr>
		                     <%
		                        }
		                     %>
		                     <%
		                        }
		                     %>
		                  
		               </table>
		               <div align="center">
		                  <input Type="button" id="brpageleftbutton" value="��">
		                  <%
		                     for(int i=1 ; i<=brpageCount;i++){
		                  %>
		                  <span class="brpageNobutton" data-num="<%=i%>"> <%=i%></span>
		                  <%
		                     }
		                  %>
		                  <input Type="button" id="brpagerightbutton" value="��">
		               </div>
		            </div>
	            </div>
	            <!-- // .nGrid -->
	            <div class="cgGrid">
		            <div id="cc">
		               <h2>�����</h2>
		               <%
		                  if(fmno.equals("20")){
		               %>
		               <input Type="button" class="cggradebutton" value="1�г�"
		                  data-num="<%=fmno%>">
		               <%
		                  }
		                                    if(fmno.equals("19")){
		               %>
		               <input Type="button" class="cggradebutton" value="1�г�"
		                  data-num="<%=fmno%>"> <input Type="button"
		                  class="cggradebutton" value="2�г�" data-num="<%=jrno%>">
		               <%
		                  }
		                                    if(fmno.equals("18")){
		               %>
		               <input Type="button" class="cggradebutton" value="1�г�"
		                  data-num="<%=fmno%>"> <input Type="button"
		                  class="cggradebutton" value="2�г�" data-num="<%=jrno%>"> <input
		                  Type="button" class="cggradebutton" value="3�г�"
		                  data-num="<%=srno%>">
		               <%
		                  }
		               %>
		               <table id="cgGridTb">
		                  <thead>
		                     <tr>
		                        <th>no</th>
		                        <th>Date</th>
		                        <th>����</th>
		                        <th>���з�</th>
		                        <th>�������</th>
		                        <th>�����</th>
		                     </tr>
		                  </thead>
		                  <tbody>
		                     <%
		                        if(cglist.size()==0){
		                     %>
		                     <tr>
		                        <td></td>
		                        <td>�����Ͱ������ϴ�.</td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                     </tr>
		                     <%
		                        }else{
		                           for(int i=0; i<cglist.size(); i++){
		                              OnlineApplication_BoardVO ovo = cglist.get(i);
		                              String no = "00"+ ovo.getRowNo();
		                              no = no.substring(no.length()-2, no.length());
		                              String oaNo = ovo.getOaNo();
		                              
		                              String oa="";
		                              if(oaNo.substring(0,2).equals("OA")){
		                               oa= "�¶��λ��";
		                              }else{  oa= "�湮���";}
		                              
		                              String oafield = ovo.getOaField();
		                              String cac= "���λ��";
		                              String lic= "��Ȱ���";
		                              String lec= "�н����";
		                     %>
		                     <tr>
		                        <td><%=no%></td>
		                        <td><%=ovo.getOaInsertdate().substring(0,10)%></td>
		                        <td><%=ovo.getTmemberVO().getTtName()%></td>
		                        <td><%=ovo.getOaField()%></td>
		                        <td><%=oa%></td>
		                        <td>
		                           <%
		                              if(oaNo.substring(0,2).equals("OA")){
		                           %> <input Type="button" class="cgoalinkbutton" value="�������"
		                           data-num="<%=oaNo%>">
		                        </td>
		                        <%
		                           }
		                        %>
		                        <%
		                           if(oaNo.substring(0,2).equals("VR")){
		                        %>
		                        <input Type="button" class="cgvrlinkbutton" value="�������"
		                           data-num="<%=oaNo%>">
		                        </td>
		                        <%
		                           }
		                        %>
		                     </tr>
		                     <%
		                        }
		                     %>
		                     <%
		                        }
		                     %>
		                  
		               </table>
		               <div align="center">
		                  <input Type="button" id="cgpageleftbutton" value="��">
		                  <%
		                     for(int i=1 ; i<=cgpageCount;i++){
		                  %>
		                  <span class="cgpageNobutton" data-num="<%=i%>"><%=i%></span>
		                  <%
		                     }
		                  %>
		                  <input Type="button" id="cgpagerightbutton" value="��">
		               </div>
		            </div>
		        </div>
		        <!-- // .cgGrid -->
		        <div class="vGrid">
		            <div id="dd">
		               <h2>��ġ������</h2>
			               <div id="valueImg">
				               <%
				                  if(vvo !=null){
				                                 String vsfirst =vvo.getVsFirst();
				                                 String vssecond =vvo.getVsSecond();
				                                 String vsthird =vvo.getVsThird();
				               %>
				               <img alt="�����Ͱ� �����ϴ�." src="/image/<%=vsfirst%>.png"> <img
				                  alt="�����Ͱ� �����ϴ�." src="/image/<%=vssecond%>.png"> <img
				                  alt="�����Ͱ� �����ϴ�." src="/image/<%=vsthird%>.png">
				               <%
				                  }else{
				               %>
				               ��ġ�� ������ ���� �����̽��ϴ�.
				               <%
				                  }
				               %>
			               </div>
		               <div>
			               	<input Type="button" id="vsupdatebutton" name="vsupdatebutton"
			                  value="�����ϱ�">
		               </div>
		            </div>
		        </div>
	        <!-- // .vGrid -->
	        </div>
            <form id="linkForm" name="linkForm">
               <input Type="hidden" id="ssNo" name="ssNo"
                  value="<%=svo.getSsNo()%>" /> <input Type="hidden" id="npNo"
                  name="npNo" /> <input Type="hidden" id="oaNo" name="oaNo" /> <input
                  Type="hidden" id="vrNo" name="vrNo" /> <input Type="hidden"
                  id="vrNo" name="vrNo" />
            </form>
            <form id="pageNoForm">
               <input Type="hidden" id="ssNo" name="ssNo"
                  value="<%=svo.getSsNo()%>" /> <input type="hidden" id="brpageNo"
                  name="brpageNo" value="<%=svo_.getBrpageNo()%>"> <input
                  type="hidden" id="cgpageNo" name="cgpageNo"
                  value="<%=svo_.getCgpageNo()%>"> <input Type="hidden"
                  id="cdyearNo" name="cdyearNo" value="<%=svo_.getCdyearNo()%>" />
               <input Type="hidden" id="bryearNo" name="bryearNo"
                  value="<%=svo_.getBryearNo()%>" /> <input Type="hidden"
                  id="cgyearNo" name="cgyearNo" value="<%=svo_.getCgyearNo()%>" />
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