<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ssm.cm.vo.NoticeBoardVO"%>
<%@ page import="java.util.List"%>
<%@ page import="ssm.common.utils.BabySession"%>


<%
	String SessionAU = BabySession.getSessionAU(request);
	//����¡������ ����
	request.setCharacterEncoding("EUC-KR");
	NoticeBoardVO searchdata = (NoticeBoardVO) request.getAttribute("Searchdata");
	int pageCount = 0;
	List<NoticeBoardVO> nblist = (List<NoticeBoardVO>) request.getAttribute("nblist");
	int listSize = nblist.size();
	if (listSize > 0) {
		NoticeBoardVO nvo_ = nblist.get(0);
		double totalCount = (double) Integer.parseInt(nvo_.getTotalCount());
		int pagelistSize = (int) request.getAttribute("listSize");
		double dval = (double) pagelistSize;
		pageCount = (int) Math.ceil(totalCount / dval); //pageCount ���� ���
		System.out.println("pageCount>>>:" + pageCount); //1
		System.out.println("totalCount>>>:" + totalCount); //10
		System.out.println("pagelistSize>>>:" + pagelistSize);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��������</title>


<!-- <link rel="stylesheet" href="/include/css/ssmTheme.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.less.css">
	<link rel="stylesheet" href="/include/css/ssmTheme.min.css.css">
	<link rel="stylesheet" href="/include/css/ssmVariables.less.css"> -->

<link rel="stylesheet" href="/common/ssmCss/default.css">
<link rel="stylesheet" href="/common/ssmCss/nbBoard.css?ver=1">
<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">

<link rel="stylesheet" href="/common/ssmCss/s_content.css">

<script src="/common/ssmJs/goCategory.js?ver=1"></script>
<script src="/common/ssmJs/index.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js?ver=2"></script>
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
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			alert($("#search").val());
			$("#f_search").attr({
				"method":"get",
				"action":"/noticeboard/nblist.ssm"
			});
			$("#f_search").submit();
		});
		
		//���Է� ��ư�������� �̺�Ʈ
		$("#nbinsertbutton").click(function(){
			$(location).attr('href',"/noticeboard/nbwirteform.ssm");
		});
		
		/*���� Ŭ���� �� ������ �̵��� ���� ó�� �̺�Ʈ*/
		$(".nbDetail").click(function(){
			var nbNo = $(this).parents("tr").attr("data-num");
			$("#nbNo").val(nbNo);
			$("#nbdetailForm").attr('action',"/noticeboard/nbDetail.ssm")
			.submit();
		});
		
		//��������ư�������� �̺�Ʈ
		$(".pageNo2").click(function(){
			var pageNo = $(this).attr("data-num");
			$("#pageNo").val(pageNo);
			$("#pageNoForm").attr('action',"/noticeboard/nblist.ssm")
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
				$("#pageNoForm").attr('action','/noticeboard/nblist.ssm').submit();
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
				$("#pageNoForm").attr('action','/noticeboard/nblist.ssm').submit();
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
		var SessionAU = "<%=SessionAU%>";
				if (SessionAU == 1) {
					$("#nbinsertbutton").hide();
				}
			});
</script>
<style>
	.board_btn {
		margin-bottom : 10px;
		top : 0 !important;
	}
</style>
</head>
<body>

	<div id="wrap">
		<!-- ��� -->
		<%@include file="/common/ssmMain/header_.jsp"%>
		<div class="subWrap">
			<!-- �׺���̼� -->
			<%
			if(SessionAU.equals("1")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmSSideNav.html"></nav><%
			}
			if(SessionAU.equals("2")){
			%><nav include-html="/common/ssmMain/ssmCategory/cmTSideNav.html"></nav><%
			}
			%>
			<!-- ���� �� -->
<!-- 				<section include-html="/common/ssmMain/ssmCategory/section_sub_title_wrap.html"> -->
<!-- 			<div class="sub_title_wrap"> -->
<!-- 				<div style=" float:left;">���α׷� ����</div> -->
<!-- 				<div style=" float:right; margin-right:20px;"> -->
<!-- 					<a target="a_" href="javascript:go_home()"><img src="/image/home.gif" alt="��������"></a> -->
<!-- 					<a target="a_" href="javascript:goPageMain();" data-sub="">> Ŀ�´�Ƽ</a> -->
<!-- 					<a target="a_" href="javascript:goPageLeft();">> ���α׷� ����</a> -->
<!-- 				</div> -->
<!-- 			</div>	 -->
			<section>
			 <div id="tit">
	            <h1>��������</h1>
	            <p>
	               <a href="#">Ȩ</a> > <a href="co01.asp">��������</a> > <a
	                  href="co03.asp" class="on">��������</a>
	            </p>
	         </div>
			<div class="container">
				<!-- �����̳� -->
				<div id="boardContainer">
<!-- 					�̹��� ��  -->
<!-- 					<div id="mainimage"> -->
<!-- 						<img alt="�����;���" src="/image/nbmain.gif"> -->
<!-- 					</div> -->
					<!-- �Խ���  -->
					<div id="boardlist">
						<!-- �˻� �κ� -->
						<div id="searchdiv">
							<form id="f_search" name="f_search">
								<table class="search_box_app mt_10" id="content01">
									<tr>
										<td>&nbsp;</td>
										<td>
											<select id="search" name="search">
												<option value="all">��ü</option>
												<option value="nbTitle">����</option>
												<option value="nbContents">����</option>
												<option value="ttName">�ۼ���</option>
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
<!-- 								<input type="button" style="float: right;" id="nbinsertbutton" -->
<!-- 							value="�۾���"> -->
							<div class="board_btn">
								<span id="nbinsertbutton">�۾���</span>
							</div>
							</form>
						</div>
						<div id="board_contents" style="margin-bottom: 10px;">
							<table class="list" cellpadding="0" cellspacing="0" border="0">
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
										if (nblist.size() == 0) {
									%>
									<tr>
										<td>0</td>
										<td colspan="5">�ۼ��� ���� �����ϴ�.</td>
									</tr>
									<%
										} else {
											int count = nblist.size();
											for (int i = 0; i < count; i++) {
												NoticeBoardVO nvo = nblist.get(i);
												String no = nvo.getNbNo().substring(4);

												String NbFile = nvo.getNbFile();
												NbFile = NbFile.substring(10);
									%>
									<tr data-num=<%=nvo.getNbNo()%>>
										<td><%=no%></td>
										<td style="text-align: left"><span class="nbDetail"><%=nvo.getNbTitle()%></span></td>
										<td><%=nvo.gettMembervo().getTtName()%></td>
										<td><%=nvo.getNbViews()%></td>
										<td><%=nvo.getNbInsertdate()%></td>
										<td>
											<%
												if (NbFile.equals("null")) {
											%>
										</td>
											<%
												} else {
											%>
											<a href="/noticeboard/nbDownload.ssm?file=<%=NbFile%>"><img
												src="/image/downloadimg.jpg" width="20" height="20"></a>
											</td>
											<%
												} // if (NbFile.equals("null")) 
											%>
									</tr>
								</tbody>
								<%
										} // for
								
									} // if (nblist.size() == 0)
								%>
							</table>
						</div>
						<div id="pagediv">
							<spanid="pageleftbutton" class="pageBtn">��</spanid>
							<%
								for (int i = 1; i <= pageCount; i++) {
							%>
								<span class="pageNo2" data-num="<%=i%>"><%=i%></span>
							<%
								}
							%>
							<span id="pagerightbutton" class="pageBtn">��</span>

							<form name="nbdetailForm" id="nbdetailForm">
								<input type="hidden" name="nbNo" id="nbNo">
							</form>

							<form id="pageNoForm">
								<input type="hidden" id="pageNo" name="pageNo"
									value="<%=searchdata.getPageNo()%>"> <input
									type="hidden" id="listSize" name="listSize" value="10">
								<input type="hidden" name="search"
									value="<%=searchdata.getSearch()%>"> <input
									type="hidden" name="keyword"
									value="<%=searchdata.getKeyword()%>">
							</form>
						</div>
						<!-- // #pagediv -->
					</div>
					<!-- // #boardList -->
				</div>
				<!-- board�����̳� DIV �� -->
			</div>
			<!-- // .container -->
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