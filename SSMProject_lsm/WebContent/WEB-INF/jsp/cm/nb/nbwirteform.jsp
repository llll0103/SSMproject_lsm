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
	<link rel="stylesheet" href="/common/ssmCss/boardwirteform.css?ver=1">
	
	<script src="/common/ssmJs/goCategory.js"></script>
	<script src="/common/ssmJs/index.js"></script>
	
	<script type="text/javascript" src="/navereditor/js/service/HuskyEZCreator.js" charset="EUC-KR"></script> 
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
	    
	    $(document).ready(function(){
	    
	    	
	    	var oEditors = [];
	    	nhn.husky.EZCreator.createInIFrame({
	    	 oAppRef: oEditors,
	    	 elPlaceHolder: "nbContents",
	    	 sSkinURI: "/navereditor/SmartEditor2Skin_ko_KR1.html",
	    	 fCreator: "createSEditor2"
	    	});
	    	
	    	$("#submitbutton").click(function(){
	    		
	    		var nbTitle=$("#nbTitle").val();
	    		if(nbTitle == "���� �Է�"){alert("������ �Է��ϼ���");return}
	    		
	    		oEditors.getById["nbContents"].exec("UPDATE_CONTENTS_FIELD", []);
	    		
	    		$("#nbwirteform").attr('action','/noticeboard/nbwirte.ssm').submit();
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
	<header include-html="/common/ssmMain/header_.jsp"></header>
	
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
		<form id="nbwirteform" name="nbwirteform" enctype="multipart/form-data" method="post">
			<input Type="hidden" id="ttNo" name="ttNo" value="<%=sessionNO %>">
			<table class="writeformtable">
				<tr>
					<td> ����  </td>
					<td><input type="text" id="nbTitle" name="nbTitle" class="A" value="���� �Է�" style="width:856px; float:left;"></td>
				</tr>
				<tr>
					<td> ����  </td>
					<td><textarea name="nbContents" id="nbContents" rows="10" cols="100">�� ������ �Է��ϼ���.</textarea></td>
				</tr>
				<tr>
					<td> ÷�� ����  </td>
					<td><input type="file" id="nbFile" name="nbFile" style="width:300px; float: left;">
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