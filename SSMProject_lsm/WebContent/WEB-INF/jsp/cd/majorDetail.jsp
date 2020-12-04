<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ssm.cd.vo.*" %>    
<%
	request.setCharacterEncoding("EUC-KR");
	Object obj = null;
	List list = null;
	Major_DataVO mdvo = null;
	String lClass     = "";
	String facilName  = "";
	String majorSeq   = "";
	String mClass     = "";
	String totalCount = "";
	obj = request.getAttribute("list");
	if(obj != null){
		list = (List)obj;
		if(list != null && list.size() > 0){
			mdvo = (Major_DataVO)list.get(0);
			lClass     = mdvo.getlClass();
			facilName  = mdvo.getFacilName();
			majorSeq   = mdvo.getMajorSeq();
			mClass     = mdvo.getmClass();
			totalCount = mdvo.getTotalCount();
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
    <link rel="stylesheet" href="/common/ssmCss/default.css">
     <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
     <link rel="stylesheet" href="/common/ssmCss/npMainBoard.css">
     <link rel="stylesheet" href="/common/ssmCss/s_base.css">
	<link rel="stylesheet" href="/common/ssmCss/s_content.css">
	<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
	<script src="/common/ssmJs/goCategory.js?ver=2"></script>
	<script src="/common/ssmJs/index.js"></script>
		<script type="text/javascript">
			$(function(){
				
				$.ajax({
					type:"GET",
					url: "http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=961f47ce54cb960e4f6929a39c6b83dc&svcType=api&svcCode=MAJOR_VIEW&contentType=json&gubun=univ_list&majorSeq="+<%=majorSeq%>+"",
					success : function(data){
						console.log(data);
						var ddc = data.dataSearch.content[0];
						var tr1 = $("<tr>");
						var td1 = $("<td colspan='4'>");
						tr1.append(td1.append(ddc.major));
						$("#table").append(tr1);
						
						var massage = "�а��迭 > "+"<%=lClass%>";
						var tr2 = $("<tr>");
						var td2 = $("<td align='left' colspan='4'>");
						tr2.append(td2.append(massage));
						$("#table").append(tr2);
						
						var tr3 = $("<tr>");
						var td3 = $("<td align='left' colspan='2'>");
						var td4 = $("<td align='left' colspan='2'>");
						tr3.append(td3.append("����� > "+ddc.employment));
						tr3.append(td4.append("���� �� ù ���� �ӱ� > "+ddc.salary));
						$("#table").append(tr3);
						
						var tr4 = $("<tr>");
						var td5 = $("<td align='center'>");
						var a1 = "<a href=javascript:sh('tab1')>�а�����<a/>"
						var td6 = $("<td align='center'>");
						var a2 = "<a href=javascript:sh('tab2')>��������<a/>"
						var td7 = $("<td align='center'>");
						var a3 = "<a href=javascript:sh('tab3')>�а�����<a/>"
						var td8 = $("<td align='center'>");
						var a4 = "<a href=javascript:sh('tab4')>�� �а��� ���� Ŀ����� ȸ��Ư��<a/>"
						tr4.append(td5.append(a1));
						tr4.append(td6.append(a2));
						tr4.append(td7.append(a3));
						tr4.append(td8.append(a4));
						$("#table").append(tr4);
						
						if(ddc.department != null){
							var tr5 = $("<tr class='tab1'>");
							var td9 = $("<td colspan='4'>");
							var h1 = "<h4>- ���ΰ����а� -</h4>";
							var tr6 = $("<tr class='tab1'>");
							tr5.append(td9.append(h1).append(ddc.department));
							
							$("#table").append(tr5);
						}
						if(ddc.summary != null){
							var tr6 = $("<tr class='tab1'>");
							var td10 = $("<td colspan='4'>");
							var h2 = "<h4>- �а����� -</h4>";
							tr6.append(td10.append(h2).append(ddc.summary));
							
							$("#table").append(tr6);
						}
						if(ddc.job != null){
							var tr7 = $("<tr class='tab1'>");
							var td11 = $("<td colspan='4'>");
							var h3 = "<h4>- �������� -</h4>";
							tr7.append(td11.append(h3).append(ddc.job));
							
							$("#table").append(tr7);
						}
						if(ddc.qualifications != null){
							var tr8 = $("<tr class='tab1'>");
							var td12 = $("<td colspan='4'>");
							var h4 = "<h4>- �����ڰ� -</h4>";
							tr8.append(td12.append(h4).append(ddc.qualifications));
							
							$("#table").append(tr8);
						}
						if(ddc.interest != null){
							var tr9 = $("<tr class='tab1'>");
							var td13 = $("<td colspan='4'>");
							var h5 = "<h4>- ��̿� ���� -</h4>";
							tr9.append(td13.append(h5).append(ddc.interest));
							
							$("#table").append(tr9);
						}
						if(ddc.property != null){
							var tr10 = $("<tr class='tab1'>");
							var td14 = $("<td colspan='4'>");
							var h6 = "<h4>- �а�Ư�� -</h4>";
							tr10.append(td14.append(h6).append(ddc.property));
							
							$("#table").append(tr10);
						}
						if(ddc.enter_field[0] != null){
							var tr11 = $("<tr class='tab1'>");
							var td15 = $("<td colspan='4'>");
							var h7 = "<h4>- ���� �� ����о� -</h4>";
							td15.append(h7);
							
							for(var i=0;i<ddc.enter_field.length;i++){
								var ss = "";
								var efg = "";
								var efd = "";
								ss = ddc.enter_field[i];
								if(ss.gradeuate != null){
									efg = ss.gradeuate;
									efg = "<h5> - "+efg+"</h5>";
									efd = ss.description;
									td15.append(efg).append(efd);
								}
							}
							tr11.append(td15);
							$("#table").append(tr11);
						}
						if(ddc.main_subject[0] != null){
							var tr12 = $("<tr class='tab1'>");
							var td16 = $("<td colspan='4'>");
							var h8 = "<h4>- �����ϴ� �ֿ� ������ -</h4>";
							td16.append(h8);
							
							for(var i=0;i<ddc.main_subject.length;i++){
								var ss = "";
								var msn = "";
								var mss = "";
								ss = ddc.main_subject[i];
								if(ss.SBJECT_NM != null){
									msn = ss.SBJECT_NM;
									msn = "<h5> - "+msn+"</h5>";
									mss = ss.SBJECT_SUMRY;
									td16.append(msn).append(mss);
								}
							}
							tr12.append(td16);
							$("#table").append(tr12);
						}
						var tr13 = $("<tr class='tab2'>");
						var td17 = $("<td colspan='4' align='left'>");
						td17.append("��������");
						tr13.append(td17);
						$("#table").append(tr13);
						var tr14 = $("<tr class='tab2'>");
						var td18 = $("<td align='center'>");
						td18.append("����");
						var td19 = $("<td align='center'>");
						td19.append("���и�");
						var td20 = $("<td align='center'>");
						td20.append("�а���");
						var td21 = $("<td align='center'>");
						td21.append("ķ�۽�");
						
						tr14.append(td18).append(td19).append(td20).append(td21);
						$("#table").append(tr14);
						
						if(ddc.university[0] != null){
							for(var i=0;i<ddc.university.length;i++){
								var unArea = "";
								var unName = "";
								var unURL = "";
								var unMajor = "";
								var unCampus = "";
								var ss = "";
								var new_a = "";
								var new_tr = "";
								var new_td1 = "";
								var new_td2 = "";
								var new_td3 = "";
								var new_td4 = "";
								var urlArray = "";
								var a = "";
								ss = ddc.university[i];
								unArea = ss.area;
								unName = ss.schoolName+" : ";
								unURL = ss.schoolURL;
// 								urlArray = ss.schoolURL.split("/");
// 								if(urlArray[2] != null){
// 									unURL = urlArray[2];
// 									a = String(unURL);
// 								}else{
// 									unURL = ss.schoolURL;
// 									a = String(unURL);
// 								}
								unMajor = ss.majorName;
								unCampus = ss.campus_nm;
								new_a = "<a href=javascript:unPage("+JSON.stringify(unURL)+")>�߰�����</a>";
								new_tr = $("<tr class='tab2'>");
								new_td1 = $("<td align='left'>");
								new_td1.append(unArea);
								new_td2 = $("<td align='left'>");
								new_td2.append(unName).append(new_a);
								new_td3 = $("<td align='left'>");
								new_td3.append(unMajor);
								new_td4 = $("<td align='left'>");
								new_td4.append(unCampus);
								new_tr.append(new_td1).append(new_td2).append(new_td3).append(new_td4);
								$("#table").append(new_tr);
							}
						}else{
							var tr15 = $("<tr class='tab2'>");
							var td22 = $("<td align='center' colspan='4'>");
							td22.append("�����Ͱ� �����ϴ�.");
							$("#table").append(tr15);
						}
						
// 						var last_tr = $("<tr>");
// 						var last_td = $("<td colspan='4' align='center'>");
// 						var goList = $("<input>");
// 						goList.attr({"type":"button","name":"goList","id":"goList","value":"��Ϻ���"});
// 						last_td.append(goList);
// 						last_tr.append(last_td);
// 						$("#table").append(last_tr);
						if(ddc.GenCD != null){
							var newtr2 = $("<tr class='tab4'>");
							var newtd2 = $("<td colspan='4'>");
							newtd2.append("<h3>"+ddc.major+"��/�� �����а��� �߰��ϰų� �˻��� �� ȸ������ ���� ��ȣ ȸ���� Ư���� �м��Ͽ� �����մϴ�.</h3>");
							$("#table").append(newtr2.append(newtd2));
							
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"��/�� ��ȣ�ϴ� ȸ������ ���� ������?</h4>");
							
							newtd.append("<h5>1. "+ddc.major+"��/�� ���� �� ȸ������ ���� ����</h5>");
							var gen = ddc.GenCD[0].popular[0].GEN_NM;
							var pcnt = ddc.GenCD[0].popular[0].PCNT;
							newtd.append("&emsp;"+gen+" : "+pcnt+"% ");
							var gen2 = ddc.GenCD[0].popular[1].GEN_NM;
							var pcnt2 = ddc.GenCD[0].popular[1].PCNT;
							newtd.append(gen2+" : "+pcnt2+"% ");
							
							newtd.append("<h5>2. "+ddc.major+"��/�� �����а��� ����� ȸ������ ���� ����</h5>");
							var gen3 = ddc.GenCD[1].bookmark[0].GEN_NM;
							var pcnt3 = ddc.GenCD[1].bookmark[0].PCNT;
							newtd.append("&emsp;"+gen3+" : "+pcnt3+"% ");
							var gen4 = ddc.GenCD[1].bookmark[1].GEN_NM;
							var pcnt4 = ddc.GenCD[1].bookmark[1].PCNT;
							newtd.append(gen4+" : "+pcnt4+"% ");
							$("#table").append(newtr.append(newtd));
						}
 						
						if(ddc.SchClass != null){
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"��/�� ��ȣ�ϴ� ȸ������ �б��޺� ������?</h4>");
							
							newtd.append("<h5>1. "+ddc.major+"��/�� ���� �� ȸ������ �б��޺� ����</h5>");
							var scn = ddc.SchClass[0].popular[0].SCH_CLASS_NM;
							var pcnt = ddc.SchClass[0].popular[0].PCNT;
							newtd.append("&emsp;"+scn+" : "+pcnt+"% ");
							var scn2 = ddc.SchClass[0].popular[1].SCH_CLASS_NM;
							var pcnt2 = ddc.SchClass[0].popular[1].PCNT;
							newtd.append(scn2+" : "+pcnt2+"% ");
							
							newtd.append("<h5>2. "+ddc.major+"��/�� �����а��� ����� ȸ������ �б��޺� ����</h5>");
							var scn3 = ddc.SchClass[1].bookmark[0].SCH_CLASS_NM;
							var pcnt3 = ddc.SchClass[1].bookmark[0].PCNT;
							newtd.append("&emsp;"+scn3+" : "+pcnt3+"% ");
							var scn4 = ddc.SchClass[1].bookmark[1].SCH_CLASS_NM;
							var pcnt4 = ddc.SchClass[1].bookmark[1].PCNT;
							newtd.append(scn4+" : "+pcnt4+"% ");
							$("#table").append(newtr.append(newtd));
						}
						
						if(ddc.lstMiddleAptd != null){
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"��/�� ��ȣ�ϴ� ���л� ȸ������ ����������?</h4>");
							
// 							��/�� ���� �� ȸ������ ��������
							newtd.append("<h5>1. "+ddc.major+"��/�� ���� �� ȸ������ ��������</h5>");
							var a0 = ddc.lstMiddleAptd[0].popular[0].CD_NM;
							var a1 = ddc.lstMiddleAptd[0].popular[1].CD_NM;
							var a2 = ddc.lstMiddleAptd[0].popular[2].CD_NM;
							newtd.append("&emsp;"+a0+"&ensp;"+a1+"&ensp;"+a2+"&ensp;");
							
// 							��/�� ���� �������� ����� ȸ������ ��������
							newtd.append("<h5>2. "+ddc.major+"��/�� �����а��� ����� ȸ������ ��������</h5>");
							var b0 = ddc.lstMiddleAptd[1].bookmark[0].CD_NM;
							var b1 = ddc.lstMiddleAptd[1].bookmark[1].CD_NM;
							var b2 = ddc.lstMiddleAptd[1].bookmark[2].CD_NM;
							newtd.append("&emsp;"+b0+"&ensp;"+b1+"&ensp;"+b2+"&ensp;");
							$("#table").append(newtr.append(newtd));
						}
						
						if(ddc.lstHighAptd != null){
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"��/�� ��ȣ�ϴ� ����л� ȸ������ ����������?</h4>");
							
// 							��/�� ���� �� ȸ������ ��������
							newtd.append("<h5>1. "+ddc.major+"��/�� ���� �� ȸ������ ��������</h5>");
							var a0 = ddc.lstHighAptd[0].popular[0].CD_NM;
							var a1 = ddc.lstHighAptd[0].popular[1].CD_NM;
							var a2 = ddc.lstHighAptd[0].popular[2].CD_NM;
							newtd.append("&emsp;"+a0+"&ensp;"+a1+"&ensp;"+a2+"&ensp;");
							
// 							��/�� ���� �������� ����� ȸ������ ��������
							newtd.append("<h5>2. "+ddc.major+"��/�� �����а��� ����� ȸ������ ��������</h5>");
							var b0 = ddc.lstHighAptd[1].bookmark[0].CD_NM;
							var b1 = ddc.lstHighAptd[1].bookmark[1].CD_NM;
							var b2 = ddc.lstHighAptd[1].bookmark[2].CD_NM;
							newtd.append("&emsp;"+b0+"&ensp;"+b1+"&ensp;"+b2+"&ensp;");
							$("#table").append(newtr.append(newtd));
						}
						if(ddc.lstVals != null){
// 							��/�� ��ȣ�ϴ� ȸ������ �߿��ϰ� �����ϴ� ������ġ��?
							var newtr = $("<tr class='tab4'>");
							var newtd = $("<td colspan='4'>");
							newtd.append("<h4>"+ddc.major+"��/�� ��ȣ�ϴ� ȸ������ �߿��ϰ� �����ϴ� ������ġ��?</h4>");
							
// 							��/�� ���� �� ȸ������ ������ġ
							newtd.append("<h5>1. "+ddc.major+"��/�� ���� �� ȸ������ ������ġ</h5>");
							var a0 = ddc.lstVals[0].popular[0].CD_NM;
							var a1 = ddc.lstVals[0].popular[1].CD_NM;
							var a2 = ddc.lstVals[0].popular[2].CD_NM;
							newtd.append("&emsp;"+a0+"&ensp;"+a1+"&ensp;"+a2+"&ensp;");
// 							��/�� ���� �������� ����� ȸ������ ������ġ
							newtd.append("<h5>2. "+ddc.major+"��/�� ���� �а����� ����� ȸ������ ������ġ</h5>");
							var b0 = ddc.lstVals[1].bookmark[0].CD_NM;
							var b1 = ddc.lstVals[1].bookmark[1].CD_NM;
							var b2 = ddc.lstVals[1].bookmark[2].CD_NM;
							newtd.append("&emsp;"+b0+"&ensp;"+b1+"&ensp;"+b2+"&ensp;");
							$("#table").append(newtr.append(newtd));
						}
						hs();
					},
					error : function(){
						console.log("error");
					}
				});
				$("#goList").click(function(){
					location.href="/test/majorList.ssm";
				});
			});
			
			function sh(data){
				$(".tab1").hide();
				$(".tab2").hide();
				$(".tab3").hide();
				$(".tab4").hide();
				$("."+data).show();
			}
			function hs(){
				$(".tab1").show();
				$(".tab2").hide();
				$(".tab3").hide();
				$(".tab4").hide();
			}
			function unPage(data){
				var url = data;
				window.open(url,"fullscreen=yes");
// 				$("#form").attr("action",url).attr("target","new")
			}
		</script>
		<style type="text/css">
		table {
				width:1150px;
			}
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
				<nav include-html="/common/ssmMain/ssmCategory/cdSideNav.html"></nav>
			<%}else{ System.out.println("����׺�");%>
				<nav include-html="/common/ssmMain/ssmCategory/cdSideNav2.html"></nav>
			<% } %>
			<div id="tit">
				<h1>�а����� Ž��</h1>
				<p>
					<a href="#">Ȩ</a> > <a href="co01.asp">���μ���</a> > <a
						href="co03.asp" class="on">�а����� Ž��</a>
				</p>
			</div>

			<section>
			<div class="container">
			
				<div class="contentbox">


	
	
		<form name="form" id="form" method="get">
			<table id="table" border="1" align="center">
			</table>
			<div class="tab3">
				<canvas id="chart1" width="550" height="316" title="���л�Ȳ�׷���" class="chartjs-render-monitor" style="display: block; height: 253px; width: 440px;"></canvas>
				<canvas id="chart2" width="550" height="316" title="���л�Ȳ(����)�׷���" class="chartjs-render-monitor" style="display: block; height: 253px; width: 440px;"></canvas>
			</div>
			<div class="tab3">
				<canvas id="chart3" width="550" height="316" title="������׷���" class="chartjs-render-monitor" style="display: block; height: 253px; width: 440px;"></canvas>
				<canvas id="chart7" width="550" height="316" title="���� �� ��Ȳ�׷���" class="chartjs-render-monitor" style="display: block; height: 253px; width: 440px;"></canvas>
			</div>
			<div class="tab3">
				<canvas id="chart4" width="1155" height="346" title="���� �� ù ���� �о� �׷���" class="chartjs-render-monitor" style="display: block; height: 277px; width: 924px;"></canvas>
			</div>
			<div class="tab3">
				<canvas id="chart5" width="550" height="343" title="���� �� ù ���� ����� �ӱݱ׷���" class="chartjs-render-monitor" style="display: block; height: 275px; width: 440px;"></canvas>
				<canvas id="chart6" width="550" height="343" title="ù ���� �������׷���" class="chartjs-render-monitor" style="display: block; height: 275px; width: 440px;"></canvas>
			</div>
			
			
			<table align="center">
				<tr>
					<td align="center">
						<input type="button" id="goList" name="goList" value="��Ϻ���">
					</td> 
				</tr>
			</table>
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

</html>