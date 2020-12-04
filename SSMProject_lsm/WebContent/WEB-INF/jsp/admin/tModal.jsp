<%@ page language='java' contentType='text/html; charset=EUC-KR'
    pageEncoding='EUC-KR'%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = 'ssm.mi.vo.TMemberVO'%>
<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<html>
	<head>
		<meta http-equiv='Content-Type' content='text/html; charset=EUC-KR'>
		<title>Insert title here</title>
		<script src='/include/js/jquery-1.11.3.min.js'></script>
		<script>
		$(document).ready(function() {
			$('#ttUpdate').hide();
			$('#bbb').hide();
			
			
			
        	// �󼼺���
        	$('.goDetail').click(function(){
        		alert('�󼼺���>>>>>>>>');
				var ttNo = $(this).parents('tr').attr('ttNo');
				$('#ttNo').val(ttNo);
				alert('(log)ttNo : ' + ttNo);
				$.ajax({
					url : '/admin/tMemberDetail.ssm',
					type : 'POST',
					headers : {
						'Content-Type':'application/json',
						'X-HTTP-Method-Override':'POST'
					},
					dataType : 'JSON',
					data : JSON.stringify({
						ttNo : ttNo	
					}),
					success : function(data){
						
						var ttNo = data.ttNo;
						var ttName = data.ttName;
						var ttBirth = data.ttBirth;
						var ttGender = data.ttGender;
						var ttAuthority = data.ttAuthority;
						var sjtCode = data.sjtCode;
						var ttId = data.ttId;
						var ttPw = data.ttPw;
						var ttTransferyear = data.ttTransferyear;
						var ttPn = data.ttPn;
						var ttEmail = data.ttEmail;
						var ttImage = data.ttImage;
						var ttGrade = data.ttGrade;
						var ttClass = data.ttClass;
						var ttGradeClass = '0'+ttGrade + ttClass+'��';
						var ttDeleteyn = data.ttDeleteyn;
						var ttInsertdate = data.ttInsertdate;
						var ttUpdatedate = data.ttUpdatedate;
						var ttAdmindate = data.ttAdmindate;
						
						$('.modalTr').children('#ttNo').html(ttNo);
						$('.modalTr').children('#ttName').html(ttName);
						$('.modalTr').children('#ttBirth').html(ttBirth);
						$('.modalTr').children('#ttGender').html(ttGender);
						$('.modalTr').children('#ttAuthority').html(ttAuthority);
						$('.modalTr').children('#sjtCode').html(sjtCode);
						$('.modalTr').children('#ttId').html(ttId);
						$('.modalTr').children('#ttPw').html(ttPw);
						$('.modalTr').children('#ttTransferyear').html(ttTransferyear);
						$('.modalTr').children('#ttPn').html(ttPn);
						$('.modalTr').children('#ttEmail').html(ttEmail);
						$('.modalTr').children('#ttImage').html(ttImage);
						$('.modalTr').children('#ttDeleteyn').html(ttDeleteyn);
						$('.modalTr').children('#ttInsertdate').html(ttInsertdate);
						$('.modalTr').children('#ttUpdatedate').html(ttUpdatedate);
						$('.modalTr').children('#ttAdmindate').html(ttAdmindate);
						
						if(ttAuthority == '���ӱ���'){
							alert('���Դµ���');
							$('.modalTr').children('#ttGradeClass').html(ttGradeClass);
							
						} else {
							$('.modalTr').children('#ttGradeClass').hide();
							
						}
						$('#myModal').show();
						
					},
					error :  function(){
						alert('��������������');
					}
				});//ajax		
			});//detail
			
			
        }); // ready
        function updateForm(){
        	var ttName = $('.modalTr').children('#ttName').text();
        	var ttBirth = $('.modalTr').children('#ttBirth').text();
        	var ttGender = $('.modalTr').children('#ttGender').text();
        	
        	var ttAuthority = $('.modalTr').children('#ttAuthority').text();
        	var sjtCode = $('.modalTr').children('#sjtCode').text();
        	var ttPw = $('.modalTr').children('#ttPw').text();
        	var ttTransferyear = $('.modalTr').children('#ttTransferyear').text();
        	var ttPn = $('.modalTr').children('#ttPn').text();
        	var ttEmail = $('.modalTr').children('#ttEmail').text();
        	var ttImage = $('.ttImage').children('#ttImage').text();
        	
			$('.modalTr').children('#ttName').html("<input type = 'text' name='ttName' id='ttName' value='"+ttName+"'/>");
			$('.modalTr').children('#ttBirth').html("<input type = 'text' name='ttBirth' id='ttBirth' value='"+ttBirth+"'/>");
			
			
			if(ttGender=="����"){
				$('.modalTr').children('#ttGender').html("<input type = 'radio' name='ttGender' id='ttGenderF' value='7' checked> ����"
						+"<input type = 'radio' name='ttGender' id='ttGenderM' value='8'> ����");
			}else{
				$('.modalTr').children('#ttGender').html("<input type = 'radio' name='ttGender' id='ttGenderF' value='7'> ����"
						+"<input type = 'radio' name='ttGender' id='ttGenderM' value='8' checked> ����");
				}

			$('.modalTr').children('#ttAuthority').html("<input type = 'text' name='ttAuthority' id='ttAuthority' value='"+ttAuthority+"'/>");
			$('.modalTr').children('#sjtCode').html("<input type = 'text' name='sjtCode' id='sjtCode' value='"+sjtCode+"'/>");
			$('.modalTr').children('#ttPw').html("<input type = 'text' name='ttPw' id='ttPw' value='"+ttPw+"'/>");
			$('.modalTr').children('#ttTransferyear').html("<input type = 'text' name='ttTransferyear' id='ttTransferyear' value='"+ttTransferyear+"'/>");
			$('.modalTr').children('#ttPn').html("<input type = 'text' name='ttPn' id='ttPn' value='"+ttPn+"'/>");
			$('.modalTr').children('#ttEmail').html("<input type = 'text' name='ttEmail' id='ttEmail' value='"+ttEmail+"'/>");
			$('.modalTr').children('#ttImage').html("<input type='file' id= 'ttImage' name='ttImage' value='"+ttImage+"'/>");
			$('#ttUpdateForm').hide();
        	$('#ttUpdate').show();
        }
        //�˾� Close ���
        function close_pop(flag) {
        	$('#bbb').hide();
        	$('#ttUpdateForm').show();
        	$('#ttUpdate').hide();
             $('#myModal').hide();
             $('#resultModal').hide();
        }
        	
		function vcUpdate(){
        	
        	var vrNo = $(".modalTr").children("#vNo").html()
        	$("#vrNo").val(vrNo);
        	alert(vrNo);
        	$("#vrComment").attr({
        		"action":"/vrComment/vcUpdate.ssm",
        		"method":"post"
        	});
        	$("#vrComment").submit();
        	
        }
		
        function vcDelete(){
        	var vrNo = $(".modalTr").children("#vNo").html();
        	$("#vrNo").val(vrNo);
        	alert(vrNo);
        	alert(vcComments);
        	$("#vrComment").attr({
        		"action":"/vrComment/vcDelete.ssm",
        		"method":"post"
        	});
        	$("#vrComment").submit();
        }
      //���Թ�ư
	 	function ttUpdate(){
			console.log("ttUpdate >>> ");
			if(confirm('����� �����ұ��?')){
					$("#ttDetail").attr({
						"method":"POST",
						"action":"/admin/ttUpdate.ssm"});
					$("#ttDetail").submit();
			};//confirm
		}//update
     
        function ttDelete(){
			var ttNo = $('.modalTr').children('#ttNo').text();
			console.log("ttNo: " +ttNo);
			//var vrNo = $(this).parents("tr").attr("vrNo");
			alert("ttNo" + ttNo);
			if(confirm("������ ������ �����Ͻðڽ��ϱ�?")){
				$.ajax({
					url:'/admin/'+ttNo+".ssm",
					type:'put',
					headers: {
						"Content-Type":"application/json",
							"X-HTTP-Method-Override":"PUT"},
					data:JSON.stringify({
						ttNo:ttNo		
					}),
					dataType:'text',
					success:function(result){
						console.log("result:" +result);
						if(result == 'SUCCESS'){
							alert("�����Ϸ�!!!");
							window.location.reload();
						}//if
					}//success
				});//ajax
			}//if		
		}//delete
		</script>
	
	</head>
	 <style>
   /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

	 
		</style>

	<body>

		<div id='myModal' class='modal' width='500px'>
	    	<!-- Modal content -->
	      	<div class='modal-content'>
	      		<p>���� ���� �󼼺���</p>
	      		<hr/>
	      		<div class='modalTb'>
	      			<form id='ttDetail' name='ttDetail'
	      				method ="POST"
						enctype="multipart/form-data"">
	      				<input type='hidden' id='ttNo' name='ttNo'/>
			      		<table align='center' width='100%'> 		
			      			<tr class='modalTr' width="40%">
			      				<th>������ȣ</th>
			      				<td id='ttNo'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>�̸�</th>
			      				<td id='ttName'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>�������</th>
			      				<td id='ttBirth'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>����</th>
			      				<td id='ttGender'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>����</th>
			      				<td id='ttAuthority'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>����б�</th>
			      				<td id='ttGradeClass'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>������</th>
			      				<td id='sjtCode'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>���̵�</th>
			      				<td id='ttId'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>��й�ȣ</th>
			      				<td id='ttPw'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>�� �ٹ��� ���Գ⵵</th>
			      				<td id='ttTransferyear'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>�޴�����ȣ</th>
			      				<td id='ttPn'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>�̸���</th>
			      				<td id='ttEmail'></td>
			      			</tr>
							<tr class='modalTr'>
			      				<th>ȸ������</th>
			      				<td id='ttImage'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>�ۼ���</th>
			      				<td id='ttInsertdate'></td>
			      			</tr>
			      			<tr class='modalTr'>
			      				<th>������</th>
			      				<td id='ttUpdatedate'></td>
			      			</tr>
			      		</table>
			      	</form>
		      	</div>
	            <div style='cursor:pointer;'>
	            <hr/>
	                <input type='button' onClick='close_pop();' class='popBtn' value='�ݱ�'/>
	                <input type='button' id= 'ttUpdateForm' onClick='updateForm()' class='popBtn' value='�����ϱ�'/>
	               	<input type='button' id= 'ttUpdate' onClick='ttUpdate()' class='popBtn' value='���'/>
	             	<input type='button' onClick='ttDelete()' class='popBtn' value='����'/>
	                <input type='button' onClick='ttUpdate()' id='saveResult' class='popBtn' value='����'/>
	            </div>
	    	</div>
	    </div>
	</body>
</html>