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
	//alert("�α׾ƿ�");
	 $("#userForm")
     .attr("action","/user/logout.ssm")
     .submit();
}

function goJoin(){
	//alert("ȸ������");
	location.href = "/user/joinCheckForm.ssm";
}