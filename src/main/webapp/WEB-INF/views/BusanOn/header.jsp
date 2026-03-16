<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.theme.default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/logintimer.js"></script>
<!-- 다크모드 깜빡임 방지: 렌더링 전 테마 적용 -->
<script>
    (function() {
        var theme = localStorage.getItem('busanon-theme') || 'light';
        document.documentElement.setAttribute('data-theme', theme);
    })();
</script>

<%@ include file="loading.jsp" %>

<!-- =================== HEADER =================== -->
<header id="main-header">
    <div class="header-inner">
        <!-- 로고 -->
        <a class="header-logo" href="${pageContext.request.contextPath}/search/main">
            <span class="logo-text">부산온나</span>
            <span class="logo-sub">BUSAN ONNA</span>
        </a>

        <!-- 데스크탑 네비게이션 -->
        <nav class="header-nav" id="mainNav">
            <ul class="nav-list">
                <c:choose>
                    <c:when test="${sessionScope.user_id == null}">
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/login">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/join">회원가입</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item timer-item">
                            <span class="timer-badge"><i class="fas fa-clock"></i> <span id="timer"></span></span>
                        </li>
                        <li class="nav-item has-dropdown">
                            <a class="nav-link dropdown-toggle-custom" href="#">
                                <i class="fas fa-user-circle"></i>&nbsp;${sessionScope.user_name}
                                <i class="fas fa-chevron-down dropdown-arrow"></i>
                            </a>
                            <ul class="dropdown-nav">
                                <c:choose>
                                    <c:when test="${sessionScope.user_type == '0'}">
                                        <li><a href="${pageContext.request.contextPath}/admin/a_index"><i class="fas fa-shield-alt"></i> 관리자페이지</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="${pageContext.request.contextPath}/member/m_myPage"><i class="fas fa-home"></i> 마이페이지</a></li>
                                        <li><a href="${pageContext.request.contextPath}/member/mypage/listReservation"><i class="fas fa-calendar-check"></i> 예약내역</a></li>
                                        <li><a href="${pageContext.request.contextPath}/member/mypage/wishlist"><i class="fas fa-heart"></i> 찜한 숙소</a></li>
                                        <li><a href="${pageContext.request.contextPath}/member/mypage/myreview"><i class="fas fa-star"></i> 내 리뷰</a></li>
                                        <li><a href="${pageContext.request.contextPath}/member/mypage/pointList"><i class="fas fa-coins"></i> 포인트내역</a></li>
                                        <li><a href="${pageContext.request.contextPath}/member/mypage/listInquiry"><i class="fas fa-comment-dots"></i> 1:1 문의</a></li>
                                    </c:otherwise>
                                </c:choose>
                                <li class="divider-item"></li>
                                <li><a href="#" onclick="doLogout()"><i class="fas fa-sign-out-alt"></i> 로그아웃</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>

                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/search/searchP">펜션목록</a></li>

                <li class="nav-item has-dropdown">
                    <a class="nav-link dropdown-toggle-custom" href="#">
                        더보기 <i class="fas fa-chevron-down dropdown-arrow"></i>
                    </a>
                    <ul class="dropdown-nav">
                        <li><a href="${pageContext.request.contextPath}/notice/noticeList"><i class="fas fa-bullhorn"></i> 공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/event/eventList"><i class="fas fa-gift"></i> 이벤트</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <!-- 우측 아이콘 영역 -->
        <div class="header-actions">
            <!-- 다크모드 토글 -->
            <button class="dark-toggle-btn" id="darkToggleBtn" title="다크모드 전환" aria-label="다크모드 전환">
                <i class="fas fa-moon" id="darkIcon"></i>
            </button>
            <!-- 모바일 햄버거 -->
            <button class="hamburger-btn" id="hamburgerBtn" aria-label="메뉴 열기">
                <span></span><span></span><span></span>
            </button>
        </div>
    </div>
</header>

<!-- =================== 모바일 드로어 (헤더 밖에 위치 - backdrop-filter 격리) =================== -->
<div class="mobile-nav-drawer" id="mobileDrawer">
    <div class="mobile-nav-inner">
        <c:choose>
            <c:when test="${sessionScope.user_id == null}">
                <a class="mobile-nav-link" href="${pageContext.request.contextPath}/member/login"><i class="fas fa-sign-in-alt"></i> 로그인</a>
                <a class="mobile-nav-link" href="${pageContext.request.contextPath}/member/join"><i class="fas fa-user-plus"></i> 회원가입</a>
            </c:when>
            <c:otherwise>
                <div class="mobile-user-info">
                    <i class="fas fa-user-circle"></i> ${sessionScope.user_name}님
                </div>
                <c:choose>
                    <c:when test="${sessionScope.user_type == '0'}">
                        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/admin/a_index"><i class="fas fa-shield-alt"></i> 관리자페이지</a>
                    </c:when>
                    <c:otherwise>
                        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/member/m_myPage"><i class="fas fa-home"></i> 마이페이지</a>
                        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/member/mypage/listReservation"><i class="fas fa-calendar-check"></i> 예약내역</a>
                        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/member/mypage/wishlist"><i class="fas fa-heart"></i> 찜한 숙소</a>
                        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/member/mypage/myreview"><i class="fas fa-star"></i> 내 리뷰</a>
                        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/member/mypage/pointList"><i class="fas fa-coins"></i> 포인트내역</a>
                        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/member/mypage/listInquiry"><i class="fas fa-comment-dots"></i> 1:1 문의</a>
                    </c:otherwise>
                </c:choose>
                <a class="mobile-nav-link" href="#" onclick="doLogout()"><i class="fas fa-sign-out-alt"></i> 로그아웃</a>
                <hr class="mobile-divider">
            </c:otherwise>
        </c:choose>
        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/search/searchP"><i class="fas fa-search"></i> 펜션목록</a>
        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/notice/noticeList"><i class="fas fa-bullhorn"></i> 공지사항</a>
        <a class="mobile-nav-link" href="${pageContext.request.contextPath}/event/eventList"><i class="fas fa-gift"></i> 이벤트</a>
    </div>
</div>
<div class="mobile-overlay" id="mobileOverlay"></div>

<script>
// ====== 다크모드 ======
var $html = document.documentElement;
var $btn  = document.getElementById('darkToggleBtn');
var $icon = document.getElementById('darkIcon');

function applyTheme(theme) {
    $html.setAttribute('data-theme', theme);
    localStorage.setItem('busanon-theme', theme);
    if (theme === 'dark') {
        $icon.classList.replace('fa-moon', 'fa-sun');
        $btn.title = '라이트모드 전환';
    } else {
        $icon.classList.replace('fa-sun', 'fa-moon');
        $btn.title = '다크모드 전환';
    }
}

applyTheme(localStorage.getItem('busanon-theme') || 'light');

$btn.addEventListener('click', function() {
    applyTheme($html.getAttribute('data-theme') === 'dark' ? 'light' : 'dark');
});

// ====== 모바일 드로어 ======
var drawer    = document.getElementById('mobileDrawer');
var overlay   = document.getElementById('mobileOverlay');
var hamburger = document.getElementById('hamburgerBtn');

function openDrawer() {
    drawer.classList.add('open');
    overlay.classList.add('show');
    hamburger.classList.add('active');
    document.body.style.overflow = 'hidden';
}
function closeDrawer() {
    drawer.classList.remove('open');
    overlay.classList.remove('show');
    hamburger.classList.remove('active');
    document.body.style.overflow = '';
}
hamburger.addEventListener('click', function() {
    drawer.classList.contains('open') ? closeDrawer() : openDrawer();
});
overlay.addEventListener('click', closeDrawer);

// ====== 데스크탑 드롭다운 ======
document.querySelectorAll('.has-dropdown').forEach(function(item) {
    var link = item.querySelector('.dropdown-toggle-custom');
    link.addEventListener('click', function(e) {
        e.preventDefault();
        var isOpen = item.classList.contains('dropdown-open');
        document.querySelectorAll('.has-dropdown.dropdown-open').forEach(function(el) {
            el.classList.remove('dropdown-open');
        });
        if (!isOpen) item.classList.add('dropdown-open');
    });
});
document.addEventListener('click', function(e) {
    if (!e.target.closest('.has-dropdown')) {
        document.querySelectorAll('.has-dropdown.dropdown-open').forEach(function(el) {
            el.classList.remove('dropdown-open');
        });
    }
});

// ====== 세션 타이머 ======
var user_id = "${sessionScope.user_id}";
var ts = 170;
if (user_id && user_id.trim() !== '') {
    timer('${pageContext.request.contextPath}', "${sessionScope.TT}", ts);
}

function doLogout() {
    if (confirm("로그아웃 하시겠습니까?")) {
        location.href = "${pageContext.request.contextPath}/member/logout";
    }
}
function resettimer() {
    $.ajax({
        url: '${pageContext.request.contextPath}/timerreset',
        type: 'get',
        success: function(data) {
            timer('${pageContext.request.contextPath}', data, ts);
        }
    });
}

// ====== 토스트 알림 (alert 대체) ======
function showToast(message, type) {
    type = type || 'info';
    var icons = { success: '✓', error: '✕', info: 'ℹ', warning: '⚠' };
    var toast = document.createElement('div');
    toast.className = 'busanon-toast toast-' + type;
    toast.innerHTML = '<span class="toast-icon">' + (icons[type] || 'ℹ') + '</span><span>' + message + '</span>';
    document.body.appendChild(toast);
    setTimeout(function() {
        toast.style.opacity = '0';
        setTimeout(function() { if (toast.parentNode) toast.parentNode.removeChild(toast); }, 350);
    }, 3200);
}
window.alert = function(msg) { showToast(msg, 'info'); };
</script>
