<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta charset="EUC-KR">
      <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <link rel="stylesheet" href="/common/ssmCss/default.css">
   <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
   
   <link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">

<link rel="stylesheet" href="/common/ssmCss/s_base.css">
<link rel="stylesheet" href="/common/ssmCss/s_content.css">
<link rel="stylesheet" href="/common/ssmCss/s_layout.css">
   
   <script src="/common/ssmJs/goCategory.js"></script>
   <script src="/common/ssmJs/index.js"></script>
   </head>
   <style>
   
.left-box {
   float: left;
   width: 50%;
   height: 100%;
   margin-bottom : 10px;
   vertical-align:middle;
}

.right-box {
   float: right;
   width: 50%;
   height: 100%
}


img {
	width : 90%;
	margin-top : 25%;
}  
   
   </style>
   <body>
      <div id="wrap">
      <%@include file="/common/ssmMain/header_.jsp"%>
      <div class="subWrap">
         <nav include-html="/common/ssmMain/ssmCategory/cgSsideNav.jsp"></nav>
         <section>
         	<div id="tit">
         		<h1>상담창구 </h1>
         		<p>
         			<a href="/chwc/index.asp">홈</a> > <a href="#메인주소"></a> <a href="#주소걸기" class="on">상담/검사</a>
                </p>
	         </div>
	         <!-- // #tit -->
	         <div class="container">
	         	<div id="content">
	         		<div class='left-box'>
	         			<a href="/visitCounsel/vcSchedule.ssm">
	         				<img src="/image/visit.png" />
<!-- 	         				<img src="/image/visit.png"  style="width: 300px;margin-top: 100px;margin-left: 100px;" /> -->
	                  	</a>
	               </div>
	               <!-- // .left-box -->
	               <div class='right-box'>
		               	<a href="/onlineApplication/oaInsertForm.ssm">
		               		<img src="/image/online.png"/>
	<!-- 	               		<img src="/image/online.png"  style="width: 300px; margin-top: 100px; margin-right: 100px;"/> -->
		                </a>
	                </div>
	         	</div>
	         	<!-- // #content -->
	         </div>
	         <!-- // .container -->
         </section>
      </div>
      <footer include-html="/common/ssmMain/footer.html"></footer>
   </div>
   <script>
      includeHTML();
   </script>
</html>