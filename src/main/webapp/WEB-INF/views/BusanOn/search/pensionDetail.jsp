<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>${pensionDTO.pen_name} | 부산온나</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailReplyStyle.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <style>
    /* ===== 전역 리셋 ===== */
    *, *::before, *::after { box-sizing: border-box; }
    body { font-family: 'Noto Sans KR', sans-serif; background: #f7f9fc; color: #1a2332; }
    a { color: inherit; text-decoration: none; }

    /* ===== 컨테이너 ===== */
    .pd-wrap { max-width: 1060px; margin: 0 auto; padding: 0 20px; }

    /* ===== 상단 히어로 영역 ===== */
    .pd-hero { background: #fff; border-bottom: 1px solid #e8edf2; padding: 28px 0 0; }
    .pd-hero-inner { display: flex; gap: 32px; align-items: flex-start; }

    /* 이미지 */
    .pd-img-box { flex: 0 0 460px; max-width: 460px; border-radius: 16px; overflow: hidden; background: #e8edf2; aspect-ratio: 4/3; display: flex; align-items: center; justify-content: center; }
    .pd-img-box img { width: 100%; height: 100%; object-fit: cover; display: block; }
    .pd-img-placeholder { display: flex; flex-direction: column; align-items: center; gap: 8px; color: #a0aec0; }
    .pd-img-placeholder i { font-size: 2.5rem; }

    /* 우측 정보 */
    .pd-info-box { flex: 1; min-width: 0; display: flex; flex-direction: column; gap: 0; padding-top: 4px; }
    .pd-info-top { display: flex; align-items: flex-start; justify-content: space-between; gap: 10px; margin-bottom: 6px; }
    .pd-pen-name { font-size: 1.6rem; font-weight: 800; color: #1a2332; margin: 0; line-height: 1.2; }
    .pd-address { font-size: 0.92rem; color: #718096; margin: 0 0 16px 0; display: flex; align-items: center; gap: 5px; }
    .pd-address i { color: #38b2d8; }

    /* 찜 버튼 */
    .wish-btn-detail { width: 40px; height: 40px; border-radius: 50%; border: 1.5px solid #fbb6ce; background: #fff; color: #f687b3; font-size: 1.1rem; cursor: pointer; flex-shrink: 0; transition: all .2s; display: flex; align-items: center; justify-content: center; }
    .wish-btn-detail:hover, .wish-btn-detail.wished { background: #fff0f6; color: #e53e3e; border-color: #e53e3e; }
    .wish-btn-detail.pop { transform: scale(1.3); }

    /* 사장님 한마디 */
    .pd-owner-msg { margin-top: 16px; background: #f0f8ff; border-radius: 12px; border: 1px solid #bee3f8; padding: 16px 18px; position: relative; }
    .pd-owner-msg-title { font-size: 0.82rem; font-weight: 700; color: #2b6cb0; margin: 0 0 6px 0; display: flex; align-items: center; gap: 5px; }
    .pd-owner-msg-title i { font-size: 0.9rem; }
    .pd-owner-msg-text { font-size: 0.88rem; color: #4a5568; line-height: 1.65; margin: 0; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; }
    .pd-owner-msg-text.expanded { -webkit-line-clamp: unset; }
    .pd-owner-toggle { background: none; border: none; font-size: 0.78rem; color: #38b2d8; cursor: pointer; padding: 4px 0 0 0; font-weight: 600; }
    .pd-owner-toggle:hover { text-decoration: underline; }

    /* ===== 탭 바 ===== */
    .pd-tab-bar { background: #fff; border-bottom: 2px solid #e8edf2; position: sticky; top: 0; z-index: 100; box-shadow: 0 2px 8px rgba(0,0,0,.05); margin-top: 0; }
    .pd-tab-inner { display: flex; align-items: center; justify-content: space-between; gap: 16px; flex-wrap: wrap; padding: 0 20px; max-width: 1060px; margin: 0 auto; }
    .pd-tabs { display: flex; gap: 0; border-bottom: none; margin: 0; padding: 0; list-style: none; }
    .pd-tabs li a { display: block; padding: 14px 28px; font-size: 0.98rem; font-weight: 600; color: #718096; border-bottom: 3px solid transparent; transition: all .2s; }
    .pd-tabs li a:hover { color: #38b2d8; }
    .pd-tabs li a.active { color: #38b2d8; border-bottom: 3px solid #38b2d8; }

    /* 날짜 변경 폼 */
    .pd-date-form { display: flex; align-items: center; gap: 8px; background: #f7f9fc; border: 1.5px solid #e2e8f0; border-radius: 12px; padding: 6px 12px; }
    .pd-date-form label { font-size: 0.75rem; font-weight: 700; color: #a0aec0; margin: 0; white-space: nowrap; }
    .pd-date-form input[type="date"] { border: none; outline: none; background: transparent; font-size: 0.88rem; color: #1a2332; padding: 2px 0; font-family: inherit; }
    .pd-date-form .pd-date-sep { color: #cbd5e0; font-size: 1rem; }
    .pd-date-form .pd-date-submit { background: #38b2d8; color: #fff; border: none; border-radius: 8px; padding: 6px 16px; font-size: 0.88rem; font-family: 'Do Hyeon', sans-serif; cursor: pointer; white-space: nowrap; transition: background .2s; }
    .pd-date-form .pd-date-submit:hover { background: #2c9fc4; }

    /* ===== 탭 콘텐츠 ===== */
    .pd-tab-content { padding: 28px 0 60px; }

    /* ===== 객실 카드 ===== */
    .room-card { background: #fff; border-radius: 16px; border: 1px solid #e8edf2; box-shadow: 0 2px 12px rgba(0,0,0,.06); overflow: hidden; margin-bottom: 20px; display: flex; min-height: 200px; transition: box-shadow .22s, transform .22s; }
    .room-card:hover { box-shadow: 0 8px 28px rgba(0,0,0,.10); transform: translateY(-2px); }
    .room-img-wrap { flex: 0 0 280px; max-width: 280px; overflow: hidden; background: #e8edf2; display: flex; align-items: center; justify-content: center; position: relative; }
    .room-img-wrap img { width: 100%; height: 100%; object-fit: cover; display: block; transition: transform .35s; }
    .room-card:hover .room-img-wrap img { transform: scale(1.04); }
    .room-img-placeholder { color: #a0aec0; font-size: 2rem; }
    .room-body { flex: 1; display: flex; flex-direction: column; justify-content: space-between; padding: 22px 28px; min-width: 0; }
    .room-name { font-size: 1.25rem; font-weight: 800; color: #1a2332; margin: 0 0 10px 0; }
    .room-meta { display: flex; align-items: center; gap: 20px; margin-bottom: 14px; flex-wrap: wrap; }
    .room-meta-item { display: flex; flex-direction: column; gap: 2px; }
    .room-meta-label { font-size: 0.72rem; font-weight: 700; color: #a0aec0; text-transform: uppercase; letter-spacing: .04em; }
    .room-meta-value { font-size: 0.9rem; font-weight: 600; color: #4a5568; }
    .room-footer { display: flex; align-items: center; justify-content: space-between; gap: 16px; flex-wrap: wrap; border-top: 1px solid #f0f4f8; padding-top: 14px; }
    .room-price-block { display: flex; flex-direction: column; gap: 2px; }
    .room-price-label { font-size: 0.75rem; color: #a0aec0; font-weight: 600; }
    .room-price-value { font-size: 1.5rem; font-weight: 800; color: #1a2332; }
    .room-price-unit { font-size: 0.85rem; font-weight: 500; color: #718096; margin-left: 2px; }
    .room-btn { min-width: 140px; height: 46px; border: none; border-radius: 10px; font-size: 1rem; font-family: 'Do Hyeon', sans-serif; cursor: pointer; transition: all .2s; }
    .room-btn.available { background: linear-gradient(135deg, #38b2d8 0%, #2c9fc4 100%); color: #fff; box-shadow: 0 4px 14px rgba(56,178,216,.30); }
    .room-btn.available:hover { background: linear-gradient(135deg, #2c9fc4 0%, #247fa0 100%); box-shadow: 0 6px 20px rgba(56,178,216,.40); }
    .room-btn.unavailable { background: #e8edf2; color: #a0aec0; cursor: default; }

    /* ===== 리뷰 탭 스타일 재정의 ===== */
    #tabmenu { padding: 20px 0; }
    .score_top { background: #fff; border-radius: 16px; border: 1px solid #e8edf2; padding: 28px; margin-bottom: 20px; text-align: center; }
    .chat ul { list-style: none; padding: 0; margin: 0 0 16px 0; }
    .chat ul li { background: #fff; border-radius: 14px; border: 1px solid #e8edf2; padding: 20px; box-shadow: 0 2px 8px rgba(0,0,0,.04); margin-bottom: 12px; }
    .guest { display: flex; gap: 14px; }
    .guest .pic { margin: 0; flex-shrink: 0; }
    .guest > div { flex: 1; min-width: 0; }
    .best_review { display: inline-block; background: #ebf8ff; color: #2b6cb0; font-size: 0.72rem; font-weight: 700; padding: 2px 8px; border-radius: 20px; margin-bottom: 4px; }
    #title { display: block; font-size: 0.98rem; font-weight: 700; color: #1a2332; margin-bottom: 4px; }
    .name { font-size: 0.82rem; color: #718096; margin: 4px 0; }
    .txt { font-size: 0.9rem; color: #4a5568; line-height: 1.6; margin: 6px 0; }
    .date { font-size: 0.75rem; color: #a0aec0; display: block; margin-top: 6px; }
    .boss { margin-top: 12px; background: #fffbeb; border-radius: 10px; border: 1px solid #fef3c7; padding: 14px; display: flex; gap: 12px; }
    .boss .pic { margin: 0; flex-shrink: 0; }
    .boss > div { flex: 1; }
    .btn-more { background: #fff; border: 1.5px solid #e2e8f0; color: #718096; border-radius: 10px; font-size: 0.9rem; padding: 10px 28px; transition: all .2s; }
    .btn-more:hover { border-color: #38b2d8; color: #38b2d8; }

    @media (max-width: 768px) {
        .pd-hero-inner { flex-direction: column; }
        .pd-img-box { flex: none; max-width: 100%; width: 100%; aspect-ratio: 16/9; }
        .room-card { flex-direction: column; }
        .room-img-wrap { flex: none; max-width: 100%; height: 180px; }
        .pd-tab-inner { padding: 0 12px; }
        .pd-tabs li a { padding: 12px 16px; font-size: 0.88rem; }
    }
    </style>
</head>
<body>
<%@ include file="../header.jsp" %>

<main class="main-content" style="background:#f7f9fc;">

    <!-- 상단 히어로 -->
    <div class="pd-hero">
        <div class="pd-wrap">
            <div class="pd-hero-inner">
                <!-- 대표 이미지 -->
                <div class="pd-img-box">
                    <c:choose>
                        <c:when test="${not empty pensionDTO.pen_image}">
                            <img src="${pageContext.request.contextPath}/upload/${pensionDTO.pen_image}"
                                 alt="${pensionDTO.pen_name}"
                                 onerror="this.style.display='none';this.parentElement.innerHTML='<div class=\'pd-img-placeholder\'><i class=\'fas fa-image\'></i><span>이미지 없음</span></div>';">
                        </c:when>
                        <c:otherwise>
                            <div class="pd-img-placeholder">
                                <i class="fas fa-image"></i>
                                <span>대표 이미지 없음</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- 펜션 정보 -->
                <div class="pd-info-box">
                    <div class="pd-info-top">
                        <h1 class="pd-pen-name">${pensionDTO.pen_name}</h1>
                        <button class="wish-btn-detail" id="detailWishBtn" onclick="toggleDetailWish(this)" title="찜하기">
                            <i class="fas fa-heart"></i>
                        </button>
                    </div>
                    <p class="pd-address">
                        <i class="fas fa-map-marker-alt"></i>${pensionDTO.pen_address}
                    </p>

                    <!-- 숙소 소개 -->
                    <c:if test="${not empty pensionDTO.pen_introduce}">
                    <div class="pd-owner-msg">
                        <p class="pd-owner-msg-title"><i class="fas fa-quote-left"></i> 숙소 소개</p>
                        <p class="pd-owner-msg-text" id="ownerMsgText">${pensionDTO.pen_introduce}</p>
                        <button class="pd-owner-toggle" onclick="toggleOwnerMsg(this)">더보기 ▾</button>
                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- 탭 바 + 날짜 변경 -->
    <div class="pd-tab-bar">
        <div class="pd-tab-inner">
            <ul class="pd-tabs nav" id="pdTabNav">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" href="#tabhome">
                        <i class="fas fa-door-open" style="margin-right:5px;"></i>객실안내/예약
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#tabmenu">
                        <i class="fas fa-star" style="margin-right:5px;"></i>리뷰
                    </a>
                </li>
            </ul>
            <form action="${pageContext.request.contextPath}/search/pensionDetail" style="margin:0;" method="get">
                <input type="hidden" name="pen_id" value="${pen_id}">
                <div class="pd-date-form">
                    <label>체크인</label>
                    <input type="date" id="checkin" name="rm_checkin" min="${today}" value="${rm_checkin}" required>
                    <span class="pd-date-sep">→</span>
                    <label>체크아웃</label>
                    <input type="date" id="checkout" name="rm_checkout" min="${tomorrow}" value="${rm_checkout}" required>
                    <button type="submit" class="pd-date-submit">변 경</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 탭 콘텐츠 -->
    <div class="tab-content pd-tab-content">

        <!-- 객실 탭 -->
        <div id="tabhome" class="tab-pane fade active show">
        <div class="pd-wrap">
                <c:forEach var="businessDTO" items="${searchRoomList}">
                <form action="${pageContext.request.contextPath}/search/reserve?rm_checkin=${rm_checkin}&rm_checkout=${rm_checkout}&room_id=${businessDTO.ROOM_ID}"
                      method="get" onsubmit="return logincheck();">
                    <input type="hidden" name="rm_checkin" value="${rm_checkin}">
                    <input type="hidden" name="rm_checkout" value="${rm_checkout}">
                    <input type="hidden" name="room_id" value="${businessDTO.ROOM_ID}">
                    <input type="hidden" name="rm_price" value="${businessDTO.RM_PRICE}">
                    <div class="room-card">
                        <!-- 객실 이미지 -->
                        <div class="room-img-wrap">
                            <c:choose>
                                <c:when test="${not empty businessDTO.RM_IMAGE}">
                                    <img src="${pageContext.request.contextPath}/upload/${businessDTO.RM_IMAGE}"
                                         alt="${businessDTO.RM_NAME}"
                                         onerror="this.style.display='none';this.parentElement.innerHTML='<i class=\'fas fa-bed room-img-placeholder\'></i>';">
                                </c:when>
                                <c:otherwise>
                                    <i class="fas fa-bed room-img-placeholder"></i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <!-- 객실 정보 -->
                        <div class="room-body">
                            <div>
                                <h3 class="room-name">${businessDTO.RM_NAME}</h3>
                                <div class="room-meta">
                                    <div class="room-meta-item">
                                        <span class="room-meta-label"><i class="fas fa-sign-in-alt"></i> 체크인</span>
                                        <span class="room-meta-value">${businessDTO.RM_CHECKIN}</span>
                                    </div>
                                    <div class="room-meta-item">
                                        <span class="room-meta-label"><i class="fas fa-sign-out-alt"></i> 체크아웃</span>
                                        <span class="room-meta-value">${businessDTO.RM_CHECKOUT}</span>
                                    </div>
                                    <div class="room-meta-item">
                                        <span class="room-meta-label"><i class="fas fa-users"></i> 최대 인원</span>
                                        <span class="room-meta-value">${businessDTO.RM_RESABLE_NUM}명</span>
                                    </div>
                                </div>
                            </div>
                            <div class="room-footer">
                                <div class="room-price-block">
                                    <span class="room-price-label">1박 기준</span>
                                    <span class="room-price-value">
                                        <fmt:formatNumber type="number" value="${fn:replace(businessDTO.RM_PRICE, ',', '')}"/><span class="room-price-unit">원</span>
                                    </span>
                                </div>
                                <c:choose>
                                    <c:when test="${businessDTO.OVERLAP != 0}">
                                        <button type="button" class="room-btn unavailable" disabled>예약 불가</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="submit" class="room-btn available">${businessDTO.BOOK}</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </form>
                </c:forEach>
            </div>
        </div>

        <!-- 리뷰 탭 -->
        <div id="tabmenu" class="tab-pane fade">
        <div class="pd-wrap">
            <%@ include file="review.jsp" %>
        </div>
        </div>

    </div>

</main>

<%@ include file="../footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/date.js"></script>

<script>
function logincheck() {
    var user_id = '${sessionScope.user_id}';
    if (!user_id) {
        showToast('로그인 이후에 이용 가능합니다.', 'warning');
        setTimeout(function() { location.href = '${pageContext.request.contextPath}/member/login'; }, 1500);
        return false;
    }
    return true;
}

function toggleDetailWish(btn) {
    var user_id = '${sessionScope.user_id}';
    if (!user_id) { showToast('로그인 후 찜하기를 이용할 수 있습니다.', 'warning'); return; }
    $.ajax({
        url: '${pageContext.request.contextPath}/member/wishlistToggle',
        type: 'POST', data: { pen_id: '${pensionDTO.pen_id}' }, dataType: 'json',
        success: function(data) {
            $(btn).addClass('pop');
            setTimeout(function() { $(btn).removeClass('pop'); }, 350);
            if (data.status === 'added') { $(btn).addClass('wished'); showToast('찜 목록에 추가했습니다. ❤', 'success'); }
            else if (data.status === 'removed') { $(btn).removeClass('wished'); showToast('찜 목록에서 제거했습니다.', 'info'); }
        }
    });
}

$(document).ready(function() {
    var user_id = '${sessionScope.user_id}';
    if (!user_id) return;
    $.ajax({
        url: '${pageContext.request.contextPath}/member/wishlistCheck',
        type: 'GET', data: { pen_id: '${pensionDTO.pen_id}' }, dataType: 'json',
        success: function(data) { if (data.wished) $('#detailWishBtn').addClass('wished'); }
    });
});

function toggleOwnerMsg(btn) {
    var txt = document.getElementById('ownerMsgText');
    if (txt.classList.contains('expanded')) {
        txt.classList.remove('expanded');
        btn.textContent = '더보기 ▾';
    } else {
        txt.classList.add('expanded');
        btn.textContent = '접기 ▴';
    }
}

$(document).ready(function() {
    $('#replyEvent').click(function() {
        var btn = $('#replyForm');
        if (btn.css('display') === 'none') {
            $.ajax({
                url: 'rescheck',
                data: { 'user_id': '${sessionScope.user_id}', 'user_type': '${sessionScope.user_type}', 'pen_id': '${param.pen_id}' },
                type: 'get',
                success: function(data) {
                    if (data == true) { btn.css('display', 'block'); return; }
                    showToast('예약 이력이 없어 리뷰작성이 불가능합니다.', 'warning');
                }
            });
        } else {
            btn.css('display', 'none');
        }
    });
});
</script>
</body>
</html>
