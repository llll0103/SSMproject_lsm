<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ssm.common.utils.BabySession" %>        
    
<%  String sessionNO = BabySession.getSessionNO(request);%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	
	<link rel="stylesheet" href="/common/ssmCss/default.css">
	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
	<link rel="stylesheet" href="/common/ssmCss/boardwirteform.css">
	
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	
	<script type="text/javascript" src="/navereditor/js/service/HuskyEZCreator.js" charset="EUC-KR"></script> 
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    
	    $(document).ready(function(){
		    
	    	var oEditors = [];
	    	nhn.husky.EZCreator.createInIFrame({
	    	 oAppRef: oEditors,
	    	 elPlaceHolder: "qbContents",
	    	 sSkinURI: "/navereditor/SmartEditor2Skin_ko_KR1.html",
	    	 fCreator: "createSEditor2"
	    	});
	    	
	    	$("#submitbutton").click(function(){
	    		var qbType=$("#qbType").val();
	    		var qbTitle=$("#qbTitle").val();
	    		if(qbType == "�Խ��Ǽ���"){alert("�Խ����� �����ϼ���");return}
	    		if(qbTitle == "���� �Է�"){alert("������ �Է��ϼ���");return}
	    		
	    		oEditors.getById["qbContents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		
	    		$("#qbwirteform").attr('action','/qnaboard/qbwirte.ssm').submit();
	    	});
	    	
	    	$('.A').keydown(function(){
	            cut_28(this);
	        });
	    	
	    });
	    
	    function cut_28(obj){
	        var text = $(obj).val();
	        var leng = text.length;
	        while(getTextLength(text) > 28){
	            leng--;
	            text = text.substring(0, leng);
	            alert("30����Ʈ�� ������ �����ϴ�.");
	        }
	        $(obj).val(text);
	    }
	    
	    function getTextLength(str) {
	        var len = 0;
	        for (var i = 0; i < str.length; i++) {
	            if (escape(str.charAt(i)).length == 6) {
	                len++;
	            }
	            len++;
	        }
	        return len;
	    }
	    
	    
    </script>
    
</head>
<body>
<div id="wrap">

	<!-- ��� -->
	<header include-html="/common/ssmMain/header_.jsp?ver=1"></header>
	
	<!-- �׺���̼� -->
	<nav include-html="/common/ssmMain/ssmCategory/cmwrapSide.html"></nav>
	
	<!-- �����̳� -->
	<div class="boardwriteformcontainer">
				
	<!-- ����� -->		
	<section include-html="/common/ssmMain/ssmCategory/section_sub_title_wrap.html"></section>	
	
	<!-- �̹��� ��  -->
	<div id="mainimage"><img alt="�����;���" src="/image/nbmain.gif"></div>
	
	<!-- �۾��� �� -->
	<div id="writeform">
		<form id="qbwirteform" name="qbwirteform">
			<input Type="hidden" id="ssNo" name="ssNo" value="<%=sessionNO%>">
			<table class="writeformtable">
				<tr>
					<td> Q&A ���� </td>
					<td style="float: left;margin: 5px auto; ">
						<select style="height:21px;" id="qbType" name="qbType">
							<option value="�Խ��Ǽ���">�Խ��Ǽ���</option>
							<option value="���μ���">���μ���</option>
							<option value="���">���</option>
							<option value="�񱳰����α׷�">�񱳰����α׷�</option>
							<option value="��Ʈ������">��Ʈ������</option>
							<option value="��������">��������</option>
							<option value="�б�����">�б�����</option>
							<option value="������Ź�">������Ź�</option>
						</select>
					</td>
				</tr>
				<tr>
					<td> ����  </td>
					<td><input type="text" id="qbTitle" name="qbTitle" class="A" value="���� �Է�" style="width:856px; float:left;"></td>
				</tr>
				<tr>
					<td> ����  </td>
					<td><textarea name="qbContents" id="qbContents" rows="10" cols="100">�� ������ �Է��ϼ���.</textarea></td>
				</tr>
				<tr>
					<td> ��б� ����  </td>
					<td style="float: left;margin: 4px auto; width:100%">
						<input type="radio" name="qbSecretyn" value="Y" checked>��б� 
						<input type="radio" name="qbSecretyn" value="N">������
						<input type="button" id ="submitbutton" name="submitbutton" value="�Է�" style="float: right;">
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
	<footer include-html="/common/ssmMain/footer.html"></footer>
	</div>
	<script>
		includeHTML();
	</script>	
</body>
</html>