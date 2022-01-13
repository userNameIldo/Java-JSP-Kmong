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
<title>크몽 리스트</title>

<style type="text/css">
.header_login_btn1{
	outline-color: initial;
    outline-style: none;
    outline-width: initial;
    
    border-top-width: 1px;
    border-right-width: 1px;
    border-bottom-width: 1px;
    border-left-width: 1px;
    
    border-top-style: solid;
    border-right-style: solid;
    border-bottom-style: solid;
    border-left-style: solid;
    
    box-sizing: border-box;
   
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
	
	line-height: 1;
    font-weight: 500;
	
	text-decoration: none;
	    
	display: inline-flex;
	
	align-items: center;
	
	justify-content: center;
    cursor: pointer;
    position: relative;
    
    white-space: nowrap;
    max-width: 100%;
    height: 42px;
    font-size: 15px;

    padding-top: 0px;
    padding-right: 22px;
    padding-bottom: 0px;
    padding-left: 22px;
    
    min-width: 64px;
    background-color: transparent;
    border-color: transparent;
    color: #303441;
    margin-right: 4px;
	
	
	
	
	
	
}


.header_login_f1{
	line-height: 1;
    font-weight: 500;
    cursor: pointer;
    white-space: nowrap;
    font-size: 15px;
	color: #303441;
}

.header_login_btn2{
	outline-color: initial;
    outline-style: none;
    outline-width: initial;
    
    border-top-style: solid;
    border-right-style: solid;
    border-bottom-style: solid;
    border-left-style: solid;
    
    box-sizing: border-box;
   
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
    
    line-height: 1;
    font-weight: 500;
    
    text-decoration: none;
    
    display: inline-flex;
        
    align-items: center;
    
    justify-content: center;
    cursor: pointer;
    position: relative;
    
    white-space: nowrap;
    max-width: 100%;
    height: 42px;
    font-size: 15px;
    
    padding-top: 0px;
    padding-right: 22px;
    padding-bottom: 0px;
    padding-left: 22px;
    min-width: 64px;
    background-color: transparent;
    
    border-top-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    border-left-color: transparent;
    color: #303441;
    margin-right: 16px;
}

.header_login_btn3{
	
	outline-color: initial;
    outline-style: none;
    outline-width: initial;
    
    border-top-width: 1px;
    border-right-width: 1px;
    border-bottom-width: 1px;
    border-left-width: 1px;
    
    border-top-style: solid;
    border-right-style: solid;
    border-bottom-style: solid;
    border-left-style: solid;
    box-sizing: border-box;
    
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
    line-height: 1;
    font-weight: 500;

	text-decoration: none;
	
	display: inline-flex;
	
	align-items: center;
	
	justify-content: center;
    cursor: pointer;
    position: relative;
    
    white-space: nowrap;
    max-width: 100%;
    height: 42px;
    font-size: 15px;
    
    padding-top: 0px;
    padding-right: 22px;
    padding-bottom: 0px;
    padding-left: 22px;
    min-width: 64px;
    background-color: #ffd400;
    
    border-top-color: rgb(255, 212, 0);
    border-right-color: rgb(255, 212, 0);
    border-bottom-color: rgb(255, 212, 0);
    border-left-color: rgb(255, 212, 0);
    color: #303441;
}



</style>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/kmong/css/list2.css" />
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/kmong/css/style.css" />
	
	<script type="text/javascript">
	function search(){
		
		var f = document.searchform;
		f.action="<%=cp%>/km/list2.do";
		f.submit();
		
	}
	
	
	</script>

</head>
<body>

	<div id="bbsList">
		<div id="bbsList_title">
			<div class="bbsList_category_image">
					<a href="<%=cp%>/kmoong/main.do">
					<img
						src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/pages/main/kmong_logo.png"
						alt="프리랜서 마켓 No.1, 크몽" width="92" height="23" loading="eager">
					</a>
			</div>

			<div id="bbsList_header">
			
			
				<form action="" name="searchform" method="post">
			<div>
				<input type="hidden" name = "searchKey" value="${ctgNum }" />
				<input type="hidden" name = "ctgNum" value="${ctgNum }" />
					<input type="text" name="searchValue" class="searchform1"
						placeholder=" 검색어를 입력하세요" align="right">
						<input type="button" value="검색" onclick="search();" style="width: 75px; height:42px; background-color:white;  border: 1px solid #c8cad2;">
						<c:choose>
							<c:when test="${dto2.sellUser == 'SellUser' }">
								<input type="button" value="등록하기" onclick="location.href='<%=cp %>/km/upload.do?ctgNum=${ctgNum}';" style="width: 75px; height:42px; background-color:white;  border: 1px solid #c8cad2;">
							</c:when>
						</c:choose>
						<div class="dropdown"style="float: right;">
						<c:choose>
							<c:when test="${empty sessionScope.customInfo.userId }">
								<button class="header_login_btn1">
								<span class="header_login_f1">전문가 등록</span>
								</button>
								
									
										<a href="<%=cp%>/kmoong/login.do" class=""style="margin-right: 30px;">
											<span class="header_login_f1">로그인</span>
										</a>
								
										<a href="<%=cp%>/kmoong/created.do" class=""> <span class="header_login_btn3">무료
										회원가입</span>
										</a>
							</c:when>
							<c:otherwise>
								<button class="dropbtn_1" style="width: 42px; height: 42px;">
										<img alt="원숭이" src="${imagePath2 }/${dto2.profileImg}"style="width: 45px; height: 45px; border-radius: 50%">
								</button>
									<div class="dropdown-content" style="font-size: 14px; line-height:1.4;">
										<ul>
											<a href="<%=cp%>/kmoong/myInfo.do">계정설정</a>
											<a href="<%=cp%>/kmoong/changePwd.do">비밀번호 변경</a>
											<a href="<%=cp%>/kmoong/deleteId.do.do">회원탈퇴</a>
											<a href="<%=cp%>/kmoong/logout.do">로그아웃</a>
				
										</ul>
									</div>
							</c:otherwise>
							</c:choose>	
					</div>
				
				</div>		
				</form>


			</div>
			<!-- <form action="" class="searchform">
				<p>
					<input type="button" name="message" class="searchform1"
						align="right">
				</p>
			</form> -->
<%-- 
			<input type="button" value=" 게시물 등록 "
				onclick="javascript:location.href='<%=cp%>/km/upload.do?ctgNum=${ctgNum }'"
				class="btn2" /> --%>
				
		</div>

		<div id="bbsList_header">
			<form action="" method="post" name="searchForm">
				<!-- <div id="menu">
					<ul class="main1">
						<li><a href="#">메뉴1</a>
							<ul class="main2">
								<li><a href="#">소메뉴1</a></li>
								<li><a href="#">소메뉴2</a>
									<ul class="main3">
										<li><a href="#">2단소메뉴1</a></li>
										<li><a href="#">2단소메뉴2</a></li>
										<li><a href="#">2단소메뉴3</a></li>
									</ul></li>
								<li><a href="#">소메뉴3</a>
									<ul class="main3">
										<li><a href="#">2단소메뉴4</a></li>
										<li><a href="#">2단소메뉴5</a></li>
										<li><a href="#">2단소메뉴6</a></li>
									</ul></li>
							</ul></li>
					</ul>
				</div> -->
				<div class="dropdown">
					<button class="dropbtn">전체카테고리</button>
					<div class="dropdown-content">
						<ul>
							<a href="<%=cp %>/km/list2.do?ctgNum=1">디자인</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=2">IT 프로그래밍</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=3">영상,사진,음향</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=4">마케팅</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=5">번역,통역</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=6">문서,글쓰기</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=7">비즈니스컨설팅</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=8">취업,투잡</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=9">운세,상담</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=10">레슨,실무교육</a>
							<a href="<%=cp %>/km/list2.do?ctgNum=11">주문제작</a>

						</ul>
					</div>
				</div>


				<%-- <select name="searchKey" class="selectField">
					<option value="category">전체카테고리</option>

					<option value="category1"
						onclick="javascript:location.href='<%=cp%>';">디자인</option>
					<option value="category2"
						onclick="javascript:location.href='<%=cp%>';">IT 프로그래밍</option>
					<option value="category3"
						onclick="javascript:location.href='<%=cp%>';">영상,사진,음향</option>
					<option value="category4"
						onclick="javascript:location.href='<%=cp%>';">번역,통역</option>
					<option value="category5"
						onclick="javascript:location.href='<%=cp%>';">문서,글쓰기</option>
					<option value="category6"
						onclick="javascript:location.href='<%=cp%>';">비즈니스컨설팅</option>
					<option value="category7"
						onclick="javascript:location.href='<%=cp%>';">취업,투잡</option>
					<option value="category8"
						onclick="javascript:location.href='<%=cp%>';">운세,상담</option>
					<option value="category9"
						onclick="javascript:location.href='<%=cp%>';">레슨,실무교육</option>
					<option value="category10"
						onclick="javascript:location.href='<%=cp%>';">주문제작</option>
				</select>  --%>
				<a color="secondary" href="./prime" class="sideCategorie" id="bbsList_sub3" 
						style="margin: 0 0 0 20px; position: relative; display: inline-block;">Prime</a>
						<a color="secondary" href="./prime" class="sideCategorie" id="bbsList_sub3"
						style="margin: 0 0 0 20px;">엔터프라이즈</a>
						<a color="secondary" href="./prime" class="sideCategorie" id="bbsList_sub3"
						style="margin: 0 0 0 20px;">머니+</a>
		


			</form>

		</div>
		<hr id="greyrule" />

		<div id="bbsList_category">
			<div id="category_left1"> 
				<div id="bbsList_decategory">
					<h1 class="bbsList_decategory1">${dto3.category }</h1>
				</div>

				<div id="bbsList_smcategory">
					<div id="bbsList_category_image">
						<img src="	https://d2v80xjmx68n4w.cloudfront.net/assets/government-support/government_support_banner.jpg" width="200px" height="81px"
							onclick="javascript:location.href='<%=cp%>';">
					</div>

				</div>
				<div id="category_left1_1">
					<div id="category_left1_1_1">
						<div class="category_left1_1_1_1">
							
						<c:forEach var="dto" items="${lists3 }" varStatus="status">
					
							<div>${dto.subCate }</div>

					
						</c:forEach>
						
							<!-- 
							<div onclick="javascript:location.href='<%=cp%>';">로고,브랜딩</div>

							<div onclick="javascript:location.href='<%=cp%>';">상세·이벤트페이지</div>
							<div onclick="javascript:location.href='<%=cp%>';">인쇄·홍보물</div>
							<div onclick="javascript:location.href='<%=cp%>';">PPT·인포그래픽</div>
							<div onclick="javascript:location.href='<%=cp%>';">웹·모바일
								디자인</div>
							<div onclick="javascript:location.href='<%=cp%>';">패키지 디자인</div>
							<div onclick="javascript:location.href='<%=cp%>';">일러스트·캐리커쳐</div>
							<div onclick="javascript:location.href='<%=cp%>';">웹툰·캐릭터·이모티콘</div>
							<div onclick="javascript:location.href='<%=cp%>';">블로그·SNS·썸네일</div>
							<div onclick="javascript:location.href='<%=cp%>';">포토샵·파일변환</div>
							<div onclick="javascript:location.href='<%=cp%>';">제품·3D프린팅</div>
							<div onclick="javascript:location.href='<%=cp%>';">공간디자인</div>
							<div onclick="javascript:location.href='<%=cp%>';">북·앨범디자인</div>
							<div onclick="javascript:location.href='<%=cp%>';">캘리그라피·폰트</div>
							<div onclick="javascript:location.href='<%=cp%>';">북·게임·VR</div>
							<div onclick="javascript:location.href='<%=cp%>';">의류디자인</div>
							<div onclick="javascript:location.href='<%=cp%>';">북·간판·시공</div>
							<div onclick="javascript:location.href='<%=cp%>';">기타</div>
							<div onclick="javascript:location.href='<%=cp%>';">북·파견·상주</div>
 							-->
						</div>
					</div>


				</div>
			</div>





		</div>
		<div id="bbsList_category1">	
				<div class="ctg" style="display:flex; color: #c8cad2; font-size: 13px; display: block; font-family: 'Metro Sans',sans-serif;  box-sizing: border-box;" ></div>
			 		
			 		<a href="<%=cp%>kmong/kmmain/kmmain.jsp" 
			 		 style="padding: 0 4px; color: #9a9ba7; font-size: 13px; text-decoration: none;
			 		 background-color: transparent; float: left;">홈</a>
				
				<div class="side" style="color: #c8cad2; font-size: 13px; float: left; display: block;">></div>
				
					<a href="" 
			 		 style="padding: 0 4px; color: #9a9ba7; font-size: 13px; text-decoration: none;
			 		background-color: transparent;">${dto3.category }</a>
				
				
				
						
			<div id="bbsList_category2">
				
				
				

				<c:forEach var="dto" items="${lists }" varStatus="status">
					
					<div id="bbsList_category3">

						<div id="bbsList_category4">
						<a href="${articleUrl}&gdsNum=${dto.gdsNum}">
						<img src="${imagePath }/${dto.gdsImg}" width="216px"
								height="161px"></a>
						</div>
						<div id="bbsList_category5">
							${dto.gdsName }
						</div>
						

						<div id="bbsList_category5" style="text-align: right;">
							${dto.gdsPrice } &nbsp;원
						</div>

					</div>

					
				</c:forEach>
				<%-- <c:choose>
					<c:when test="${dataCount % 3 == 2 }">
						<div id="bbsList_category3"></div> 
						
					</c:when>
					<c:when test="${dataCount % 3 == 1 }">
							<div id="bbsList_category3"></div> 
					</c:when>
					

				</c:choose> --%>

				


			</div>
			
			<div id="bbsList_pagenum">
					<c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if>
					<c:if test="${dataCount==0 }">
					등록된 게시물이 없습니다.
					</c:if>
				</div>
		</div>


		<div id="bbsList_footer">
			<hr class="bbs_footer_hr">
			<div id="bbsList_mainfooter">
				<div id="bbsList_mainfooter_1">
					<div id="bbsList_mainfooter_1_1">
						<p class="bbsList_mainfooter_1_p">고객센터 1544-6254</p>
						<p class="bbsList_mainfooter_1_p_1">10:30~18:00 (점심시간
							13:00~14:00)</p>
						<p class="bbsList_mainfooter_1_p_1">주말, 공휴일 휴무</p>
						<a href="<%=cp %>/gesi/listgesi.do" class="footer_link1">
					<span class="footer_link1_1">1:1 문의</span>
							</a>
					</div>

					<div id="bbsList_mainfooter_2_1">
						<p class="bbsList_mainfooter_2_p">크몽</p>
						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">마켓</a>
						</p>

						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">마켓Prime</a>
						</p>


						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">맞춤견적</a>
						</p>


						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">엔터프라이즈</a>
						</p>


					</div>

					<div id="bbsList_mainfooter_2_1">
						<p class="bbsList_mainfooter_2_p">크몽 정보</p>
						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">서비스소개</a>
						</p>

						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">인재영입</a>
						</p>


						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">크몽PRESS</a>
						</p>

					</div>


					<div id="bbsList_mainfooter_2_1">
						<p class="bbsList_mainfooter_2_p">관련사이트</p>
						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">크몽 블로그</a>
						</p>

						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">크몽 인스타그램</a>
						</p>


						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">크몽 유튜브</a>
						</p>

					</div>

					<div id="bbsList_mainfooter_2_1">
						<p class="bbsList_mainfooter_2_p">지원</p>
						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">공지사항</a>
						</p>

						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">자주 묻는 질문</a>
						</p>


						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">이용약관</a>
						</p>

						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">개인정보처리방침</a>
						</p>

						<p class="bbsList_mainfooter_2_p_1">
							<a href="" class="bbsList_mainfooter_2_p_2">전문가센터</a>
						</p>

					</div>

				</div>

				<div class="footer_menu_bottom">
			<div class="footer_menu_link2">
				<a href="https://play.google.com/store/apps/details?id=com.kmong.kmong"
				target="_blank" class="footer_menu_link2_1">
					<span class="footer_menu_link2_2">
						<img alt="google play" src="<%=cp %>/kmong/kmimage/googleplay.png"
						width="20" height="20">
					</span>
					<span class="footer_menu_link2_3">Google play</span>
				</a>
			</div>
			<div>
				<a href="http://itunes.apple.com/kr/app//id1039179300?mt=8" class="footer_menu_link2_1">
					<span class="footer_menu_link2_2">
						<img alt="" src="<%=cp %>/kmong/kmimage/appstore.png" width="16" height="20">	
					</span>
					<span class="footer_menu_link2_3">App Store</span>
				</a>
			</div>
		</div>

			</div>
			<hr class="bbs_footer_hr">
			<div id="bbsList_mainfooter_4">
				<p class="bbsList_mainfooter_4_1">
					(주)크몽 <span class="bbsList_mainfooter_4_2"></span> 서울시 서초구 사임당로
					157, 3층 <span class="bbsList_mainfooter_4_2"></span> 대표 : 박현호 <span
						class="bbsList_mainfooter_4_2"></span> 개인정보관리책임자 : 서동진 <span
						class="bbsList_mainfooter_4_2"></span> 사업자등록번호 : 613-81-65278 <a
						color="default"
						href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=6138165278"
						target="_blank" class="bbsList_mainfooter_4_4"> <span
						class="bbsList_mainfooter_4_3">사업자 정보확인</span>
					</a><span class="bbsList_mainfooter_4_2"></span> 통신판매업신고 :
					2014-서울강남-01471호 <span class="bbsList_mainfooter_4_2"></span>
					help@kmong.com
				</p>

			</div>

			<div class="bbsList_mainfooter_5">
				<p class="bbsList_mainfooter_5_1">(주)크몽은 통신판매중개자이며, 통신판매의 당사자가
					아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매회원에게 있습니다.</p>
				<p class="bbsList_mainfooter_5_1">(주)크몽 사이트의 상품/판매회원/중개 서비스/거래
					정보, 콘텐츠, UI 등에 대한 무단복제, 전송, 배포, 스크래핑 등의 행위는 저작권법, 콘텐츠산업 진흥법 등 관련법령에
					의하여 엄격히 금지됩니다. [안내 보기]</p>
				<div class="bbsList_mainfooter_5_2">
					<p class="bbsList_mainfooter_5_3">Copyright © 2021 kmong Inc.
						All rights reserved.</p>
				</div>
			</div>
		</div>



	</div>
</body>
</html>
