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
    <script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/daum_address_api.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
     <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
</head>

<style>
.member-edit-section { padding: 50px 0 60px; background: #f7f9fc; min-height: calc(100vh - 200px); }
.member-edit-card { background: #fff; border-radius: 16px; box-shadow: 0 4px 30px rgba(0,0,0,0.09); overflow: hidden; max-width: 620px; margin: 0 auto; }
.member-edit-head { background: linear-gradient(135deg, #1a2332 0%, #2d4a6e 100%); padding: 28px 36px; }
.member-edit-head h3 { color: #fff; font-size: 20px; font-weight: 700; margin: 0; }
.member-edit-head h3 i { color: #38b2d8; margin-right: 8px; }
.member-edit-grid { padding: 28px 36px 8px; display: grid; grid-template-columns: 120px 1fr; gap: 0; }
.field-label { display: flex; align-items: center; font-size: 13px; font-weight: 700; color: #4a5568; padding: 10px 0; border-bottom: 1px solid #f0f4f8; }
.field-control { padding: 6px 0; border-bottom: 1px solid #f0f4f8; display: flex; align-items: center; }
.field-control .form-control { border: 1.5px solid #e2e8f0; border-radius: 8px; padding: 10px 14px; font-size: 14px; }
.field-control .form-control:focus { border-color: #38b2d8; box-shadow: 0 0 0 3px rgba(56,178,216,0.12); }
.inline-row { display: flex; gap: 8px; width: 100%; }
.member-edit-actions { padding: 24px 36px; display: flex; justify-content: flex-end; }
.member-edit-actions .btn { font-size: 18px; font-family: 'Do Hyeon', sans-serif; padding: 10px 36px; border-radius: 9px; background: #38b2d8; border-color: #38b2d8; }
.member-edit-actions .btn:hover { background: #2c9fc4; border-color: #2c9fc4; }
</style>
<body>
<%@ include file="../header.jsp" %>

<!-- 마이페이지 폼 시작-->
<form action="updateuser" method="post">
    <section class="member-edit-section">
        <div class="container">
            <div class="member-edit-card">
                <div class="member-edit-head">
                    <h3><i class="bi bi-person-gear"></i> 회원정보 수정</h3>
                </div>

                <div class="member-edit-grid">
                    <div class="field-label">이름</div>
                    <div class="field-control">
                        <input class="form-control" type="text" name="user_name" id="user_name" required placeholder="이름" value="${MemberDTO.USER_NAME}">
                    </div>

                    <c:if test="${not fn:contains(sessionScope.user_id,'APIlogin')}">
                        <div class="field-label">패스워드</div>
                        <div class="field-control">
                            <input class="form-control" type="password" name="password" id="password" required placeholder="패스워드">
                        </div>
                    </c:if>

                    <div class="field-label">휴대폰 번호</div>
                    <div class="field-control">
                        <input class="form-control" type="text" name="user_phonenumber" id="user_phonenumber" required placeholder="휴대폰 번호 ex) 000-0000-0000" maxlength="13" value="${MemberDTO.USER_PHONENUMBER}">
                    </div>

                    <div class="field-label">우편번호</div>
                    <div class="field-control">
                        <div class="inline-row">
                            <input class="form-control" type="text" name="postNum" id="postNum" required placeholder="우편번호">
                            <input class="btn btn-danger" type="button" value="우편번호 검색" onclick="addressSearch()" style="width: 220px; font-size: 20px; font-family: 'Do Hyeon', sans-serif;">
                        </div>
                    </div>

                    <div class="field-label">주소</div>
                    <div class="field-control">
                        <input class="form-control" type="text" name="user_address" id="user_address" required placeholder="주소" value="${MemberDTO.USER_ADDRESS}">
                    </div>

                    <div class="field-label">상세주소</div>
                    <div class="field-control">
                        <input class="form-control" type="text" name="user_address1" id="user_address1" required placeholder="상세주소">
                    </div>
                </div>

                <div class="member-edit-actions">
                    <input class="btn btn-danger" id="loginbtn" type="submit" value="입 력" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif;">
                </div>
            </div>
        </div>
    </section>
</form>
<!-- 마이페이지 폼 끝-->


<!--  ************************* Footer Start Here ************************** --> 
     
<<<<<<< HEAD
    
<%@ include file="../footer.jsp" %>

</body>
=======
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
