function goLogin(){
	 if($("input[name='userAuthority']:checked").val()==null){
		// alert("ssssssssss");
		 return;
	 } else {
        $("#loginForm")
        .attr("action","/user/loginCheck.ssm")
        .submit();
	 }
 }

function goLogout(){
	//alert("로그아웃");
	 $("#userForm")
     .attr("action","/user/logout.ssm")
     .submit();
}

function goJoin(){
	//alert("회원가입");
	location.href = "/user/joinCheckForm.ssm";
}