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
    <style>
    .passcheck-wrap {
        min-height: calc(100vh - 200px);
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 60px 16px;
        background: #f7f9fc;
    }
    .passcheck-card {
        background: #fff;
        border-radius: 16px;
        box-shadow: 0 4px 30px rgba(0,0,0,0.10);
        padding: 50px 44px 44px;
        width: 100%;
        max-width: 420px;
        text-align: center;
    }
    .passcheck-icon {
        width: 72px;
        height: 72px;
        background: #e8f5fa;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 22px;
        font-size: 32px;
        color: #38b2d8;
    }
    .passcheck-card h3 {
        font-size: 22px;
        font-weight: 800;
        color: #1a2332;
        margin-bottom: 8px;
    }
    .passcheck-card p {
        font-size: 14px;
        color: #718096;
        margin-bottom: 28px;
        line-height: 1.6;
    }
    .passcheck-card .form-control {
        border: 1.5px solid #e2e8f0;
        border-radius: 10px;
        padding: 13px 16px;
        font-size: 15px;
        margin-bottom: 16px;
        transition: border-color 0.2s;
    }
    .passcheck-card .form-control:focus {
        border-color: #38b2d8;
        box-shadow: 0 0 0 3px rgba(56,178,216,0.12);
    }
    .passcheck-submit {
        width: 100%;
        background: #38b2d8;
        color: #fff;
        border: none;
        border-radius: 10px;
        padding: 14px;
        font-size: 18px;
        font-family: 'Do Hyeon', sans-serif;
        cursor: pointer;
        transition: background 0.2s;
        margin-top: 4px;
    }
    .passcheck-submit:hover { background: #2c9fc4; }
    </style>
</head>

<body>
<%@ include file="../header.jsp" %>

<div class="passcheck-wrap">
    <div class="passcheck-card">
        <div class="passcheck-icon">
            <i class="bi bi-person-lock"></i>
        </div>
        <h3>비밀번호 확인</h3>
        <p>개인정보 보호를 위해<br>비밀번호를 다시 입력해 주세요.</p>
        <form action="userpasscheck?type=${type}" id="fr" method="post">
            <input class="form-control" type="password" name="password" id="password" required placeholder="비밀번호를 입력하세요">
            <button class="passcheck-submit" type="submit">확 인</button>
        </form>
    </div>
</div>

<%@ include file="../footer.jsp" %>

<<<<<<< HEAD
</body>
=======
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
>>>>>>> parent of fee9d09 (1234)

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>
</html>
