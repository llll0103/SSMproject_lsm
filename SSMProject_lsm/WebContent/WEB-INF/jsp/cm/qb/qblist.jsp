<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.QnABoardVO" %>    
<%@ page import="java.util.List" %>
<%@ page import="ssm.common.utils.BabySession" %>      
<%
	request.setCharacterEncoding("EUC-KR");	
%>

<%  String sessionAU = BabySession.getSessionAU(request);%>

<%	
	//����¡������ ����
	QnABoardVO searchdata =(QnABoardVO)request.getAttribute("Searchdata");
	int pageCount =0;
	List<QnABoardVO> qblist =(List<QnABoardVO>)request.getAttribute("qblist");
	int listSize=qblist.size();
	if(listSize >0){
	QnABoardVO qvo_ = qblist.get(0);
	double totalCount = (double)Integer.parseInt(qvo_.getTotalCount()); 
	int pagelistSize = (int)request.getAttribute("listSize");
	double dval = (double)pagelistSize;
	pageCount = (int)Math.ceil(totalCount/dval); //pageCount ���� ���
	}
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	
	<!-- <link rel="stylesheet" href="/include/css/ssmTheme.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.less.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.min.css.css">
	<link rel="stylesheet" href="/include/css/ssmVariables.less.css"> -->
	
	<link rel="stylesheet" href="/common/ssmCss/default.css?ver=1">
	<link rel="stylesheet" href="/common/ssmCss/nbBoard.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	
	<link rel="stylesheet" href="/common/ssmCss/s_content.css">
    <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
	
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		/*�˻� ����� ����� ������ ó�� �̺�Ʈ*/
		$("#search").change(function(){
			if($("#search").val()=="all"){
				$("#keyword").val("��ü ������ ��ȸ�մϴ�.");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();
			}
		});
		
		/*�˻� ��ư Ŭ�� �� ó�� �̺�Ʈ*/
		$("#searchBut").click(function(){
			
			goPage();
		});
		
		//�۾����ư
		$("#insertbutton").click(function(){
			$(location).attr('href',"/qnaboard/qbwirteform.ssm");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/qnaboard/qblist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*���� Ŭ���� �� ������ �̵��� ���� ó�� �̺�Ʈ*/
		$(".qbDetail").click(function(){
			var qbNo = $(this).parents("tr").attr("data-num");
			
			if($(this).attr("id") == 'Y'){
				
				//�������� ttno �ֱ�
				var sessionAU = "<%=sessionAU%>";
				if(sessionAU != 1){
					//alert("�л��� �ƴմϴ� ��й�ȣ Ȯ�������� ���� ��ȸ");
					$("#qbNo").val(qbNo);
					$("#qbdetailForm").attr('action',"/qnaboard/qbDetail.ssm")
					.submit();
				}else{
					//alert("�л��̴� (��й�ȣ �Է�������)");
					$("#qbNo").val(qbNo);
					$("#qbdetailForm").attr('action',"/qnaboard/qbPwcheckform.ssm")
					.submit();
				}
			}else{
				$("#qbNo").val(qbNo);
				$("#qbdetailForm").attr('action',"/qnaboard/qbDetail.ssm")
				.submit();
			}
		});
		
		//��������ư�������� �̺�Ʈ
		$(".pageNobutton").click(function(){
			var pageNo = $(this).attr("data-num");
			$("#pageNo").val(pageNo);
			$("#pageNoForm").attr('action',"/qnaboard/qblist.ssm")
			.submit();
		});
		
		//����¡ ���� ��ư
		$("#pageleftbutton").click(function(){
			var pageNo =$("#pageNo").val();
			if(pageNo == 1){
				//alert("ù��°�������Դϴ�!");
			}else{
				pageNo  = pageNo-1;
				$("#pageNo").val(pageNo);
				$("#pageNoForm").attr('action','/qnaboard/qblist.ssm').submit();
			}
		});
		
		//����¡ ������ ��ư
		$("#pagerightbutton").click(function(){
			var pageNo =$("#pageNo").val();
			if(pageNo >= <%=pageCount%>){
				//alert("�������������Դϴ�");
			}else{
				pageNo  = Number(pageNo)+1;
				$("#pageNo").val(pageNo);
				$("#pageNoForm").attr('action','/qnaboard/qblist.ssm').submit();
			}
		});
		
		//Ű����˻��� �˻��ѳ��� �����ϰ��ϴ� ����
		var keyword2 = "<%=searchdata.getKeyword()%>";
		var search2 = "<%=searchdata.getSearch()%>";
		if(keyword2 != "null" && keyword2 != ""){ // Ű���� �����Ͱ� ������ ����
			$("#keyword").val(keyword2);
			$("#search").val(search2);
		}
		
		// �л������ϰ�츸 �۾����ư ���ܶ�
		var sessionAU = "<%=sessionAU%>";
		if(sessionAU == 2){ 
			$("#insertbutton").hide();
		}

		
	});	
	</script>
	
</head>
<body>
<div id="wrap">
	<!-- ��� -->
	<header include-html="/common/ssmMain/header_.jsp?ver=1"></header>
	<div class="subWrap">
	<!-- �׺���̼� -->
			<%
			if(sessionAU.equals("1")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmSSideNav.html"></nav><%
			}
			if(sessionAU.equals("2")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmTSideNav.html"></nav><%
			}
			%>
	
		<!-- ���� �� -->
<!-- 		<section include-html="/common/ssmMain/ssmCategory/section_sub_title_wrap.html"></section> -->
		<section>	
		<div id="tit">
            <h1>������ �亯</h1>
            <p>
               <a href="#">Ȩ</a> > <a href="co01.asp">��������</a> > <a
                  href="co03.asp" class="on">Q&A�Խ���</a>
            </p>
         </div>
		<div class="container">
		
		<!-- �����̳� -->
		<div id="boardContainer">	
		
		<!-- �̹��� ��  -->
<!-- 		<div id="mainimage"><img alt="�����;���" src="/image/nbmain.gif"></div> -->
		
		<!-- �Խ���  -->
		<div id="boardlist">
		<!-- �˻��κ� -->
		<div id="searchdiv">
			<form id="f_search" name="f_search">
				<table class="search_box_app mt_20" id="content01">
					<tr>
						<td>&nbsp;</td>
						<td>
							<select id="search" name="search">
								<option value="all">��ü</option>
								<option value="qbTitle">����</option>
								<option value="qbContents">����</option>
								<option value="ssName">�ۼ���</option>
							</select>
						</td>
						<td>
							<input type="text" name="keyword" id="keyword" placeholder="�˻�� �Է��ϼ���" maxlength="50" class="input"  />
							<span class="bt">
								<span class="bt_search" id="searchBut" name="searchBut">&nbsp;&nbsp;�˻�&nbsp;&nbsp;</span>
							</span>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<input type="button" style="float:right; margin-bottom:10px;" id="insertbutton" name="insertbutton" value="�۾���">
		<div id=board_contents style="margin-bottom:10px;">
			<table class="list">
				<colgroup>
					<col width="10%" />
					<col width="10%" />
					<col width="20%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th>�۹�ȣ</th>
						<th style="text-align:left">����</th>
						<th style="text-align:left">������</th>
						<th>�ۼ���</th>
						<th>��ȸ��</th>
						<th>�ۼ���</th>
						<th>�亯����</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(qblist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>�ۼ��� ���� �����ϴ�.</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<%
					}else{
						int count = qblist.size();
						for (int i=0; i<count; i++){
							QnABoardVO qvo = qblist.get(i);
							String no = qvo.getQbNo().substring(4);
							String Secretyn = qvo.getQbSecretyn();
					%>	
						<tr data-num=<%=qvo.getQbNo() %>>
							<td><%=no %></td>
							<td style="text-align:left"><%=qvo.getQbType() %></td>
							<% 
							if(Secretyn.equals("N") ){//(ssno�� ������ || ttno�� �ֶ� 
							%>
							<td style="text-align:left" id="N"><span class="qbDetail" id="N"><%=qvo.getQbTitle() %></span></td>
							<% 
							}else{
							%>
							<td style="text-align:left"><span class="qbDetail" id="Y">��б��Դϴ�.</span></td>
							
							<%
							}
							%>	
							<td><%=qvo.getsMembervo().getSsName() %></td>
							<td><%=qvo.getQbViews() %></td>
							<td><%=qvo.getQbInsertdate() %></td>
							<td><%=qvo.getQaCount()%></td>
						</tr>
					</tbody>
					<% }%>
				</table>
				</div>
				<% 
				}
				%>
				<div id="pagediv" >
				<input Type="button" id="pageleftbutton" value="��">
				<%
				for(int i=1 ; i<=pageCount;i++){
				%>
				<span class="pageNobutton" data-num="<%=i%>" ><%=i%></span>
				<%}%>				
				<input Type="button" id="pagerightbutton" value="��">
				
				<!-- �� ������ �̵��� ���� form -->
				<form name=qbdetailForm" id="qbdetailForm">
				<input type="hidden" name="qbNo" id="qbNo">
				</form>
				
				<form id="pageNoForm">
				<input type="hidden" id="pageNo" name="pageNo" value="<%=searchdata.getPageNo()%>">
				<input type="hidden" id="listSize" name="listSize" value="10">
				<input type="hidden" name="search" value="<%=searchdata.getSearch()%>">
				<input type="hidden" name="keyword" value="<%=searchdata.getKeyword()%>">
				</form>
				</div>
		</div>
	</div> 
	<!-- �����̳� DIV �� -->
	</div>
	<!-- // .container -->
	</section>
	</div>
	<!-- // .subWrap -->
	    <footer include-html="/common/ssmMain/footer.html"></footer>
</div>
		<script>
			includeHTML();
		</script>	
</body>
</html>