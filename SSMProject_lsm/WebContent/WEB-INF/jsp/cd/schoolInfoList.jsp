<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List"%>
<%@ page import="ssm.cd.vo.*"%>
<%@ page import="java.lang.Math"%>
<%
	request.setCharacterEncoding("EUC-KR");
	Object obj = request.getAttribute("list");
	Object obj2 = request.getAttribute("saveData");
	Object obj3 = request.getAttribute("saveData3");
	List list = null;
	String sd_No = "";
	String sd_CampusName = "";
	String sd_CollageInfoUrl = "";
	String sd_SchoolType = "";
	String sd_Link = "";
	String sd_SchoolGubun = "";
	String sd_Adres = "";
	String sd_Region = "";
	String sd_TotalCount = "";
	String sd_EstType = "";
	String sd_Seq = "";
	String sd_SchoolName = "";
	String listSize = "";
	String sd_curPage = "";
	String rowNum = "";
	int sd_listSize = 0;
	int curPage2 = 0;
	School_DataVO sddvo = null;
	String all = "";
	String all2 = "";
	String region1 = "";
	String region2 = "";
	String region3 = "";
	String region4 = "";
	String region5 = "";
	String region6 = "";
	String region7 = "";
	String region8 = "";
	String region9 = "";
	String region10 = "";
	String region11 = "";
	String region12 = "";
	String region13 = "";
	String region14 = "";
	String region15 = "";
	String region16 = "";
	String region17 = "";
	String region18 = "";
	String sd_EstType1 = "";
	String sd_EstType2 = "";
	String sd_EstType3 = "";
	S_DataVO dvo = null;
	String alll = "";
	String all22 = "";
	String regionn11 = "";
	String region22 = "";
	String region33 = "";
	String region44 = "";
	String region55 = "";
	String region66 = "";
	String region77 = "";
	String region88 = "";
	String region99 = "";
	String region100 = "";
	String region111 = "";
	String region122 = "";
	String region133 = "";
	String region144 = "";
	String region155 = "";
	String region166 = "";
	String region177 = "";
	String region188 = "";
	String sd_EstType11 = "";
	String sd_EstType22 = "";
	String sd_EstType33 = "";
	String sd_SchoolTypee = "";

	double aa = 0.0;
	double bb = 0.0;
	double ss = 0.0;
	int bb2 = 0;
	int dd = 0;

	if (obj != null) {
		list = (List) obj;
		if (list.size() > 0) {
			School_DataVO sdvo = (School_DataVO) list.get(0);
			sd_TotalCount = sdvo.getSd_Totalcount(); // row �� ����
			listSize = sdvo.getSd_listSize(); // �������� row��
			sd_listSize = Integer.parseInt(listSize);
			sd_curPage = sdvo.getSd_curPage(); // ���� ������
			curPage2 = Integer.parseInt(sd_curPage);
			aa = Double.valueOf(sd_TotalCount);
			bb = Double.valueOf(listSize);
			ss = Math.ceil(aa / bb);
			bb2 = (int) bb;
			dd = (int) ss;
		}
	} else {

	}

	if (obj3 != null) {
		sddvo = (School_DataVO) obj3;
		all = sddvo.getAll();
		all2 = sddvo.getAll2();
		region1 = sddvo.getRegion1();
		region2 = sddvo.getRegion2();
		region3 = sddvo.getRegion3();
		region4 = sddvo.getRegion4();
		region5 = sddvo.getRegion5();
		region6 = sddvo.getRegion6();
		region7 = sddvo.getRegion7();
		region8 = sddvo.getRegion8();
		region9 = sddvo.getRegion9();
		region10 = sddvo.getRegion10();
		region11 = sddvo.getRegion11();
		region12 = sddvo.getRegion12();
		region13 = sddvo.getRegion13();
		region14 = sddvo.getRegion14();
		region15 = sddvo.getRegion15();
		region16 = sddvo.getRegion16();
		region17 = sddvo.getRegion17();
		region18 = sddvo.getRegion18();
		sd_EstType1 = sddvo.getSd_EstType1();
		sd_EstType2 = sddvo.getSd_EstType2();
		sd_EstType3 = sddvo.getSd_EstType3();
		sd_SchoolType = sddvo.getSd_SchoolType();
	}

	if (obj2 != null) {
		dvo = (S_DataVO) obj2;
		alll = dvo.getAlll();
		all22 = dvo.getAll22();
		regionn11 = dvo.getRegionn11();
		region22 = dvo.getRegion22();
		region33 = dvo.getRegion33();
		region44 = dvo.getRegion44();
		region55 = dvo.getRegion55();
		region66 = dvo.getRegion66();
		region77 = dvo.getRegion77();
		region88 = dvo.getRegion88();
		region99 = dvo.getRegion99();
		region100 = dvo.getRegion100();
		region111 = dvo.getRegion111();
		region122 = dvo.getRegion122();
		region133 = dvo.getRegion133();
		region144 = dvo.getRegion144();
		region155 = dvo.getRegion155();
		region166 = dvo.getRegion166();
		region177 = dvo.getRegion177();
		region188 = dvo.getRegion188();
		sd_EstType11 = dvo.getSd_EstType11();
		sd_EstType22 = dvo.getSd_EstType22();
		sd_EstType33 = dvo.getSd_EstType33();
		sd_SchoolTypee = dvo.getSd_SchoolTypee();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>schoolInfo</title>
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
				console.log("ready");
				
				$("#sd_listSize").val(<%=sd_listSize%>);
				but();
				checked();
				checked1();
				$(".curPage").click(function(){
					abc();
					abc2();
					$("#sd_listSize").val(<%=bb2%>);
					var ss = $(this).val();
					$("#sd_curPage").val(ss);
					$("#f").attr("action","/test/schoolInfoList.ssm").submit();
				});
				$("#next").click(function(){
					abc();
					abc2();
					var page = $("#sd_curPage").val();
					if(page <= 10){$("#sd_curPage").val(Number(11));}
					else if(page <= 20){$("#sd_curPage").val(Number(21));}
					else if(page <= 30){$("#sd_curPage").val(Number(31));}
					else if(page <= 40){$("#sd_curPage").val(Number(41));}
					else if(page <= 50){$("#sd_curPage").val(Number(51));}
					$("#sd_listSize").val(<%=bb2%>);
					$("#f").attr("action","/test/schoolInfoList.ssm").submit();
				});
				$("#last").click(function(){
					abc();
					abc2();
					$("#sd_listSize").val(<%=bb2%>);
					$("#sd_curPage").val(<%=dd%>);
					$("#f").attr("action","/test/schoolInfoList.ssm").submit();
				});
				$("#prev").click(function(){
					abc();
					abc2();
					$("#sd_listSize").val(<%=bb2%>);
					var page = $("#sd_curPage").val();
					if(page <= 20){$("#sd_curPage").val(Number(1));}
					else if(page <= 30){$("#sd_curPage").val(Number(11));}
					else if(page <= 40){$("#sd_curPage").val(Number(21));}
					else if(page <= 50){$("#sd_curPage").val(Number(31));}
					$("#f").attr("action","/test/schoolInfoList.ssm").submit();
				});
				$("#first").click(function(){
					abc();
					abc2();
					$("#sd_listSize").val(<%=bb2%>);
					$("#sd_curPage").val(Number(1));
					$("#f").attr("action","/test/schoolInfoList.ssm").submit();
				});
				$("#apply").click(function(){
					abc();
					abc2();
					$("#sd_curPage").val(Number(1));
					$("#f").attr("action","/test/schoolInfoList.ssm").submit();
				});
				$("#all").click(function(){
					if($("#all").prop("checked")){
						for(var i=1;i<=18;i++){
							$("#region"+i).prop("checked",true);
						}
					}else{
						for(var i=1;i<=18;i++){
							$("#region"+i).prop("checked",false);
						}
					}
				});
				$("#all2").click(function(){
					if($("#all2").prop("checked")){
						for(var i=1;i<=3;i++){
							$("#sd_EstType"+i).prop("checked",true);
						}
					}else{
						for(var i=1;i<=3;i++){
							$("#sd_EstType"+i).prop("checked",false);
						}
					}
				});
				$("#result").click(function(){
					os();
					abc();
					abc2();
					$("#sd_curPage").val(Number(1));
					$("#f").attr("action","/test/schoolInfoList.ssm").submit();
				});
			});
			function but(){
				var page = $("#sd_curPage").val();
				var cp = $("#sd_curPage").val();
				$("#sd_curPage"+cp).attr("style","background-color:orange");
				var total =<%=dd%>;
				if(page <=10){
					$("#prev").hide();
					$("#first").hide();
					if(total<=10){
						$("#next").hide();
						$("#last").hide();
					}
				}
				if(page <=20 && page >= 11){
					if(total<=20){
						$("#next").hide();
						$("#last").hide();
					}
				}
				if(page <=30 && page >= 21){
					if(total<=30){
						$("#next").hide();
						$("#last").hide();
					}
				}
				if(page <=40 && page >= 31){
					if(total<=40){
						$("#next").hide();
						$("#last").hide();
					}
				}
				if(page <=50 && page >= 41){
					if(total<=50){
						$("#next").hide();
						$("#last").hide();
					}
				}
			}
			
			function checked(){
				if("<%=all%>" != 'null')$("#all").val("<%=all%>");
				if("<%=region1%>" != 'null')$("#region1").val("<%=region1%>");
				if("<%=region2%>" !='null')$("#region2").val("<%=region2%>");
				if("<%=region3%>" !='null')$("#region3").val("<%=region3%>");
				if("<%=region4%>" !='null')$("#region4").val("<%=region4%>");
				if("<%=region5%>" !='null')$("#region5").val("<%=region5%>");
				if("<%=region6%>" !='null')$("#region6").val("<%=region6%>");
				if("<%=region7%>" !='null')$("#region7").val("<%=region7%>");
				if("<%=region8%>" !='null')$("#region8").val("<%=region8%>");
				if("<%=region9%>" !='null')$("#region9").val("<%=region9%>");
				if("<%=region10%>" !='null')$("#region10").val("<%=region10%>");
				if("<%=region11%>" !='null')$("#region11").val("<%=region11%>");
				if("<%=region12%>" !='null')$("#region12").val("<%=region12%>");
				if("<%=region13%>" !='null')$("#region13").val("<%=region13%>");
				if("<%=region14%>" !='null')$("#region14").val("<%=region14%>");
				if("<%=region15%>" !='null')$("#region15").val("<%=region15%>");
				if("<%=region16%>" !='null')$("#region16").val("<%=region16%>");
				if("<%=region17%>" !='null')$("#region17").val("<%=region17%>");
				if("<%=region18%>" !='null')$("#region18").val("<%=region18%>");
				
				if("<%=all2%>" != 'null')$("#all2").val("<%=all2%>");
				if("<%=sd_EstType1%>" !='null')$("#sd_EstType1").val("<%=sd_EstType1%>");
				if("<%=sd_EstType2%>" !='null')$("#sd_EstType2").val("<%=sd_EstType2%>");
				if("<%=sd_EstType3%>" !='null')$("#sd_EstType3").val("<%=sd_EstType3%>");
				
				if("<%=sd_SchoolType%>" == "null"){
					$("#sd_SchoolType").val("all");
				}else{
					$("#sd_SchoolType").val("<%=sd_SchoolType%>");
				}
				
			}
			function checked1(){
				if("<%=alll%>" != 'null')$("#alll").prop("checked",true);
				if("<%=regionn11%>" != 'null')$("#regionn11").prop("checked",true);
				if("<%=region22%>" !='null')$("#region22").prop("checked",true);
				if("<%=region33%>" !='null')$("#region33").prop("checked",true);
				if("<%=region44%>" !='null')$("#region44").prop("checked",true);
				if("<%=region55%>" !='null')$("#region55").prop("checked",true);
				if("<%=region66%>" !='null')$("#region66").prop("checked",true);
				if("<%=region77%>" !='null')$("#region77").prop("checked",true);
				if("<%=region88%>" !='null')$("#region88").prop("checked",true);
				if("<%=region99%>" !='null')$("#region99").prop("checked",true);
				if("<%=region100%>" !='null')$("#region100").prop("checked",true);
				if("<%=region111%>" !='null')$("#region111").prop("checked",true);
				if("<%=region122%>" !='null')$("#region122").prop("checked",true);
				if("<%=region133%>" !='null')$("#region133").prop("checked",true);
				if("<%=region144%>" !='null')$("#region144").prop("checked",true);
				if("<%=region155%>" !='null')$("#region155").prop("checked",true);
				if("<%=region166%>" !='null')$("#region166").prop("checked",true);
				if("<%=region177%>" !='null')$("#region177").prop("checked",true);
				if("<%=region188%>" !='null')$("#region188").prop("checked",true);
				
				if("<%=all22%>" != 'null')$("#all22").prop("checked",true);
				if("<%=sd_EstType11%>" !='null')$("#sd_EstType11").prop("checked",true);
				if("<%=sd_EstType22%>" !='null')$("#sd_EstType22").prop("checked",true);
				if("<%=sd_EstType33%>" !='null')$("#sd_EstType33").prop("checked",true);
				
				if("<%=sd_SchoolTypee%>" == "null"){
					$("#sd_SchoolTypee").val("all");
				}else{
					$("#sd_SchoolTypee").val("<%=sd_SchoolTypee%>");
				}
				
			}
			function abc(){
				for(var i=1;i<=18;i++){
					if($("#region"+i).val()){
						$("#go").val("go");
						break;
					}
				}
			}
			function abc2(){
				for(var i=1;i<=3;i++){
					if($("#sd_EstType"+i).val()){
						$("#go2").val("go2");
						break;
					}
				}
			}
			function os(){
				if($("#alll").prop("checked")){
					var v = $("#alll").val();
					$("#all").val(v);
				}else{
					$("#all").val("");
				}
				if($("#regionn11").prop("checked")){
					var v = $("#regionn11").val();
					$("#region1").val(v);
				}else{
					$("#region1").val("");
				}
				if($("#region22").prop("checked")){
					var v = $("#region22").val();
					$("#region2").val(v);
				}else{
					$("#region2").val("");
				}
				if($("#region33").prop("checked")){
					var v = $("#region33").val();
					$("#region3").val(v);
				}else{
					$("#region3").val("");
				}
				if($("#region44").prop("checked")){
					var v = $("#region44").val();
					$("#region4").val(v);
				}else{
					$("#region4").val("");
				}
				if($("#region55").prop("checked")){
					var v = $("#region55").val();
					$("#region5").val(v);
				}else{
					$("#region5").val("");
				}
				if($("#region66").prop("checked")){
					var v = $("#region66").val();
					$("#region6").val(v);
				}else{
					$("#region6").val("");
				}
				if($("#region77").prop("checked")){
					var v = $("#region77").val();
					$("#region7").val(v);
				}else{
					$("#region7").val("");
				}
				if($("#region88").prop("checked")){
					var v = $("#region88").val();
					$("#region8").val(v);
				}else{
					$("#region8").val("");
				}
				if($("#region99").prop("checked")){
					var v = $("#region99").val();
					$("#region9").val(v);
				}else{
					$("#region9").val("");
				}
				if($("#region100").prop("checked")){
					var v = $("#region100").val();
					$("#region10").val(v);
				}else{
					$("#region10").val("");
				}
				if($("#region111").prop("checked")){
					var v = $("#region111").val();
					$("#region11").val(v);
				}else{
					$("#region11").val("");
				}
				if($("#region122").prop("checked")){
					var v = $("#region122").val();
					$("#region12").val(v);
				}else{
					$("#region12").val("");
				}
				if($("#region133").prop("checked")){
					var v = $("#region133").val();
					$("#region13").val(v);
				}else{
					$("#region13").val("");
				}
				if($("#region144").prop("checked")){
					var v = $("#region144").val();
					$("#region14").val(v);
				}else{
					$("#region14").val("");
				}
				if($("#region155").prop("checked")){
					var v = $("#region155").val();
					$("#region15").val(v);
				}else{
					$("#region15").val("");
				}
				if($("#region166").prop("checked")){
					var v = $("#region166").val();
					$("#region16").val(v);
				}else{
					$("#region16").val("");
				}
				if($("#region177").prop("checked")){
					var v = $("#region177").val();
					$("#region17").val(v);
				}else{
					$("#region17").val("");
				}
				if($("#region188").prop("checked")){
					var v = $("#region188").val();
					$("#region18").val(v);
				}else{
					$("#region18").val("");
				}
				
				if($("#all22").prop("checked")){
					var v = $("#all22").val();
					$("#all2").val(v);
				}else{
					$("#all2").val("");
				}
				
				if($("#sd_EstType11").prop("checked")){
					var v = $("#sd_EstType11").val();
					$("#sd_EstType1").val(v);	
				}else{
					$("#sd_EstType1").val("");
				}
				if($("#sd_EstType22").prop("checked")){
					var v = $("#sd_EstType22").val();
					$("#sd_EstType2").val(v);
				}else{
					$("#sd_EstType2").val("");
				}
				if($("#sd_EstType33").prop("checked")){
					var v = $("#sd_EstType33").val();
					$("#sd_EstType3").val(v);
				}else{
					$("#sd_EstType3").val("");
				}
				
				if($("#sd_SchoolTypee").val() == "all"){
					$("#sd_SchoolType").val("all"); 
				}else{
					$("#sd_SchoolType").val("<%=sd_SchoolTypee%>");
				}
			}
			
		</script>
<style type="text/css">
table {
	width: 1150px;
	text-align : left;
}
table td span{
text-align : left;}
a {
	text-decoration: none;
}

</style>
</head>
<body>


	<div id="wrap">

		<%@include file="/common/ssmMain/header_.jsp"%>

		<div class="subWrap">
		<%if(sessionAU.equals("1")){ System.out.println("�л��׺�");%>
				<nav include-html="/common/ssmMain/ssmCategory/cdSsideNav.html"></nav>
			<%}else{ System.out.println("����׺�");%>
				<nav include-html="/common/ssmMain/ssmCategory/cdTsideNav.html"></nav>
			<% } %>

			<section>
			<div id="tit">
				<h1>���б� Ž��</h1>
				<p>
					<a href="#">Ȩ</a> > <a href="co01.asp">���μ���</a> > <a
						href="co03.asp" class="on">���б� Ž��</a>
				</p>
			</div>
			<div class="container">
			
				<div class="contentbox">


	





					<form name="f" id="f" method="post">
						<input type="hidden" name="sd_curPage" id="sd_curPage"
							value="<%=curPage2%>"> <input type="hidden" name="go"
							id="go"> <input type="hidden" name="go2" id="go2">
						<input type="hidden" name="all" id="all"> <input
							type="hidden" name="region1" id="region1"> <input
							type="hidden" name="region2" id="region2"> <input
							type="hidden" name="region3" id="region3"> <input
							type="hidden" name="region4" id="region4"> <input
							type="hidden" name="region5" id="region5"> <input
							type="hidden" name="region6" id="region6"> <input
							type="hidden" name="region7" id="region7"> <input
							type="hidden" name="region8" id="region8"> <input
							type="hidden" name="region9" id="region9"> <input
							type="hidden" name="region10" id="region10"> <input
							type="hidden" name="region11" id="region11"> <input
							type="hidden" name="region12" id="region12"> <input
							type="hidden" name="region13" id="region13"> <input
							type="hidden" name="region14" id="region14"> <input
							type="hidden" name="region15" id="region15"> <input
							type="hidden" name="region16" id="region16"> <input
							type="hidden" name="region17" id="region17"> <input
							type="hidden" name="region18" id="region18"> <input
							type="hidden" id="sd_SchoolType" name="sd_SchoolType"> <input
							type="hidden" name="all2" id="all2"> <input
							type="hidden" name="sd_EstType1" id="sd_EstType1"> <input
							type="hidden" name="sd_EstType2" id="sd_EstType2"> <input
							type="hidden" name="sd_EstType3" id="sd_EstType3">
						<div class="checkbox mt_10">
							<table cellpadding="0" cellspacing="0" border="0" 
								class="view_box2">
								<colgroup>
									<col width="30%" />
									<col width="70%" />
								</colgroup>
								<tr>
									<th><span>��������</span></th>
									<td style="text-align : left;">
									
									<span> <input type="checkbox"
											name="alll" id="alll" value="��ü">��ü
									</span> 
									
									<span> <input type="checkbox" name="regionn11"
											id="regionn11" value="����Ư����">����Ư����
									</span>
									
									 <span> <input type="checkbox" name="region22"
											id="region22" value="�λ걤����">�λ걤����
									</span> 
									<span> <input type="checkbox" name="region33"
											id="region33" value="��õ������">��õ������
									</span> <span> <input type="checkbox" name="region44"
											id="region44" value="�뱸������">�뱸������
									</span> <span> <input type="checkbox" name="region55"
											id="region55" value="���ֱ�����">���ֱ�����
									</span> <span> <input type="checkbox" name="region66"
											id="region66" value="����������">����������
									</span> <span> <input type="checkbox" name="region77"
											id="region77" value="��걤����">��걤����
									</span> <span> <input type="checkbox" name="region88"
											id="region88" value="����Ư����ġ��">����Ư����ġ��
									</span> <span> <input type="checkbox" name="region99"
											id="region99" value="��⵵">��⵵
									</span> <span> <input type="checkbox" name="region100"
											id="region100" value="������">������
									</span> <span> <input type="checkbox" name="region111"
											id="region111" value="��û����">��û����
									</span> <span> <input type="checkbox" name="region122"
											id="region122" value="��û�ϵ�">��û�ϵ�
									</span> <span> <input type="checkbox" name="region133"
											id="region133" value="���ϵ�">���ϵ�
									</span> <span> <input type="checkbox" name="region144"
											id="region144" value="��󳲵�">��󳲵�
									</span> <span> <input type="checkbox" name="region155"
											id="region155" value="����ϵ�">����ϵ�
									</span> <span> <input type="checkbox" name="region166"
											id="region166" value="���󳲵�">���󳲵�
									</span> <span> <input type="checkbox" name="region177"
											id="region177" value="����Ư����ġ��">����Ư����ġ��
									</span> <span> <input type="checkbox" name="region188"
											id="region188" value="�ؿܰ���">�ؿܰ���
									</span></td>
								</tr>
								<tr>
									<th><span>�б�����</span></th>
									<td><select id="sd_SchoolTypee" name="sd_SchoolTypee"
										class="select" style="float: left;">
											<option value="all">��ü</option>
											<option value="��������">��������</option>
											<option value="��ɴ���(�����ش���)">��ɴ���(�����ش���)(����)</option>
											<option value="���̹�����(2����)">���̹�����(2����)</option>
											<option value="��������(����)">��������(����)</option>
											<option value="�Ϲݴ���">�Ϲݴ���</option>
											<option value="��������">��������</option>
											<option value="�������">�������</option>
											<option value="���̹�����(4����)">���̹�����(4����)</option>
											<option value="��������(����)">��������(����)</option>
									</select></td>
								</tr>
								<tr>
									<th><span>��������</span></th>
									<td align="left"><input type="checkbox" name="all22"
										id="all22" value="����">��ü <input type="checkbox"
										name="sd_EstType11" id="sd_EstType11" value="����">���� <input
										type="checkbox" name="sd_EstType22" id="sd_EstType22"
										value="�縳">�縳 <input type="checkbox"
										name="sd_EstType33" id="sd_EstType33" value="����">����</td>
								</tr>
								<tr>
							
									<td colspan="2" style=" line-height:20px;" >
									���ð˻���� : ��ü <%=sd_TotalCount%>���� �˻��Ǿ����ϴ�.
									<input type="button" style="float:right; " name="result" id="result" value="���ð������"></td>
								</tr>
							</table>

						</div>
						<div class="search_box" style="float:right;">
							<div id="sHowmany">
								<select id="sd_listSize" name="sd_listSize">
									<option value="10">10��</option>
									<option value="20">20��</option>
									<option value="30">30��</option>		
								</select>
								<span class="bt">
									<span class="bt_search" id="apply" name="apply">&nbsp;&nbsp;����&nbsp;&nbsp;</span>
								</span>
							</div>	
						</div>
<!-- 						<div class="search_box" style="float:left;"> -->
<!-- 							<select class="select" id="sd_listSize" name="sd_listSize" style="width:150px;"> -->
<!-- 									<option value=10>10��</option> -->
<!-- 									<option value=20>20��</option> -->
<!-- 									<option value=30>30��</option> -->
<!-- 							</select>  -->
<!-- 								<input class="q_btn" type="button" name="apply" id="apply" value="����"> -->
<!-- 						</div> -->
						<table cellpadding="0" cellspacing="0" border="0" summary="����"
							class="list_box mt_5" 	style="	text-align : left;">
						
							<thead>
								<tr>
									<th>��ȣ</th>
									<th>�б���</th>
									<th>�б�����</th>
									<th>�б�����</th>
									<th>����</th>
									<th>����</th>
								</tr>
							</thead>
							<%if(list.size() > 0){
								for (int i = 0; i < list.size(); i++) {
									School_DataVO sdvo = (School_DataVO) list.get(i);
									sd_No = sdvo.getSd_No();
									sd_CampusName = sdvo.getSd_CampusName();
									sd_CollageInfoUrl = sdvo.getSd_CollageInfoUrl();
									sd_SchoolType = sdvo.getSd_SchoolType();
									sd_Link = sdvo.getSd_Link();
									sd_SchoolGubun = sdvo.getSd_SchoolGubun();
									sd_Adres = sdvo.getSd_Adres();
									sd_Region = sdvo.getSd_Region();
									sd_TotalCount = sdvo.getSd_TotalCount();
									sd_EstType = sdvo.getSd_EstType();
									sd_Seq = sdvo.getSd_Seq();
									sd_SchoolName = sdvo.getSd_SchoolName();
									rowNum = sdvo.getRowNum();
							%>
							<tbody>
								<tr>
									<td><%=rowNum%></td>
									<%
										if (sd_Link.equals("") || sd_Link.length() == 0
													|| sd_Link.equals("null")) {
									%>
									<td><%=sd_SchoolName%></td>
									<%
										} else {
									%>
									<td><a href="<%=sd_Link%>"><%=sd_SchoolName%></a></td>
									<%
										}
									%>

									<td><%=sd_SchoolGubun%></td>
									<td><%=sd_SchoolType%></td>
									<td><%=sd_EstType%></td>
									<td><%=sd_Region%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>




						<div class="page_box">
							<table align="center">
								<tr>
									<td align="center"><input type="button" name="first"
										id="first" value="<<�Ǿ�"> <input type="button"
										name="prev" id="prev" value="<����"> <%
 	int sta = 0;
 	int end = 0;
 	if (curPage2 <= 10) {
 		sta = 1;
 		end = 10;
 		if (dd < 10) {
 			end = dd;
 		}
 	}
 	if (curPage2 <= 20 && curPage2 >= 11) {
 		sta = 11;
 		end = 20;
 		if (dd < 20) {
 			end = dd;
 		}
 	}
 	if (curPage2 <= 30 && curPage2 >= 21) {
 		sta = 21;
 		end = 30;
 		if (dd < 30) {
 			end = dd;
 		}
 	}
 	if (curPage2 <= 40 && curPage2 >= 31) {
 		sta = 31;
 		end = 40;
 		if (dd < 40) {
 			end = dd;
 		}
 	}
 	if (curPage2 < (dd + 1) && curPage2 >= 41) {
 		sta = 41;
 		end = dd;
 		if (dd < 40) {
 			end = dd;
 		}
 	}
 	for (int i = sta; i <= end; i++) {
 %> <input type="button" class="curPage" name="sd_curPage<%=i%>"
										id="sd_curPage<%=i%>" value="<%=i%>"> <%
 	}
 %> <input type="button" name="next" id="next" value="����>">
										<input type="button" name="last" id="last" value="�ǵ�>>">
									</td>
								</tr>
								<%
            }else{
               
            
            %>
            <tr>
               <td colspan="6">
                  �����Ͱ� �����ϴ�.
               </td>
            </tr>
            <%
            
               
            }
            %>
							</table>
						</div>
					</form>


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