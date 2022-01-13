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
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/kmlogin/myInfo.css"/>
<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		if(f.changePwd.value != f.changePwd2.value){
			
			alert("변경할 비밀번호랑 같지 않습니다.");
			f.changePwd.focus();
			return;
			
		}
		
		f.action = '<%=cp%>/kmoong/changePwd_ok.do';
		f.submit();
		
	}


</script>
<style type="text/css">
.main_inputbox{

	width: 825px;

}
.changPwd_wrap{

	display: flex;

}
.changPwd_flex{

	flex-grow: 1;

}
.main_inputbox3{
   
    width: 390px;
    height: 42px;
    padding: 0 14px;
    border-radius: 4px;

}
.main_inputbox4{

	width: 390px;
    height: 42px;
    padding: 0 14px;
    border-radius: 4px;
    margin-left: 20px;
    margin-bottom: 30px;
	
}
.info_btn{
	
	background-color:#ffd400;
	margin-left: 0px;
	float: left;
	border: none;
	font-weight: 500;
	
}
</style>
</head>
<body>
<div id= "myInfo_header">
	<div id="myInfo_header_main">
		<a href="<%=cp %>/kmoong/main.do" class="kmong_logo"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/pages/main/kmong_logo.png" width="92" height="23"></a>
		<div class = "login_after">
			<a href="<%=cp%>/kmoong/myInfo.do" class="header_bal">내정보</a>
			<a href="<%=cp%>/kmoong/logout.do" class="header_bal">로그아웃</a>
		</div>
	</div>
</div>

<div id="main_wrap">
		<div id="main_wrap_content">
		
			<div id="main_side">
				<div class="main_side_title">계정 설정</div>
				<hr orientation="horizontal" class="main_side_line">
				<a class="main_side_content" href="<%=cp%>/kmoong/myInfo.do">나의정보</a>
				<a class="main_side_check" href="<%=cp%>/kmoong/changePwd.do">비밀번호 변경</a>
				<a class="main_side_content" href="<%=cp%>/kmoong/deleteId.do">회원 탈퇴</a>
			</div>

			<div id="main_main">
				<h1 class="main_main_title">비밀번호 변경</h1>
				<div id = "main_main_wrap">
						<form action="" method="post" name="myForm">
							<h4>
							현재 비밀번호
							</h4>
							<div>
							<input type="password" name = "nowPwd" class="main_inputbox">
							</div>
							<div class="changPwd_wrap">
							<div class="changPwd_flex">
								<h4>
									변경할 비밀번호
								</h4>
									<input type="password" name="changePwd" class="main_inputbox3">
							</div>
							<div class="changPwd_flex">
								<h4>
									한번 더 입력
								</h4>
									<input type="password" name="changePwd2" class="main_inputbox4">
							</div>
							</div>
							<input type="button" value="변경하기" onclick="sendIt();" class="info_btn">
						</form>				
				</div>			
			</div>
		
		</div>
</div>




</body>
</html>