<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<!-- test -->
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
						<p><a href="/member/mypage/listReservation" class="learn-more">페이지 이동</a></p>
					</div>
				</div>
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<img class="d-block-3 mb-4" src="http://project.yermi.works/resources/assets/images/get-money.png" style="width:50px">
						<h3 class="text-black mb-3 font-weight-bold">포인트내역 조회</h3>
						<p class="text-black-50">포인트 내역을 조회합니다.</p>
						<p><a href="#" class="learn-more" id="mypagePoint">페이지 이동</a></p>
					</div>
				</div>
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<img class="d-block-3 mb-4" src="http://project.yermi.works/resources/assets/images/chat.png" style="width:50px">
						<h3 class="text-black mb-3 font-weight-bold">내가 쓴 댓글 조회</h3>
						<p class="text-black-50">내가 쓴 댓글을 조회합니다.</p>
						<p><a href="#" class="learn-more" id="mypageReply">페이지 이동</a></p>
					</div>
				</div>
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<img class="d-block-3 mb-4" src="http://project.yermi.works/resources/assets/images/phone-call.png" style="width:50px">
						<h3 class="text-black mb-3 font-weight-bold">1:1 문의내역</h3>
						<p class="text-black-50">1:1 문의내역을 조회합니다.</p>
						<p><a href="/member/mypage/listInquiry" class="learn-more">페이지 이동</a></p>
					</div>
				</div>	

				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<img class="d-block-3 mb-4" src="http://project.yermi.works/resources/assets/images/man.png" style="width:50px">
						<h3 class="text-black mb-3 font-weight-bold">회원정보 수정</h3>
						<p class="text-black-50">회원정보를 수정합니다.</p>
						<p><a href="/member/modify" class="learn-more">페이지 이동</a></p>
					</div>
				</div>
				
				<div class="col-6 col-lg-4">
					<div class="box-feature mb-4">
						<img class="d-block-3 mb-4" src="http://project.yermi.works/resources/assets/images/settings.png" style="width:50px">
						<h3 class="text-black mb-3 font-weight-bold">관리자 페이지</h3>
						<p class="text-black-50">관리자 페이지로 이동합니다.</p>
						<p><a href="${pageContext.request.contextPath }/admin/a_index" class="learn-more">페이지 이동</a></p>
					</div>
				</div>
				
			</div>
		</div>
	</div>

<!-- 마이페이지 폼 끝-->

<!--  ************************* Footer Start Here ************************** --> 
     
    </body>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>
</html>
