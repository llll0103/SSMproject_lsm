<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import =  "ssm.cg.vo.OnlineApplication_BoardVO" %>
<%@ page import =  "ssm.cg.controller.OnlineApplication_BoardController" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("EUC-KR");
   //String imagePath = request.getRealPath("uploadStorage");
   Object obj = request.getAttribute("oaDetailList");
   OnlineApplication_BoardVO oaVo = (OnlineApplication_BoardVO)obj;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      	<title>Detail</title>
    </head>
  	<script src="/include/js/jquery-1.11.3.min.js"></script>
   	<link rel="stylesheet" href="/common/ssmCss/default.css">
   	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
   	<link rel="stylesheet" href="/common/ssmCss/css/ssm_base.css">
   	<link rel="stylesheet" href="/common/ssmCss/css/ssm_content.css">
   	<link rel="stylesheet" href="/common/ssmCss/css/ssm_layout.css">
   	<script src="/common/ssmJs/index.js"></script>
   	<script>
   	
   		// ��Ϻ���()
	   	function oaListBtn(){
	        //location.href = document.referrer; 
	        history.go(-1);   
	     }
	   	
	   	// ����()
	   	function oaUpdateBtn(){
	   		$("#oaDetailForm")
	        .attr("action","/onlineApplication/oaUpdateForm.ssm")
	        .submit();
	     }
	   	
	   	// ����()
	   	function oaDeleteBtn(){
	   		if(confirm("���� �����Ͻðڽ��ϱ�?")){
	   			$("#oaDetailForm")
	           .attr("action","/onlineApplication/oaBoardDelete.ssm")
	           .submit();
	        }
	     }
	     
	     // ���� �ٿ�ε�
	     function wwo(){
	    	 
	        var filePath = "";
	        
	        $("#oaDetailForm").attr({
	           "action":"/onlineApplication/oaFileDownload.ssm"
	        });
	        $("#oaDetailForm").submit();
	     }
	     
   	</script>
   	<style>
   		.board_btn .back {
      		background-color: #b1c9ca75;
      	}
    </style>
	<body>
		<div id="wrap">
   			<%@include file="/common/ssmMain/header_.jsp"%>
      		<div class="subWrap">
	      	<%if(sessionAU.equals("1")){ System.out.println("�л��׺�");%>
            <nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
	         <%}else{ System.out.println("����׺�");%>
            <nav include-html="/common/ssmMain/ssmCategory/cgTsideNav.jsp"></nav>
	         <% } %>
	         <section>
	         	<div id="tit">
	            	<h1>���� �¶��� ���</h1>
	            	<p>
	               		<a href="#">Ȩ</a> > <a href="co01.asp">��û/����</a> > <a href="co03.asp" class="on">�¶��λ��</a>
	            	</p>
	         	</div>
	         	<div class="container">
	         		<div id="content">
	      				<div id="oaDetail">
	      					<div class="comm_tit mt_10"  id="oaTitle" style="margin:0 auto;">
<!-- 	     					 <div class="comm_titmin mt_10"  id="oaTitle" style="margin:0 auto;"> -->
	     					 	<span>�󼼱ۺ���</span>
      						</div>
	      					<!-- // .comm_titmin mt_10 -->
	         				<div class="clear_div"></div>
	         					<table cellpadding="0" cellspacing="0" border="0" style="margin:auto;" class="view_box mt_5" >
						         	<colgroup>
						         		<col width="18%">
						       			<col width="35%">
						       			<col width="18%">
						       			<col width="35%">
						       		</colgroup>
							        <%
							        	if(oaVo == null){
							        %>
	            					<tr><td>��ȸ�� �����߽��ϴ�.</td></tr>
						        	<%
						        		} else {
						       		%>
						            <tr>
						               <th>��û��ȣ</th>
						               <td><%=oaVo.getOaNo() %></td>
						               <th>��û��</th>
						               <td><%=oaVo.getOaInsertdate() %></td>
						            </tr>		
						            <tr>
						               <th>�ۼ���</th>
						               <td colspan="3"><%=oaVo.getSmemberVO().getSsName() %></td>
						            </tr>
						            <tr>
						               <th>����</th>
						               <td><%=oaVo.getTmemberVO().getTtName() %></td>
						               <th>���о�</th>
						               <td><%=oaVo.getOaField() %></td>
						            </tr>
						            <tr>
						               <th>����</th>
						               <td colspan="3" ><%=oaVo.getOaTitle() %></td>
						            </tr>
						            <tr>
						               <th height="200px">��㳻��</th>
						               <td colspan="3"><%=oaVo.getOaContents() %></td>
						            </tr>
						            <tr>
						               <th>÷������</th>
						               <td colspan="3">
						               <%
						                  if(oaVo.getOaFile() == null) {
						               %>
						                  ÷�������� �����ϴ�.</td>
						               <%
						                  } else {
						               %>
						                  <p><%=oaVo.getOaFile() %>&nbsp;&nbsp;&nbsp;<a href="/onlineApplication/oaFileDownload.ssm?fileName=<%=oaVo.getOaFile()%>">�ٿ�ε�</a></p></td>
						               <%      
						                  } // if
						               %>
						            </tr>
							        <%
							        	}
							        %>
         						</table>
         						<form id="oaDetailForm" name="oaDetailForm" method="POST">
         							<input type="hidden" id="oaNo" name="oaNo" value=<%=oaVo.getOaNo() %> />
						            <input type="hidden" id="ssNo" name="ssNo" value=<%=oaVo.getSsNo() %> />
					            </form>
					            <div class="board_btn">
					            	<div style="text-align:end;">
					            		<a href="javascript:oaUpdateBtn()"><span>����</span></a>
					            		<a href="javascript:oaDeleteBtn()"><span>����</span></a>
					            		<a href="javascript:oaListBtn()"><span class="back">���</span></a>
					               </div>
					            </div>
					            <!-- // .board_btn -->
      						</div>
	     				 	<%@include file="oaComment.jsp"%> 
	      				</div>
	      				<!-- // #content -->
	         		</div>
         		</section>
   			</div>
   			<!-- // .subWrap -->
   			<footer include-html="/common/ssmMain/footer.html"></footer>
		</div>
		<!-- // #wrap -->
	   <script>
	      includeHTML();
	   </script>
   </body>
</html>