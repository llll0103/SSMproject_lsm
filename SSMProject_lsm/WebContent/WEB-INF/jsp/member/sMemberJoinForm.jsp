<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "ssm.mi.vo.SMemberVO"%>
<% 
	SMemberVO smvo     = (SMemberVO)request.getAttribute("data");
	String    ssNo     = smvo.getSsNo();         // �й�
	String    ssBirth  = smvo.getSsBirth();      // �������
	String    ssPn     = smvo.getSsPn();         // �޴�����ȣ
	String    ssName   = smvo.getSsName();
	String    ssGender = smvo.getSsGender();
	
	String yy = ssBirth.substring(0, 4);
	String mm = ssBirth.substring(4,6);
	String dd = ssBirth.substring(6);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
   
      <title>�л� ������</title>
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
      <script type="text/javascript" src= "/include/js/common.js"></script>
      <script type = "text/javascript">   
         $(document).ready(function(){
            var idc =0; //���̵� �ߺ� üũ���θ� Ȯ���ϴ� ����
            var pwc =0; //��й�ȣ üũ���θ� Ȯ���ϴ� ����
            var ssGender= "<%=ssGender%>";
            if(ssGender="7"){$('input:radio[name="ssGender"][value="7"]').prop('checked', true);}
                        else{$('input:radio[name="ssGender"][value="8"]').prop('checked', true);}
            
             
            $("#ssPwCheck").click(function(){
               var ssPwVal = $("#ssPw").val();
               var ssPwCVal = $("#ssPwC").val();
               
               //��� �Է°˻�
               if (! ssPwVal){
                  console.log("(log)pw���� >>> : " + ! ttPwVal);
                  alert("��й�ȣ�� �Է��ϼ���");
                  $("#ssPw").focus();
                  return false;               
               }//ssPwVal if ��
               if(!ssPwCVal){
                  console.log("(log)pwC���� >>> "+ !ssPwCVal);
                  alert("��й�ȣ Ȯ�ζ��� �Է��ϼ���");
                  $("#ssPwC").focus();
                  return false; 
               }//if ssPwCVal��
               
               if(ssPwVal == ssPwCVal){
                  alert("��й�ȣ�� Ȯ�εǾ����ϴ�");
                  $("#ssPw").attr("readonly",true);
                  $("#ssPwC").attr("readonly",true);
                  pwc=Number(1);
               }else{
                  alert("��й�ȣ ����ġ : �ٽ� Ȯ���ϼ���");
                  $("#ssPw").val('');
                  $("#ssPwC").val('');
                  $("#ssPw").focus();
                  return false;
               }
            });//ssPwCheck clickfunction��
            //�̸��� �Է¹�� ����
             $('#selectEmail').change(function(){ 
                $("#selectEmail option:selected").each(function () { 
                   if($(this).val()== 'etc'){//�����Է��� ���
                      $("#ssEmail02").val(''); //�� �ʱ�ȭ 
                      $("#ssEmail02").attr("disabled",false); //Ȱ��ȭ
                   }else{ //�����Է��� �ƴҰ�� 
                      $("#ssEmail02").val($(this).text()); //���ð� �Է� 
                      $("#ssEmail02").attr("disabled",true); //��Ȱ��ȭ
                  } 
                }); 
            });
            //���̵� �ߺ�üũ
            $("#ssIdCheck").click(function(){
            	var ssIdVal = $("#ssId").val();
            	//���̵� �Է°˻�
                if (!ssIdVal){
                   console.log("(log)id���� >>> : " + ! ssIdVal);
                   alert("���̵� �Է��ϼ���");
                   $("#ssId").focus();
                   return false;               
                }
            	$.ajax({
            		url : "/smember/ajaxIdCheck.ssm",
            		type : "get",
            		data : {ssId : ssIdVal},
            		success : function(data){
            			console.log(data);
            			var check = eval(data);
            			if(check){
            				 alert("��� ������ ���̵��Դϴ�.");
                             $("#ssId").attr("readonly",true);
                             $("#ssIdCheck").hide();
                             $('#ajaxResData').html("�ߺ�üũ�Ϸ�");
                             idc=Number(1);
            			}else{
            				alert("�ߺ��� ���̵��Դϴ�.");
            				$("#ssId").val('');
            				$("#ssId").focus();
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
               var ssEmail = $("#ssEmail01").val()+"@"+$("#ssEmail02").val();
               $("#ssEmail").val(ssEmail);
               
               if (!chkSubmit($('#ssId'),"���̵�")) return;
               else if (!chkSubmit($('#ssPw'),"�н����带")) return;
               else if (!chkSubmit($('#ssPwC'),"�н����� Ȯ����")) return;
               else if (idc==0) return alert("���̵� �ߺ�üũ�� Ȯ�����ּ���.");
               else if (pwc==0) return alert("�н����� Ȯ���� üũ�Ͻÿ�"); 
               else if (!chkSubmit($('#grGrade'),"�г���")) return;
               else if (!chkSubmit($('#grClass'),"����")) return;
               else if (!chkSubmit($('#grNum'),"��ȣ��")) return;
               else if (!chkSubmit($('#ssEmail01'),"�̸�����")) return;
               else if (!chkSubmit($('#ssEmail02'),"�̸�����")) return;
               else if (!chkSubmit($('#ssImage'),"������")) return;
               else{
                  if(confirm('����� �����ұ��?')){
                     $("#joinForm").attr({
                        "method":"POST",
                        "action":"/smember/joinSMember.ssm"});
                     $("#joinForm").submit();
                  }//confirm
               }//else
            });//insertData_click   
         });//document ready
      </script>
      <script type="text/javascript">
      ////////�ݹ�ȣ����
      
      var g_selbox = new Array('1', '2', '3' );
      var c_selbox = new Array();   
         for (var i =0 ; i<3 ;i++){ c_selbox[i] = new Array('1', '2', '3', '4', '5');}
      var n_selbox = new Array();
         for (var i =0; i<5 ; i++){n_selbox[i] = new Array('1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
               '11', '12', '13', '14', '15', '16', '17', '18', '19', '20');}
         
      function init(f){
         console.log(f);
         console.log("init");
         var g_sel = f.grGrade;
         var c_sel = f.grClass;
         var n_sel = f.grNum;
         
         g_sel.options[0] = new Option("�г� ����", "");
         c_sel.options[0] = new Option("�� ����", "");
         n_sel.options[0] = new Option("��ȣ ����", "");

         for(var i =0; i<g_selbox.length; i++){
            g_sel.options[i+1] = new Option(g_selbox[i], g_selbox[i]);
         }
      }//init(f) onload

      function classIdChange(f){
         var g_sel = f.grGrade;
         var c_sel = f.grClass;
         
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
      
      function numIdChange(f){      
    	 var c_sel = f.grClass;
         var n_sel = f.grNum;
         
         var sel = c_sel.selectedIndex;
         for(var i=n_sel.length; i>=0; i--){
            n_sel.options[i] = null;
         }
         
         n_sel.options[0] = new Option("��ȣ ����", "");

         if(sel != 0){
            for(var i=0; i<n_selbox[sel-1].length; i++){
               n_sel.options[i+1] = new Option(n_selbox[sel-1][i], n_selbox[sel-1][i]);
            }
         }
      }
      function moveFocus(num,here,next){
          var str = here.value.length;
          if(str == num)
             next.focus();
          }
      </script>
   </head>
   <body onload = "init(this.joinForm);">
      <div align="center">
         <h3>�л� ȸ������ �Է� ȭ��</h3>
         <form name="joinForm" id="joinForm"   method="POST"   enctype="multipart/form-data">
         <input type="hidden" name="ttPn" id="ttPn" value="<%=ssPn%>">
         
            <table border="1" align="center">
               <tr>
                  <th scope="row" colspan="2" align="center">
                     	�л� ����
                  </th>         
               </tr>
               <tr>
                  <th> �̸� </th>
                  <td><input type = text name="ssName" id="ssName" value="<%=ssName%>" readonly></td>
               </tr>
               <tr>
                  <th scope="row"> �������</th>
                  <td>
                     <input type="text" id="yy"  style="width:80px;" maxlength="4" value ="<%=yy%>" readonly> ��
                     <input type="text" id="mm" name="mm"  style="width:80px;" value="<%=mm%>" readonly> ��                  
                     <input type="text" id="dd" name ="dd" style="width:80px;" value="<%=dd%>" maxlength="2">��   
                  </td>
               </tr>
               <tr>
                  <th scope="row"> ���� </th>
                  <td>
                     <input type = "radio" name="ssGender" id="ssGenderF" value="7" disabled> ����
                     <input type = "radio" name="ssGender" id="ssGenderM" value="8" disabled> ����
                  </td>
               </tr>
               <tr>
                  <th scope="row"> ���̵�</th>
                  <td>
                     <input type = text name= "ssId" id="ssId"/>
                     <input type="button" id="ssIdCheck" value="���̵��ߺ�üũ"/>
                     <div id="ajaxResData">���̵� �ߺ�üũ�Ͻÿ�</div>                        
                  </td>
               </tr>
               <tr>
                  <th scope="row"> �н����� </th>
                  <td> <input type="password"   name="ssPw" id="ssPw" size="21"></td>
               </tr>
               <tr>
                  <th scope="row"> �н����� Ȯ��</th>
                  <td>
                  <input type="password"   name="ssPwC" id="ssPwC" size="21"/>&nbsp;&nbsp;&nbsp;
                  <input type="button"   name="ssPwCheck" id="ssPwCheck" value="��й�ȣȮ��"/>
                  </td>
               </tr>
              	<tr id="gradeClass" class="gradeClass">
                  <th scope="row"><label>�г�/��/��ȣ</label></th>
                  <td>
                     <select id="grGrade" name="grGrade" style="width:80px;" onchange="classIdChange(this.form);" ></select>
                     <label for="grGrade">�г�</label>
                     <select id="grClass" name="grClass" style="width:80px;"  onchange="numIdChange(this.form);" ></select>
                     <label for="grClass">��</label>
                     <select id="grNum" name="grNum" style="width:80px;"></select>
                     <label for="grNum">��</label>
                  </td>
               </tr>
               <tr>
                  <th scope="row"> �̸��� </th>
                  <td><input type = hidden name="ssEmail" id="ssEmail">
                      <input type="text" name="ssEmail01" id="ssEmail01" style="width:100px"> 
                  @   <input type="text" name="ssEmail02" id="ssEmail02" style="width:100px;" disabled placeholder="�������ּ���"> 
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
                  <td><input type="file" id= "ssImage" name="ssImage"></td><br>
               </tr>
               <tr>
                  <td colspan="2" align="center">
                     <input type="button" id="insertData" value="����" />
                     <input type="reset" value="�ٽ�"/>                     
                  </td>
               </tr>         
            </table>      
         </form>
      </div>
   </body>
</html>