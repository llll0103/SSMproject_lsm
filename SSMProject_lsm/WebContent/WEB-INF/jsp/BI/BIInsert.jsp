<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="ssm.mi.vo.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
	Object obj = null;
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
		if(bvo.getBiAddress()    != null){if(biAddress.split("_")[2] != null){addr2  = biAddress.split("_")[2];}}
		System.out.println("asdad"+bvo.getBiPn()+bvo.getBiAddress());
		System.out.println("asdad"+bvo.getBiCA());
	}else{
		isud = "I";
		objNO = request.getAttribute("ssNo");
		ssNo  = (String)objNO;
		objPn = request.getAttribute("svo");
		SMemberVO svo  = (SMemberVO)objPn;
		ssPn = svo.getSsPn();
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>BIInsert.jsp</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
						console.log(data);
		                // ���θ� �ּ��� ���� ��Ģ�� ���� �� �Ҹ� �����Ѵ�.
		                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
		                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
		                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����
						var addr = "";
		                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
		                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
		                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
		                if(fullRoadAddr !== ''){
		                    fullRoadAddr += extraRoadAddr;
		                }
		
		                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
		                document.getElementById('postNo').value = data.zonecode; //5�ڸ� �������ȣ ���
		                
// 		                if(fullRoadAddr != null){
// 		                	document.getElementById('jAddr').value = fullRoadAddr;
// 		                }else{
// 		                	document.getElementById('jAddr').value = data.jibunAddress;
// 		                }
		                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
		                    addr = data.roadAddress;
		                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
		                    addr = data.jibunAddress;
		                }
		                document.getElementById('addr').value = addr;
		            }
		        }).open();
		    }
		</script>
		<script type="text/javascript">
			$(function(){
				val();	
				$("#save").click(function(){
					alert("gkg"+$("#biCA").val());
					var a1 = $("#postNo").val();
					var a2 = $("#addr").val();
					var a3 = $("#addr2").val();
					if(a1 == ""){a1 =' ';}
					if(a2 == ""){a2 =' ';}
					if(a3 == ""){a3 =' ';}
					$("#biAddress").val(a1+"_"+a2+"_"+a3);
					$("#form").attr("action","/smember/BIInsert.ssm").submit();
				});
			});
			function val(){
				$("#ISUD_TYPE").val("<%=isud%>");
				$("#ssNo").val("<%=ssNo%>");
				
				if($("#ISUD_TYPE").val() == "I"){
					$("#biPn").val("<%=ssPn%>");
					
					
				}else if($("#ISUD_TYPE").val() == "U"){
					$("#biNo").val("<%=biNo%>");
					$("#biPn").val("<%=biPn%>");
					$("#postNo").val("<%=postNo%>");
					$("#addr").val("<%=addr%>");
					$("#addr2").val("<%=addr2%>");
<%-- 					$("#biRType").val("<%=biRType%>"); --%>
<%-- 					$("#biCType").val("<%=biCType%>"); --%>
<%-- 					$("#biCTime").val("<%=biCTime%>"); --%>
<%-- 					$("#biIncome").val("<%=biIncome%>"); --%>
<%-- 					$("#biPJob").val("<%=biPJob%>"); --%>
<%-- 					$("#biCA").val("<%=biCA%>"); --%>
					for(var i=1;i<=5;i++){
						if($("#biRType"+i).val() == "<%=biRType%>"){
							$("#biRType"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=4;i++){
						if($("#biCType"+i).val() == "<%=biCType%>"){
							$("#biCType"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=4;i++){
						if($("#biCTime"+i).val() == "<%=biCTime%>"){
							$("#biCTime"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=3;i++){
						if($("#biIncome"+i).val() == "<%=biIncome%>"){
							$("#biIncome"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=6;i++){
						if($("#biPJob"+i).val() == "<%=biPJob%>"){
							$("#biPJob"+i).attr("checked",true);
							break;
						}
					}
					for(var i=1;i<=2;i++){
						if($("#biCA"+i).val() == "<%=biCA%>"){
							$("#biCA"+i).attr("checked",true);
							break;
						}
					}
					
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
			<input type="hidden" name="biNo" id="biNo">
			<input type="hidden" name="biAddress" id="biAddress">
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
						<input type="text" name="postNo" id="postNo" placeholder="�����ȣ">
						<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br>
						<input type="text" name="addr"  id="addr" placeholder="���� or ���θ��ּ�">
						<input type="text" name="addr2" id="addr2" placeholder="���ּ�">
					</td>
				</tr>
				<tr>
					<td>��������</td>
					<td>
						<input type="radio" class="biRType" name="biRType" id="biRType1" value="������ ����">������ ����
						<input type="radio" class="biRType" name="biRType" id="biRType2" value="�����">�����
						<input type="radio" class="biRType" name="biRType" id="biRType3" value="����">����
						<input type="radio" class="biRType" name="biRType" id="biRType4" value="�ϼ�">�ϼ�
						<input type="radio" class="biRType" name="biRType" id="biRType5" value="��Ÿ">��Ÿ
					</td>
				</tr>
				<tr>
					<td>������</td>
					<td>
						<input type="radio" class="biCType" name="biCType" id="biCType1" value="����">����
						<input type="radio" class="biCType" name="biCType" id="biCType2" value="������(��������ġ ����)">������(��������ġ ����)
						<input type="radio" class="biCType" name="biCType" id="biCType3" value="����ö  or ����">����ö  or ����
						<input type="radio" class="biCType" name="biCType" id="biCType4" value="�ڰ���(50cc�ʰ�)">�ڰ���(50cc�ʰ�)
					</td>
				</tr>
				<tr>
					<td>���нð�</td>
					<td>
						<input type="radio" class="biCTime" name="biCTime" id="biCTime1" value="10�� �̳�">10�� �̳�
						<input type="radio" class="biCTime" name="biCTime" id="biCTime2" value="30�� �̳�">30�� �̳�
						<input type="radio" class="biCTime" name="biCTime" id="biCTime3" value="1�ð� �̳�">1�ð� �̳�
						<input type="radio" class="biCTime" name="biCTime" id="biCTime4" value="1�ð� �̻�">1�ð� �̻�
					</td>
				</tr>
				<tr>
					<td>�к�/��Ȱ����ó</td>
					<td>
						<input type="radio" class="biIncome" name="biIncome" id="biIncome1" value="�θ��">�θ��
						<input type="radio" class="biIncome" name="biIncome" id="biIncome2" value="�Ƹ�����Ʈ">�Ƹ�����Ʈ
						<input type="radio" class="biIncome" name="biIncome" id="biIncome3" value="����������">����������
					</td>
				</tr>
				<tr>
					<td>����Ȱ������(����:1��)</td>
					<td>
						<input type="radio" class="biPJob" name="biPJob" id="biPJob1" value="��������">��������
						<input type="radio" class="biPJob" name="biPJob" id="biPJob2" value="��������">��������
						<input type="radio" class="biPJob" name="biPJob" id="biPJob3" value="5�ð��̻�">5�ð��̻�
						<input type="radio" class="biPJob" name="biPJob" id="biPJob4" value="10�ð��̻�">10�ð��̻�
						<input type="radio" class="biPJob" name="biPJob" id="biPJob5" value="20�ð��̻�">20�ð��̻�
						<input type="radio" class="biPJob" name="biPJob" id="biPJob6" value="30�ð��̻�">30�ð��̻�
					</td>
				</tr>
				<tr>
					<td>(���Ƹ�)���Կ���</td>
					<td>
						<input type="radio" name="biCA" id="biCA1" value="��">��
						<input type="radio" name="biCA" id="biCA2" value="�ƴϿ�">�ƴϿ�
					</td>
				</tr>
				<tr>
					<td>���</td>
					<td><input type="text" name="biInterest" id="biInterest"></td>
				</tr>
				<tr>
					<td>���� �� ������</td>
					<td><textarea rows="10" cols="50" name="biSense" id="biSense"></textarea></td>
				</tr>
				<tr>
					<td>���� �� �ϰ� ���� ��,����(���)</td>
					<td><input type="text" name="biWJ" id="biWJ"></td>
				</tr>
				<tr>
					<td>����ϴ� ����,�а�</td>
					<td><input type="text" name="biWF" id="biWF"></td>
				</tr>
				<tr>
					<td>����ϴ� ���</td>
					<td><input type="text" name="biWI" id="biWI"></td>
				</tr>
				<tr>
					<td>����ϴ� ����</td>
					<td><textarea rows="10" cols="50" name="biReason" id="biReason"></textarea></td>
				</tr>
				<tr>
					<td>�����Կ��� �ϰ� ���� ��</td>
					<td><textarea rows="10" cols="50" name="biComment" id="biComment"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" name="save" id="save" value="�����ϱ�">
						<input type="reset" value="����">
						<input type="button" name="cancel" id="cancel" value="���">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>