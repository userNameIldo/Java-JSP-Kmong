<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String job = (String)request.getAttribute("job");
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/kmlogin/myInfo.css"/>
<title>Insert title here</title>
<script type="text/javascript">
	
	function update(){
		
		var f = document.myInfo

		
		document.getElementById("selectJob").disabled = false;
		
		document.getElementById("changtext").innerHTML = "<span id = 'changtext'><a onclick='changeJob();'>확인</a><a onclick='changeCancle();'>취소</a></span>";
		
		
	}
	
	function updateproFileImg(){
		
		var  f = document.myForm;
		
		f.action = '<%=cp%>/kmoong/changeproFile.do';
		
		f.submit();
		
	}
	
	function start(){
		
		var f = document.myInfo;
		
		var select = document.getElementById('selectJob');
		
		var job = "<%=job%>";
		
		for(var i = 0; i<select.children.length; i++){
			
			if(select.children[i].value===job){
				
				select.children[i].setAttribute('selected','')
				
			}
			
		}
		
	}
	function changeJob(){
		
		var  f = document.myInfo;
		
		f.action = '<%=cp%>/kmoong/changeJob.do';
		
		f.submit();
		
	}
	
	function changeCancle(){
		
	var f = document.myInfo

		
		document.getElementById("selectJob").disabled = true;
		
		document.getElementById("changtext").innerHTML = "<span id='changtext'><a href='javascript:update();'>수정</a></span>";
		
		
	}


</script>
<style type="text/css">

.info_btn2{

	height: 42px;
    background-color: white;
    color: black;
    border: 2px solid black;
    width: 100px;
    border-radius: 6px;
    padding: 10px 30px;

}
#input-file{

	display: none;

}
.myprofile{

	width: 112px;
	height: 112px;
	border-radius: 50%;
	margin-bottom: 30px;

}
a{

	text-decoration: none;
	
	color:black;
	
}
.changtext{
	
	float: right;
	
}
</style>
</head>
<body onload="start();">
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
				<a class="main_side_check" href="<%=cp%>/kmoong/myInfo.do">나의정보</a>
				<a class="main_side_content" href="<%=cp%>/kmoong/changePwd.do">비밀번호 변경</a>
				<a class="main_side_content" href="<%=cp%>/kmoong/deleteId.do">회원 탈퇴</a>
			</div>
			<div id="main_main">
				<h1 class="main_main_title">나의 정보</h1>

					
					<div id="main_main_wrap">
					<form action="" method="post" enctype="multipart/form-data" name="myForm" >
					<div id= "main_wrap_left">
							<div style="">
								<img src ="${imagePath }/${dto.profileImg}" class="myprofile">
							</div>
							<div>
								<label class="info_btn2" for="input-file">업로드</label>
								<input type="file" name="upload" id="input-file" onChange="updateproFileImg();"/>
							</div>
					</div>
					</form>
					<form action="" method="post" name="myInfo">
					<div id = "main_wrap_right">
						<div class="main_subtitle">이름</div>
						<div class="" style="margin-bottom: 20px;">
							<input type="text" name="" value="${dto.userName }" readonly class="main_inputbox">
						</div>
						<div class="main_subtitle">이메일</div>
						<div class="" style="margin-bottom: 20px;">
							<input type="text" class="main_inputbox" name="" value="${dto.userId }" readonly>
						</div>

						<div class="main_subtitle">휴대폰 본인인증</div>
						<div style="margin-bottom: 20px;">
							<input type="text" name=""  class="main_inputbox2"
								value="${dto.userTel }" readonly> <input type="button" class="info_btn"
								value="재인증">
						</div>
						<div class="main_subtitle">
							<span>직업</span> <span id="changtext"><a
								href="javascript:update();">수정</a></span>
						</div>

						<div style="margin-bottom: 20px;">
							<select name="selectJob" id="selectJob" class="main_inputbox_select" disabled>
								<option value="프리랜서">프리랜서</option>
								<option value="직장인">직장인</option>
								<option value="소상공인">소상공인</option>
								<option value="스타트업 창업자">스타트업 창업자</option>
								<option value="대학(원)생">대학(원)생</option>
								<option value="취업준비생">취업준비생</option>
							</select>
						</div>
						<div class="main_subtitle">
							<span>관심분야</span> <span><a>수정</a></span>
						</div>
						<div class="" style="margin-bottom: 20px;">
							<select name="userFor" class="main_inputbox_select">
								<option value="IT프로그래밍">IT프로그래밍</option>
								<option value="디자인">디자인</option>
								<option value="영상·사진·음향">영상·사진·음향</option>
								<option value="마케팅">마케팅</option>
								<option value="번역·통역">번역·통역</option>
								<option value="문서·글쓰기">문서·글쓰기</option>
								<option value="비즈니스컨설팅">비즈니스컨설팅</option>
								<option value="취업·투잡">취업·투잡</option>
								<option value="운세·상담">운세·상담</option>
								<option value="레슨·실무교육">레슨·실무교육</option>
								<option value="주문제작">주문제작</option>
							</select>
						</div>
						
						</div>
						</form>
					</div>
				

			</div>

		</div>
		
	</div>

</body>
</html>