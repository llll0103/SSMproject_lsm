<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,ssm.br.vo.Non_VideoVO,ssm.common.utils.BabySession" %>
<%
	response.setCharacterEncoding("EUC-KR");
	request.setCharacterEncoding("EUC-KR");
	String userAuthoriry = BabySession.getSessionAU(request);
	Object obj = request.getAttribute("list");
	List list = null;
	Non_VideoVO nvvo = null;
	if(obj != null && obj !=""){
		list = (List)obj;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>nvMain</title>
		<script type = "text/javascript" src= "http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<link rel="stylesheet" href="/common/ssmCss/ssmMain.css">
  		<link rel="stylesheet" href="/common/ssmCss/default.css">
  	   	<link rel="stylesheet" href="/common/ssmCss/categoryDefault.css">
  	   	 <link rel="stylesheet" href="/common/ssmCss/npMainBoard.css">
  	   	 <link rel="stylesheet" href="/common/ssmCss/s_layout.css">
		<script src="/common/ssmJs/goCategory.js?ver=2"></script>
		<script src="/common/ssmJs/index.js"></script>
			<script type="text/javascript">
				$(function(){
					if("<%=userAuthoriry%>"=="1"){
						$(".ttBtn").hide();
					}
					$("#detail").hide();
					
					$("#goinsert").click(function(){
						location.href="/Non_Video/goInsertForm.ssm";
					});
					
					$("#godelete").click(function(){
						$("#videoForm").attr("action","/Non_Video/deleteVideo.ssm").submit();
					});
					$("#goupdate").click(function(){
						$("#videoForm").attr("action","/Non_Video/goUpdateVideo.ssm").submit();
					});
	
				});
				function getVideo(data,nvNo,title,ttName,insertDate,updateDate){
					//alert("����");
					
					$("#nvNo").val(nvNo);
					
					$("#videoView").attr("src","/video/"+data);
					$("#videoOO").load();
					$("#detail").show();
					
					$("#nvTitle").val(title);
					$("#ttName").val(ttName);
					$("#nvInsertdate").val(insertDate);
					$("#nvUpdatedate").val(updateDate);
				}
			</script>
			<style>
/* 	 			#leftcol { overflow:auto; */
/* 	 						height:570px; */
/* 	 						float: left;  */
/* 						    width: 230px;  */
/* 						    padding-bottom: 50px;  */
/* 						}	 */
/* 				#box2 { width:900px; */
/* 				      	height:600px; */
/* 				      	background; */
/* 				      	border: 5px solid ; */
/* 				      	float:left; */
/* 				      	margin:10px; */
/* 				      	font-size:60px; */
				    	
/* 						} */
/* 				 .imul a{	    float: left; */
/* 								    height: 31px; */
/* 								    width: 138px; */
/* 								    padding: 17px 0 0 16px; */
/* 								    border: solid 1px #e6e6e6; */
/* 									text-decoration: none; */
/* 								    font-size: 12px; */
/* 								    color: #555555; */
/* 								    font-family: 'NanumGothicBoldWeb'; */
/* 								    text-align: center; */
/* 								}	 */
/* 	 			.imul li {	  */
/* 	 				overflow: hidden; */
/* 	 				display: inline; */
/* 				}			  */
/* 				.imbox2ul{ */
/* 						 margin-top: 0px;  */
/* 						 margin-bottom: 0px;					 */
/* 					    padding-left: 0px; */
	
/* 				} */
		</style>
	</head>
	<body>
		<div id="wrap">
			<%@include file= "/common/ssmMain/header_.jsp" %>
			<div class="subWrap">
		<%
			if(userAuthoriry.equals("1")){%>
				<nav include-html="/common/ssmMain/ssmCategory/brSsideNav.html"></nav>
		<%
			}else if(userAuthoriry.equals("2") || userAuthoriry.equals("3")) {
		%>
				<nav include-html="/common/ssmMain/ssmCategory/brTsideNav.html"></nav>
		<%
			}
		%>
			<section>
				<div id="tit">
					<h1>���� ������</h1>
					<p><a href="/chwc/index.asp">Ȩ</a> > <a href="#�����ּ�">�񱳰� ��õ</a> > <a
						href="#�ּҰɱ�" class="on">���� ������</a>
					</p>
				</div>
				<div class="container">
					
					<div id="ttBox">
						<input type="button" id="godelete" name="godelete" class="ttBtn" value="����">
						<input type="button" id="goupdate" name="goupdate" class="ttBtn" value="����">
						<input type="button" id="goinsert" name="goinsert" class="ttBtn" value="�۾���">
					</div>
					<form id="videoForm" name="videoForm">
						<input type="hidden" id="nvNo" name="nvNo">
					</form>
					<div id="box2">
						<div id="leftcol">
							<ul class="imul">
						<%
							if(list==null){
						%>
									<li class="leftli"><a href="#"> �������� �����ϴ�</a></li>
						<%
							}else{
								for(int i=0;i<list.size();i++){
									nvvo=(Non_VideoVO)list.get(i);
						%>
									<li class="leftli">
										<a id="nvNoInput" name="nvNoinput" href="javascript:getVideo('<%=nvvo.getNvVideo()%>','<%=nvvo.getNvNo() %>','<%=nvvo.getNvTitle()%>','<%=nvvo.getTtName()%>','<%=nvvo.getNvInsertdate()%>','<%=nvvo.getNvUpdatedate()%>')"><%=nvvo.getNvTitle()%></a>
									</li>
						<%
								} // for
							} // if(list==null)
						%>
							</ul>
						</div>
						<!-- // #leftcol -->
<%-- 						<div><h3><span><%=nvvo.getNvTitle()%></span></h3></div> --%>
						<ul class="imbox2ul">
<!-- 						 width="600" height="400" style=" margin-top: 0px; margin-bottom: 0px;"  -->
							<video controls>
						 		<source id="videoView" type="video/mp4" src="/video/�ݷ�����������.mp4"/>
							</video>
						</ul>
					</div>
					<div id="detail">
						<table>
							<tr>
								<th>�۹�ȣ</th>
								<td><input type="text" id="nvNo" name="nvNo" disabled></td>
							</tr>
							<tr>
								<th>����</th>
								<td><input type="text" id="nvTitle" name="nvTitle" disabled></td>
							</tr>
							<tr>
								<th>�ۼ���</th>
								<td><input type="text" id="ttName" name="ttName" disabled></td>
							</tr>
							<tr>
								<th>�Խ���</th>
								<td><input type="text" id="nvInsertdate" name="nvInsertdate" disabled></td>
							</tr>
							<tr>
								<th>�ֱ� ������</th>
								<td><input type="text" id="nvUpdatedate" name="nvUpdatedate" disabled></td>
							</tr>
						</table>
					</div>
				</div>
			</section>
		</div>
		<footer include-html="/common/ssmMain/footer.html"></footer>
	</div>
	<script type="text/javascript">
		includeHTML();
	</script>
	</body>
	
</html>