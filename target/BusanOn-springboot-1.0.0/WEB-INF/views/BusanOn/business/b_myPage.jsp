<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
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
    <style>
    a {
  color: #009ECE;
  -webkit-transition: .3s all ease;
  -o-transition: .3s all ease;
  transition: .3s all ease; }
  a:hover {
    color: #009ECE;
    text-decoration: none; }
    </style>
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

 <div class="section bg-light" style="margin-top: 25px;">
		<div class="container">
			<div class="row">
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<img class="d-block-3 mb-4" src="http://project.yermi.works/resources/assets/images/note.png" style="width:50px">
						<h3 class="text-black mb-3 font-weight-bold">예약내역 조회</h3>
						<p class="text-black-50">펜션 예약 내역을 조회합니다.</p>
						<p><a href="/business/mypage/listReservation" class="learn-more">페이지 이동</a></p>
					</div>
				</div>
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<i class="fas fa-coins d-block mb-4" style="font-size:50px; color:#38b2d8;"></i>
						<h3 class="text-black mb-3 font-weight-bold"><a href="${pageContext.request.contextPath}/member/mypage/pointList">포인트내역 조회</a></h3>
						<p class="text-black-50">포인트 내역을 조회합니다.</p>
					</div>
				</div>
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<i class="fas fa-star d-block mb-4" style="font-size:50px; color:#38b2d8;"></i>
						<h3 class="text-black mb-3 font-weight-bold"><a href="${pageContext.request.contextPath}/business/b_reviewlist">받은 리뷰 조회</a></h3>
						<p class="text-black-50">내 업체에 작성된 리뷰를 조회합니다.</p>
					</div>
				</div>
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<img class="d-block-3 mb-4" src="http://project.yermi.works/resources/assets/images/phone-call.png" style="width:50px">
						<h3 class="text-black mb-3 font-weight-bold">1:1 문의내역</h3>
						<p class="text-black-50">1:1 문의내역을 조회합니다.</p>
						<p><a href="/business/mypage/listInquiry" class="learn-more">페이지 이동</a></p>
					</div>
				</div>	

				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<img class="d-block-3 mb-4" src="http://project.yermi.works/resources/assets/images/man.png" style="width:50px">
						<h3 class="text-black mb-3 font-weight-bold">회원정보 수정</h3>
						<p class="text-black-50">회원정보를 수정합니다.</p>
						<p><a href="/business/modify" class="learn-more">페이지 이동</a></p>
					</div>
				</div>
				
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<img class="d-block-3 mb-4" src="http://project.yermi.works/resources/assets/images/settings.png" style="width:50px">
						<h3 class="text-black mb-3 font-weight-bold">사업자 페이지</h3>
						<p class="text-black-50">사업자 페이지로 이동합니다.</p>
						<p><a href="${pageContext.request.contextPath }/business/b_index" class="learn-more">페이지 이동</a></p>
					</div>
				</div>
				
			</div>
		</div>
	</div>

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
