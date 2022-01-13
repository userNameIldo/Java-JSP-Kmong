<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	
	margin:0px;
	padding: 0px;
	
}
*{
	margin:auto;

}
#login_wrap{

	width: 400px;
	margin-top: 200px;



}
.login_box{
	
	height: 52px;
    line-height: 52px;
	display: block;
    width: 360px;
	color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #e6e6e6;
	padding-left: 20px;
	padding-right: 20px;
	border-radius: 6px;
	
}
.login_box:focus{

	border: 1px solid #ffd400;
	

}
#userId_input{
	 
	 margin-top:30px; 
	 margin-bottom:30px;

}
#userPwd_input{

	margin-bottom:30px;

}
#login_wrap_header{

	font-size: 20pt;
	font-weight: 400;

}
.login_btn{
	text-decoration:none;
	font-weight: 400;
	font-size: 17px;
    color: #303441;
    background-color: #ffd400;
    border-color: #ffd400;
    text-align: center;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 15px 175px;
	border-radius: 5px;
	width: 100% !important;
	height: 26px;
}
.login_btn:hover{

    background: #fae57c;


}
::selection{
	
	background: #fae57c;
    color: #4d4d4d;

}
#login_btn{
	
	margin-bottom: 30px;

}
#login_title{
	margin-bottom:20px;
	text-align: center;

}
#center_hr{
	
	margin-top:30px; 
	margin-bottom:30px;

}
.join_btn{

	text-decoration:none;
	font-weight: 400;
	font-size: 17px;
    text-align: center;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
	color: #116ad4;
    background-color: #fff;
    border-color: #116ad4;
    white-space: nowrap;
    padding: 15px 126px;
	border-radius: 5px;
	height: 26px;

}

#login_footer_right{

	float: right;
	text-decoration: none;
}
#login_footer_right a{
	
	text-decoration: none;
	cursor: pointer;
	color:black;
}
</style>
<script type="text/javascript">
	
	function sendIt(){
		
		var f = document.myForm;
		
			
		if(!f.userId.value){
			
			alert("아이디를 입력하세요.");
			f.userId.focus();
			return;
			
		}
		if(!f.userPwd.value){
			
			alert("비밀번호를 입력하세요.");
			f.userPwd.focus();
			return;
			
		}
		
		f.action = "<%=cp%>/kmoong/login_ok.do";
		
		f.submit();
		
	}

</script>

</head>
<body>
	<div id = "login_wrap">
		<div id = "login_title">
			<a href="<%=cp%>/kmoong/main.do"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/pages/main/kmong_logo.png" style="width: 120px;"></a>
		</div>
		<div id = "login_wrap_header">
			로그인
		</div>
		<form action="" method="post" name="myForm">
		<div id = "userId_input">
			<input type="text" name = "userId" maxlength="25" class="login_box" placeholder ="이메일을 입력해주세요">
		</div>
		<div id="userPwd_input">
			<input type="password" name = "userPwd" maxlength="25" class="login_box" placeholder ="비밀번호를 입력해주세요">
		</div>
		<div id = "login_btn">
			<a class="login_btn" onClick="sendIt();">로그인</a>
		</div>
		<div id = "login_footer">
			<span id = "login_footer_left"><input type="checkbox">로그인 유지</span>
			<span id = "login_footer_right"><a href = "<%=cp%>/kmoong/find.do">아이디ㆍ비밀번호 찾기</a></span>		
		</div>
		</form>
		<hr id = "center_hr">
		<div id = "join_btn">
			<a class="join_btn" href="<%=cp%>/kmoong/created.do">크몽 회원가입 하기</a>
		</div>
	</div>
</body>
</html>