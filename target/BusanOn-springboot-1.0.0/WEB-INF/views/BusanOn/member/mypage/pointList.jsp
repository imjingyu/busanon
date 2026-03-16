<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>포인트 내역 | 부산온나</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/premium.css">
    <script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <style>
    .point-hero {
        background: linear-gradient(135deg, #38b2d8 0%, #2c7be5 100%);
        border-radius: 20px;
        color: #fff;
        padding: 40px 32px;
        margin-bottom: 32px;
        position: relative;
        overflow: hidden;
    }
    .point-hero::after {
        content: '';
        position: absolute;
        right: -30px; top: -30px;
        width: 180px; height: 180px;
        background: rgba(255,255,255,0.1);
        border-radius: 50%;
    }
    .point-hero .balance-label { font-size: 0.9rem; opacity: 0.85; margin-bottom: 6px; }
    .point-hero .balance-amount {
        font-size: 3rem;
        font-weight: 800;
        letter-spacing: -1px;
        line-height: 1;
    }
    .point-hero .balance-amount span { font-size: 1.4rem; font-weight: 600; margin-left: 4px; }
    .point-hero .point-info { font-size: 0.8rem; opacity: 0.75; margin-top: 10px; }

    .point-table th { background: #f7fafc; font-size: 0.85rem; color: #718096; font-weight: 600; }
    .point-badge-earn { color: #38a169; font-weight: 700; font-size: 1rem; }
    .point-badge-use  { color: #e53e3e; font-weight: 700; font-size: 1rem; }
    .point-amount-earn { color: #38a169; font-weight: 700; }
    .point-amount-use  { color: #e53e3e; font-weight: 700; }
    .empty-state { text-align: center; padding: 60px 20px; color: #a0aec0; }
    .empty-state i { font-size: 3rem; margin-bottom: 16px; }
    </style>
</head>
<body>
<%@ include file="../../header.jsp" %>

<div style="background:linear-gradient(90deg,#1a2332 0%,#2d4a6e 45%,#38b2d8 100%);padding:22px 0;">
    <div style="max-width:1100px;margin:0 auto;padding:0 24px;display:flex;align-items:center;justify-content:space-between;gap:16px;">
        <div style="color:#8fa3c0;font-size:12px;white-space:nowrap;">
            <a href="${pageContext.request.contextPath}/search/main" style="color:#8fa3c0;text-decoration:none;">홈</a> &rsaquo;
            <a href="${pageContext.request.contextPath}/member/m_myPage" style="color:#8fa3c0;text-decoration:none;">마이페이지</a> &rsaquo; 포인트 내역
        </div>
        <h1 style="color:#fff;font-size:22px;font-weight:800;margin:0;white-space:nowrap;">
            <i class="fas fa-coins" style="color:#fff;margin-right:8px;"></i>포인트 내역
        </h1>
    </div>
</div>

<main class="main-content">
<div class="container my-5">

    <!-- 포인트 요약 카드 -->
    <div class="point-hero animate__animated animate__fadeInDown">
        <div class="balance-label"><i class="fas fa-coins"></i> 현재 보유 포인트</div>
        <div class="balance-amount">
            <fmt:formatNumber value="${balance}" pattern="#,###"/><span>P</span>
        </div>
        <div class="point-info">
            적립 기준: 회원가입 +500P · 예약완료 결제금액의 1% · 리뷰작성 +200P
        </div>
    </div>

    <!-- 포인트 내역 테이블 -->
    <div class="card shadow-sm" style="border-radius: 16px; border: none;">
        <div class="card-header py-3" style="border-radius: 16px 16px 0 0; background: transparent; border-bottom: 1px solid var(--border-color);">
            <h6 class="m-0 font-weight-bold" style="color: var(--text-color);">
                <i class="fas fa-history"></i> 포인트 적립/사용 내역
            </h6>
        </div>
        <div class="card-body p-0">
            <c:choose>
                <c:when test="${empty pointList}">
                    <div class="empty-state">
                        <i class="fas fa-coins d-block"></i>
                        <p style="font-size: 1.1rem; font-weight: 600;">포인트 내역이 없습니다.</p>
                        <p style="font-size: 0.9rem;">예약을 완료하거나 리뷰를 작성하면 포인트가 적립됩니다!</p>
                        <a href="${pageContext.request.contextPath}/search/searchP" class="btn btn-primary mt-3">
                            <i class="fas fa-search"></i> 펜션 둘러보기
                        </a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="table-responsive">
                        <table class="table point-table mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 100px;">구분</th>
                                    <th>내용</th>
                                    <th style="width: 130px;">포인트</th>
                                    <th style="width: 130px;">잔액</th>
                                    <th style="width: 160px;">일시</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${pointList}" var="pt">
                                    <tr>
                                        <td>
                                            <c:choose>
                                                <c:when test="${pt.point_type == 'EARN'}">
                                                    <span class="badge badge-pill" style="background: #c6f6d5; color: #276749; padding: 6px 12px; font-size: 0.82rem;">
                                                        <i class="fas fa-plus-circle"></i> 적립
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-pill" style="background: #fed7d7; color: #9b2c2c; padding: 6px 12px; font-size: 0.82rem;">
                                                        <i class="fas fa-minus-circle"></i> 사용
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="vertical-align: middle;">${pt.description}</td>
                                        <td style="vertical-align: middle;">
                                            <c:choose>
                                                <c:when test="${pt.point_type == 'EARN'}">
                                                    <span class="point-amount-earn">+<fmt:formatNumber value="${pt.point_amount}" pattern="#,###"/>P</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="point-amount-use">-<fmt:formatNumber value="${pt.point_amount}" pattern="#,###"/>P</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <fmt:formatNumber value="${pt.balance}" pattern="#,###"/>P
                                        </td>
                                        <td style="vertical-align: middle; color: var(--text-muted); font-size: 0.85rem;">
                                            ${pt.created_at}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="mt-4 text-center">
        <a href="${pageContext.request.contextPath}/member/m_myPage" class="btn btn-outline-secondary" style="border-radius: 10px;">
            <i class="fas fa-arrow-left"></i> 마이페이지로
        </a>
    </div>
</div>
</main>

<%@ include file="../../footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>
</html>
