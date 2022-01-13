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
<title>문의하기</title>
<script type="text/javascript" src="<%=cp%>/kmong/js/util.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/css/created.css"/>



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
		alert("\n아이디를 입력하세요");
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
	
	if(!confirm('게시글을 등록하시겠습니까?')){
		return false;
	}else{
		f.action= "<%=cp%>/gesi/createdgesi_ok.do";
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

<div style="background-color:#FEEB83">
<header class="header" style="background-color:#FEEB83">
  <div class="logo">
    <a href=""location='<%=cp%>/gesi/listgesi.do'"><img src="//theme.zdassets.com/theme_assets/9204604/15e332c87d9d43e084f70ac3e783f86cf814cc14.png" class="logo-kmong"></a>
    <a title="홈" href="location='<%=cp%>/gesi/listgesi.do'">
    	<img src="//theme.zdassets.com/theme_assets/9204604/e7811e635667ca17c8278087aa8868d481a9a88c.png" class="cs">  
    </a>  
  </div>
 


</header> 
  

  
</div>



<div id="bbs">

 	<div id="bbs_title" style="background-color:rgba( 255, 212, 0, 1); text-align: center;">
 	문의 등록
 	</div>
 	<form action="" method="post" name="myForm">
 		<div id="bbsCreated">
 		
 		
 			<div class="bbsCreated_bottomLine">
 				<dl>
 					<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
 					<dd>
 					<input type="text" name="subject" size="60" maxlength="100"
 					class="boxTF"/>
 					</dd>
 				</dl>
 			</div>
 			
 			
 			
 			<div class="bbsCreated_bottomLine">
 				<dl>
 					<dt>아 이 디 (E-mail)</dt>
 					<dd>
 					<input type="text" name="userID" size="60" maxlength="50"
 					class="boxTF" value="${sessionScope.customInfo.userId }" readonly="readonly" onclick="sendIt2();"/>
 					</dd>
 				</dl>
 			</div>
 		
 			
 					
 			<div id="bbsCreated_content">
 				<dl>
 					<dt><br><br>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
 					<dd>
 					<textarea rows="15" cols="63"  name="content" class="boxTA"></textarea>
 					
 					</dd>
 				</dl>
 			</div>
 		
 			
 		</div>
 		
 		<div id="bbsCreated_footer">
 		 	<input type="button" style="font-weight: bold;" value="등록하기" class="btn2" onclick="sendIt();" />
 	 		<input type="reset" style="font-weight: bold;" value="다시입력" class="btn2" onclick="document.myForm.subject.focus();"/>
 			<input type="button" style="font-weight: bold;" value="작성취소" class="btn2" onclick="alert('게시판으로 이동합니다');location='<%=cp%>/gesi/listgesi.do'"/>
 		</div>
 	
 	</form>
 	
 	</div>

</body>
</html>