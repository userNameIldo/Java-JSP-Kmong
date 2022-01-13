<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
		request.setCharacterEncoding("UTF-8");
		String cp= request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>



<style>

select {
width: 200px;
padding: .8em .5em;
border: 1px solid #999;
background: url('arrow.jpg') no-repeat 95% 50%;
border-radius: 0px; 

}

select::-ms-expand {
    display: none;
}


.css-boxAG {
    padding: 16px;
    border: 1px solid rgb(228, 229, 237);
    border-radius: 4px;
    margin-bottom: 20px;
}

.Cinput_box {
    height: 52px;
    line-height: 52px;
    display: block;
    width: 300px;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #e6e6e6;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 6px;
    border-color: rgb(206, 206, 206);
    margin-bottom: 8px;
}


.css-btnbox {
    outline: none;
    border-width: 1px;
    border-style: solid;
    box-sizing: border-box;
    border-radius: 4px;
    line-height: 1;
    font-weight: 500;
    transition: background-color 0.3s ease 0s, border-color 0.3s ease 0s;
    display: inline-flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    cursor: pointer;
    position: relative;
    user-select: none;
    white-space: nowrap;
    max-width :100%;
    height: 52px;
    font-size: 16px;
    font-weight: 500;
    padding: 0px 50px;
    min-width: 80px;
    background-color: rgb(255, 212, 0);
    border-color: rgb(255, 212, 0);
    color: rgb(48, 52, 65);
}


.css-agree {
    font-size: 14px;
    color: rgb(114, 117, 133);
    margin-bottom: 4px;
    cursor: pointer;
}

.css-seller{
    font-size: 15px;
    padding-bottom: 16px;
    border-bottom: 1px solid rgb(228, 229, 237);
    cursor: pointer;
}

.css-font {
    font-size: 16px;
    color: #555969;
    margin-bottom: 8px;
    position: relative;
}



* {
    font-family: 'Metro Sans',sans-serif;
    box-sizing: border-box;
}

</style>


<script type="text/javascript">

	function sendIt() {
		
		var f= document.myForm;
		   var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		
		str=f.userId.value;
		str=str.trim();
		
		
		if(!str){
			alert("아이디를 입력해주세요");
			f.userId.focus();
			return;
			
		}
		
        if (regex.test(str) == false) {
            alert("잘못된 이메일 형식입니다.");
            f.userId.focus();
            return ;
        }
		
		f.userId.value=str;
		
		
		str=f.userName.value;
		str=str.trim();
		
		if(!str){
			alert("이름을 입력해주세요");
			f.userName.focus();
			return;
		}
		
	
		
		f.userName.value=str;
		
		str=f.userPwd.value;
		str=str.trim();
		
		if(!str){
			alert("비밀번호를 입력하세요");
			f.userPwd.focus();
			return;
		}
		
		str1=f.userPwd2.value;
		str1=str1.trim();
		
		if(str!=str1){
			alert("비밀번호가 일치하지 않습니다.");
			f.userPwd.focus();
			return;
		}
	
		
		f.userPwd.value=str;
		
		str=f.userTel.value;
	
		
		if(!str){
			alert("전화번호를 입력하세요");
			f.userTel.focus();
			return; 
		}
		
		if(str.length!=11){
			alert("전화번호는 11자리 입니다.");
			f.userTel.focus();
			return;
		}
		
		f.userTel.value=str;
		
		str=f.userJob.value;
		
		if(!str){
			alert("직업을 선택해주세요");
			return; 
		}
		
		f.userJob.value=str;
		
		str=f.userFor.value;
		
		if(!str){
			alert("관심사를 선택해주세요");
			return;
		}
	
		f.userFor.value=str;
		
		
		f.action="<%=cp%>/kmoong/created_ok.do";
		f.submit();
		
	}

	

</script>

</head>
<body>

<h1 align="center"><img src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/pages/main/kmong_logo.png" 
alt="프리랜서 마켓 No.1, 크몽" width="108" height="28"  ></h1>

<div align="center">
	<form action="" method="post" name="myForm">
		<h1><font size="4">회원가입</font></h1>
			<div>
				<div class="css-font">
					<dl>
						<dt>아이디</dt>
							<input type="text" name="userId" class="Cinput_box"
							maxlength="20" placeholder="이메일 형식으로 아이디를 입력해주세요" />		
					</dl>
				</div>

				<div class="css-font">
					<dl>
						<dt class="css-font">비밀번호</dt>
							<input type="password" name="userPwd" class="Cinput_box" placeholder="비밀번호를 입력해주세요"  />
					</dl>
	
					<dl>
							<input type="password" name="userPwd2" class="Cinput_box" placeholder="비밀번호를 한번 더 입력해주세요" />
					</dl>
				</div>
				
				<div class="css-font">
					<dl>
						<dt>이름</dt>
							<input type="text" name="userName" class="Cinput_box" placeholder="이름을 입력해주세요" />
					</dl>
				</div>
				<div class="css-font">
					<dl>
						<dt>전화번호</dt>
							<input type="text" name="userTel" class="Cinput_box" placeholder="전화번호를 입력해주세요" />
					</dl>
				</div>


				<div class="css-font">
					<dl>
						<dt>직업</dt>
							<select name="userJob" class="Cinput_box">
								<option value="">직업을 선택해주세요</option>
								<option value="프리랜서">프리랜서</option>
								<option value="대학(원)생">대학(원)생</option>
								<option value="직장인">직장인</option>
								<option value="소상공인">소상공인</option>
								<option value="스타트업 창업자">스타트업 창업자</option>
								<option value="취업준비생">취업준비생</option>
							</select>
					</dl>
				</div>

				<div class="css-font">
					<dl>
						<dt>관심사 선택</dt>
							<select name="userFor" class="Cinput_box">
								<option value="">관심사를 선택해주세요</option>
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
					</dl>
				</div>
				
				<div>
					<dl>
						<p>내 전문성을 판매하고 싶다면 ?</p>
						<input type="checkbox" name="sellUser" value="SellUser"  class="css-seller" /><b> 전문가로 가입 </b><br/>
					</dl>
				</div>
	
	

				<div class="css-boxAG">
					<div class="css-agree">
				  		 <input type="checkbox" name="select"><font color=" #727585">만 14세 이상입니다.&nbsp;&nbsp;&nbsp;&nbsp;</font><br/>
				  		 <input type="checkbox" name="select" ><font color=" #727585">서비스 이용약관에 동의합니다.&nbsp;&nbsp;&nbsp;</font><br/>
				  		 <input type="checkbox" name="select"><font color=" #727585">개인정보 수집/이용에 동의합니다.&nbsp;&nbsp;</font><br/>
				  		 <input type="checkbox" name="select"><font color=" #727585">이벤트 할인 혜택 알림 수신에 동의합니다.</font><br/>										
						 <input type="checkbox" name="select"><font color=" #727585">장기 미접속 시 계정 활성 상태 유지합니다.</font><br/>
					</div>
				</div>
			
				

			</div>

			<div align="center">
				<input type="button" value=" 버튼만 누르면 가입완료 ! " class="css-btnbox" onclick="sendIt();" />
			</div>
	</form>
	
</div>
</body>
</html>