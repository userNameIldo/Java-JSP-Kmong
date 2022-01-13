<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int number = (int)(request.getAttribute("gdsPrice"));
	int day = (int)(request.getAttribute("workDate"));
	
	String gdsNum = request.getParameter("gdsNum");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프리랜서마켓 No.1 크몽 | 디자인, IT·프로그래밍,마케팅,번역·통역, 경영진단, 법률 및 취업 관련 전문가들을 만나보세요</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/kmong/kmBoard/css/payment.css">
<script type="text/javascript">

//지불 경로 설정
function sendPay() {
	var f = sendForm;
	f.action = "<%=cp%>/kmong/kmBoard/payment_ok.jsp";
	f.submit();
	
}

function count(type) {
	 // 결과를 표시할 element
	const resultElement = document.getElementById('result');
	const getGdsPrice1 = document.getElementById('dto.getGdsPrice1');
	const getGdsPrice2 = document.getElementById('dto.getGdsPrice2');
	const getGdsPrice3 = document.getElementById('dto.getGdsPrice3');
	const getWorkDate = document.getElementById('dto.getWorkDate');
	 
	// 현재 화면에 표시된 값
	 let number = resultElement.innerText;
	 
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	  var result = parseInt(number);
	  getGdsPrice1.innerText = number*<%=number%>+"원";
	  getGdsPrice2.innerText = number*<%=number%>+"원";
	  getGdsPrice3.innerText = number*<%=number%>+"원";
	  getWorkDate.innerText  = number*<%=day%>+"일";
	  
}







function sendGAEventSimple(category, action, label, value) {
    label = typeof label !== 'undefined' ? label : '';

    var data  = {
        'event_category' : category,
        'event_label' : label,
    };

    if(typeof value !== 'undefined' && value !== '') {
        data['event_value'] = value;
    }

    if(typeof gtag !== 'undefined') {
        gtag('event', action, data);
    }
}







</script>







<style type="text/css">
#headerTab {
	display: flex;
	align-items: center;
	flex-grow: 1;
	color: rgba(48,52,65,0.7);
	font 13px;
	text-decoration: none;
	transition: color 0.2s;
	position: relative;
}
a { text-decoration:none !important;
	cursor: pointer;
	
} 
a:hover { text-decoration:none !important }

hr {
 border-bottom: 1px solid #bbb;
}


</style>

</head>
<body>

	<div id = div_top style="border-bottom: 1px solid #bbb;">
	
            <div class="NavSwitchService">
                <div class="NavSwitchService__container">
                    <div class="NavSwitchService__service-link-list">
                    		<div style="margin-right: 50px;">
							<a href="<%=cp%>/kmoong/main.do">
							<img  style="top: 50%; margin: auto; "  
							width="91" height="23" src="https://d2v80xjmx68n4w.cloudfront.net/assets/desktop/pages/main/kmong_logo.png" title="당신의 '일'을 해결해줄 전문가들이 있는 곳, 서비스 마켓플레이스 크몽 ( kmong )">
							</a>
							</div>
                        <a
                            href="/"
                            class="NavSwitchService__service-link"
                            @click="sendNavServiceEvent(kmongServiceType.MARKET)"
                        >
                            마켓
                        </a>
                        <span class="NavSwitchService__service-link-separator"></span>
                        <a
                            href="/custom-project"
                            class="NavSwitchService__service-link"
                            @click="sendNavServiceEvent(kmongServiceType.CUSTOM_PROJECT)"
                        >
                            맞춤견적
                        </a>
                        <span class="NavSwitchService__service-link-separator"></span>
                        <a
                            href="/enterprise"
                            class="NavSwitchService__service-link"
                            @click="sendNavServiceEvent(kmongServiceType.ENTERPRISE)"
                        >
                            엔터프라이즈
                            <div class="NavSwitchService__enterprise-tooltip-wrapper">
                                <div class="NavSwitchService__enterprise-tooltip">
                                    <div class="tooltip-arrow"></div>
                                    <div class="text-wrapper">
                                        기업 고객을 위한 맞춤 서비스 제공
                                    </div>
                                    <div class="tooltip-arrow tooltip-arrow--hide-shadow"></div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <a
                        v-if="!isEnterprisePage"
                        href="/enterprise"
                        class="NavSwitchService__ads-link"
                        @click="sendNavRightEvent()"
                    >
                        기업전용 서비스가 필요하신가요? >
                    </a>
                </div>
            </div>
        </div>
	
	
	
	

	
	<div id="orderDiv" >
    <!-- head -->
    <div class="OrderHeader layout__container">
        <h2 class="OrderHeader__title">결제하기</h2>
    </div>
    <div class="layout__container">
        <!-- main -->
        <div class="OrderMain">
                <!-- 주문내역 -->
                <section class="OrderGigInfo">
            <!--
    agreed가 1인 경우  -> inbox에서 결제요청 동의를 한 경우  
    주문제작이랑 간판은 모두 맞춤 옵션 세팅 -> agreed가 1
 -->
 <!-- 주문 GIG INFO -->
<div>
    <h3 class="OrderGigInfo__title">
        주문 내역
    </h3>
            <div class="OrderGigInfo__gig-summary">
            <div class="OrderGigInfo__thumnail-wrapper">
                                <img data-type="1-1" width="120px" height="auto" class="border-radius" src="${imagePath }/${dto.gdsImg }" onerror="this.onerror=null;this.src='https://d2v80xjmx68n4w.cloudfront.net/assets/404/no_gig_sm_image.jpg';">
                            </div>

            <div class="OrderGigInfo__description-wrapper">
                <h4 class="OrderGigInfo__gig-title">${dto.gdsName }</h4>
                <div class="OrderGigInfo__seller-info">
                    <img width="20px" class="OrderGigInfo__seller-profile" src="https://d2v80xjmx68n4w.cloudfront.net/members/thumbs/lFKjF1579075048.jpg" title="MMT마케팅" alt="MMT마케팅" onerror="this.onerror=null;this.src='/img/tools/main_user.png';">
                    <span class="OrderGigInfo__seller-name">${dto.userName }</span>
                </div>
            </div>
        </div>
    </div>
<!-- 주문 옵션 테이블 I-->
<table class="OrderGigInfo__option-table OrderGigInfo__option-table--not-additional" 
style="border-collapse: collapse;
    border-spacing: 0;">
    <colgroup>
        <col width="400px">
        <col width="104px">
        <col width="104px">
        <col width="128px">
    </colgroup>
    <thead>
    <tr>
        <th>기본항목</th>
        <th class="text-center">수량선택</th>
        <th class="text-center">작업일</th>
        <th class="text-right">가격</th>
    </tr>
    </thead>
    <tbody>
            <tr class="OrderGigInfo__option-table-row" data-type="2-1">
            <td class="OrderGigInfo__option-table-cell"> 
                <div class="OrderGigInfo__option-table-cell-item OrderGigInfo__option-table-title  first-row">
                     
                    <div >${dto.gdsSell } </div>
                    
                </div>
                
            </td>
            <td class="OrderGigInfo__option-table-cell">
                <div class="OrderGigInfo__option-table-cell-item first-row">
                    <button class="order-btn-brand-gray1" onclick="count('minus')" >
                        <span>-</span>
                    </button>
                    <span class="OrderGigInfo__option-table-count" id="result" >1</span>
                    <button class="order-btn-brand-gray2" onclick="count('plus')">
                        <span>+</span>
                    </button>
                </div>
            </td>
            <td class="OrderGigInfo__option-table-cell">							
                <div class="OrderGigInfo__option-table-cell-item first-row" id="dto.getWorkDate">                 <%=day %>일              </div>
            </td>
            <td class="OrderGigInfo__option-table-cell">
                <div class="OrderGigInfo__option-table-cell-item OrderGigInfo__option-table-price-item first-row" id ="dto.getGdsPrice1">  <%=number %> 원                </div>
            </td>
        </tr>
        
    
    <!-- 
        주문제작  or 메시지로 결제 승인 했을 시 
     -->
    
    </tbody>
</table>

<table style="display:none;" class="OrderGigInfo__option-table order__option-table" data-type="additional">
    <colgroup>
        <col width="400px">
        <col width="104px">
        <col width="104px">
        <col width="128px">
    </colgroup>
    <thead>
    <tr>
        <th>옵션항목</th>
        <th class="text-center">수량선택</th>
        <th class="text-center">작업일</th>
        <th class="text-right">가격</th>
    </tr>
    </thead>
    <tbody>
    
    </tbody>
</table>    </section>
                 <div id="customer_info"></div>
    <div>
        <div>
                <div class="OrderCustomerInfo">
            <h3 class="OrderCustomerInfo__title">
                의뢰인 정보
            </h3>
            <div class="OrderCustomerInfo__descriptions">
                <li>∙본인 확인 후 구매가 가능합니다.(첫 결제 1회만)</li>
                <li>∙인증된 정보에 따라 실명이 자동 업데이트됩니다.</li>
            </div>
            <div align="right">
                
                    <input type="button" value="로그인 후 휴대폰 인증을 해주세요." height="60" onclick="">
                     
                </a>
            </div>
            
        </div>
                </div>
    </div>

    
                
                
             



                
                <!-- 결제방법 선택  -->
                <section class="OrderPaymentMethods">
    <div class="OrderPaymentMethods__main">
    <h3 class="OrderPaymentMethods__title">결제방법</h3>
    <ul class="OrderPaymentMethods__items">
        <li class="OrderPaymentMethods__item" key="SC0010">
        
            <select name='howPay'>
  <option value='' selected>-- 선택 --</option>
  <option value='creadit'>신용카드</option>
  <option value='kakaopay'>카카오페이</option>
  <option value='payco'>페이코</option>
   <option value='phone'>휴대폰결제</option>
</select>
        </li>
    </ul>
</div>

</section>






        
        </div>
        <!-- summary -->
        <div class="OrderSummary">
        <div class="OrderSummary__main">
            <h5 class="OrderSummary__price-wrapper">
                <span class="OrderSummary__price-label">총 서비스 금액</span>
                <span class="OrderSummary__price OrderSummary__price--total" id="dto.getGdsPrice2"><%=number %>원</span>
            </h5>
            
            <!-- divider -->
            <div class="OrderSummary__divider">
        </div>
        <h5 class="OrderSummary__total-price-wrapper">
            <span class="OrderSummary__price-label">총 결제금액</span>
            <span class="OrderSummary__price" id="dto.getGdsPrice3"><%=number %>원</span>
        </h5>
        <div style="" class="OrderSummary__agreement-wrapper">
            <div class="OrderSummary__agreement-checkbox-wrapper">
                <div class="awesome-checkbox">
                    <label>
                        <input id="taxApplyCheckbox" type="checkbox">
                        <span class="awesome-checkbox-body">
                        </span>
                        <div class="OrderSummary__agreement-text">주문 내용을 확인하였으며, 결제에 동의합니다. (필수)
                        <input type="checkbox" size="5" >
                        </div>
                    </label>
                </div>
            </div>
	
            	

            
        </div>
        
    <form method="post" name="sendForm">
        <div>
                        <a class="plain">
                <button class="btn btn-brand-yellow NGB btn-block" style="height: 52px; width: 320px;" 
                onclick="sendPay();">
                    <span class="OrderSummary__pay-button-text" >
                        <b>결제하기</b>
                    </span>
                </button>
            </a>
                        <p class="OrderSummary__safe-trade">                
                서비스 제공이 완료된 이후에 전문가에게 결제 대금이 전달됩니다.
            </p>
        </div>
        </form>
    </div>
</div>
                            
    </div>
</div>
	



	
	
	
</body>
<footer
    id="footer-renewal"
    class="footer-body"
    data-copyright="Copyright © 2018 kmong Inc. All rights reserved."
>
    <div class="container-1170 footer__container">
        <div
            class="flex"
            style="justify-content: space-between;"
        >
            <div
                style="flex-basis: 388px;"
            >
                <p class="footer__service-center">
                    고객센터 1544-6254
                </p>

                <ul 
                    class="footer__service-contents" 
                    style="margin-bottom: 16px;"
                >
                    <li>10:30~18:00 (점심시간 13:00~14:00)</li>
                    <li>주말, 공휴일 휴무</li>
                </ul>

                <a
                    :data-ga-action="
                        `https://support.kmong.com/hc/ko/categories/360001839311_`
                    "
                    target="_blank"
                    class="plain sendGATriggerClz footer__inquiry"
                    href="/zendesk/login?return_url=https://support.kmong.com/hc/ko/requests/new"
                    data-ga-category="footer"
                >
                    1:1 문의
                </a>
            </div>

            <div
                style="flex: 1; flex-direction: column;"
                class="flex"
            >
                <div
                    style="justify-content: flex-end;"
                    class="flex"
                >
                    <div
                        style="flex-basis: 140px;"
                    >
                        <div class="contents-title">
                            크몽
                        </div>
                        <ul class="margin-top-12 right-side-contents">
                            <li
                                v-for="(serviceIndex, serviceItem) in serviceTypeData"
                            >
                                <a
                                    class="plain"
                                    :key="serviceIndex"
                                    :href="serviceItem.link"                                
                                >
                                  
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div
                        class="margin-left-30"
                        style="flex-basis: 140px;"
                    >
                        <div class="contents-title">
                            크몽 정보
                        </div>
                        <ul class="margin-top-12 right-side-contents">
                            <li>
                                <a
                                    class="plain sendGATriggerClz"
                                    href="/about/service"
                                    data-ga-category="footer"
                                    data-ga-action="/about/service_/order/4632865"
                                >
                                    서비스소개
                                </a>
                            </li>
                            <li>
                                <a
                                    class="plain sendGATriggerClz"
                                    href="/about/kmong_is"
                                    data-ga-category="footer"
                                    data-ga-action="/about/kmong_is_/order/4632865"
                                >
                                    인재영입
                                </a>
                            </li>

                            <li>
                                <a

                                    class="plain sendGATriggerClz"
                                    href="//medium.com/kmong/press/home"
                                    data-ga-category="footer"
                                    data-ga-action="/kmong_press_/order/4632865"
                                >
                                    크몽 PRESS
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div
                        class="margin-left-30"
                        style="flex-basis: 140px;"
                    >
                        <div class="contents-title">
                            관련 사이트
                        </div>
                        <ul class="margin-top-12 right-side-contents">
                            <li>
                                <a
                                    target="_blank"
                                    class="plain sendGATriggerClz"
                                    href="https://medium.com/kmong"
                                    data-ga-category="footer"
                                    data-ga-action="https://medium.com/kmong_/order/4632865"
                                >
                                    크몽 블로그
                                </a>
                            </li>
                            <li>
                                <a
                                    target="_blank"
                                    class="plain sendGATriggerClz"
                                    href="https://www.instagram.com/kmong_official/"
                                    data-ga-category="footer"
                                    data-ga-action="https://www.instagram.com/kmong_official/_/order/4632865"
                                >
                                    크몽 인스타그램
                                </a>
                            </li>
                            <li>
                                <a
                                    target="_blank"
                                    class="plain sendGATriggerClz"
                                    href="https://www.youtube.com/channel/UCUpdmwMWbAEtK7jf_7XztAw"
                                    data-ga-category="footer"
                                    data-ga-action="https://www.youtube.com/channel/UCUpdmwMWbAEtK7jf_7XztAw_/order/4632865"
                                >
                                    크몽 유튜브
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div
                        class="margin-left-30"
                        style="flex-basis: 140px;"
                    >
                        <div class="contents-title">
                            지원
                        </div>
                        <ul class="margin-top-12 right-side-contents">
                            <li>
                                <a
                                    target="_blank"
                                    class="plain sendGATriggerClz"
                                    href="https://support.kmong.com/hc/ko/categories/360001764912"
                                    data-ga-category="footer"
                                    data-ga-action="https://support.kmong.com/hc/ko/categories/360001764912_/order/4632865"
                                >
                                    공지사항
                                </a>
                            </li>
                            <li>
                                <a
                                    target="_blank"
                                    class="plain sendGATriggerClz"
                                    href="https://support.kmong.com/hc/ko/categories/360001643071"
                                    data-ga-category="footer"
                                    data-ga-action="https://support.kmong.com/hc/ko/categories/360001643071_/order/4632865"
                                >
                                    자주 묻는 질문
                                </a>
                            </li>
                            <li>
                                <a
                                    target="_blank"
                                    class="plain sendGATriggerClz"
                                    href="https://support.kmong.com/hc/ko/articles/900005915466"
                                    data-ga-category="footer"
                                    data-ga-action="https://support.kmong.com/hc/ko/articles/360035875831_/order/4632865"
                                >
                                    이용약관
                                </a>
                            </li>
                            <li>
                                <a
                                    target="_blank"
                                    class="plain sendGATriggerClz NGB"
                                    href="https://support.kmong.com/hc/ko/articles/900006875183"
                                    data-ga-category="footer"
                                    data-ga-action="https://support.kmong.com/hc/ko/articles/360027093231_/order/4632865"
                                >
                                    개인정보처리방침
                                </a>
                            </li>
                            <li>
                                <a
                                    target="_blank"
                                    class="plain sendGATriggerClz"
                                    href="https://support.kmong.com/hc/ko/categories/360001839311"
                                    data-ga-category="footer"
                                    data-ga-action="https://support.kmong.com/hc/ko/categories/360001839311_/order/4632865"
                                >
                                    전문가 센터
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="footer__app-download-button-wrapper">
                    <a
                        class="sendGATriggerClz"
                        target="_blank"
                        href="https://play.google.com/store/apps/details?id=com.kmong.kmong"
                        data-ga-category="footer"
                        data-ga-action="click on app download_/order/4632865"
                        data-ga-label="google play"
                    >
                        <div
                            class="footer__app-download-button"
                            style="margin: 0px 8px 0 0;"
                        >
                            <img
                                src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_google_play.png"
                                srcset="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_google_play@2x.png 2x,
                                    https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_google_play@3x.png 3x"
                                class="img-responsive"
                                alt="google play"
                                title="안드로이드 앱 다운로드"
                            />
                            Google play
                        </div>
                    </a>

                    <a
                        class="sendGATriggerClz"
                        target="_blank"
                        href="http://itunes.apple.com/kr/app//id1039179300?mt=8"
                        data-ga-category="footer"
                        data-ga-action="click on app download_/order/4632865"
                        data-ga-label="appstore"
                    >
                        <div class="footer__app-download-button">
                            <img
                                src="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_apple.png"
                                srcset="https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_apple@2x.png 2x,
                                    https://d2v80xjmx68n4w.cloudfront.net/assets/icon/ic_apple@3x.png 3x"
                                class="img-responsive"
                                alt="크몽 IOS 어플리케이션"
                                title="IOS 앱 다운로드"
                            />
                            App Store
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>


    <div class="company-container">
        <div class="company-info">
            (주)크몽
            <span class="v-hr">|</span>
            서울시 서초구 사임당로 157, 3층
            <span class="v-hr">|</span>
            대표 : 박현호
            <span class="v-hr">|</span>
            개인정보관리책임자 : 서동진
            <span class="v-hr">|</span>
            사업자등록번호 : 613-81-65278
            <a
                target="_blank"
                href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=6138165278"
                class="btn btn-default btn-xs margin-left-5"
            >
                사업자 정보확인
            </a>
            <span class="v-hr">|</span>
            통신판매업신고 : 2014-서울강남-01471호
            <span class="v-hr">|</span>
            help@kmong.com
        </div>

        <div
            class="kmong-copyright-container"
            style="cursor: pointer;"
            onclick="$('#footer__content-creative').show();"
        >
            <p class="notify-right">(주)크몽은 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매회원에게 있습니다.</p>
            <p class="notify-right">
                (주)크몽 사이트의 상품/판매회원/중개 서비스/거래 정보, 콘텐츠, UI 등에 대한 무단복제, 전송, 배포, 스크래핑 등의 행위는 저작권법, 콘텐츠산업 진흥법 등 관련법령에 의하여 엄격히 금지됩니다. [안내 보기]
            </p>
            <p class="kmong-copyright" id="kmongCopyRight"></p>
        </div>
    </div>
    <script src="/js/kmong.copyright.write.js"></script>
</footer>

</html>