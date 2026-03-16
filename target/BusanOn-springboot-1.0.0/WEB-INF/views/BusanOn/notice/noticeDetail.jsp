<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${notice.title} | 공지사항 | 부산온나</title>
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
    .notice-detail-box {
        background: var(--card-bg, #fff);
        border-radius: 16px;
        box-shadow: var(--card-shadow, 0 4px 20px rgba(0,0,0,0.06));
        overflow: hidden;
        border: 1px solid var(--card-border, rgba(0,0,0,0.08));
    }
    .notice-detail-header {
        padding: 32px 40px;
        border-bottom: 1px solid var(--border-color, #e2e8f0);
    }
    .notice-detail-header h3 {
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--text-color, #2d3748);
        margin-bottom: 12px;
    }
    .notice-meta-bar {
        display: flex;
        gap: 20px;
        font-size: 0.85rem;
        color: var(--text-muted, #718096);
    }
    .notice-content {
        padding: 40px;
        font-size: 0.95rem;
        line-height: 1.9;
        color: var(--text-color, #2d3748);
        min-height: 200px;
        white-space: pre-wrap;
    }
    .notice-footer-bar {
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
        <div class="row"><h2>공지사항</h2></div>
    </div>
</div>

<main class="main-content">
<div class="container my-5">
    <div class="notice-detail-box animate__animated animate__fadeInUp">
        <div class="notice-detail-header">
            <div style="display: inline-block; background: linear-gradient(135deg,#667eea,#764ba2); color:#fff; padding: 4px 14px; border-radius: 20px; font-size: 0.78rem; font-weight: 600; margin-bottom: 14px;">
                <i class="fas fa-bullhorn"></i> 공지
            </div>
            <h3>${notice.title}</h3>
            <div class="notice-meta-bar">
                <span><i class="fas fa-user"></i> ${notice.writer_id}</span>
                <span><i class="fas fa-calendar"></i> ${notice.created_at}</span>
                <span><i class="fas fa-eye"></i> ${notice.views}</span>
            </div>
        </div>
        <div class="notice-content">${notice.content}</div>
        <div class="notice-footer-bar">
            <c:if test="${sessionScope.user_type == '0'}">
                <a href="${pageContext.request.contextPath}/admin/noticeDelete?notice_id=${notice.notice_id}"
                   class="btn btn-sm btn-danger"
                   style="border-radius: 8px;"
                   onclick="return confirm('공지사항을 삭제하시겠습니까?')">
                    <i class="fas fa-trash"></i> 삭제
                </a>
            </c:if>
            <a href="${pageContext.request.contextPath}/notice/noticeList" class="btn btn-sm btn-outline-secondary" style="border-radius: 8px;">
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
