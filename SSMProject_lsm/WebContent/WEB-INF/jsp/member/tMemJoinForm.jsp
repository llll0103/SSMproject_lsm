<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<% 
	Object obj1 = request.getAttribute("data");
	System.out.println(">>>>" + obj1);
	TMemberVO tvo = (TMemberVO)obj1;

	String ttName = tvo.getTtName();
	String ttBirth = tvo.getTtBirth();
	String ttGender = tvo.getTtGender();
	String ttTransferyear = tvo.getTtTransferyear();
	String ttPn = tvo.getTtPn();	
	
	String yy = ttBirth.substring(0, 4);
	String mm = ttBirth.substring(4,6);
	String dd = ttBirth.substring(6);
	System.out.println("String ttGender = tvo.getTtGender()>>>"+ttGender);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	
		<title>���� ������</title>
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src= "/include/js/common.js"></script>
		<script type = "text/javascript">	
			$(document).ready(function(){
				var idc =0; //���̵� �ߺ� üũ���θ� Ȯ���ϴ� ����
				var pwc =0; //��й�ȣ üũ���θ� Ȯ���ϴ� ����
				var ttGender=<%=ttGender%>;
				
				if(ttGender="7"){$('input:radio[id="ttGenderF"][value="7"]').prop('checked', true);}
								else{$('input:radio[id="ttGenderM" ][value="8"]').prop('checked', true);}
				
				 
				$("#ttPwCheck").click(function(){
					var ttPwVal = $("#ttPw").val();
					var ttPwCVal = $("#ttPwC").val();
					
					//��� �Է°˻�
					if (! ttPwVal){
						console.log("(log)pw���� >>> : " + ! ttPwVal);
						alert("��й�ȣ�� �Է��ϼ���");
						$("#ttPw").focus();
						return false;					
					}//ttPwVal if ��
					if(!ttPwCVal){
						console.log("(log)pwC���� >>> "+ !ttPwCVal);
						alert("��й�ȣ Ȯ�ζ��� �Է��ϼ���");
						$("#ttPwC").focus();
						return false; 
					}//if ttPwCVal��
					
					if(ttPwVal ==ttPwCVal){
						alert("��й�ȣ�� Ȯ�εǾ����ϴ�");
						$("#ttPw").attr("readonly",true);
						$("#ttPwC").attr("readonly",true);
						pwc=1;
					}else{
						alert("��й�ȣ ����ġ : �ٽ� Ȯ���ϼ���");
						$("#ttPw").val('');
						$("#ttPwC").val('');
						$("#ttPw").focus();
						return false;
					}
				});//ttPwCheck clickfunction��
				//�̸��� �Է¹�� ����
			 	$('#selectEmail').change(function(){ 
			 		$("#selectEmail option:selected").each(function () { 
				 		if($(this).val()== 'etc'){//�����Է��� ���
						 	$("#ttEmail02").val(''); //�� �ʱ�ȭ 
						 	$("#ttEmail02").attr("disabled",false); //Ȱ��ȭ
				 		}else{ //�����Է��� �ƴҰ�� 
						 	$("#ttEmail02").val($(this).text()); //���ð� �Է� 
						 	$("#ttEmail02").attr("disabled",true); //��Ȱ��ȭ
						} 
			 		}); 
				});
				
				
			 	//���̵� �ߺ�üũ
	            $("#ttIdCheck").click(function(){
	            	var ttIdVal = $("#ttId").val();
	            	//���̵� �Է°˻�
	                if (!ttIdVal){
	                   console.log("(log)id���� >>> : " + ! ttIdVal);
	                   alert("���̵� �Է��ϼ���");
	                   $("#ttId").focus();
	                   return false;               
	                }
	            	$.ajax({
	            		url : "/tMember/ajaxIdCheck.ssm",
	            		type : "get",
	            		data : {ttId : ttIdVal},
	            		success : function(data){
	            			console.log(data);
	            			var check = eval(data);
	            			if(check){
	            				 alert("��� ������ ���̵��Դϴ�.");
	                             $("#ttId").attr("readonly",true);
	                             $("#ttIdCheck").hide();
	                             $('#ajaxResData').html("�ߺ�üũ�Ϸ�");
	                             idc=Number(1);
	            			}else{
	            				alert("�ߺ��� ���̵��Դϴ�.");
	            				$("#ttId").val('');
	            				$("#ttId").focus();
	            				idc = Number(0);
	            				return false;
	            			}
	            		},
	            		error : function(){
	            			console.log("error");
	            		}
	            	});
	            	
	            });//ssIdCheck clickfunction��
				
				//���Թ�ư
				$("#insertData").click(function(){
					console.log("insertData_click >>> ");
					//�Է°�üũ
					var ttEmail = $("#ttEmail01").val()+"@"+$("#ttEmail02").val();
					$("#ttEmail").val(ttEmail);
					
					if (!chkSubmit($('#ttId'),"���̵�")) return;
					else if (!chkSubmit($('#ttPw'),"�н����带")) return;
					else if (!chkSubmit($('#ttPwC'),"�н����� Ȯ����")) return;
					else if (pwc==0) return alert("�н����� Ȯ���� üũ�Ͻÿ�");					
					
					if(!$("input:radio[name='sjtType']").is(":checked")){
						alert("��米���� ������ �����Ͻÿ�");return false;
					}else if($("input:radio[id='SJT00']").is(":checked")) {
						 if (!chkSubmit($('#sjtCode'),"��������")) return;
						else if (!chkSubmit($('#gradeId'),"�г���")) return;
						else if (!chkSubmit($('#classId'),"����")) return;
					}
					 
					 if (!chkSubmit($('#ttEmail01'),"�̸�����")) return;
					else if (!chkSubmit($('#ttEmail02'),"�̸�����")) return;
					else if (!chkSubmit($('#ttImage'),"������")) return;
					else{
						if(confirm('����� �����ұ��?')){
							$("#joinForm").attr({
								"method":"POST",
								"action":"/tMember/joinTMember.ssm"});
							$("#joinForm").submit();
						};//confirm
					}//else
				});//insertData_click	
			});//document ready
		</script>
		<script type="text/javascript">
		////////�ݹ�ȣ����
		
		var g_selbox = new Array('01', '02', '03' );
		var c_selbox = new Array();	
			for (var i =0 ; i<3 ;i++){ c_selbox[i] = new Array('01', '02', '03', '04', '05');}
		
		function init(f){
			console.log(f);
			console.log("init");
			var g_sel = f.gradeId;
			var c_sel = f.classId;
		
		
			g_sel.options[0] = new Option("�г� ����", "");
			c_sel.options[0] = new Option("�� ����", "");

		
			for(var i =0; i<g_selbox.length; i++){
				g_sel.options[i+1] = new Option(g_selbox[i], g_selbox[i]);
			}
			
		}//init(f) onload

		function classIdChange(f){
			var g_sel = f.gradeId;
			var c_sel = f.classId;
			
			var sel = g_sel.selectedIndex;
			for(var i=c_sel.length; i>=0; i--){
				c_sel.options[i] = null;
			}

			c_sel.options[0] = new Option("�� ����", "");

			if(sel != 0){
				for(var i=0; i<c_selbox[sel-1].length; i++){
					c_sel.options[i+1] = new Option(c_selbox[sel-1][i], c_selbox[sel-1][i]);
				}
			}
		}//
		
		function moveFocus(num,here,next){
			 var str = here.value.length;
			 if(str == num)
			    next.focus();
		 }
		function setDisplay(){
		    if($('input:radio[id=SJT01]').is(':checked')){
		        $('#pop1').hide();
		    }else{
		        $('#pop1').show();
		    }
		}

		</script>
	</head>
	<body onload = "init(this.joinForm);">
	<div>
		<div align="center">
			<h3>���� ȸ������ �Է� ȭ��</h3>
			<form name="joinForm" id="joinForm"	method="POST"	enctype="multipart/form-data">
			<input type="hidden" name="ttPn" id="ttPn" value="<%=ttPn%>">
			<input type="hidden" name="ttGender" id="ttGender" value="<%=ttGender%>">
			
				<table border="1" align="center">
					<tr>
						<th scope="row" colspan="2" align="center">
							������ ����
						</th>			
					</tr>
					<tr>
						<th> �̸� </th>
						<td><input type = text name="ttName" id="ttName" value="<%=ttName%>" readonly></td>
					</tr>
					<tr>
						<th scope="row"> �������</th>
						<td>
							<input type="text" id="yy"  style="width:80px;" maxlength="4" value ="<%=yy%>" readonly> ��
							<input id="mm" name="mm"  style="width:80px;" value="<%=mm%>" readonly> ��						
							<input type="text" id="dd" name ="dd" style="width:80px;" value="<%=dd%>" maxlength="2">��	
						</td>
					</tr>
										<tr>
						<th scope="row"> ���� </th>
						<td>
							<input type = "radio" name="ttGender" id="ttGenderF" value="7" disabled> ����
							<input type = "radio" name="ttGender" id="ttGenderM" value="8" disabled> ����
						</td>
					</tr>
					
					<tr>
						<th scope="row"> ���̵�</th>
						<td>
							<input type = text name= "ttId" id="ttId"/>
							<input type="button" id="ttIdCheck" value="���̵��ߺ�üũ"/>
							<div id="ajaxResData">���̵� �ߺ�üũ�Ͻÿ�</div>								
						</td>
					</tr>
					<tr>
						<th scope="row"> �н����� </th>
						<td> <input type="password"	name="ttPw" id="ttPw" size="21"></td>
					</tr>
					<tr>
						<th scope="row"> �н����� Ȯ��</th>
						<td>
						<input type="password"	name="ttPwC" id="ttPwC" size="21"/>&nbsp;&nbsp;&nbsp;
						<input type="button"	name="ttPwCheck" id="ttPwCheck" value="��й�ȣȮ��"/>
						</td>
					</tr>

					<tr>
						<th scope="row">�� �ٹ��� ���Գ⵵ </th>
						<td><input type = text name="ttTransferyear" id="ttTransferyear" value="<%=ttTransferyear%>" readonly></td>
					</tr>
					<tr>
						<th scope="row">���о�</th>
						<td>
							<input type ="radio" name="sjtType" value="SJT01" id="SJT01" onchange= "setDisplay()"> ��㱳�� 
							<input type ="radio" name="sjtType" value= "���ӱ���" id="SJT00" onchange= "setDisplay()"> ���ӱ���
							<div id="pop1" style="display: none;"><p>
						
							<select id="sjtCode" name="sjtCode">
								<option value="">���� ����</option>
				  	 			<option value="SJT02">����</option>
				  	 			<option value="SJT03">����</option>
                                <option value="SJT04">����</option>
                                <option value="SJT05">��ȸŽ��(����,��������)</option>
                                <option value="SJT06">����Ž��</option>
                                <option value="SJT07">ü��������(����,�̼�)</option>
                                <option value="SJT08">��Ȱ������(�������,�ѹ�)</option>
                                <option value="SJT09">��2�ܱ���</option>
                                <option value="SJT10">��Ÿ</option>
							</select><br>
							<select id="gradeId" name="gradeId" style="width:80px;" onchange="classIdChange(this.form);"  ></select>
							<label for="gradeId">�г�</label>
							<select id="classId" name="classId" style="width:80px;"></select>
							<label for="classId">��</label>
						</p></div>
						</td>
						
					</tr>
				
					<tr>
						<th scope="row"> �̸��� </th>
						<td><input type = hidden name="ttEmail" id="ttEmail">
							<input type="text" name="ttEmail01" id="ttEmail01" style="width:100px"> 
						@ 	<input type="text" name="ttEmail02" id="ttEmail02" style="width:100px;" disabled placeholder="�������ּ���"> 
							<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail"> 
								<option value="�������ּ���" selected>�������ּ���</option>								
								<option value="naver.com">naver.com</option>  
								<option value="hanmail.net">hanmail.net</option> 
								<option value="gmail.com">gmail.com</option> 
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option> 
								<option value="freechal.com">freechal.com</option> 
								<option value="hanmir.com">hanmir.com</option> 
								<option value="korea.com">korea.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option> 					
								<option value="paran.com">paran.com</option> 
								<option value="etc">�����Է�</option> 
							</select> 
						

					</td>
					</tr>
					<tr>
						<th scope="row">������ ����</th>
						<td><input type="file" id= "ttImage" name="ttImage"></td><br>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type = "button" id="insertData" value="����" />
							<input type ="reset" value="�ٽ�"/>							
						</td>
					</tr>			
				</table>		
			</form>
		</div>
		</div>
	</body>
</html>