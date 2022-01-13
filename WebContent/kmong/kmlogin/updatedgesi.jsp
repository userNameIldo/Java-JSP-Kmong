<%@ page contentType="text/html; charset=UTF-8"%>
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
<script type="text/javascript" src="<%=cp%>/kmong/js/util.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/kmong/css/created.css" />

<script type="text/javascript">
function sendIt(){
	
	var f = document.myForm;
	str = f.subject.value;
	str = str.trim();
	if(!str){
		alert("\n제목을 입력하세요");
		f.subject.focus();
		return;
	}
	f.subject.value = str;
	
	var f = document.myForm;
	str = f.userID.value;
	str = str.trim();
	if(!str){
		alert("\n아이디를 입력하세요(E-mail 형식)");
		f.userID.focus();
		return;
	}
	
	

	if(f.userID.value){
		if(!isValidEmail(f.userID.value)){
			alert("\n정상적인 이메일을 입력하세요");
			f.userID.focus();
			return;
		}
		
	}
	
	str  = f.content.value;
	str = str.trim();

	if(!str){
		alert("\n내용을 입력하세요");
		f.content.focus();
		return;
	}
	f.content.value = str;
	
	if(!confirm('게시글을 수정하시겠습니까?')){
		return false;
	}else{
		alert('수정을 완료하였습니다.');
		f.action= "<%=cp%>/gesi/updatedgesi_ok.do";
		f.submit();	
	}

	}
	function sendIt2(){
		alert("작성자 이름 변경불가");
		return;
	}
</script>

</head>
<body>


	<div id="bbs">
		<div id="bbs_title"
			style="background-color: rgba(255, 212, 0, 1); text-align: center;">문
			의 사 항</div>
		<form action="" method="post" name="myForm">
			<div id="bbsCreated">


				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
						<dd>
							<input type="text" name="subject" value="${dto.subject }"
								size="60" maxlength="100" class="boxTF" />
						</dd>
					</dl>
				</div>



				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>작 성 자</dt>
						<dd>
							<input type="text" name="userID" value="${dto.userID }" size="60"
								maxlength="50" class="boxTF" readonly="readonly" onclick="sendIt2();"/>
						</dd>
					</dl>
				</div>



				<div id="bbsCreated_content">
					<dl>
						<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
						<dd>
							<textarea rows="12" cols="63" name="content" class="boxTA">${dto.content }
 					</textarea>

						</dd>
					</dl>
				</div>



			</div>

			<div id="bbsCreated_footer">

				<input type="hidden" name="num" value="${dto.num}" /> <input
					type="hidden" name="pageNum" value="${pageNum }" /> <input
					type="hidden" name="searchKey" value="${searchKey }" /> <input
					type="hidden" name="searchValue" value="${searchValue }" /> <input
					type="button" value="수정하기" class="btn2" onclick="sendIt();" /> <input
					type="button" value="수정취소" class="btn2"
					onclick="location='<%=cp%>/gesi/listgesi.do?${params }'" />
			</div>
		</form>

	</div>

</body>
</html>