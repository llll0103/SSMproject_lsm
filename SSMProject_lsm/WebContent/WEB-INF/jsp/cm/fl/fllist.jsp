<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.FamilyLetterVO" %>    
<%@ page import="java.util.List" %>
<%@ page import="ssm.common.utils.BabySession" %>     
   
<%  String sessionAU = BabySession.getSessionAU(request);%>   
   
<%
	FamilyLetterVO searchdata =(FamilyLetterVO)request.getAttribute("Searchdata");
	int pageCount = 0;
	List<FamilyLetterVO> fllist =(List<FamilyLetterVO>)request.getAttribute("fllist");
	int listSize= fllist.size();
	if(listSize >0){
		FamilyLetterVO fvo_ = fllist.get(0);
		double totalCount = (double)Integer.parseInt(fvo_.getTotalCount()); 
		int pagelistSize = (int)request.getAttribute("listSize");
		double dval = (double)pagelistSize;
		pageCount = (int)Math.ceil(totalCount/dval); //pageCount ���� ���
		System.out.println("pageCount>>>:"+ pageCount); //1
		System.out.println("totalCount>>>:"+ totalCount); //10
		System.out.println("pagelistSize>>>:"+ pagelistSize);
	}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>������Ź�</title>
	
	
	<!-- <link rel="stylesheet" href="/include/css/ssmTheme.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.less.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.min.css.css">
	<link rel="stylesheet" href="/include/css/ssmVariables.less.css"> -->
	
	
	<link rel="stylesheet" href="/common/ssmCss/default.css?ver=1">
	<link rel="stylesheet" href="/common/ssmCss/nbBoard.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js?ver=1"></script>
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
			
			goPage(1);
		});
		
		$("#insertbutton").click(function(){
			$(location).attr('href',"/familyletter/flwirteform.ssm");
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			alert($("#search").val());
			$("#f_search").attr({
				"method":"get",
				"action":"/familyletter/fllist.ssm"
			});
			$("#f_search").submit();
		}
		
		/*���� Ŭ���� �� ������ �̵��� ���� ó�� �̺�Ʈ*/
		$(".flDetail").click(function(){
			var flNo = $(this).parents("tr").attr("data-num");
			$("#flNo").val(flNo);
			$("#fldetailForm").attr('action',"/familyletter/flDetail.ssm")
			.submit();
		});
		
		//��������ư�������� �̺�Ʈ
		$(".pageNobutton").click(function(){
			var pageNo = $(this).attr("data-num");
			$("#pageNo").val(pageNo);
			$("#pageNoForm").attr('action',"/familyletter/fllist.ssm")
			.submit();
		});
		
		//����¡ ���� ��ư
		$("#pageleftbutton").click(function(){
			var pageNo =$("#pageNo").val();
			if(pageNo == 1){
				alert("ù��°�������Դϴ�!");
			}else{
				pageNo  = pageNo-1;
				$("#pageNo").val(pageNo);
				$("#pageNoForm").attr('action','/familyletter/fllist.ssm').submit();
			}
		});
		
		//����¡ ������ ��ư
		$("#pagerightbutton").click(function(){
			var pageNo =$("#pageNo").val();
			if(pageNo >= <%=pageCount%>){
				alert("�������������Դϴ�");
			}else{
				pageNo  = Number(pageNo)+1;
				$("#pageNo").val(pageNo);
				$("#pageNoForm").attr('action','/familyletter/fllist.ssm').submit();
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
		if(sessionAU == 1){ 
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
	<nav include-html="/common/ssmMain/ssmCategory/cmSideNav.html?ver=1"></nav>
	<div id="tit">
       <h1>������Ź�</h1>
       <p>
          <a href="#">Ȩ</a> > <a href="co01.asp">��������</a> > <a
             href="co03.asp" class="on">������Ź�</a>
       </p>
    </div>
	<section>	
	<div class="container">
	<!-- �����̳� -->		
	<div id="boardContainer">
	
		<!-- ���� �� -->
<!-- 		<section include-html="/common/ssmMain/ssmCategory/section_sub_title_wrap.html"></section>	 -->
		
		<!-- �̹��� ��  -->
<!-- 		<div id="mainimage"><img alt="�����;���" src="/image/nbmain.gif"></div> -->
		
		<!-- �Խ���  -->
		<div id="boardlist">
			<input type="button" style="float:right;"id="insertbutton" value="�۾���">
		
		<!-- �˻��κ� -->
		<div id="searchdiv">
			<form id="f_search" name="f_search">
				<label>�˻�����</label>
				<select id="search" name="search">
					<option value="all">��ü</option>
					<option value="flTitle">����</option>
					<option value="flContents">����</option>
					<option value="ttName">�ۼ���</option>
				</select>
				
				<input type="text" name="keyword" id="keyword" value="�˻���Է��ϼ���" />
				<input type="button" value="�˻�" id="searchBut" />
			</form>
		</div>
		
		
		<div id="board_contents">
			<table class="list">
				<colgroup>
					<col width="15%" />
					<col width="25%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead style="text-align: center;">
					<tr>
						<th>�۹�ȣ</th>
						<th>������</th>
						<th>�ۼ���</th>
						<th>��ȸ��</th>
						<th>�ۼ���</th>
						<th>÷������</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(fllist.size()==0){
					%>
					<tr>
						<td>0</td>
						<td colspan="5">�ۼ��� ���� �����ϴ�.</td>
					</tr>
					<%
					}else{
						int count = fllist.size();
						for (int i=0; i<count; i++){
							FamilyLetterVO fvo = fllist.get(i);
							String no = fvo.getFlNo().substring(4);
							
							String FlFile=fvo.getFlFile();
							FlFile = FlFile.substring(10);
					%>	
						<tr data-num=<%=fvo.getFlNo() %>>
							<td><%=no%> </td>
							<td style="text-align:left"><span class="flDetail"><%=fvo.getFlTitle() %></span></td>
							<td><%=fvo.gettMembervo().getTtName() %></td>
							<td><%=fvo.getFlViews() %></td>
							<td><%=fvo.getFlInsertdate() %></td>
							<td>
								<%
								if(FlFile.equals("null")){
								%>
							</td>
								<%
								}else{
								%>
								<a href="/familyletter/flDownload.ssm?file=<%=FlFile%>"><img src="/image/downloadimg.jpg" width="20" height="20"></a></td>
								<%	
								} // if(FlFile.equals("null"))
								%>
							</tr>
						</tbody>	
						<%
							} // for
						} // if(fllist.size()==0){
						%>
					</table>
					</div>
					<div id="pagediv" >
					<input Type="button" id="pageleftbutton" value="��">	
					<%
					for(int i=1 ; i<=pageCount;i++){
					%>
					<span class="pageNobutton" data-num="<%=i%>" ><%=i%></span>
					<%}%>				
					<input Type="button" id="pagerightbutton" value="��">
					
					<!-- �� ������ �̵��� ���� form -->
					<form name="fldetailForm" id="fldetailForm">
					<input type="hidden" name="flNo" id="flNo">
					</form>
					
					<form id="pageNoForm">
					<input type="hidden" id="pageNo" name="pageNo" value="<%=searchdata.getPageNo()%>">
					<input type="hidden" id="listSize" name="listSize" value="10">
					<input type="hidden" name="search" value="<%=searchdata.getSearch()%>">
					<input type="hidden" name="keyword" value="<%=searchdata.getKeyword()%>">
					</form>
					</div>
		</div>
	</div> <!-- �����̳� DIV �� -->
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