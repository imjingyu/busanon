<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>1:1 문의 | 부산온나</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/premium.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/memberMyPage/qna.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<style>
.mypage-hero { background: linear-gradient(90deg, #1a2332 0%, #2d4a6e 45%, #38b2d8 100%); padding: 22px 0; }
.mypage-hero-inner { max-width:1100px; margin:0 auto; padding:0 24px; display:flex; align-items:center; justify-content:space-between; gap:16px; }
.mypage-hero h1 { color:#fff; font-size:22px; font-weight:800; margin:0; white-space:nowrap; }
.breadcrumb-line { color:#8fa3c0; font-size:12px; white-space:nowrap; }
.breadcrumb-line a { color:#8fa3c0; text-decoration:none; }
.breadcrumb-line a:hover { color:#fff; }
.back-btn { display:inline-flex; align-items:center; gap:6px; padding:10px 24px; border:1.5px solid #e2e8f0; border-radius:10px; background:#fff; color:#718096; font-size:15px; font-family:'Do Hyeon',sans-serif; text-decoration:none; }
.back-btn:hover { color:#38b2d8; border-color:#38b2d8; }
.mypage-content { background:#f7f9fc; min-height:60vh; padding:36px 0 60px; }
.mypage-card { background:#fff; border-radius:14px; box-shadow:0 2px 20px rgba(0,0,0,.08); overflow:hidden; max-width:1100px; margin:0 auto; }
.mypage-card-head { padding:20px 28px; border-bottom:1px solid #f0f4f8; }
.mypage-card-head h5 { margin:0; font-size:16px; font-weight:700; color:#1a2332; }
.mypage-card-body { padding:0; }
.badge-info { background-color:#3182ce!important; color:#fff; }
.badge-danger { background-color:#e53e3e!important; color:#fff; }
.badge-warning { background-color:#d69e2e!important; color:#fff; }
/* 새 테이블 디자인 */
.modern-table { width:100%; border-collapse:collapse; }
.modern-table thead tr { border-bottom:2px solid #38b2d8; }
.modern-table thead th { padding:13px 20px; font-size:13px; font-weight:700; color:#2d4a6e; background:#f0f7ff; white-space:nowrap; }
.modern-table tbody tr { border-bottom:1px solid #f0f4f8; transition:background 0.12s; }
.modern-table tbody tr:last-child { border-bottom:none; }
.modern-table tbody tr:hover { background:#f7fbff; }
.modern-table tbody td { padding:14px 20px; font-size:14px; color:#4a5568; vertical-align:middle; }
.tbl-empty td { text-align:center; padding:60px 20px !important; }
.tbl-empty-icon { font-size:40px; color:#cbd5e0; margin-bottom:12px; }
.tbl-empty-msg { font-size:15px; font-weight:600; color:#718096; margin:0; }
.expand-row { background:#f7f9fc !important; }
/* 문의 작성 폼 */
.inquiry-write-section { background:#f7f9fc; border-radius:0 0 14px 14px; padding:28px 28px 32px; border-top:1px solid #f0f4f8; }
.inquiry-write-section .write-title { font-size:16px; font-weight:800; color:#1a2332; margin-bottom:18px; }
.inquiry-write-section .form-control { border:1.5px solid #e2e8f0; border-radius:8px; margin-bottom:12px; }
.inquiry-write-section .form-control:focus { border-color:#38b2d8; box-shadow:0 0 0 3px rgba(56,178,216,.12); }
.inquiry-write-section .btn-primary { background:#38b2d8; border-color:#38b2d8; font-family:'Do Hyeon',sans-serif; font-size:17px; padding:10px 0; border-radius:8px; }
.inquiry-write-section .btn-primary:hover { background:#2c9fc4; border-color:#2c9fc4; }
</style>
</head>
<body>
<%@ include file="../../header.jsp" %>

<div class="mypage-hero">
    <div class="mypage-hero-inner">
        <div class="breadcrumb-line"><a href="${pageContext.request.contextPath}/search/main">홈</a> &rsaquo; <a href="${pageContext.request.contextPath}/member/m_myPage">마이페이지</a> &rsaquo; 1:1 문의</div>
        <h1><i class="fas fa-comment-dots" style="color:#38b2d8;margin-right:10px;"></i>1:1 문의내역</h1>
    </div>
</div>

<div class="mypage-content">
<div style="max-width:1100px;margin:0 auto;padding:0 16px;">
<div class="mypage-card">
    <div class="mypage-card-head">
        <h5><i class="fas fa-headset" style="color:#38b2d8;margin-right:8px;"></i>부산온나 고객센터</h5>
    </div>
    <div class="mypage-card-body">
        <div style="overflow-x:auto;">
            <table class="modern-table" width="100%">
                <thead>
                    <tr>
                        <th style="width:130px;">상태</th>
                        <th>제목</th>
                        <th style="width:200px;">답변자</th>
                        <th style="width:180px;">문의시간</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${fn:length(list) eq 0}">
                        <tr class="tbl-empty">
                            <td colspan="4">
                                <div class="tbl-empty-icon"><i class="fas fa-comment-slash"></i></div>
                                <p class="tbl-empty-msg">문의 내역이 없습니다.</p>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list}" var="qna">
                            <tr style="cursor:pointer;" id="rep${qna.count}" onclick="showQna(this.id)">
                                <td>
                                    <c:choose>
                                        <c:when test="${qna.reply == 'Y'}">
                                            <span class="badge badge-info p-2">처리 완료</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-danger p-2">미답변</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${qna.title}</td>
                                <td style="color:#718096;"></td>
                                <td style="color:#718096;font-size:13px;">${qna.time}</td>
                            </tr>
                            <tr class="rep${qna.count} expand-row" style="display:none;">
                                <td colspan="4" style="padding:20px 24px;">
                                    <div style="font-size:13px;color:#38b2d8;font-weight:700;margin-bottom:8px;"><i class="fas fa-question-circle"></i> 문의 내용</div>
                                    <div style="color:#4a5568;line-height:1.8;white-space:pre-wrap;">${qna.content}</div>
                                </td>
                            </tr>
                            <c:if test="${qna.reply == 'Y'}">
                                <tr class="rep${qna.count}" style="display:none;background:#fffbeb;">
                                    <td><span class="badge badge-warning p-2">부산온나의 답변</span></td>
                                    <td>Q&amp;A : ${qna.title}</td>
                                    <td style="color:#718096;">${qna.writer}</td>
                                    <td style="color:#718096;font-size:13px;">${qna.answer_time}</td>
                                </tr>
                                <tr class="rep${qna.count}" style="display:none;background:#fffbeb;">
                                    <td colspan="4" style="padding:20px 24px;">
                                        <div style="font-size:13px;color:#38a169;font-weight:700;margin-bottom:8px;"><i class="fas fa-reply"></i> 답변 내용</div>
                                        <div style="color:#4a5568;line-height:1.8;white-space:pre-wrap;">${qna.answer}</div>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>

        <div class="inquiry-write-section">
            <div class="write-title"><i class="fas fa-pen" style="color:#38b2d8;margin-right:8px;"></i>문의 작성</div>
            <form action="qnainput" method="get" class="col-10 mx-auto" onsubmit="return lenc()">
                <input type="text" class="form-control" name="title" id="title" placeholder="문의 제목을 입력하세요">
                <textarea class="form-control" name="content" id="content" placeholder="문의 내용을 입력하세요" style="min-height:300px;resize:vertical;"></textarea>
                <br>
                <input type="submit" class="btn btn-primary btn-block" value="1:1 문의 등록">
            </form>
        </div>
    </div>
</div>
</div>
</div>

<<<<<<< HEAD
<div style="margin-top:28px;text-align:center;padding-bottom:20px;">
    <a href="${pageContext.request.contextPath}/member/m_myPage" class="back-btn">
        <i class="fas fa-arrow-left"></i> 마이페이지로
    </a>
</div>
=======
<!--  ************************* Footer Start Here ************************** --> 
     
    <%@ include file="../../footer.jsp" %>
    </body>
>>>>>>> parent of fee9d09 (1234)

<%@ include file="../../footer.jsp" %>

<script>AOS.init({ duration: 1000 });</script>
</body>
</html>
