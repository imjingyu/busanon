<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>공지사항 | 부산온나</title>
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
    .notice-board { background: var(--card-bg,#fff); border-radius: 16px; overflow: hidden; box-shadow: var(--card-shadow, 0 4px 20px rgba(0,0,0,0.06)); }
    .notice-board-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: #fff; padding: 28px 32px;
    }
    .notice-board-header h4 { margin: 0; font-size: 1.3rem; font-weight: 700; }
    .notice-board-header p { margin: 6px 0 0; opacity: 0.85; font-size: 0.88rem; }
    .notice-row {
        display: flex;
        align-items: center;
        padding: 18px 24px;
        border-bottom: 1px solid var(--border-color, #e2e8f0);
        text-decoration: none;
        color: var(--text-color, #2d3748);
        transition: background 0.15s;
        gap: 16px;
    }
    .notice-row:hover { background: var(--notice-row-hover, #f0f4ff); text-decoration: none; color: var(--text-color, #2d3748); }
    .notice-row:last-child { border-bottom: none; }
    .notice-num { min-width: 40px; font-size: 0.82rem; color: var(--text-muted, #718096); text-align: center; }
    .notice-title { flex: 1; font-size: 0.95rem; font-weight: 500; }
    .notice-meta { font-size: 0.8rem; color: var(--text-muted, #718096); white-space: nowrap; }
    .notice-views { font-size: 0.78rem; color: var(--text-muted, #718096); min-width: 60px; text-align: right; }
    .empty-notice { text-align: center; padding: 60px 20px; color: var(--text-muted, #a0aec0); }
    .paging-wrap { display: flex; justify-content: center; gap: 6px; margin-top: 24px; flex-wrap: wrap; }
    .paging-wrap a, .paging-wrap span {
        display: inline-flex; align-items: center; justify-content: center;
        width: 36px; height: 36px; border-radius: 8px;
        font-size: 0.88rem; font-weight: 600; text-decoration: none;
        background: var(--card-bg,#fff); color: var(--text-color,#2d3748);
        border: 1px solid var(--border-color,#e2e8f0);
        transition: background 0.15s, color 0.15s;
    }
    .paging-wrap a:hover { background: #667eea; color: #fff; border-color: #667eea; }
    .paging-wrap .current { background: #667eea; color: #fff; border-color: #667eea; }
    </style>
</head>
<body>
<%@ include file="../header.jsp" %>

<div class="page-nav no-margin row">
    <div class="container">
        <div class="row"><h2>공지사항</h2></div>
    </div>
</div>

<main class="main-content">
<div class="container my-5">
    <div class="notice-board animate__animated animate__fadeInUp">
        <div class="notice-board-header d-flex justify-content-between align-items-center">
            <div>
                <h4><i class="fas fa-bullhorn"></i> 공지사항</h4>
                <p>부산온나의 새로운 소식과 공지를 확인하세요.</p>
            </div>
            <c:if test="${sessionScope.user_type == '0'}">
                <a href="${pageContext.request.contextPath}/admin/noticeWrite" class="btn btn-light btn-sm" style="border-radius: 8px; font-weight: 600;">
                    <i class="fas fa-pen"></i> 작성
                </a>
            </c:if>
        </div>

        <!-- 목록 헤더 -->
        <div class="notice-row" style="background: var(--table-stripe,#f7fafc); font-weight: 700; pointer-events: none; font-size: 0.82rem; color: var(--text-muted,#718096);">
            <span class="notice-num">번호</span>
            <span class="notice-title">제목</span>
            <span class="notice-meta">작성일</span>
            <span class="notice-views"><i class="fas fa-eye"></i> 조회</span>
        </div>

        <c:choose>
            <c:when test="${empty list}">
                <div class="empty-notice">
                    <i class="fas fa-bullhorn d-block mb-3" style="font-size: 2.5rem;"></i>
                    <p style="font-size: 1rem; font-weight: 600;">등록된 공지사항이 없습니다.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${list}" var="notice">
                    <a class="notice-row" href="${pageContext.request.contextPath}/notice/noticeDetail?notice_id=${notice.notice_id}">
                        <span class="notice-num">${notice.notice_id}</span>
                        <span class="notice-title">${notice.title}</span>
                        <span class="notice-meta">${notice.created_at}</span>
                        <span class="notice-views">${notice.views}</span>
                    </a>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- 페이징 -->
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
