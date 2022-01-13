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
<%-- <link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/css/created.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/css/article.css"/> --%>
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/css/list.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/css/style.css"/>
<script type="text/javascript">


	function sendIt(){
		var f = document.searchForm;
		f.action="<%=cp%>/gesi/listgesi.do";
		f.submit();
	}

</script>

</head>
<body>

<div id="bbsList">
	<div id="bbsList_title" style="background-color:rgba( 255, 212, 0, 1);">
<marquee behavior="alternate" width="400px;">1:1 문의게시판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.customInfo.userName }님</marquee> 
	</div>
	
	<div id="bbsList_header">
		<div id="leftHeader">
		<form action="" method="post" name="searchForm">
			<select name="searchKey" class="selectField">
				<option value="subject">제목</option>
				<option value="userID">작성자</option>
				<option value="num">번호</option>		
			</select>
			<input type="text" name="searchValue" class="textField">
			<input type="button" value=" 검 색 " class="btn2" onclick="sendIt();"/>
		
		</form>
	
		</div>
		
		<div id="rightHeader">
			<input type="button" value=" 홈 " class="btn2" onclick="history.back(-1);"/>
			<input type="button" value=" 글올리기 " class="btn2" onclick="location='<%=cp%>/gesi/createdgesi.do'"/>
		</div>	
	</div>
	
	
	<div id="bbsList_list">
		<div id="title">
			<dl>
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="userID">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		</div>
		
		
		
			<div id="lists">
			
			<c:forEach var="dto" items="${lists }">
			
			
			<dl>
				<dd class="num">${dto.num }</dd>
				<%--  --%>
				<dd class="subject"><form action=""method="post" name="checkID"><a href="${articleUrl}&num=${dto.num}" >${dto.subject }</a></form></dd>
				
				<dd class="userID">${dto.userID }</dd>
				<dd class="created">${dto.created }</dd>
				<dd class="hitCount">${dto.hitCount }</dd>
			</dl>
			</c:forEach>
		</div>
		
		<div id="footer">
			<p>
				<c:if test="${dataCount!=0 }">
					${pageIndexList }
				
				</c:if>
				
				<c:if test="${dataCount==0 }">
					등록된 게시물이 없습니다.
				
				</c:if>
			</p>
		</div>	
		
		
	</div>
	
	
	
</div>

</body>
</html>