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
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/kmlogin/myInfo.css"/>
<title>Insert title here</title>
<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		if(!f.userId.value){
			
			alert("이메일을 입력해주세요");
			f.userId.focus();
			return;
			
		}
		
		f.action = '<%=cp%>/kmoong/deleteId_ok.do';
		f.submit();
		
	}


</script>
<style type="text/css">
#main_main_wrap{

flex-direction: column;

}
.deleted_radio{

	margin-bottom: 10px;


}
.email_check{

	margin-top: 20px;

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
				<a class="main_side_content" href="<%=cp%>/kmoong/changePwd.do">비밀번호 변경</a>
				<a class="main_side_check" href="<%=cp%>/kmoong/deleteId.do">회원 탈퇴</a>
			</div>
			<div id="main_main">
				<h1 class="main_main_title">회원 탈퇴</h1>
				<div id = "main_main_wrap">
					<h2>
						크몽을 떠나는 이유를 알려주세요.
					</h2>
					<div class="deleted_radio">
						<input type="radio" name="out_res" id ="rs_1" value="1"><label for="rs_1">이용하고 싶은 서비스가 없어요</label>
					</div>
					<div class="deleted_radio">
						<input type="radio" name="out_res" id ="rs_2" value="2"><label for="rs_2">서비스 퀄리티가 낮아요</label>
					</div>
					<div class="deleted_radio">
						<input type="radio" name="out_res" id ="rs_3" value="3"><label for="rs_3">비매너 회원을 만났어요</label>
					</div>
					<div class="deleted_radio">
						<input type="radio" name="out_res" id ="rs_4" value="4"><label for="rs_4">잦은 오류가 발생해요</label>
					</div>
					<div class="deleted_radio">
						<input type="radio" name="out_res" id ="rs_5" value="5"><label for="rs_5">대체할 만한 서비스를 찾았어요</label>
					</div>
					<div class="deleted_radio">
						<input type="radio" name="out_res" id ="rs_6" value="6"><label for="rs_6">쿠폰ㆍ적립금 등 혜택이 적어요</label>
					</div>
					<div class="deleted_radio">
						<input type="radio" name="out_res" id ="rs_7" value="7"><label for="rs_7">기타</label>
					</div>

					<form action="" method="post" name="myForm">
					<div class="email_check">
						<h4>
							이메일 확인
						</h4>
						<input type="text" name="userId" class="main_inputbox">
						<input type="button" value="회원 탈퇴" onclick="sendIt();" class="info_btn">
					</div>
					</form>
				
				</div>
			
			
			</div>
			
		</div>
</div>
</body>
</html>