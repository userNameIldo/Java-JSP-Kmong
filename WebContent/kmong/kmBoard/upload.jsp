<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String ctgNum = request.getParameter("ctgNum");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/css/created.css"/>
<style type="text/css">
body{
	
	margin: 0px;
	padding: 0px;

}

</style>
<!-- 카테고리 추가 작업 -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--  -->
<script type="text/javascript">

function sendIt() {
	
	var f=document.myForm;
	
	str = f.gdsName.value;
	str = str.trim();
	if(!str) {
		alert("\n제목을 입력하세요.")
		f.gdsName.focus();
		return;
		
	}
	f.gdsName.value = str;

	/*     사진 조건
	str = f.content.value;
	str = str.trim();
	
	if(!str) {
		alert("\n내용을 입력하세요");
		f.content.focus();
		return;
	}
	f.content.value = str;
	*/
	
	f.action = "<%=cp%>/km/upload_ok.do?ctgNum=<%=ctgNum%>";
	f.submit();
	
	
}

//카테고리 추가 작업
//카테고리 만들기
//대분류
var cates = false;

function update_selected() {
  $("#cate1").val(0);
  $("#cate1").find("option[value!=0]").detach();

  $("#cate1").append(cates.filter(".cate" + $(this).val()));
}

$(function() {
  cates = $("#cate1").find("option[value!=0]");
  cates.detach();

  $("#cate0").change(update_selected);
  $("#cate0").trigger("change");
});
//여기까지

</script>
</head>
<body>
<div style="background-color:#FEEB83">
<header class="header" style="background-color:#FEEB83">
  <div class="logo">
    <a href="<%=cp%>/kmoong/main.do"><img src="//theme.zdassets.com/theme_assets/9204604/15e332c87d9d43e084f70ac3e783f86cf814cc14.png" class="logo-kmong"></a>

  </div> 
</div>
<!-- <div style="background-color:#FEEB83">
<header class="header" style="background-color:#FEEB83">
  <div class="logo">
    <a href="" location="/study/gesi/listgesi.do" "=""><img src="//theme.zdassets.com/theme_assets/9204604/15e332c87d9d43e084f70ac3e783f86cf814cc14.png" class="logo-kmong"></a>
  
  </div> -->
 

<br><br>



<form action="" method="post"  name="myForm" 
enctype="multipart/form-data">

<table width="700" cellpadding="0" cellspacing="0"
align="center" style="margin: auto;background-color:rgba( 255, 212, 0, 1); border-radius: 5px;">
<tr height="40" style="">
	<td style="padding-left: 20px; text-align: center;" >
	<b>판 매 등 록</b>
	</td>
</tr>
</table>
<br>

<table width="700" border="0" cellpadding="3" cellspacing="0" align="center" style="margin: auto;">
<tr><td colspan="2" height="3" style="background-color:rgba( 255, 212, 0, 1); border-radius: 5px;" align="center" ></td></tr>

<tr>

	<td width="20%" height="30" style="background-color:#FEEB83" align="center" >
	제&nbsp;&nbsp;목 
	</td>
	<td width="80" style="padding-left: 10px;" colspan="2">
	<input type="hidden" name="gdsNum">
	<input type="text" name="gdsName" class="boxTF" size="69" maxlength="50" class="boxTF" style="margin: auto; border-radius: 5px; width: 99%;" >
	</td>
</tr>	
<tr><td colspan="2" height="1" style="background-color:rgba( 255, 212, 0, 1); border-radius: 5px;" ></td></tr>

<tr>

	<td width="20%" height="30" style="background-color:#FEEB83" align="center">
	제품 사진 
	</td>
	
	<td width="80" style="padding-left: 10px;" colspan="2">
	<input type="file" size="69" value=" 찾아보기 " name="upload"><br>
	</td>
</tr>
	
<tr><td colspan="2" height="1" style="background-color:rgba( 255, 212, 0, 1); border-radius: 5px;" ></td></tr>
<tr>

	<td width="20%" height="30" style="background-color:#FEEB83" align="center" >
	제품 단가
	</td>
	<td width="80" style="padding-left: 10px;" colspan="2">
	<input type="text" name="gdsPrice" placeholder="숫자로 입력하세요" size="20" maxlength="20" class="boxTF" style="margin: auto; border-radius: 5px; width: 99%;" >
	</td>
</tr>	
<tr><td colspan="2" height="1" style="background-color:rgba( 255, 212, 0, 1); border-radius: 5px;" ></td></tr>

<tr>

	<td width="20%" height="30" style="background-color:#FEEB83" align="center" >
	제품   설명 
	</td>
	<td width="80" style="padding-left: 10px;" colspan="2">
	<textarea rows="12" cols="63" name="gdsDes" class="boxTA" style="border-radius: 5px; width: 99%;"></textarea>
	</td>
</tr>	
<tr><td colspan="2" height="1" style="background-color:rgba( 255, 212, 0, 1); border-radius: 5px;" ></td></tr>

<tr>

	<td width="20%" height="30" style="background-color:#FEEB83" align="center" >
	제품군
	</td>
	<td width="80" style="padding-left: 10px;" colspan="2" >
	<!-- 카테고리 추가 작업 -->
	<label>대분류</label>
		<select id="cate0" name="cateCode" class="boxTF">
			<option value="">카테고리 선택</option>
			<option value="1">디자인</option>
			<option value="2">IT·프로그래밍</option>
			<option value="3">영상·사진·음향</option>
			<option value="4">마케팅</option>
			<option value="5">번역·통역</option>
			<option value="6">문서·글쓰기</option>
			<option value="7">비즈니스컨설팅</option>
			<option value="8">취업·투잡</option>
			<option value="9">운세·상담</option>
			<option value="10">레슨·실무교육</option>
			<option value="11">주문제작</option>
		</select>
		<label>중분류</label>
		<select id="cate1" name="subCate" class="boxTF">
			<option value="0">선택</option>
			<option value="로고·브랜딩" class="cate1">로고·브랜딩</option>
			<option value="상세·이벤트페이지" class="cate1">상세·이벤트페이지</option>
			<option value="인쇄·홍보물" class="cate1">인쇄·홍보물</option>
			<option value="PPT·인포그래픽" class="cate1">PPT·인포그래픽</option>
			<option value="웹·모바일 디자인" class="cate1">웹·모바일 디자인</option>
			<option value="패키지 디자인" class="cate1">패키지 디자인</option>
			<option value="일러스트·캐리커쳐" class="cate1">일러스트·캐리커쳐</option>
			<option value="웹툰·캐릭터·이모티콘" class="cate1">웹툰·캐릭터·이모티콘</option>
			<option value="블로그·SNS·썸네일" class="cate1">블로그·SNS·썸네일</option>
			<option value="포토샵·파일변환" class="cate1">포토샵·파일변환</option>
			<option value="제품·3D프린팅" class="cate1">제품·3D프린팅</option>
			<option value="공간디자인" class="cate1">공간디자인</option>
			<option value="북·앨범디자인" class="cate1">북·앨범디자인</option>
			<option value="캘리그라피·폰트" class="cate1">캘리그라피·폰트</option>
			<option value="게임·VR" class="cate1">게임·VR</option>
			<option value="의류디자인" class="cate1">의류디자인</option>
			<option value="간판·시공" class="cate1">간판·시공</option>
			<option value="기타" class="cate1">기타</option>
			<option value="파견·상주" class="cate1">파견·상주</option>
			
			<option value="기획" class="cate2">기획</option>
			<option value="워드프레스" class="cate2">워드프레스</option>
			<option value="웹사이트 개발" class="cate2">웹사이트 개발</option>
			<option value="쇼핑몰·커머스" class="cate2">쇼핑몰·커머스</option>
			<option value="모바일 앱" class="cate2">모바일 앱</option>
			<option value="프로그램 개발" class="cate2">프로그램 개발</option>
			<option value="임베디드 HW·SW" class="cate2">임베디드 HW·SW</option>
			<option value="게임" class="cate2">게임</option>
			<option value="데이터베이스" class="cate2">데이터베이스</option>
			<option value="데이터분석·리포트" class="cate2">데이터분석·리포트</option>
			<option value="블록체인" class="cate2">블록체인</option>
			<option value="보안" class="cate2">보안</option>
			<option value="서버·호스팅" class="cate2">서버·호스팅</option>
			<option value="QA·호스팅" class="cate2">QA·호스팅</option>
			<option value="기술지원" class="cate2">기술지원</option>
			<option value="파일변환" class="cate2">파일변환</option>
			<option value="챗봇" class="cate2">챗봇</option>
			<option value="기타" class="cate2">기타</option>
			<option value="파견·상주" class="cate2">파견·상주</option>
			
			<option value="영상촬영·편집" class="cate3">영상촬영·편집</option>
			<option value="유튜브 제작" class="cate3">유튜브 제작</option>
			<option value="온라인 생중계" class="cate3">온라인 생중계</option>
			<option value="드론 촬영" class="cate3">드론 촬영</option>
			<option value="애니메이션" class="cate3">애니메이션</option>
			<option value="3D·VR" class="cate3">3D·VR</option>
			<option value="인트로·로고" class="cate3">인트로·로고</option>
			<option value="영상 자막" class="cate3">영상 자막</option>
			<option value="영상 템플릿" class="cate3">영상 템플릿</option>
			<option value="사진촬영" class="cate3">사진촬영</option>
			<option value="사진·영상 보정" class="cate3">사진·영상 보정</option>
			<option value="성우" class="cate3">성우</option>
			<option value="음악·사운드" class="cate3">음악·사운드</option>
			<option value="모델·MC·공연" class="cate3">모델·MC·공연</option>
			<option value="스튜디오 렌탈" class="cate3">스튜디오 렌탈</option>
			<option value="기타" class="cate3">기타</option>
			
			<option value="블로그 마케팅" class="cate4">블로그 마케팅</option>
			<option value="카페 마케팅" class="cate4">카페 마케팅</option>
			<option value="SNS 마케팅" class="cate4">NS 마케팅</option>
			<option value="쇼핑몰·스토어" class="cate4">쇼핑몰·스토어</option>
			<option value="체험단·기자단 대행" class="cate4">체험단·기자단 대행</option>
			<option value="웹 트래픽" class="cate4">웹 트래픽</option>
			<option value="언론홍보" class="cate4">언론홍보</option>
			<option value="종합광고대행" class="cate4">종합광고대행</option>
			<option value="검색최적화·SEO" class="cate4">검색최적화·SEO릿</option>
			<option value="지도등록·홍보" class="cate4">지도등록·홍보</option>
			<option value="앱마케팅" class="cate4">앱마케팅</option>
			<option value="라이브커머스" class="cate4">라이브커머스</option>
			<option value="개인 인플루언서" class="cate4">개인 인플루언서</option>
			<option value="키워드·배너광고" class="cate4">키워드·배너광고</option>
			<option value="포털질문·답변" class="cate4">포털질문·답변</option>
			<option value="마케팅 컨설팅" class="cate4">마케팅 컨설팅</option>
			<option value="영상 마케팅" class="cate4">영상 마케팅</option>
			<option value="오프라인광고" class="cate4">오프라인광고</option>
			<option value="해외마케팅" class="cate4">해외마케팅</option>
			<option value="브랜드마케팅" class="cate4">브랜드마케팅</option>
			<option value="기타" class="cate4">기타</option>
			
			<option value="산업별 전문번역" class="cate5">블로그 마케팅</option>
	        <option value="일반 번역" class="cate5">일반 번역</option>
	        <option value="통역" class="cate5">통역</option>
	        <option value="영상번역" class="cate5">영상번역</option>
	        <option value="감수" class="cate5">감수</option>
	        <option value="번역공증대행" class="cate5">번역공증대행</option>
			
			<option value="기업명·네이밍" class="cate6">기업명·네이밍</option>
			<option value="제품 카피라이팅" class="cate6">제품 카피라이팅</option>
			<option value="광고 카피라이팅" class="cate6">광고 카피라이팅</option>
			<option value="마케팅 글작성" class="cate6">마케팅 글작성</option>
			<option value="보도자료" class="cate6">보도자료팅</option>
			<option value="산업별 전문 글작성" class="cate6">산업별 전문 글작성</option>
			<option value="타이핑(영상)" class="cate6">타이핑(영상)</option>
			<option value="타이핑(문서)" class="cate6">타이핑(문서)</option>
			<option value="책·시나리오" class="cate6">책·시나리오</option>
			<option value="논문" class="cate6">논문</option>
			<option value="교정·교열 첨삭" class="cate6">교정·교열 첨삭</option>
			<option value="맞춤양식" class="cate6">맞춤양식</option>
			<option value="기타" class="cate6">기타</option>
			
			<option value="사업계획서·투자제안서" class="cate7">사업계획서·투자제안서</option>
			<option value="퍼스널 브랜딩" class="cate7">퍼스널 브랜딩</option>
			<option value="유튜브 컨설팅" class="cate7">유튜브 컨설팅</option>
			<option value="창업 컨설팅" class="cate7">창업 컨설팅</option>
			<option value="쇼핑몰·스토어 창업" class="cate7">쇼핑몰·스토어 창업</option>
			<option value="크라우드펀딩" class="cate7">크라우드펀딩</option>
			<option value="해외사업 컨설팅" class="cate7">해외사업 컨설팅</option>
			<option value="리서치·설문조사" class="cate7">리서치·설문조사</option>
			<option value="법률·법무" class="cate7">법률·법무</option>
			<option value="인사·노무" class="cate7">인사·노무</option>
			<option value="특허·IP" class="cate7">특허·IP</option>
			<option value="세무회계" class="cate7">세무회계</option>
			<option value="업무지원·CS" class="cate7">업무지원·CS</option>
			<option value="기타" class="cate7">기타</option>
			
			<option value="직무 멘토링" class="cate8">직무 멘토링</option>
			<option value="자소서·이력서(국내기업)" class="cate8">자소서·이력서(국내기업)</option>
			<option value="자소서·이력서(외국계)" class="cate8">자소서·이력서(외국계)</option>
			<option value="자소서(입시·기타)" class="cate8">자소서(입시·기타)</option>
			<option value="인적성·NCS필기" class="cate8">인적성·NCS필기</option>
			<option value="면접·커리어 컨설팅" class="cate8">면접·커리어 컨설팅</option>
			<option value="유학생 국내취업 컨설팅" class="cate8">유학생 국내취업 컨설팅</option>
			<option value="N잡・주식・재테크" class="cate8">N잡・주식・재테크</option>
			<option value="전자책·노하우" class="cate8">전자책·노하우</option>
			
			<option value="신점" class="cate9">신점</option>
			<option value="사주·운세" class="cate9">사주·운세</option>
			<option value="타로" class="cate9">타로</option>
			<option value="작명" class="cate9">작명</option>
			<option value="심리상담" class="cate9">심리상담</option>
			<option value="심리검사" class="cate9">심리검사</option>
			<option value="연애상담" class="cate9">연애상담</option>
			<option value="여행·생활" class="cate9">여행·생활</option>
			<option value="기타" class="cate9">기타</option>
			
			<option value="크몽 아카데미" class="cate10">크몽 아카데미</option>
			<option value="프로그래밍" class="cate10">프로그래밍</option>
			<option value="데이터분석" class="cate10">데이터분석</option>
			<option value="마케팅" class="cate10">마케팅</option>
			<option value="그래픽디자인" class="cate10">그래픽디자인</option>
			<option value="영상" class="cate10">영상</option>
			<option value="사진" class="cate10">사진</option>
			<option value="외국어(영어)" class="cate10">외국어(영어)</option>
			<option value="외국어(기타 언어)" class="cate10">외국어(기타 언어)</option>
			<option value="PPT·프레젠테이션" class="cate10">PPT·프레젠테이션</option>
			<option value="입시·학업" class="cate10">입시·학업</option>
			<option value="취미·라이프" class="cate10">취미·라이프</option>
			<option value="기타" class="cate10">기타</option>
			
			<option value="인쇄" class="cate11">인쇄</option>
			<option value="간판" class="cate11">간판</option>
			<option value="3D프린팅" class="cate11">3D프린팅프</option>
			<option value="가게용품 제작" class="cate11">가게용품 제작</option>
			<option value="기념품 제작" class="cate11">기념품 제작</option>
			<option value="모형 제작" class="cate11">모형 제작</option>
			<option value="제품 제작" class="cate11">제품 제작</option>
			<option value="시스템 제작" class="cate11">시스템 제작</option>
			<option value="인테리어 시공" class="cate11">인테리어 시공</option>
			<option value="패키지 제작" class="cate11">패키지 제작</option>
			<option value="기타" class="cate11">기타</option>
			
		</select>
		<!-- 여기까지 -->
	
	</td>

</tr>	
<tr><td colspan="2" height="1" style="background-color:rgba( 255, 212, 0, 1); border-radius: 5px;"></td></tr>

<tr>

	<td width="20%" height="30" style="background-color:#FEEB83" align="center" >
	파는 물품
	</td>
	<td width="80" style="padding-left: 10px;" colspan="2">
	<input type="text" name="gdsSell" size="30" maxlength="20" class="boxTF" style="margin: auto; border-radius: 5px; width: 99%;" >
	</td>
</tr>	
<tr><td colspan="2" height="1" style="background-color:rgba( 255, 212, 0, 1); border-radius: 5px;" ></td></tr>

<tr>

	<td width="20%" height="30" style="background-color:#FEEB83" align="center" >
	작업 기간
	</td>
	<td width="80" style="padding-left: 10px;" colspan="2">
	<input type="text" placeholder="숫자로 입력하세요" name="workDate" size="20" maxlength="10"  class="boxTF" style="margin: auto; border-radius: 5px; width: 99%;" >
	
	
	</td>
</tr>	
<tr><td colspan="2" height="1" style="background-color:rgba( 255, 212, 0, 1); border-radius: 5px;" ></td></tr>




</table>
<br>

<table width="560" border="0" cellpadding="3" cellspacing="0" style="margin: auto;">
<tr align="center">
	<td height="40">
	<input type="button" value=" 등록하기 " class="btn10" onclick="sendIt();">
	<input type="reset" value=" 다시입력 " class="btn10" 
	onclick="document.myForm.gdsName.focus();">
	<input type="button" value=" 등록취소 " class="btn10" 
	onclick="history.back();">
	</td>	
</tr>
</table>
</form>



</body>
</html>