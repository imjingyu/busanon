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
    
</head>

<body>
<!--헤더 -->
<%@ include file="../../header.jsp" %>
 
<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
    <div class="container">
        <div class="row">
            <h2>예약내역조회</h2>
        </div>
    </div>
</div>

<!-- 마이페이지 폼 시작-->
<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow my-5">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">예약내역조회</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="text-center">
                                            <th>예약번호</th>
                                            <th>숙소이름</th>
                                            <th>체크인</th>
                                            <th>체크아웃</th>
                                            <th>승인상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${reservation}" var="r">
	                                        <tr>
	                                            <td class="text-center">${r.reservationNum}</td>
	                                            <td class="text-center"><a href="/pension/detail?pensionid=${r.pensionid}" class="text-dark">${r.roomName}</a></td>
	                                            <td class="text-center">${r.checkin}</td>
	                                            <td class="text-center">${r.checkout}</td>
	                                            <td class="text-center">${r.reservationStatus ? "예약" : "취소"}</td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
