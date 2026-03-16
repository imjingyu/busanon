<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>마이페이지 | 부산온나</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
<%@ include file="../header.jsp" %>

<main class="main-content">

    <!-- 히어로 배너 -->
    <div class="mypage-hero animate__animated animate__fadeIn">
        <div class="container">
            <div class="mypage-hero-inner">
                <div class="mypage-avatar">
                    <i class="fas fa-user-circle"></i>
                </div>
                <div class="mypage-hero-info">
                    <h2>${sessionScope.user_name}님, 환영합니다!</h2>
                    <p>부산온나에서 특별한 여행을 계획해 보세요 ✈</p>
                </div>
            </div>
        </div>
    </div>

    <!-- 카드 그리드 -->
    <div class="container mypage-cards-section">
        <div class="row g-4">

            <!-- 예약내역 -->
            <div class="col-6 col-lg-4">
                <a href="${pageContext.request.contextPath}/member/mypage/listReservation" class="mypage-card-link animate__animated animate__fadeInUp">
                    <div class="mypage-card-icon" style="background: linear-gradient(135deg, #38b2d8, #2c7be5);">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <h3>예약내역 조회</h3>
                    <p>펜션 예약 내역을 확인하고 관리하세요.</p>
                    <span class="mypage-card-arrow">이동하기 →</span>
                </a>
            </div>

            <!-- 찜한 숙소 -->
            <div class="col-6 col-lg-4">
                <a href="${pageContext.request.contextPath}/member/mypage/wishlist" class="mypage-card-link animate__animated animate__fadeInUp" style="animation-delay:0.05s;">
                    <div class="mypage-card-icon" style="background: linear-gradient(135deg, #fc8181, #e53e3e);">
                        <i class="fas fa-heart"></i>
                    </div>
                    <h3>찜한 숙소</h3>
                    <p>찜한 펜션 목록을 확인하세요.</p>
                    <span class="mypage-card-arrow">이동하기 →</span>
                </a>
            </div>

            <!-- 포인트 -->
            <div class="col-6 col-lg-4">
                <a href="${pageContext.request.contextPath}/member/mypage/pointList" class="mypage-card-link animate__animated animate__fadeInUp" style="animation-delay:0.05s;">
                    <div class="mypage-card-icon" style="background: linear-gradient(135deg, #f59e0b, #d97706);">
                        <i class="fas fa-coins"></i>
                    </div>
                    <h3>포인트내역</h3>
                    <p>적립된 포인트 내역을 조회합니다.</p>
                    <span class="mypage-card-arrow">이동하기 →</span>
                </a>
            </div>

            <!-- 내가 쓴 리뷰 -->
            <div class="col-6 col-lg-4">
                <a href="${pageContext.request.contextPath}/member/mypage/myreview" class="mypage-card-link animate__animated animate__fadeInUp" style="animation-delay:0.1s;">
                    <div class="mypage-card-icon" style="background: linear-gradient(135deg, #48bb78, #38a169);">
                        <i class="fas fa-star"></i>
                    </div>
                    <h3>내가 쓴 리뷰</h3>
                    <p>작성한 리뷰를 조회하고 관리하세요.</p>
                    <span class="mypage-card-arrow">이동하기 →</span>
                </a>
            </div>

            <!-- 1:1 문의 -->
            <div class="col-6 col-lg-4">
                <a href="${pageContext.request.contextPath}/member/mypage/listInquiry" class="mypage-card-link animate__animated animate__fadeInUp" style="animation-delay:0.15s;">
                    <div class="mypage-card-icon" style="background: linear-gradient(135deg, #9f7aea, #7c3aed);">
                        <i class="fas fa-comment-dots"></i>
                    </div>
                    <h3>1:1 문의내역</h3>
                    <p>문의 내역을 확인하고 답변을 받아보세요.</p>
                    <span class="mypage-card-arrow">이동하기 →</span>
                </a>
            </div>

            <!-- 회원정보 수정 -->
            <div class="col-6 col-lg-4">
                <a href="${pageContext.request.contextPath}/member/passcheck?type=u" class="mypage-card-link animate__animated animate__fadeInUp" style="animation-delay:0.2s;">
                    <div class="mypage-card-icon" style="background: linear-gradient(135deg, #ed8936, #c05621);">
                        <i class="fas fa-user-edit"></i>
                    </div>
                    <h3>회원정보 수정</h3>
                    <p>프로필 및 비밀번호를 수정합니다.</p>
                    <span class="mypage-card-arrow">이동하기 →</span>
                </a>
            </div>

            <!-- 회원 탈퇴 or 업체 관리 -->
            <div class="col-6 col-lg-4">
                <c:choose>
                    <c:when test="${sessionScope.user_type == 1}">
                        <a href="${pageContext.request.contextPath}/member/passcheck?type=d" class="mypage-card-link animate__animated animate__fadeInUp" style="animation-delay:0.25s;">
                            <div class="mypage-card-icon" style="background: linear-gradient(135deg, #fc8181, #e53e3e);">
                                <i class="fas fa-user-times"></i>
                            </div>
                            <h3>회원 탈퇴</h3>
                            <p>회원 탈퇴를 진행합니다.</p>
                            <span class="mypage-card-arrow">이동하기 →</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/business/b_index" class="mypage-card-link animate__animated animate__fadeInUp" style="animation-delay:0.25s;">
                            <div class="mypage-card-icon" style="background: linear-gradient(135deg, #4299e1, #2b6cb0);">
                                <i class="fas fa-building"></i>
                            </div>
                            <h3>업체 관리</h3>
                            <p>사업자 관리 페이지로 이동합니다.</p>
                            <span class="mypage-card-arrow">이동하기 →</span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </div>

</main>

<%@ include file="../footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>
</html>
