<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>이벤트 | 부산온나</title>
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
    .event-hero-banner {
        background: linear-gradient(135deg, #38b2d8 0%, #2c7be5 50%, #38b2d8 100%);
        border-radius: 20px;
        color: #fff;
        padding: 48px 40px;
        margin-bottom: 40px;
        text-align: center;
    }
    .event-hero-banner h2 { font-size: 2rem; font-weight: 800; margin-bottom: 8px; }
    .event-hero-banner p  { opacity: 0.9; font-size: 1rem; }

    .event-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 24px; }
    .event-card {
        background: var(--card-bg, #fff);
        border-radius: 16px;
        box-shadow: var(--card-shadow, 0 4px 20px rgba(0,0,0,0.06));
        border: 1px solid var(--card-border, rgba(0,0,0,0.06));
        overflow: hidden;
        transition: transform 0.2s, box-shadow 0.2s;
        display: flex;
        flex-direction: column;
    }
    .event-card:hover { transform: translateY(-4px); box-shadow: 0 12px 40px rgba(0,0,0,0.12); text-decoration: none; }
    .event-card-thumb {
        height: 140px;
        background: linear-gradient(135deg, #38b2d8 0%, #2c7be5 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 3rem;
    }
    .event-card-body { padding: 20px; flex: 1; display: flex; flex-direction: column; }
    .event-badge {
        display: inline-block;
        padding: 3px 10px;
        border-radius: 20px;
        font-size: 0.75rem;
        font-weight: 700;
        margin-bottom: 10px;
    }
    .badge-active { background: #c6f6d5; color: #276749; }
    .badge-ended  { background: #e2e8f0; color: #718096; }
    .event-card-title { font-size: 1rem; font-weight: 700; color: var(--text-color, #2d3748); margin-bottom: 8px; }
    .event-card-period { font-size: 0.82rem; color: var(--text-muted, #718096); margin-top: auto; padding-top: 12px; }
    .empty-event { text-align: center; padding: 80px 20px; color: var(--text-muted, #a0aec0); }

    .paging-wrap { display: flex; justify-content: center; gap: 6px; margin-top: 32px; flex-wrap: wrap; }
    .paging-wrap a, .paging-wrap span {
        display: inline-flex; align-items: center; justify-content: center;
        width: 36px; height: 36px; border-radius: 8px;
        font-size: 0.88rem; font-weight: 600; text-decoration: none;
        background: var(--card-bg,#fff); color: var(--text-color,#2d3748);
        border: 1px solid var(--border-color,#e2e8f0);
        transition: background 0.15s, color 0.15s;
    }
    .paging-wrap a:hover { background: #38b2d8; color: #fff; border-color: #38b2d8; }
    .paging-wrap .current { background: #38b2d8; color: #fff; border-color: #38b2d8; }
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

    <div class="event-hero-banner animate__animated animate__fadeInDown">
        <h2><i class="fas fa-gift"></i> 부산온나 이벤트</h2>
        <p>다양한 혜택과 이벤트를 확인하고 알뜰하게 여행을 즐기세요!</p>
        <c:if test="${sessionScope.user_type == '0'}">
            <a href="${pageContext.request.contextPath}/admin/eventWrite"
               class="btn btn-light mt-3" style="border-radius: 10px; font-weight: 700;">
                <i class="fas fa-pen"></i> 이벤트 등록
            </a>
        </c:if>
    </div>

    <c:choose>
        <c:when test="${empty list}">
            <div class="empty-event">
                <i class="fas fa-gift d-block mb-3" style="font-size: 3rem;"></i>
                <p style="font-size: 1.1rem; font-weight: 600;">진행 중인 이벤트가 없습니다.</p>
                <p style="font-size: 0.9rem;">곧 새로운 이벤트가 열릴 예정입니다!</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="event-grid animate__animated animate__fadeInUp">
                <c:forEach items="${list}" var="ev">
                    <a class="event-card" href="${pageContext.request.contextPath}/event/eventDetail?event_id=${ev.event_id}">
                        <div class="event-card-thumb">🎁</div>
                        <div class="event-card-body">
                            <c:choose>
                                <c:when test="${ev.status == 'Y'}">
                                    <span class="event-badge badge-active"><i class="fas fa-circle" style="font-size:0.5rem;"></i> 진행중</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="event-badge badge-ended">종료</span>
                                </c:otherwise>
                            </c:choose>
                            <div class="event-card-title">${ev.title}</div>
                            <div class="event-card-period">
                                <i class="fas fa-calendar-alt"></i>
                                ${ev.start_date} ~ ${ev.end_date}
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>

    <c:if test="${page != null}">
        <div class="paging-wrap">
            <c:if test="${page.prev}">
                <a href="?pageNum=${page.startPage - 1}"><i class="fas fa-chevron-left"></i></a>
            </c:if>
            <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
                <c:choose>
                    <c:when test="${i == page.pageNum}"><span class="current">${i}</span></c:when>
                    <c:otherwise><a href="?pageNum=${i}">${i}</a></c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${page.next}">
                <a href="?pageNum=${page.endPage + 1}"><i class="fas fa-chevron-right"></i></a>
            </c:if>
        </div>
    </c:if>
</div>
</main>

<%@ include file="../footer.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>
</html>
