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

<script type="text/javascript">

	function findId(){
		
		var f = document.IdForm;
		
		f.action = "<%=cp%>/kmoong/find_Id.do";
		f.submit();
		
	}
	function findPwd(){
		var f = document.PwdForm;
		
		f.action = "<%=cp%>/kmoong/find_Pwd.do";
		f.submit();
	}


</script>
<style type="text/css">
body{

	margin:0px;
	padding: 0px;
	letter-spacing: 0;
    font-size: 13px;
    font-family: MetroSans;
    font-weight: 400;


}
*{

	margin:auto;
	
}


#find_header{

	width: 100%;
    height: 59px;
    background-color: #ffd400;

}
#find_wrap{

	width: 331px;

}
#find_title{

	margin-top: 30px;
	margin-bottom: 30px;


}
.find_Id{

	width: 300px;
	margin-top: 20px;
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid #e6e6e6;
    border-radius: 5px;
	
	
}
#find_title{

	padding-left: 15px;
    padding-right: 15px;

}
.panel-heading{
	padding: 10px 12px;
    border-bottom: 1px solid transparent;
    color: #4d4d4d;
    background-color: #e8e8e8;
    border-color: #e6e6e6;

}
.panel-body
{
	padding:20px;

}
.userName_wrap{

	margin-bottom: 5px;
}
.input_box{
	height: 52px;
    line-height: 52px;
    padding: 0 15px;
	
	display: block;
    width: 88%;
    font-size: 13px;
	color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #e6e6e6;
    border-radius: 5px;	
}
.text_wrap{

	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 10px;
	line-height: 1.5438;
	color: #888;
}
.text_wrap2{

	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 10px;
	line-height: 1.5438;
	color: #888;
	text-align: center;

}
#find_footer{

	padding-left: 20px;
	padding-right: 20px;
	

}
#footer_right{

	float:right;
	

}
.find_btn{

	width: 100%;
	height: 52px;
    line-height: 52px;
	cursor: pointer;
	color: #fff;
    background-color: #f26656;
	border-radius: 4px;
	display: block;
	border: 1px solid #f0513e;
}
</style>
</head>
<body>
<div id="find_header">
	<a href="<%=cp%>/kmoong/main.do"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/pages/main/kmong_logo.png" style="width: 105px; padding-top: 15px; padding-left: 40px;"></a>
</div>
<div id="find_wrap">
	<div id="find_title">
		<h2>아이디/비밀번호 찾기</h2>
	</div>
	<form action="" method="post" name="IdForm">
	<div class="find_Id">
		<div class = "panel-heading">
			아이디 찾기
		</div>
		<div class = "panel-body">
		<div class = "userName_wrap">
			<input type="text" name="userName" class="input_box" placeholder="이름을 입력해주세요">
		</div>
		<div class="userName_wrap">
			<input type="text" name="userTel" class="input_box" placeholder="핸드폰번호를 입력해주세요">
		</div>
		<div class = "text_wrap">
			본인인증 받으신 정보를 입력해 주세요. 휴대폰 번호로 아이디(이메일 주소)를 보내드립니다.
		</div>
		<div class = "">
			<input type="button" value="아이디(이메일 주소)전송" class="find_btn" onclick="findId();">
		</div>
		</div>
	</div>
	</form>
	<form action="" method="post" name="PwdForm">
	<div class="find_Id">
		<div class = "panel-heading">
			비밀번호 찾기
		</div>
		<div class ="panel-body">
		<div class = "userName_wrap">
			<input type="text" name="userId" class="input_box" placeholder="아이디를 입력해주세요">
		</div>
		<div class = "text_wrap">
			가입시 등록하신 이메일 주소를 입력해 주세요. 비밀번호 재 설정 링크를 보내드립니다.		
		</div>
		<div class = "">
			<input type="button" value="비밀번호 변경 URL 전송" class="find_btn" onclick="findPwd();">
		</div>
		</div>
	</div>
	
	</form>
	<div id="find_footer">
	<span><a href="<%=cp%>/kmoong/login.do">로그인</a></span>
	<span id="footer_right"><a href="<%=cp%>/kmoong/created.do">무료회원가입</a></span>
	</div>
	<div class = "text_wrap2">
		copyright 2021kmong Inc.Allrights reserverd.
	</div>
</div>

</body>
</html>