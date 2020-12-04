<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%  request.setCharacterEncoding("EUC-KR"); %>
<%@ page import = "ssm.mi.vo.TMemberVO"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import= "ssm.common.utils.FilePath" %>
<% 
		Object obj1 = request.getAttribute("tmemberList"); 
		System.out.println("obj >>> : " +obj1);
		String result="";
		
		result = (String)request.getAttribute("result");
		if(result != null){
		
			System.out.println("result >>> : " +result);
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>����</title>
		  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){	
			
			$("#tabs").tabs();
			getContentTab(1);
		})//ready
		function getContentTab(index){
			var url ="/admin/listTMemberAll.ssm"
			var targetDiv = "#default"+ index; 
			$.get(url, null, function(result){
						$(targetDiv).html(result);   // �ش� div�� ����� ��Ÿ��
					});		
		}
		
		</script>
		<style>
			#container {
				width: 960px;
				margin: 0 auto;
				text-align: center;
			}
			.tab {
				list-style: none;
				margin: 0;
				padding: 0;
				overflow: hidden;
			}
			#tabcontent {
				display: block;
				background-color: green;
				padding: 6px 12px;
				color: #fff;
			}
			a{
				display: inline-block;
				color: #000;
				text-align: center;
				text-decoration: none;
				padding: 14px 16px;
				font-size: 17px;
				transition: 0.3s;
			}
			a:visited { 
				color: black; 
				text-decoration: none;
				
				}
			
			
			li {
				float: left;
				display: inline-block;
				color: #000;
				text-align: center;
				text-decoration: none;
				padding: 14px 16px;
				font-size: 17px;
			}
			}
		</style>
	</head>
	<body>
		<div id="tabs">
			<ul>
				<li><a href="/admin/listTMemberAll.ssm" onclick="getContentTab(1);">��ü��������</a></li>
				<li><a href="/admin/listTMemberY.ssm" onclick="getContentTab(2);">���Ѵ��</a></li>
				<li><a href="/admin/listTMemberN.ssm" onclick="getContentTab(3);">�̰��Ա���</a></li>
				
			</ul>
			<div id="default-1"></div>
		</div>
	</body>
</html>