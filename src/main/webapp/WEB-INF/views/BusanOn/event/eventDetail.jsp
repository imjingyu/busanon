<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${event.title} | 이벤트 | 부산온나</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <style>
    .event-detail-box {
        background: var(--card-bg, #fff);
        border-radius: 20px;
        box-shadow: var(--card-shadow, 0 4px 20px rgba(0,0,0,0.06));
        overflow: hidden;
        border: 1px solid var(--card-border, rgba(0,0,0,0.08));
    }
    .event-detail-banner {
        background: linear-gradient(135deg, #38b2d8 0%, #2c7be5 50%, #38b2d8 100%);
        padding: 48px 40px;
        color: #fff;
        text-align: center;
    }
    .event-detail-banner .event-icon { font-size: 3.5rem; margin-bottom: 16px; }
    .event-detail-banner h2 { font-size: 1.8rem; font-weight: 800; margin-bottom: 12px; }
    .event-detail-banner .period-badge {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        background: rgba(255,255,255,0.2);
        padding: 8px 20px;
        border-radius: 30px;
        font-size: 0.88rem;
        font-weight: 600;
        backdrop-filter: blur(4px);
    }
    .event-content-area {
        padding: 40px;
        font-size: 0.95rem;
        line-height: 1.9;
        color: var(--text-color, #2d3748);
        min-height: 200px;
        white-space: pre-wrap;
    }
    .event-footer-bar {
        padding: 20px 40px;
        border-top: 1px solid var(--border-color, #e2e8f0);
        display: flex;
        gap: 10px;
        justify-content: flex-end;
        flex-wrap: wrap;
    }
    </style>
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="page-nav no-margin row">
    <div class="container">
        <div class="row"><h2>이벤트</h2></div>
    </div>
</div>

<main class="main-content">
<div class="container my-5">
    <div class="event-detail-box animate__animated animate__fadeInUp">
        <div class="event-detail-banner">
            <div class="event-icon">🎁</div>
            <h2>${event.title}</h2>
            <div class="period-badge">
                <i class="fas fa-calendar-alt"></i>
                ${event.start_date} ~ ${event.end_date}
            </div>
        </div>
        <div class="event-content-area">${event.content}</div>
        <div class="event-footer-bar">
            <c:if test="${sessionScope.user_type == '0'}">
                <a href="${pageContext.request.contextPath}/admin/eventDelete?event_id=${event.event_id}"
                   class="btn btn-sm btn-danger"
                   style="border-radius: 8px;"
                   onclick="return confirm('이벤트를 삭제하시겠습니까?')">
                    <i class="fas fa-trash"></i> 삭제
                </a>
            </c:if>
            <a href="${pageContext.request.contextPath}/event/eventList" class="btn btn-sm btn-outline-secondary" style="border-radius: 8px;">
                <i class="fas fa-list"></i> 목록으로
            </a>
        </div>
    </div>
</div>
</main>

<%@ include file="../footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>
</html>
