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
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/css/article2.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/css/style.css"/>
<script type="text/javascript">

</script>



<title>문의 게시판</title>
</head>
<body>


<div id="bbs">
		<div id="bbs_title" style="background-color: rgba( 255, 212, 0, 1);">문 의 게 시 판 </div>
		<div id="bbsArticle">
			<div id="bbsArticle_header">제&nbsp;&nbsp;&nbsp;&nbsp;목 : ${dto.subject }</div>

			<div class="bbsArticle_bottomLine">
				<dl>
					<dt>작성자</dt>
					<dd> ${dto.userID }</dd>
					<dt>줄수</dt>
					<dd>${lineSu }</dd>
				</dl>
			</div>


			<div class="bbsArticle_bottomLine">
				<dl>
					<dt>등록일</dt>
					<dd>${dto.created }</dd>
					<dt>조회수</dt>
					<dd>${dto.hitCount }</dd>
				</dl>
			</div>
			
			
			<div id="bbsArticle_content">
				<table width="600" border="0">
					<tr>
						<td style="padding: 20px 80px 20px 62px;"
						valign="top" height="200">${dto.content }</td>
					</tr>
				</table>
			</div>
	
		</div>
		
		
		
		<div id="bbsArticle_footer">
			<div id="leftFooter">
				<input type="button" value="수정" class="btn4" 
				onclick="location='<%=cp%>/gesi/updatedgesi.do?num=${dto.num }&${params }';"/>
				<input type="button" value="삭제" class="btn4" 
				 onclick="if(!confirm('게시글을 삭제하시겠습니까?')){return false;}
				 else{alert('삭제가 완료되었습니다.');location='<%=cp%>/gesi/deletedgesi_ok.do?num=${dto.num }&${params }'; }"/>
			</div>
			
			<div id="rightFooter">
				<input type="button" value="리스트" class="btn3" 
				onclick="location='<%=cp%>/gesi/listgesi.do?${params }';"/>
			</div>
			
			
		</div>


	</div>

</body>
</html>