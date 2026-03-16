<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>찜한 숙소 | 부산온나</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
    .mypage-hero { background: linear-gradient(90deg, #1a2332 0%, #2d4a6e 45%, #38b2d8 100%); padding: 22px 0; }
    .mypage-hero-inner { max-width: 1100px; margin: 0 auto; padding: 0 24px; display: flex; align-items: center; justify-content: space-between; gap: 16px; }
    .breadcrumb-line { color: #8fa3c0; font-size: 12px; white-space: nowrap; }
    .breadcrumb-line a { color: #8fa3c0; text-decoration: none; }
    .breadcrumb-line a:hover { color: #fff; }
    .mypage-hero h1 { color: #fff; font-size: 22px; font-weight: 800; margin: 0; white-space: nowrap; }
    .mypage-content { background: #f7f9fc; min-height: 60vh; padding: 36px 0 60px; }
    .wish-item { margin-bottom: 16px; }
    .wish-item .pensions { border-radius: 14px; border: 1px solid #e2e8f0; background: #fff; box-shadow: 0 2px 12px rgba(0,0,0,.05); overflow: hidden; }
    .wish-item .pen-card-inner { display: flex; align-items: stretch; min-height: 130px; }
    .wish-item .pen-img-wrap { flex: 0 0 140px; max-width: 140px; overflow: hidden; display: block; }
    .wish-item .pen-card-img { width: 100%; height: 100%; object-fit: cover; display: block; }
    .wish-item .pensionInfo { flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 14px 18px; min-width: 0; }
    .wish-item .infoBox1 h2 { font-size: 1rem; font-weight: 700; color: #1a2332; margin: 0 0 4px 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
    .wish-item .infoBox1 h2 a { color: #1a2332; text-decoration: none; }
    .wish-item .infoBox1 h2 a:hover { color: #38b2d8; }
    .wish-item .infoBox1 p { font-size: 0.82rem; color: #718096; margin: 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
    .wish-price { font-size: 1rem; font-weight: 800; color: #38b2d8; }
    .wish-meta { display: flex; align-items: center; justify-content: space-between; margin-top: 8px; flex-wrap: wrap; gap: 6px; }
    .wish-date { font-size: 0.75rem; color: #a0aec0; }
    .wish-remove-btn { background: none; border: 1px solid #fed7d7; border-radius: 8px; color: #e53e3e; font-size: 0.78rem; padding: 4px 12px; cursor: pointer; font-family: 'Do Hyeon', sans-serif; }
    .wish-remove-btn:hover { background: #fff5f5; }
    .empty-state { text-align: center; padding: 80px 20px; background: #fff; border-radius: 14px; box-shadow: 0 2px 20px rgba(0,0,0,.08); }
    .empty-state i { font-size: 3rem; color: #e2e8f0; display: block; margin-bottom: 16px; }
    .back-btn { display: inline-flex; align-items: center; gap: 6px; padding: 10px 24px; border: 1.5px solid #e2e8f0; border-radius: 10px; background: #fff; color: #718096; font-size: 15px; font-family: 'Do Hyeon', sans-serif; text-decoration: none; }
    .back-btn:hover { color: #38b2d8; border-color: #38b2d8; }
    </style>
</head>
<body>
<%@ include file="../../header.jsp" %>

<div class="mypage-hero">
    <div class="mypage-hero-inner">
        <div class="breadcrumb-line">
            <a href="${pageContext.request.contextPath}/search/main">홈</a> &rsaquo;
            <a href="${pageContext.request.contextPath}/member/m_myPage">마이페이지</a> &rsaquo; 찜한 숙소
        </div>
        <h1><i class="fas fa-heart" style="color:#fc8181;margin-right:8px;"></i>찜한 숙소</h1>
    </div>
</div>

<div class="mypage-content">
<div style="max-width:1100px;margin:0 auto;padding:0 16px;">

    <c:choose>
        <c:when test="${empty wishlist}">
            <div class="empty-state">
                <i class="fas fa-heart-broken"></i>
                <p style="font-size:1rem;font-weight:600;color:#718096;margin-bottom:6px;">찜한 숙소가 없습니다.</p>
                <p style="font-size:0.88rem;color:#a0aec0;margin-bottom:20px;">마음에 드는 펜션을 찜해보세요!</p>
                <a href="${pageContext.request.contextPath}/search/searchP" class="btn btn-primary" style="border-radius:10px;font-family:'Do Hyeon',sans-serif;font-size:16px;">
                    <i class="fas fa-search"></i> 펜션 둘러보기
                </a>
            </div>
        </c:when>
        <c:otherwise>
            <div id="wishlist-container">
                <c:forEach items="${wishlist}" var="item">
                <div class="wish-item" id="wish-${item.pen_id}">
                    <div class="pensions">
                        <div class="pen-card-inner">
                            <a class="pen-img-wrap" href="${pageContext.request.contextPath}/search/pensionDetail?pen_id=${item.pen_id}">
                                <img src="${pageContext.request.contextPath}/upload/${item.pen_image}"
                                     alt="${item.pen_name}" class="pen-card-img"
                                     onerror="this.style.display='none';this.parentElement.style.background='#f0f4f8';">
                            </a>
                            <div class="pensionInfo">
                                <div class="infoBox1">
                                    <h2><a href="${pageContext.request.contextPath}/search/pensionDetail?pen_id=${item.pen_id}">${item.pen_name}</a></h2>
                                    <p><i class="fas fa-map-marker-alt" style="color:#38b2d8;margin-right:4px;"></i>${item.pen_address}</p>
                                </div>
                                <div style="padding-top:4px;">
                                    <p style="font-size:0.78rem;color:#718096;margin:0;"><i class="fas fa-star" style="color:#f59e0b;margin-right:3px;"></i>별점 ${item.star}&nbsp;|&nbsp;<i class="fas fa-comment-alt" style="color:#38b2d8;margin-right:3px;"></i>리뷰 ${item.rv}개</p>
                                </div>
                                <div class="wish-meta">
                                    <div>
                                        <p class="wish-price" style="margin-bottom:2px;">
                                            <c:choose>
                                                <c:when test="${not empty item.rm_price and item.rm_price ne '0'}">${item.rm_price}원 ~</c:when>
                                                <c:otherwise>가격 정보 없음</c:otherwise>
                                            </c:choose>
                                        </p>
                                        <span class="wish-date"><i class="fas fa-calendar-alt" style="margin-right:3px;"></i>${item.created_at} 찜함</span>
                                    </div>
                                    <button class="wish-remove-btn" onclick="removeWish('${item.pen_id}')">
                                        <i class="fas fa-heart-broken"></i> 찜 해제
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>

    <div style="margin-top:28px;text-align:center;">
        <a href="${pageContext.request.contextPath}/member/m_myPage" class="back-btn">
            <i class="fas fa-arrow-left"></i> 마이페이지로
        </a>
    </div>
</div>
</div>

<%@ include file="../../footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

<script>
function removeWish(pen_id) {
    $.ajax({
        url: '${pageContext.request.contextPath}/member/wishlistToggle',
        type: 'POST',
        data: { pen_id: pen_id },
        dataType: 'json',
        success: function(data) {
            if (data.status === 'removed') {
                $('#wish-' + pen_id).fadeOut(300, function() { $(this).remove(); });
                showToast('찜 목록에서 제거했습니다.', 'info');
            }
        }
    });
}
</script>
</body>
</html>
