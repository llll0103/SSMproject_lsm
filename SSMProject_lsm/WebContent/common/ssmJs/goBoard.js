
// 공지사항
$.ajax({
	url :  "/link/nbPortal.ssm",
	type : "post",
	dataType : "json",
	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	success : function(data){
		console.log("공지 호출 성공");
		var html = "";
		for(i=0; i<data.length; i++){
			var nbNo = data[i].nbNo;
			var nbTitle = data[i].nbTitle;
			var nbInsertdate = data[i].nbInsertdate;
			
          	html += "<li><div class='goBoardli'><a href=#>"+data[i].nbTitle+"</a></div>" 
          	html +=	"&nbsp;&nbsp;&nbsp;<span>"+data[i].nbInsertdate+"</span></li>"
          	
		}
		$("#noticeList").html(html);
	}, 
	error : function(){
		console.log("공지 호출 실패");
	}
});

// 비교과
$.ajax({
	url : "/link/npPortal.ssm",
	type : "post",
	dataType : "json",
	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	success : function(data){
		var html= "";
		console.log("비교과 프로그램 호출 성공");
		for(i= 0; i < data.length; i++){
			var npTitle = data[i].npTitle;
			var npNo = data[i].npNo;
			var npPsdate = data[i].npPsdate;
			html += "<li><div class='goBoardli'><a href='/nonprogram/np_detailData.ssm?npNo="+npNo+"'>"+data[i].npTitle+"</a></div>" 
          	html += "&nbsp;&nbsp;&nbsp;<span>"+data[i].npPsdate+"</span></li>"
		}
		$("#programList").html(html);
	},
	error : function(){
		console.log("비교과 프로그램 실패");
	}
});
