<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>�������� �������� �Է�</title>
		<script type="text/javascript"
				src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src= "/include/js/common.js"></script>
		<script type="text/javascript">
			$(function(){
				alert("function>>>");
				var seq=$('#seq').attr("value",0);
				alert($('#seq').val());
				
				$('#addRow').click(function(){
					seq = $('#seq').val();
					var seq2 = (Number(seq) + 1);
					$('#seq').attr("value",seq2);
					alert($('#seq').val());
					console.log($('#seq').val());
					addRow2(seq2);
				});
				/*���� ��ư Ŭ���� ó�� �̺�Ʈ*/
				$("#tMemberInsert").click(function(){
						$("#f_writeForm").attr({
								"method":"POST",
								"action":"/tMember/tMemberInsert.ssm"
						});
						$("#f_writeForm").submit();				
				});
				function addRow2(seq2){
					//tr�±� ���θ����
					var new_tr = $("<tr>");
					
					//td�±� �����
					var new_td = $("<td>");
					
					//�̸� td�±� ���θ����
					var new_Nametd = $("<td>");
					new_Nametd.html("�̸�");
					//�̸� input�±� �����
					var new_NameInput = $("<input>");
					new_NameInput.attr({"type":"text","id":"tMemberList["+seq2+"].ttName","name":"tMemberList["+seq2+"].ttName"});

					//������� td�±� ���θ����
					var new_Birthtd = $("<td>");
					new_Birthtd.html("�������");
					//������� input�±� �����
					var new_BirthInput = $("<input>");
					new_BirthInput.attr({"type":"text","id":"tMemberList["+seq2+"].ttBirth","name":"tMemberList["+seq2+"].ttBirth"});

					//���� td�±� ���θ����
					var new_Gendertd = $("<td>");
					new_Gendertd.html("����");
					//���� input�±� �����
					var new_GenderInputF = $("<input>");
					new_GenderInputF.attr({"type":"radio","id":"tMemberList["+seq2+"].ttGender","name":"tMemberList["+seq2+"].ttGender","value":"7"});
					var new_GenderHtmlF = ("F")
					var new_GenderInputM = $("<input>");
					new_GenderInputM.attr({"type":"radio","id":"tMemberList["+seq2+"].ttGender","name":"tMemberList["+seq2+"].ttGender","value":"8"});
					var new_GenderHtmlM = ("M")
					
					
					
					
					//����ȣ td�±� ���θ����
					var new_Pntd = $("<td>");
					new_Pntd.html("����ȣ");
					//����ȣ input�±� �����
					var new_PnInput = $("<input>");
					new_PnInput.attr({"type":"text","id":"tMemberList["+seq2+"].ttPn","name":"tMemberList["+seq2+"].ttPn"});
		
					//�� �ٹ��� ���Գ⵵ td�±� ���θ����
					var new_Transferyeartd = $("<td>");
					new_Transferyeartd.html("�� �ٹ��� ���Գ⵵");
					//�� �ٹ��� ���Գ⵵ input�±� �����
					var new_TransferyearInput = $("<input>");
					new_TransferyearInput.attr({"type":"text","id":"tMemberList["+seq2+"].ttTransferyear","name":"tMemberList["+seq2+"].ttTransferyear"});

					
					new_tr.append(new_Nametd).append(new_NameInput);
					new_tr.append(new_Birthtd).append(new_BirthInput);
					new_tr.append(new_Gendertd).append(new_GenderInputF).append(new_GenderHtmlF).append(new_GenderInputM).append(new_GenderHtmlM);
					new_tr.append(new_Pntd).append(new_PnInput);
					new_tr.append(new_Transferyeartd).append(new_TransferyearInput);
					
					$('#boardWrite').append(new_tr);
				}
				
			});
			
		
		</script>
	</head>
	<body>

		<form id="f_writeForm" name="f_writeForm" enctype="application/x-www-form-urlencoded">
			<input type="hidden" name="seq" id="seq">
			<table id="boardWrite" border="1">
				<tr>
					<td>�̸�</td>	<td><input type="text" name="tMemberList[0].ttName" id="tMemberList[0].ttName"></td>
					<td>�������</td><td><input type="text" name="tMemberList[0].ttBirth" id="tMemberList[0].ttBirth"></td>
					<td>����</td>
					<td>
					<input type = "radio" name="tMemberList[0].ttGender" id="ttGenderF" value="7"/> F
					<input type = "radio" name="tMemberList[0].ttGender" id="ttGenderM" value="8"/> M
					
					<%-- <input type="radio" name="tMemberList[0].ttGender" id="tMemberList[0].ttGender"></td>--%>
					<td>����ȣ</td><td><input type="text" name="tMemberList[0].ttPn" id="tMemberList[0].ttPn"></td>
					<td>�� �ٹ��� ���Գ⵵</td><td><input type="text" name="tMemberList[0].ttTransferyear" id="tMemberList[0].ttTransferyear"></td>	
					
				</tr>
			</table>
			<!-- 
			<input type="text" name="tMemberList[0].ttName" id="tMemberList[0].ttName" />
			<input type="text" name="tMemberList[1].ttName" id="tMemberList[1].ttName" />
			 -->
		</form>
		<input type="button" value="�߰�" id="addRow" name="addRow">
		<input type="button" value="����"  id="tMemberInsert">
	</body>
</html>