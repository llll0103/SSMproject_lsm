<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="ssm.mi.vo.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
	Object obj   = null;
	Object objNO = null;
	Object objPn = null;
	String ssPn         = "";
	String isud         = "";
	String biNo         = ""; // �۹�ȣ
	String ssNo         = ""; // �� �ۼ����� �й�
	String biInterest   = ""; // ���
	String biAddress    = ""; // ������ �ּ�
	String biPn         = ""; // �޴�����ȣ
	String biRType      = ""; // ��������
	String biCType      = ""; // ������
	String biCTime      = ""; // ���нð�
	String biIncome     = ""; // �к�/��Ȱ����ó
	String biPJob       = ""; // ����Ȱ������
	String biCA         = ""; // (���Ƹ�)���Կ���
	String biSense      = ""; // ���� �� ������
	String biWJ         = ""; // ���� �� �ϰ� ���� ��(���)
	String biWF    	    = ""; // ����ϴ� ����
	String biWI         = ""; // ����ϴ� ���
	String biReason     = ""; // ����ϴ� ����
	String biComment    = ""; // �����Կ��� �ϰ� ���� ��
	String biDeleteYN   = ""; // ��������
	String biInsertdate = ""; // �ۼ���
	String biUpdatedate = ""; // ������
	String postNo = "";
	String addr   = "";
	String addr2  = "";
	obj = request.getAttribute("list");
	if(obj != null){
		isud = "U";
		List list = (List)obj;
		BasicInformationVO bvo = (BasicInformationVO)list.get(0);
		biNo         = bvo.getBiNo();
		ssNo         = bvo.getSsNo();
		if(bvo.getBiInterest()   != null){biInterest   = bvo.getBiInterest();}
		if(bvo.getBiAddress()    != null){biAddress    = bvo.getBiAddress();}
		if(bvo.getBiPn()         != null){biPn         = bvo.getBiPn();}
		if(bvo.getBiRType()      != null){biRType      = bvo.getBiRType();}
		if(bvo.getBiCType()      != null){biCType      = bvo.getBiCType();}
		if(bvo.getBiCTime()      != null){biCTime      = bvo.getBiCTime();}
		if(bvo.getBiIncome()     != null){biIncome     = bvo.getBiIncome();}
		if(bvo.getBiPJob()       != null){biPJob       = bvo.getBiPJob();}
		if(bvo.getBiCA()         != null){biCA         = bvo.getBiCA();}
		if(bvo.getBiSense()      != null){biSense      = bvo.getBiSense();}
		if(bvo.getBiWJ()         != null){biWJ         = bvo.getBiWJ();}
		if(bvo.getBiWF()         != null){biWF    	   = bvo.getBiWF();}
		if(bvo.getBiWI()         != null){biWI         = bvo.getBiWI();}
		if(bvo.getBiReason()     != null){biReason     = bvo.getBiReason();}
		if(bvo.getBiComment()    != null){biComment    = bvo.getBiComment();}
		if(bvo.getBiDeleteYN()   != null){biDeleteYN   = bvo.getBiDeleteYN();}
		if(bvo.getBiInsertdate() != null){biInsertdate = bvo.getBiInsertdate();}
		if(bvo.getBiUpdatedate() != null){biUpdatedate = bvo.getBiUpdatedate();}
		if(bvo.getBiAddress()    != null){if(biAddress.split("_")[0] != null){postNo = biAddress.split("_")[0];}}
		if(bvo.getBiAddress()    != null){if(biAddress.split("_")[1] != null){addr   = biAddress.split("_")[1];}}
		if(bvo.getBiAddress()    != null){if(biAddress.split("_")[2] != null && biAddress.split("_")[2].length() > 0){addr2  = biAddress.split("_")[2];}}
		System.out.println("asdad"+bvo.getBiPn()+bvo.getBiAddress());
		System.out.println("asdad"+bvo.getBiCA());
	}else{
		objNO = request.getAttribute("ssNo");
		ssNo  = (String)objNO;
		objPn = request.getAttribute("svo");
		SMemberVO svo  = (SMemberVO)objPn;
		ssPn = svo.getSsPn();
		isud = "I";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>basicInformation.jsp</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript">
			$(function(){
				val();
				
				$("#update").click(function(){
					$("form").attr("action","/smember/basicInformation.ssm").submit();
				});
				$("main").click(function(){
					$("form").attr("action","/smember/mainForm.ssm").submit();
				});
				
			});
			function val(){
				$("#ssNo").val("<%=ssNo%>");
				$("#ISUD_TYPE").val("<%=isud%>");
				
				if($("#ISUD_TYPE").val() == "I"){
					$("#biPn").val("<%=ssPn%>");
					
				}else if($("#ISUD_TYPE").val() == "U"){
					$("#biPn").val("<%=biPn%>");
					$("#postNo").val("<%=postNo%>");
					$("#addr").val("<%=addr%>");
					$("#addr2").val("<%=addr2%>");
					$("#biRType").val("<%=biRType%>");
					$("#biCType").val("<%=biCType%>");
					$("#biCTime").val("<%=biCTime%>");
					$("#biIncome").val("<%=biIncome%>");
					$("#biPJob").val("<%=biPJob%>");
					$("#biCA").val("<%=biCA%>");
					$("#biInterest").val("<%=biInterest%>");
					$("#biSense").val("<%=biSense%>");
					$("#biWJ").val("<%=biWJ%>");
					$("#biWF").val("<%=biWF%>");
					$("#biWI").val("<%=biWI%>");
					$("#biReason").val("<%=biReason%>");
					$("#biComment").val("<%=biComment%>");
				}
			}
			
		</script>
	</head>
	<body>
		<form name="form" id="form">
			<input type="hidden" name="ISUD_TYPE" id="ISUD_TYPE">
			<table align="center">
				<tr>
					<td><h3>�������� ����</h3></td>
				</tr>
				<tr>
					<td>�й�</td>
					<td><input type="text" name="ssNo" id="ssNo" readonly></td>
				</tr>
				<tr>
					<td>�޴�����ȣ</td>
					<td><input type="text" name="biPn" id="biPn" readonly></td>
				</tr>
				<tr>
					<td>������ �ּ�</td>
					<td>
						<input type="text" name="postNo" id="postNo" readonly>
						<input type="text" name="addr"  id="addr" readonly>
						<input type="text" name="addr2" id="addr2" readonly>
					</td>
				</tr>
				<tr>
					<td>��������</td>
					<td><input type="text" name="biRType" id="biRType" readonly></td>
				</tr>
				<tr>
					<td>������</td>
					<td><input type="text" name="biCType" id="biCType" readonly></td>
				</tr>
				<tr>
					<td>���нð�</td>
					<td><input type="text" name="biCTime" id="biCTime" readonly></td>
				</tr>
				<tr>
					<td>�к�/��Ȱ����ó</td>
					<td><input type="text" name="biIncome" id="biIncome" readonly></td>
				</tr>
				<tr>
					<td>����Ȱ������(����:1��)</td>
					<td><input type="text" name="biPJob" id="biPJob" readonly></td>
				</tr>
				<tr>
					<td>(���Ƹ�)���Կ���</td>
					<td><input type="text" name="biCA" id="biCA" readonly></td>
				</tr>
				<tr>
					<td>���</td>
					<td><input type="text" name="biInterest" id="biInterest" readonly></td>
				</tr>
				<tr>
					<td>���� �� ������</td>
					<td><textarea rows="10" cols="50" name="biSense" id="biSense" readonly></textarea></td>
				</tr>
				<tr>
					<td>���� �� �ϰ� ���� ��,����(���)</td>
					<td><input type="text" name="biWJ" id="biWJ" readonly></td>
				</tr>
				<tr>
					<td>����ϴ� ����,�а�</td>
					<td><input type="text" name="biWF" id="biWF" readonly></td>
				</tr>
				<tr>
					<td>����ϴ� ���</td>
					<td><input type="text" name="biWI" id="biWI" readonly></td>
				</tr>
				<tr>
					<td>����ϴ� ����</td>
					<td><textarea rows="10" cols="50" name="biReason" id="biReason" readonly></textarea></td>
				</tr>
				<tr>
					<td>�����Կ��� �ϰ� ���� ��</td>
					<td><textarea rows="10" cols="50" name="biComment" id="biComment" readonly></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" name="update" id="update" value="�����ϱ�">
						<input type="button" name="main" id="main" value="����">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>