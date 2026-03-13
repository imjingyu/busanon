<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Free Tour and Travel Website Tempalte | Smarteyeapps.com</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <c:if test="${fn:contains(sessionScope.user_id,'_naverAPIlogin') || fn:contains(sessionScope.user_id,'_kakaoAPIlogin')}">
    <script type="text/javascript">
    	location.href="userpasscheck?type=${type}";
    </script>
    
    </c:if>
    <!-- AOS 라이브러리 불러오기-->
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
</head>

<body>
<!--헤더 -->
<%@ include file="../header.jsp" %>
 
<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
    <div class="container">
        <div class="row">
            <h2>마이페이지</h2>
        </div>
    </div>
</div>

<!-- 마이페이지 폼 시작-->
<form action="userpasscheck?type=${type}" id="fr" method="post">
<%-- <c:if test="${type == 'd'}"> --%>
<!--  <script type="text/javascript"> -->
<!-- //  	fr.action = "deletecustom" -->
<!--  </script> -->
<%-- </c:if> --%>
<script> 
AOS.init({duration: 1000});// 자바스크립트로 init()을 해야 동작한다.
        </script>
 <div class="section bg-light" style="margin-top: 25px;">
		<div class="container" data-aos="flip-left" data-aos-anchor-placement="top-center">
			<div class="row">
			<div class="col-6 col-lg-4"></div>
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4" style="margin-top: 50px;">
						<i class="bi bi-person-gear d-block-3 mb-4" style="font-size:50px;"></i>
						<h3 class="text-black mb-3 font-weight-bold">패스워드 입력</h3>
						<div class="form-group">
					     <input class="form-control" type="password" name="password" id="password" required placeholder="비밀번호">
					    </div>
<!-- 						<p><a href="#" class="learn-more" id="mypagePoint">페이지 이동</a></p> -->
					</div>
				</div>
			<div class="col-6 col-lg-4"></div>
			<div class="col-6 col-lg-4"></div>
			<div class="col-6 col-lg-4" style="margin-bottom: 50px;">
			<input class="btn btn-danger w-100" id="loginbtn" type="submit" value="입 력" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif; padding: 0.75px 0.75px;">
			</div>
			</div>
		</div>
	</div>
</form>
<!-- 마이페이지 폼 끝-->

<!--  ************************* Footer Start Here ************************** --> 
     
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <h2>About Us</h2>
                    <p>
                        Smart Eye is a leading provider of information technology, consulting, and business process services. Our dedicated employees offer strategic insights, technological expertise and industry experience.
                    </p>
                    <p>We focus on technologies that promise to reduce costs, streamline processes and speed time-to-market, Backed by our strong quality processes and rich experience managing global... </p>
                </div>
                <div class="col-md-4 col-sm-12">
                    <h2>Useful Links</h2>
                    <ul class="list-unstyled link-list">
                        <li><a ui-sref="about" href="#/about">About us</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="portfolio" href="#/portfolio">Portfolio</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="products" href="#/products">Latest jobs</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="gallery" href="#/gallery">Pricing</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="contact" href="#/contact">Contact us</a><i class="fa fa-angle-right"></i></li>
                    </ul>
                </div>
                <div class="col-md-4 col-sm-12 map-img">
                    <h2>Contact Us</h2>
                    <address class="md-margin-bottom-40">
                        BlueDart Hosting <br>
                       765th Boulevard, <br>
                        Rochester, CA <br>
                        Phone: +1 831 143 556 <br>
                        Email: <a href="mailto:info@bluedart.com" class="">info@bluedart.in</a><br>
                        Web: <a href="https://smarteyeapps.com/" class="">www.bluedart.in</a>
                    </address>

                </div>
            </div>
        </div>
        

    </footer>
    <div class="copy">
            <div class="container">
                <a href="https://www.smarteyeapps.com/">2019 &copy; All Rights Reserved | Designed and Developed by Smarteyeapps</a>
                
                <span>
                <a><i class="fab fa-github"></i></a>
                <a><i class="fab fa-google-plus-g"></i></a>
                <a><i class="fab fa-pinterest-p"></i></a>
                <a><i class="fab fa-twitter"></i></a>
                <a><i class="fab fa-facebook-f"></i></a>
        </span>
            </div>

        </div> 

    </body>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>
</html>
