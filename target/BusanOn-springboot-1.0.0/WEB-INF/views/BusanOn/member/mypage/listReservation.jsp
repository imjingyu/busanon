<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>예약내역 | 부산온나</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
/* 예약내역 페이지 */
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
.mypage-card-head { padding:20px 28px; border-bottom:1px solid #f0f4f8; display:flex; align-items:center; justify-content:space-between; }
.mypage-card-head h5 { margin:0; font-size:16px; font-weight:700; color:#1a2332; }
.mypage-card-body { padding:0; }
/* 새 테이블 디자인 */
.modern-table { width:100%; border-collapse:collapse; }
.modern-table thead tr { border-bottom:2px solid #38b2d8; }
.modern-table thead th { padding:13px 20px; font-size:13px; font-weight:700; color:#2d4a6e; background:#f0f7ff; white-space:nowrap; text-align:center; }
.modern-table tbody tr { border-bottom:1px solid #f0f4f8; transition:background 0.12s; }
.modern-table tbody tr:last-child { border-bottom:none; }
.modern-table tbody tr:hover { background:#f7fbff; }
.modern-table tbody td { padding:14px 20px; font-size:14px; color:#4a5568; vertical-align:middle; text-align:center; }
.tbl-empty td { text-align:center !important; padding:60px 20px !important; }
.tbl-empty-icon { font-size:40px; color:#cbd5e0; margin-bottom:12px; }
.tbl-empty-msg { font-size:15px; font-weight:600; color:#718096; margin:0; }
.res-status-confirmed { color:#38b2d8; font-weight:700; }
.res-status-cancel { color:#e53e3e; font-weight:700; }
.res-status-locked { color:#48bb78; font-weight:700; }
</style>
</head>
<body>
<%@ include file="../../header.jsp" %>

<div class="mypage-hero">
    <div class="mypage-hero-inner">
        <div class="breadcrumb-line"><a href="${pageContext.request.contextPath}/search/main">홈</a> &rsaquo; <a href="${pageContext.request.contextPath}/member/m_myPage">마이페이지</a> &rsaquo; 예약내역</div>
        <h1><i class="fas fa-calendar-check" style="color:#38b2d8;margin-right:10px;"></i>예약내역 조회</h1>
    </div>
</div>

<div class="mypage-content">
<div style="max-width:1100px;margin:0 auto;padding:0 16px;">
<div class="mypage-card">
    <div class="mypage-card-head">
        <h5><i class="fas fa-list" style="color:#38b2d8;margin-right:8px;"></i>나의 예약 목록</h5>
    </div>
    <div class="mypage-card-body">
        <div style="overflow-x:auto;">
            <table class="modern-table" width="100%">
                <thead>
                    <tr>
                        <th>예약번호</th>
                        <th style="width:20%;">숙소이름</th>
                        <th style="width:20%;">방 이름</th>
                        <th>체크인</th>
                        <th>체크아웃</th>
                        <th>예약상태</th>
                        <th>예약취소</th>
                    </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${empty list}">
                        <tr class="tbl-empty">
                            <td colspan="7">
                                <div class="tbl-empty-icon"><i class="fas fa-calendar-times"></i></div>
                                <p class="tbl-empty-msg">예약 내역이 없습니다.</p>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list}" var="r">
                            <tr>
                                <td>${r.res_number}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/search/pensionDetail?pen_id=${r.pen_id}&pen_name=${r.pen_name}"
                                       style="color:#38b2d8;font-weight:600;">${r.pen_name}</a>
                                </td>
                                <td>${r.rm_name}</td>
                                <td>${r.check_in_d}</td>
                                <td>${r.check_out_d}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${r.res_status == '1'}">
                                            <span class="res-status-confirmed">예약확정</span>
                                        </c:when>
                                        <c:when test="${r.res_status == '2'}">
                                            <span class="res-status-locked">취소불가</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="res-status-cancel">취소완료</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${r.res_status == '1'}">
                                            <button class="btn btn-primary btn-sm" style="border-radius:7px;font-family:'Do Hyeon',sans-serif;padding:6px 14px;"
                                                    onclick="cancelreservation('${r.res_number}')">취소하기</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="btn btn-secondary btn-sm" style="border-radius:7px;font-family:'Do Hyeon',sans-serif;padding:6px 14px;" disabled>취소하기</button>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>

<div style="margin-top:28px;text-align:center;">
    <a href="${pageContext.request.contextPath}/member/m_myPage" class="back-btn">
        <i class="fas fa-arrow-left"></i> 마이페이지로
    </a>
</div>

<<<<<<< HEAD
<script type="text/javascript">
function cancelreservation(res_number) {
    if (confirm('취소하시겠습니까?')) {
        location.href = 'listReservation2?res_number=' + res_number;
=======
<!-- 마이페이지 폼 끝-->

<!--  ************************* Footer Start Here ************************** --> 
     
    <%@ include file="../../footer.jsp" %>
    <script type="text/javascript">
    function cancelreservation(res_number){
    	if(confirm('취소하시겠습니까?')){
    		location.href='listReservation2?res_number='+res_number+'';
    	}
>>>>>>> parent of fee9d09 (1234)
    }
}
</script>

<%@ include file="../../footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
