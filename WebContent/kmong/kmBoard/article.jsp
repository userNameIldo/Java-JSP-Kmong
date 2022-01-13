<%@ page  contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	String gdsNum = request.getParameter("gdsNum");
	
%>
<!DOCTYPE html "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 판매</title>
<style type="text/css">
a{

	text-decoration: none;
	

}

</style>
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/kmBoard/css/article.css"/>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="<%=cp %>/kmong/kmBoard/data/guest.js"></script>
<style type="text/css">

.dropbtn_1 {
  outline: none;
    border-width: 1px;
    border-style: solid;
    box-sizing: border-box;
    line-height: 1;
    font-weight: 500;
    display: inline-flex;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    cursor: pointer;
    position: relative;
    user-select: none;
    white-space: nowrap;
    max-width: 100%;
    height: 42px;
    font-size: 15px;
    min-width: 42px;
    padding: 0;
    border-radius: 21px;
    background-color: transparent;
    border-color: transparent;
    color: #303441;
}
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 180px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 2;
  float: left;
}
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd; }

.dropdown:hover .dropdown-content {display: block;}


</style>
<script>

jQuery(document).ready(function($) {

$(".scroll").click(function(event){            

event.preventDefault();

$('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);

});

});

</script>



</head>
<body>
<div class="top">
	
	<header class="headerPart" >
		<a href="<%=cp %>/kmoong/main.do" class="headerLogo">
			<img alt="" src="<%=cp %>/kmong/kmBoard/image/kmong_logo.png" width="92" height="23">
		</a>
		<div style="flex-grow: 1;" class="headerBlock"></div> 

		<div class="header_login_part">
			<c:choose>
			<c:when test="${empty sessionScope.customInfo.userId }">
			<button class="header_login_btn1">
				<span class="header_login_f1">
				<a href="">
				전문가 등록</a>
				</span>
			</button>
			<button class="header_login_btn2">
				<span class="header_login_f1">
				<a href="<%=cp%>/kmoong/login.do">
				로그인
				</a>
				</span>
			</button>
				<span class="header_login_btn3">
				<a href="<%=cp%>/kmoong/created.do">
				무료 회원가입
				</a>
				</span>
			</c:when>
					<c:otherwise>
					<div class="dropdown"style="float: right;">
						<button class="dropbtn_1" style="width: 42px; height: 42px;">
							<img alt="원숭이" src="${imagePath2 }/${dto2.profileImg}"
								style="width: 45px; height: 45px; border-radius: 50%">
						</button>
						<div class="dropdown-content"
							style="font-size: 14px; line-height: 1.4;">
							<ul>
								<a href="<%=cp%>/kmoong/myInfo.do">계정설정</a>
								<a href="<%=cp%>/kmoong/changePwd.do">비밀번호 변경</a>
								<a href="<%=cp%>/kmoong/deleteId.do.do">회원탈퇴</a>
								<a href="<%=cp%>/kmoong/logout.do">로그아웃</a>
							</ul>
						</div>
						</div>
					</c:otherwise>
				</c:choose>
		
		</div>
	
	</header>



</div>
<div  class="main_All" " >
	<div class="main_body">
	 <section class="main_area">
	 <div class="main_article">
	 	<!--카테고리  -->
	 	<section class="main_tag">
	 		<div class="main_tag1">
	 			<a  href="/"  class="main_tag2">
	 			${dto.cateCode }</a>
	 			<span role="img" color="#555969" rotate="0" class="main_tagImg">
	 				<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true" focusable="false" preserveAspectRatio="xMidYMid meet" class="css-7kp13n e181xm9y0">
	 					<path xmlns="http://www.w3.org/2000/svg" d="M8.59 16.59L13.17 12 8.59 7.41 10 6l6 6-6 6-1.41-1.41z">
	 					</path>
	 				</svg>
	 			</span>
	 			<a  href="/"  class="main_tag2">
	 			보안</a>
	 		</div>
	 	</section>
	 	<!-- 이미지 -->
	 	<section class="main_imgbody">
	 		<img alt="이미지" src="${imagePath }/${dto.gdsImg }" width="100%">
	 	</section>

	 	
	 	
	 	<!-- 탭 -->
	 	<nav class="main_tab_area">
	 		<div class="main_tab">
	 			<div class="main_tab_button">
	 			<a href="#info" class="scroll">서비스 설명</a>
	 			</div>
	 			<div class="main_tab_button">
	 			<a href="#priceInfo" class="scroll">가격 정보</a>
	 			</div>
	 			<div class="main_tab_button">
	 			<a href="#modif" class="scroll">수정·재진행</a>
	 			</div>
	 			<div class="main_tab_button">
	 			<a href="#cancel" class="scroll">취소·환불 규정</a>
	 			</div>
	 			
	 			<div class="main_tab_button">
	 			<a href="#comment" class="scroll">서비스 평가</a>
	 			</div>
	 		</div>
	 	</nav>
	 	
	 	
	 	<!-- 서비스 설명 -->
	 	<section  class="main_infoAll">
	 		<div id="info" class="main_infoTitle">서비스 설명</div>
	 		<div class="main_infoBody">${dto.gdsDes }</div>
	 	</section>
	 	
	 	
	 	
	 	
	 	
	 	<!-- 가격정보 -->
	 	<!-- 가격변동 Top -->
	 	<section class="main_priceArea" >
	 		<div id="priceInfo" class="main_priceTitle">가격정보</div>
	 		<div class="main_price_table">
	 			<div class="main_price_class1">
	 				<span class="main_price_font1">STANDARD</span>
	 					<span class="main_price_font2">
	 					${dto.gdsPrice }
	 					원
	 					</span>
	 				
	 					
	 				</div>
	 				
	 					
	 			</div>
	 			<!-- 가격변동 body -->
	 			<div class="main_price_body1">
	 				<div class="main_price_body2">
	 					
	 					<div class="main_price_body4">
	 						
	 							<div class="main_price_body_font1">패키지내용</div>
	 							<div class="main_price_body_font2">내용설명</div>
	 						
	 					</div>
	 					
	 				</div>
	 				
	 				
	 			</div>
	 			
	 			<!--
	 			<div class="main_price_footer">
	 				<div class="main_price_class2"></div>
	 				<div class="main_price_body_img1">
	 					<button class="main_price_btn">
	 						<span class="main_price_btn2">
	 							<span>
	 							<a href="<%=cp %>/kmong/kmBoard/payment.jsp">
	 							 구매
	 							 </a>
	 							</span>
	 						</span>
	 					</button>
	 				</div>
	 				
	 				
	 			</div>
	 			 가격변동 버튼 부분 -->
	 	</section>
	 	
	 	<section class="main_mod1" >
	 		<div id="modif" class="main_mod_font1">수정 및 재진행</div>
	 		<div class="main_mod_font2">
	 		수정 내용
	 		</div>
	 	</section>
	 	
			
	 	<section class="main_mod1" id="cancel">
	 		<div  class="main_mod_font1">취소 및 환불 규정</div>
	 		<div class="main_mod_font2">
01. 전문가와 의뢰인 간의 상호 협의 후 청약철회가 가능합니다. 

02. 전문가의 귀책사유로 디자인작업을 시작하지 않았거나 혹은 이에 준하는 보편적인 관점에서 심각하게 잘못 이행한 경우 결제 금액 전체 환불이 가능합니다. 		

04. 서비스 받은 항목을 공제하여 환불하며, 공제 비용은 정가 처리됩니다.
가. 소비자 피해 보상 규정에 의거하여 작업물 원본의 멸실 및 작업 기간 미이행 및 이에 상응하는 전문가 책임으로 인한 피해 발생 시, 전액 환불 
나. 시안 작업 진행된 상품 차감 환불
ⓐ. '디자인'에 대한 금액이 서비스 내 별도 기재가 되지 않았거나, 디자인 상품 패키지 내 수정 횟수가 1회(1회 포함) 이상인 서비스 상품의 시안 or 샘플이 제공된 경우
→ 구매금액의 10% 환불(디자인 비용이 별도 기재되어 있는 경우, 해당금액 차감 후 환불)
※ 시안 제공 및 수정이 추가로 이뤄진 경우 환불 금액내 수정 횟수에 따라 분할하여 환불. 

05. 주문 제작 상품 등 서비스 받은 항목이 없으며, 결제 후 1일 이내 작업이 진행되기 전 시점은 전액 환불 가능. 

06. 다만, 환불이 불가능한 서비스에 대한 사실을 표시사항에 포함한 경우에는 의뢰인의 환불요청이 제한될 수 있습니다. 
가. 고객의 요청에 따라 개별적으로 주문 제작되는 재판매가 불가능한 경우(인쇄, 이니셜 각인, 사이즈 맞춤 등) 
ⓐ. 주문 제작 상품 특성상 제작(인쇄 등) 진행된 경우. 
ⓑ. 인쇄 색상의 차이 : 모니터의 종류에 따라 색상의 차이가 발생하며,인쇄 시마다 합판 인쇄 방법의 특성상 색상 표현의 오차가 발생함. 
ⓒ. 디자인 서비스이며 수정 횟수가 존재하지 않았던 상품일 경우 시안 수령 후 환불 불가
	 		</div>
	 	</section>
	 
	 
	 	<section>서비스 평가
	 	
	 	<div id="comment" >
	 		<div >
	 			<c:if test="${userId == null }">
	 			<textarea rows="5" cols="50" readonly="readonly">
	 			로그인 후 댓글 달기
	 			</textarea>
	 			</c:if>
	 			<c:if test="${userId != null }">
	 				<i class=""></i>${dto.userId }
	 				<form>
	 					<input type="hidden" name="gdsNum" value="${dto.gdsNum }">
	 					<input type="hidden" name="userId" value="${dto.userId }">
	 					<textarea rows="5" cols="50" placeholder="작성"
	 					name="guContent"></textarea>
	 					<input type="button" value="등록" onblur="guSendIt();">
	 				</form>
	 			
	 			
	 			
	 			</c:if>
	 	
	 	
	 	
	 		</div> 	
	 	
	 	</div>

	 	
	 	
	 	
	 	
	 	</section>
	 	<!-- 방명록 처리 -->
	 
	 
	 </div>
	 
	 <aside class="main_payment_area">
	 	<section class="main_payment_title">
	 		<h1 class="main_payment_title_font">${dto.gdsName }</h1>
	 		<div class="main_payment_price1">
	 			<h3 class="main_payment_price_f1">
	 				<span>${dto.gdsPrice } 원</span>
	 				
	 			</h3>
	 		</div>
	 	</section>
		
		<!-- 결제창 -->
		<section class="main_payment_chkArea">
			<div class="main_payment_chk">
				<div class="main_payment_chk_f1">
				${dto.gdsPrice } 원
				<div class="main_payment_chk_f2">STANDARD</div>
				</div>
				
				<div class="main_payment_chk_contentArea">
					<hr class="main_payment_hr1">
					<div class="main_payment_chk_article1">
						<div class="main_payment_chk_article2">
							패키지내용
						</div>
						<div class="main_payment_chk_article2">
							내용설명
						</div>
						
						
						<div class="main_payment_chk_article5">
							<div class="main_payment_chk_article5_1">
								<img alt="" src="<%=cp %>/kmong/kmBoard/image/days.png"
								width="22" height="22">
								작업일 : ${dto.workDate }일
							</div>
							
						</div>
					</div>
				</div>
				
				<!-- 구매버튼 -->
				<div class="main_payment_chk_article6">
					<button class="main_payment_chk_article6_btn" onclick="location='<%=cp%>/km/payment.do?gdsNum=<%=gdsNum%>';">
						<span class="main_payment_chk_article6_btn_f">
							<span>구매하기</span>
						</span>
					</button>
				</div>
				<!-- 할부버튼 -->
				<div class="main_payment_chk_article7">
					<button class="main_payment_chk_article7_btn">
						<span class="main_payment_chk_article6_btn_f">
							<span>무이자 할부</span>
						</span>
					</button>
				</div>
			
			</div>
		
		</section>
		
	 </aside>	
	 
	 
	 
	 
	 </section>
</div>
</div>






<footer >
	<hr class="footer_hr">
	<div class="footer_area1">
		<div class="footer_area2">
		<div class="footer_menu"  >
		<p class="footer_font1">고객센터 1544-6254</p>
		<p class="footer_font2">10:30~18:00 (점심시간 13:00~14:00)</p>
		<p class="footer_font2">주말, 공휴일 휴무</p>
		<a href="/" class="footer_link1">
			<span class="footer_link1_1">1:1 문의</span>
		</a>
		</div>
		<div class="footer_menu">
			<p class="footer_menu_font1">크몽</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com" class="footer_menu_link1">
				마켓
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/prime" class="footer_menu_link1">
				마켓 Prime
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/custom-project" class="footer_menu_link1">
				맞춤견적
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/enterprise" class="footer_menu_link1">
				엔터프라이즈
				</a>				
			</p>
		</div>
		<div class="footer_menu">
			<p class="footer_menu_font1">크몽 정보</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com" class="footer_menu_link1">
				서비스 소개
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/prime" class="footer_menu_link1">
				인재영입
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/custom-project" class="footer_menu_link1">
				크몽 PRESS
				</a>				
			</p>
		</div>
		
		<div class="footer_menu">
			<p class="footer_menu_font1">관련 사이트</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com" class="footer_menu_link1">
				크몽 블로그
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/prime" class="footer_menu_link1">
				크몽 인스타그램
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/custom-project" class="footer_menu_link1">
				크몽 유튜브
				</a>				
			</p>
		</div>
		
		<div class="footer_menu">
			<p class="footer_menu_font1">지원</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com" class="footer_menu_link1">
				공지사항
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/prime" class="footer_menu_link1">
				자주 묻는 질문
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/custom-project" class="footer_menu_link1">
				이용약관
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/enterprise" class="footer_menu_link1">
				개인정보처리방침
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/enterprise" class="footer_menu_link1">
				전문가 센터
				</a>				
			</p>
		</div>
		</div>
		<div class="footer_menu_bottom">
			<div class="footer_menu_link2">
				<a href="https://play.google.com/store/apps/details?id=com.kmong.kmong"
				target="_blank" class="footer_menu_link2_1">
					<span class="footer_menu_link2_2">
						<img alt="google play" src="<%=cp %>/kmong/kmBoard/image/googleplay.png"
						width="20" height="20">
					</span>
					<span class="footer_menu_link2_3">Google play</span>
				</a>
			</div>
			<div>
				<a href="http://itunes.apple.com/kr/app//id1039179300?mt=8" class="footer_menu_link2_1">
					<span class="footer_menu_link2_2">
						<img alt="" src="<%=cp %>/kmong/kmBoard/image/appstore.png" width="16" height="20">	
					</span>
					<span class="footer_menu_link2_3">App Store</span>
				</a>
			</div>
		</div>
	</div>
		<hr class="footer_hr">
		<div class="footer_companyArea">
		
			<p class="footer_company_p">
				(주)크몽
				<span class="footer_company_font1">|</span>
				서울시 서초구 사임당로 157, 3층
				<span class="footer_company_font1">|</span>
				대표 : 박현호
				<span class="footer_company_font1">|</span>
				개인정보관리책임자 : 서동진
				<span class="footer_company_font1">|</span>
				사업자등록번호 : 613-81-65278
				<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=6138165278" target="_blank" class="footer_company_link1">
					<span class="footer_menu_link2_3">사업자 정보확인</span>
				</a>
				<span class="footer_company_font1">|</span>
				통신판매업신고 : 2014-서울강남-01471호
				<span class="footer_company_font1">|</span>
				help@kmong.com
			</p>		
		</div>
		<div class="footer_companyArea2">
			<p class="footer_company_font2">(주)크몽은 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매회원에게 있습니다.</p>
			<p class="footer_company_font2">(주)크몽 사이트의 상품/판매회원/중개 서비스/거래 정보, 콘텐츠, UI 등에 대한 무단복제, 전송, 배포, 스크래핑 등의 행위는 저작권법, 콘텐츠산업 진흥법 등 관련법령에 의하여 엄격히 금지됩니다. [안내 보기]</p>
			<div class="">
				<p class="footer_company_font2">Copyright © 2021 kmong Inc. All rights reserved.</p>
			</div>
		</div>
		
	
</footer>
</body>
</html>