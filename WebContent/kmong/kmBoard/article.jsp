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
<title>์ํ ํ๋งค</title>
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
				์?๋ฌธ๊ฐ ๋ฑ๋ก</a>
				</span>
			</button>
			<button class="header_login_btn2">
				<span class="header_login_f1">
				<a href="<%=cp%>/kmoong/login.do">
				๋ก๊ทธ์ธ
				</a>
				</span>
			</button>
				<span class="header_login_btn3">
				<a href="<%=cp%>/kmoong/created.do">
				๋ฌด๋ฃ ํ์๊ฐ์
				</a>
				</span>
			</c:when>
					<c:otherwise>
					<div class="dropdown"style="float: right;">
						<button class="dropbtn_1" style="width: 42px; height: 42px;">
							<img alt="์์ญ์ด" src="${imagePath2 }/${dto2.profileImg}"
								style="width: 45px; height: 45px; border-radius: 50%">
						</button>
						<div class="dropdown-content"
							style="font-size: 14px; line-height: 1.4;">
							<ul>
								<a href="<%=cp%>/kmoong/myInfo.do">๊ณ์?์ค์?</a>
								<a href="<%=cp%>/kmoong/changePwd.do">๋น๋ฐ๋ฒํธ ๋ณ๊ฒฝ</a>
								<a href="<%=cp%>/kmoong/deleteId.do.do">ํ์ํํด</a>
								<a href="<%=cp%>/kmoong/logout.do">๋ก๊ทธ์์</a>
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
	 	<!--์นดํ๊ณ?๋ฆฌ  -->
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
	 			๋ณด์</a>
	 		</div>
	 	</section>
	 	<!-- ์ด๋ฏธ์ง -->
	 	<section class="main_imgbody">
	 		<img alt="์ด๋ฏธ์ง" src="${imagePath }/${dto.gdsImg }" width="100%">
	 	</section>

	 	
	 	
	 	<!-- ํญ -->
	 	<nav class="main_tab_area">
	 		<div class="main_tab">
	 			<div class="main_tab_button">
	 			<a href="#info" class="scroll">์๋น์ค ์ค๋ช</a>
	 			</div>
	 			<div class="main_tab_button">
	 			<a href="#priceInfo" class="scroll">๊ฐ๊ฒฉ ์?๋ณด</a>
	 			</div>
	 			<div class="main_tab_button">
	 			<a href="#modif" class="scroll">์์?ยท์ฌ์งํ</a>
	 			</div>
	 			<div class="main_tab_button">
	 			<a href="#cancel" class="scroll">์ทจ์ยทํ๋ถ ๊ท์?</a>
	 			</div>
	 			
	 			<div class="main_tab_button">
	 			<a href="#comment" class="scroll">์๋น์ค ํ๊ฐ</a>
	 			</div>
	 		</div>
	 	</nav>
	 	
	 	
	 	<!-- ์๋น์ค ์ค๋ช -->
	 	<section  class="main_infoAll">
	 		<div id="info" class="main_infoTitle">์๋น์ค ์ค๋ช</div>
	 		<div class="main_infoBody">${dto.gdsDes }</div>
	 	</section>
	 	
	 	
	 	
	 	
	 	
	 	<!-- ๊ฐ๊ฒฉ์?๋ณด -->
	 	<!-- ๊ฐ๊ฒฉ๋ณ๋ Top -->
	 	<section class="main_priceArea" >
	 		<div id="priceInfo" class="main_priceTitle">๊ฐ๊ฒฉ์?๋ณด</div>
	 		<div class="main_price_table">
	 			<div class="main_price_class1">
	 				<span class="main_price_font1">STANDARD</span>
	 					<span class="main_price_font2">
	 					${dto.gdsPrice }
	 					์
	 					</span>
	 				
	 					
	 				</div>
	 				
	 					
	 			</div>
	 			<!-- ๊ฐ๊ฒฉ๋ณ๋ body -->
	 			<div class="main_price_body1">
	 				<div class="main_price_body2">
	 					
	 					<div class="main_price_body4">
	 						
	 							<div class="main_price_body_font1">ํจํค์ง๋ด์ฉ</div>
	 							<div class="main_price_body_font2">๋ด์ฉ์ค๋ช</div>
	 						
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
	 							 ๊ตฌ๋งค
	 							 </a>
	 							</span>
	 						</span>
	 					</button>
	 				</div>
	 				
	 				
	 			</div>
	 			 ๊ฐ๊ฒฉ๋ณ๋ ๋ฒํผ ๋ถ๋ถ -->
	 	</section>
	 	
	 	<section class="main_mod1" >
	 		<div id="modif" class="main_mod_font1">์์? ๋ฐ ์ฌ์งํ</div>
	 		<div class="main_mod_font2">
	 		์์? ๋ด์ฉ
	 		</div>
	 	</section>
	 	
			
	 	<section class="main_mod1" id="cancel">
	 		<div  class="main_mod_font1">์ทจ์ ๋ฐ ํ๋ถ ๊ท์?</div>
	 		<div class="main_mod_font2">
01. ์?๋ฌธ๊ฐ์ ์๋ขฐ์ธ ๊ฐ์ ์ํธ ํ์ ํ ์ฒญ์ฝ์ฒ?ํ๊ฐ ๊ฐ๋ฅํฉ๋๋ค. 

02. ์?๋ฌธ๊ฐ์ ๊ท์ฑ์ฌ์?๋ก ๋์์ธ์์์ ์์ํ์ง ์์๊ฑฐ๋ ํน์ ์ด์ ์คํ๋ ๋ณดํธ์?์ธ ๊ด์?์์ ์ฌ๊ฐํ๊ฒ ์๋ชป ์ดํํ ๊ฒฝ์ฐ ๊ฒฐ์? ๊ธ์ก ์?์ฒด ํ๋ถ์ด ๊ฐ๋ฅํฉ๋๋ค. 		

04. ์๋น์ค ๋ฐ์ ํญ๋ชฉ์ ๊ณต์?ํ์ฌ ํ๋ถํ๋ฉฐ, ๊ณต์? ๋น์ฉ์ ์?๊ฐ ์ฒ๋ฆฌ๋ฉ๋๋ค.
๊ฐ. ์๋น์ ํผํด ๋ณด์ ๊ท์?์ ์๊ฑฐํ์ฌ ์์๋ฌผ ์๋ณธ์ ๋ฉธ์ค ๋ฐ ์์ ๊ธฐ๊ฐ ๋ฏธ์ดํ ๋ฐ ์ด์ ์์ํ๋ ์?๋ฌธ๊ฐ ์ฑ์์ผ๋ก ์ธํ ํผํด ๋ฐ์ ์, ์?์ก ํ๋ถ 
๋. ์์ ์์ ์งํ๋ ์ํ ์ฐจ๊ฐ ํ๋ถ
โ. '๋์์ธ'์ ๋ํ ๊ธ์ก์ด ์๋น์ค ๋ด ๋ณ๋ ๊ธฐ์ฌ๊ฐ ๋์ง ์์๊ฑฐ๋, ๋์์ธ ์ํ ํจํค์ง ๋ด ์์? ํ์๊ฐ 1ํ(1ํ ํฌํจ) ์ด์์ธ ์๋น์ค ์ํ์ ์์ or ์ํ์ด ์?๊ณต๋ ๊ฒฝ์ฐ
โ ๊ตฌ๋งค๊ธ์ก์ 10% ํ๋ถ(๋์์ธ ๋น์ฉ์ด ๋ณ๋ ๊ธฐ์ฌ๋์ด ์๋ ๊ฒฝ์ฐ, ํด๋น๊ธ์ก ์ฐจ๊ฐ ํ ํ๋ถ)
โป ์์ ์?๊ณต ๋ฐ ์์?์ด ์ถ๊ฐ๋ก ์ด๋ค์ง ๊ฒฝ์ฐ ํ๋ถ ๊ธ์ก๋ด ์์? ํ์์ ๋ฐ๋ผ ๋ถํ?ํ์ฌ ํ๋ถ. 

05. ์ฃผ๋ฌธ ์?์ ์ํ ๋ฑ ์๋น์ค ๋ฐ์ ํญ๋ชฉ์ด ์์ผ๋ฉฐ, ๊ฒฐ์? ํ 1์ผ ์ด๋ด ์์์ด ์งํ๋๊ธฐ ์? ์์?์ ์?์ก ํ๋ถ ๊ฐ๋ฅ. 

06. ๋ค๋ง, ํ๋ถ์ด ๋ถ๊ฐ๋ฅํ ์๋น์ค์ ๋ํ ์ฌ์ค์ ํ์์ฌํญ์ ํฌํจํ ๊ฒฝ์ฐ์๋ ์๋ขฐ์ธ์ ํ๋ถ์์ฒญ์ด ์?ํ๋? ์ ์์ต๋๋ค. 
๊ฐ. ๊ณ?๊ฐ์ ์์ฒญ์ ๋ฐ๋ผ ๊ฐ๋ณ์?์ผ๋ก ์ฃผ๋ฌธ ์?์๋๋ ์ฌํ๋งค๊ฐ ๋ถ๊ฐ๋ฅํ ๊ฒฝ์ฐ(์ธ์, ์ด๋์ ๊ฐ์ธ, ์ฌ์ด์ฆ ๋ง์ถค ๋ฑ) 
โ. ์ฃผ๋ฌธ ์?์ ์ํ ํน์ฑ์ ์?์(์ธ์ ๋ฑ) ์งํ๋ ๊ฒฝ์ฐ. 
โ. ์ธ์ ์์์ ์ฐจ์ด : ๋ชจ๋ํฐ์ ์ข๋ฅ์ ๋ฐ๋ผ ์์์ ์ฐจ์ด๊ฐ ๋ฐ์ํ๋ฉฐ,์ธ์ ์๋ง๋ค ํฉํ ์ธ์ ๋ฐฉ๋ฒ์ ํน์ฑ์ ์์ ํํ์ ์ค์ฐจ๊ฐ ๋ฐ์ํจ. 
โ. ๋์์ธ ์๋น์ค์ด๋ฉฐ ์์? ํ์๊ฐ ์กด์ฌํ์ง ์์๋ ์ํ์ผ ๊ฒฝ์ฐ ์์ ์๋?น ํ ํ๋ถ ๋ถ๊ฐ
	 		</div>
	 	</section>
	 
	 
	 	<section>์๋น์ค ํ๊ฐ
	 	
	 	<div id="comment" >
	 		<div >
	 			<c:if test="${userId == null }">
	 			<textarea rows="5" cols="50" readonly="readonly">
	 			๋ก๊ทธ์ธ ํ ๋๊ธ ๋ฌ๊ธฐ
	 			</textarea>
	 			</c:if>
	 			<c:if test="${userId != null }">
	 				<i class=""></i>${dto.userId }
	 				<form>
	 					<input type="hidden" name="gdsNum" value="${dto.gdsNum }">
	 					<input type="hidden" name="userId" value="${dto.userId }">
	 					<textarea rows="5" cols="50" placeholder="์์ฑ"
	 					name="guContent"></textarea>
	 					<input type="button" value="๋ฑ๋ก" onblur="guSendIt();">
	 				</form>
	 			
	 			
	 			
	 			</c:if>
	 	
	 	
	 	
	 		</div> 	
	 	
	 	</div>

	 	
	 	
	 	
	 	
	 	</section>
	 	<!-- ๋ฐฉ๋ช๋ก ์ฒ๋ฆฌ -->
	 
	 
	 </div>
	 
	 <aside class="main_payment_area">
	 	<section class="main_payment_title">
	 		<h1 class="main_payment_title_font">${dto.gdsName }</h1>
	 		<div class="main_payment_price1">
	 			<h3 class="main_payment_price_f1">
	 				<span>${dto.gdsPrice } ์</span>
	 				
	 			</h3>
	 		</div>
	 	</section>
		
		<!-- ๊ฒฐ์?์ฐฝ -->
		<section class="main_payment_chkArea">
			<div class="main_payment_chk">
				<div class="main_payment_chk_f1">
				${dto.gdsPrice } ์
				<div class="main_payment_chk_f2">STANDARD</div>
				</div>
				
				<div class="main_payment_chk_contentArea">
					<hr class="main_payment_hr1">
					<div class="main_payment_chk_article1">
						<div class="main_payment_chk_article2">
							ํจํค์ง๋ด์ฉ
						</div>
						<div class="main_payment_chk_article2">
							๋ด์ฉ์ค๋ช
						</div>
						
						
						<div class="main_payment_chk_article5">
							<div class="main_payment_chk_article5_1">
								<img alt="" src="<%=cp %>/kmong/kmBoard/image/days.png"
								width="22" height="22">
								์์์ผ : ${dto.workDate }์ผ
							</div>
							
						</div>
					</div>
				</div>
				
				<!-- ๊ตฌ๋งค๋ฒํผ -->
				<div class="main_payment_chk_article6">
					<button class="main_payment_chk_article6_btn" onclick="location='<%=cp%>/km/payment.do?gdsNum=<%=gdsNum%>';">
						<span class="main_payment_chk_article6_btn_f">
							<span>๊ตฌ๋งคํ๊ธฐ</span>
						</span>
					</button>
				</div>
				<!-- ํ?๋ถ๋ฒํผ -->
				<div class="main_payment_chk_article7">
					<button class="main_payment_chk_article7_btn">
						<span class="main_payment_chk_article6_btn_f">
							<span>๋ฌด์ด์ ํ?๋ถ</span>
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
		<p class="footer_font1">๊ณ?๊ฐ์ผํฐ 1544-6254</p>
		<p class="footer_font2">10:30~18:00 (์?์ฌ์๊ฐ 13:00~14:00)</p>
		<p class="footer_font2">์ฃผ๋ง, ๊ณตํด์ผ ํด๋ฌด</p>
		<a href="/" class="footer_link1">
			<span class="footer_link1_1">1:1 ๋ฌธ์</span>
		</a>
		</div>
		<div class="footer_menu">
			<p class="footer_menu_font1">ํฌ๋ชฝ</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com" class="footer_menu_link1">
				๋ง์ผ
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/prime" class="footer_menu_link1">
				๋ง์ผ Prime
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/custom-project" class="footer_menu_link1">
				๋ง์ถค๊ฒฌ์?
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/enterprise" class="footer_menu_link1">
				์ํฐํ๋ผ์ด์ฆ
				</a>				
			</p>
		</div>
		<div class="footer_menu">
			<p class="footer_menu_font1">ํฌ๋ชฝ ์?๋ณด</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com" class="footer_menu_link1">
				์๋น์ค ์๊ฐ
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/prime" class="footer_menu_link1">
				์ธ์ฌ์์
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/custom-project" class="footer_menu_link1">
				ํฌ๋ชฝ PRESS
				</a>				
			</p>
		</div>
		
		<div class="footer_menu">
			<p class="footer_menu_font1">๊ด๋?จ ์ฌ์ดํธ</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com" class="footer_menu_link1">
				ํฌ๋ชฝ ๋ธ๋ก๊ทธ
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/prime" class="footer_menu_link1">
				ํฌ๋ชฝ ์ธ์คํ๊ทธ๋จ
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/custom-project" class="footer_menu_link1">
				ํฌ๋ชฝ ์?ํ๋ธ
				</a>				
			</p>
		</div>
		
		<div class="footer_menu">
			<p class="footer_menu_font1">์ง์</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com" class="footer_menu_link1">
				๊ณต์ง์ฌํญ
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/prime" class="footer_menu_link1">
				์์ฃผ ๋ฌป๋ ์ง๋ฌธ
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/custom-project" class="footer_menu_link1">
				์ด์ฉ์ฝ๊ด
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/enterprise" class="footer_menu_link1">
				๊ฐ์ธ์?๋ณด์ฒ๋ฆฌ๋ฐฉ์นจ
				</a>				
			</p>
			<p class="footer_menu_font2">
				<a href="https://kmong.com/enterprise" class="footer_menu_link1">
				์?๋ฌธ๊ฐ ์ผํฐ
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
				(์ฃผ)ํฌ๋ชฝ
				<span class="footer_company_font1">|</span>
				์์ธ์ ์์ด๊ตฌ ์ฌ์๋น๋ก 157, 3์ธต
				<span class="footer_company_font1">|</span>
				๋ํ : ๋ฐํํธ
				<span class="footer_company_font1">|</span>
				๊ฐ์ธ์?๋ณด๊ด๋ฆฌ์ฑ์์ : ์๋์ง
				<span class="footer_company_font1">|</span>
				์ฌ์์๋ฑ๋ก๋ฒํธ : 613-81-65278
				<a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=6138165278" target="_blank" class="footer_company_link1">
					<span class="footer_menu_link2_3">์ฌ์์ ์?๋ณดํ์ธ</span>
				</a>
				<span class="footer_company_font1">|</span>
				ํต์?ํ๋งค์์?๊ณ? : 2014-์์ธ๊ฐ๋จ-01471ํธ
				<span class="footer_company_font1">|</span>
				help@kmong.com
			</p>		
		</div>
		<div class="footer_companyArea2">
			<p class="footer_company_font2">(์ฃผ)ํฌ๋ชฝ์ ํต์?ํ๋งค์ค๊ฐ์์ด๋ฉฐ, ํต์?ํ๋งค์ ๋น์ฌ์๊ฐ ์๋๋๋ค. ์ํ, ์ํ์?๋ณด, ๊ฑฐ๋์ ๊ดํ ์๋ฌด์ ์ฑ์์ ํ๋งคํ์์๊ฒ ์์ต๋๋ค.</p>
			<p class="footer_company_font2">(์ฃผ)ํฌ๋ชฝ ์ฌ์ดํธ์ ์ํ/ํ๋งคํ์/์ค๊ฐ ์๋น์ค/๊ฑฐ๋ ์?๋ณด, ์ฝํ์ธ?, UI ๋ฑ์ ๋ํ ๋ฌด๋จ๋ณต์?, ์?์ก, ๋ฐฐํฌ, ์คํฌ๋ํ ๋ฑ์ ํ์๋ ์?์๊ถ๋ฒ, ์ฝํ์ธ?์ฐ์ ์งํฅ๋ฒ ๋ฑ ๊ด๋?จ๋ฒ๋?น์ ์ํ์ฌ ์๊ฒฉํ ๊ธ์ง๋ฉ๋๋ค. [์๋ด ๋ณด๊ธฐ]</p>
			<div class="">
				<p class="footer_company_font2">Copyright ยฉ 2021 kmong Inc. All rights reserved.</p>
			</div>
		</div>
		
	
</footer>
</body>
</html>