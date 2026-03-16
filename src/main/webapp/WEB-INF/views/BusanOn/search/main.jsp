<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Come to Busan - 부산온나</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/main.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/search.css" />
<style>
/* ===== 히어로 내 검색 패널 ===== */
.hero-search-wrap {
    position: absolute;
    bottom: -34px;
    left: 0;
    right: 0;
    z-index: 20;
    padding: 0 16px;
}
.hero-search-panel {
    max-width: 960px;
    margin: 0 auto;
    background: #fff;
    border-radius: 14px;
    box-shadow: 0 8px 32px rgba(0,0,0,0.22);
    padding: 0;
    overflow: hidden;
}
.hero-search-grid {
    display: flex;
    align-items: stretch;
    height: 64px;
}
.hero-search-field {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 6px 16px;
    min-width: 0;
    border-right: 1px solid #e2e8f0;
}
.hero-search-label {
    font-size: 10px;
    color: #718096;
    font-weight: 700;
    letter-spacing: 0.5px;
    text-transform: uppercase;
    margin-bottom: 2px;
    line-height: 1;
}
.hero-search-field input,
.hero-search-field select {
    background: transparent;
    border: none;
    outline: none;
    color: #1a2332;
    font-size: 14px;
    padding: 0;
    width: 100%;
    font-family: 'Noto Sans KR', 'Open Sans', sans-serif;
}
.hero-search-field input::placeholder { color: #a0aec0; }
.hero-search-btn {
    background: #38b2d8;
    color: #fff;
    border: none;
    padding: 0 28px;
    font-size: 17px;
    font-weight: 700;
    font-family: 'Do Hyeon', sans-serif;
    cursor: pointer;
    white-space: nowrap;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    gap: 7px;
    transition: background 0.2s;
}
.hero-search-btn:hover { background: #2c9fc4; }
@media (max-width: 768px) {
    .hero-search-grid { flex-direction: column; height: auto; }
    .hero-search-field { border-right: none; border-bottom: 1px solid #e2e8f0; padding: 10px 16px; }
    .hero-search-btn { width: 100%; height: 48px; justify-content: center; }
}
</style>

</head>

<body>
<%@ include file="../header.jsp" %>

<div class="main-page">
    <section class="hero-section">
        <div class="slider">
            <div class="owl-carousel ">
                <div class="slider-img">
                    <div class="item">
                        <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-0.jpg" alt=""></div>
                        <div class="container"><div class="row"><div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"><div class="animated bounceInDown slider-captions"></div></div></div></div>
                    </div>
                </div>
                <div class="item"><div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-1.jpg" alt=""></div><div class="container"><div class="row"><div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"><div class="slider-captions "></div></div></div></div></div>
                <div class="item"><div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-2.jpg" alt=""></div><div class="container"><div class="row"><div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"><div class="slider-captions "></div></div></div></div></div>
                <div class="item"><div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-3.jpg" alt=""></div><div class="container"><div class="row"><div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"><div class="slider-captions "></div></div></div></div></div>
                <div class="item"><div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-4.jpg" alt=""></div><div class="container"><div class="row"><div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"><div class="slider-captions "></div></div></div></div></div>
                <div class="item"><div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-5.jpg" alt=""></div><div class="container"><div class="row"><div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"><div class="slider-captions "></div></div></div></div></div>
                <div class="item"><div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-6.jpg" alt=""></div><div class="container"><div class="row"><div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"><div class="slider-captions "></div></div></div></div></div>
                <div class="item"><div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-8.jpg" alt=""></div><div class="container"><div class="row"><div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"><div class="slider-captions "></div></div></div></div></div>
            </div>

            <div class="hero-copy">
                <span class="hero-kicker"><i class="fas fa-map-marker-alt"></i> BUSAN STAY CURATION</span>
                <h1>부산의 감성을 담은<br>숙소를 가장 쉽게 찾다</h1>
                <div class="hero-badges">
                    <span><i class="far fa-calendar-check"></i> 날짜 기반 빠른 검색</span>
                    <span><i class="fas fa-hotel"></i> 인기 숙소 큐레이션</span>
                    <span><i class="fas fa-star"></i> 평점 중심 탐색</span>
                </div>
            </div>

            <!-- 검색 패널 (슬라이더 내부 하단 고정) -->
            <div class="hero-search-wrap">
            <div class="hero-search-panel">
                <form action="${pageContext.request.contextPath}/search/searchP" name="f" method="get" class="hero-search-grid">
                    <div class="hero-search-field">
                        <span class="hero-search-label">체크인</span>
                        <input type="date" id="checkin" min="${today}" value="${today}" class="main_checkin_1" name="rm_checkin" onchange="dateChk()" required>
                    </div>
                    <div class="hero-search-field">
                        <span class="hero-search-label">체크아웃</span>
                        <input type="date" id="checkout" min="${tomorrow}" value="${tomorrow}" class="main_checkout_1" name="rm_checkout" onchange="dateChk()" required>
                    </div>
                    <div class="hero-search-field" style="flex:0.6;">
                        <span class="hero-search-label">인원</span>
                        <select id="select_ro_count" onchange="change_ro_count()" name="rm_resable_num">
                            <option value="1">1명</option>
                            <option value="2" selected>2명</option>
                            <option value="3">3명</option>
                            <option value="4">4명</option>
                        </select>
                    </div>
                    <div class="hero-search-field">
                        <span class="hero-search-label">지역</span>
                        <input type="search" class="main_search_text" placeholder="숙소 지역 입력" name="pen_address" value="${pen_address}">
                    </div>
                    <div class="hero-search-field">
                        <span class="hero-search-label">숙소명</span>
                        <input type="search" class="main_search_text" placeholder="숙소명 입력" name="pen_name" value="${pen_name}">
                    </div>
                    <button class="hero-search-btn" type="submit"><i class="fas fa-search"></i> 검색</button>
                </form>
            </div>
        </div>
    </section>

    <section class="curation-section container-fluid">
        <div class="container">
            <div class="section-intro">
                <span class="section-label">BUSAN ONNA PICK</span>
                <h2>부산에서 지금 가장 눈에 띄는 숙소</h2>
            </div>
            <div class="row">
                <c:forEach items="${TopList }" var="PensionDTO" begin="0" end="5" varStatus="status">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="stay-card">
                            <a class="stay-thumb" href="${pageContext.request.contextPath }/search/pensionDetail?pen_id=${PensionDTO.pen_id}">
                                <img src="${pageContext.request.contextPath }/upload/${PensionDTO.pen_image }" alt="${PensionDTO.pen_name}">
                                <span class="stay-rank"><i class="fas fa-fire"></i> TOP ${status.index + 1}</span>
                            </a>
                            <div class="stay-body">
                                <input type="hidden" name="pen_id" value="${PensionDTO.pen_id}">
                                <h3 class="stay-name">${PensionDTO.pen_name}</h3>
                                <p class="stay-address"><i class="fas fa-location-dot"></i><span>${PensionDTO.pen_address }</span></p>
                                <div class="stay-footer">
                                    <div class="stay-rating">
                                        <c:choose>
                                            <c:when test="${fn:length(PensionDTO.star.trim()) == 0}">
                                                <strong>평점 5점</strong>
                                                <div class="stay-stars">
                                                    <c:forEach var="i" begin="1" end="5" step="1">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <strong>평점 ${PensionDTO.star }</strong>
                                                <fmt:parseNumber var="star" type="number" value="${PensionDTO.star}" />
                                                <div class="stay-stars">
                                                    <c:forEach var="i" begin="1" end="5" step="1">
                                                        <c:choose>
                                                            <c:when test="${i <= star}">
                                                                <i class="fa fa-star"></i>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <i class="fa fa-star" style="opacity: .28;"></i>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <a class="stay-link" href="${pageContext.request.contextPath }/search/pensionDetail?pen_id=${PensionDTO.pen_id}">
                                        상세보기 <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
</div>

<%@ include file="../footer.jsp" %>

</body>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/script.js"></script>

</html>
