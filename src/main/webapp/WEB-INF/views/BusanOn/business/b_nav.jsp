<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top border-bottom">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>

        <!-- 현재 페이지 제목 -->
        <span id="bNavPageTitle" class="d-none d-sm-inline-block font-weight-bold text-gray-700 ml-3" style="font-size:1rem;"></span>

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">
            <!-- Nav Item - 새 예약 알림 -->
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="bAlertsDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                    onclick="loadBAlerts()">
                    <i class="fas fa-bell fa-fw"></i>
                    <span class="badge badge-danger badge-counter" id="bAlertBadge" style="display:none;"></span>
                </a>
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="bAlertsDropdown">
                    <h6 class="dropdown-header">
                        <i class="fas fa-calendar-check mr-1"></i> 최근 7일 새 예약
                    </h6>
                    <div id="bAlertList">
                        <div class="text-center py-3 text-gray-500" id="bAlertLoading">
                            <i class="fas fa-spinner fa-spin"></i> 로딩 중...
                        </div>
                    </div>
                    <a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/business/listReservation">
                        전체 예약 보기 →
                    </a>
                </div>
            </li>

            <!-- Nav Item - 미답변 리뷰 -->
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="bMessagesDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                    onclick="loadBMessages()">
                    <i class="fas fa-comment-alt fa-fw"></i>
                    <span class="badge badge-danger badge-counter" id="bMsgBadge" style="display:none;"></span>
                </a>
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="bMessagesDropdown">
                    <h6 class="dropdown-header">
                        <i class="fas fa-star mr-1"></i> 미답변 리뷰
                    </h6>
                    <div id="bMsgList">
                        <div class="text-center py-3 text-gray-500" id="bMsgLoading">
                            <i class="fas fa-spinner fa-spin"></i> 로딩 중...
                        </div>
                    </div>
                    <a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/business/b_reviewlist">
                        전체 리뷰 보기 →
                    </a>
                </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle pl-0" href="#" id="bUserDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 mt-1 d-none d-lg-inline text-gray-600 small">${sessionScope.user_id}</span>
                    <img class="img-profile rounded-circle ml-1"
                        src="${pageContext.request.contextPath}/resources/assets/admin/img/undraw_profile.svg">
                </a>
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="bUserDropdown">
                    <a class="dropdown-item" onclick="event.preventDefault(); confirm('로그아웃 하시겠습니까?') ? document.bLogout.submit() : ''">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                    </a>
                    <form action="${pageContext.request.contextPath}/member/logout" name="bLogout" method="get" onsubmit="return confirm('로그아웃 하시겠습니까?')">
                    </form>
                </div>
            </li>

        </ul>

    </nav>
    <!-- End of Topbar -->

<script>
var bAlertsLoaded = false;
var bMsgsLoaded = false;

/* 페이지 로드 시 배지 카운트 초기화 + 페이지 제목 */
$(document).ready(function() {
    var titleParts = document.title.split(':');
    var pageTitle = titleParts.length > 1 ? titleParts[titleParts.length - 1].trim() : document.title;
    $('#bNavPageTitle').text(pageTitle);

    $.ajax({
        url: '${pageContext.request.contextPath}/business/alerts',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            if (data.count > 0) {
                $('#bAlertBadge').text(data.count > 9 ? '9+' : data.count).show();
            }
        }
    });
    $.ajax({
        url: '${pageContext.request.contextPath}/business/messages',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            if (data.count > 0) {
                $('#bMsgBadge').text(data.count > 9 ? '9+' : data.count).show();
            }
        }
    });
});

/* 새 예약 클릭 시 로드 */
function loadBAlerts() {
    if (bAlertsLoaded) return;
    $.ajax({
        url: '${pageContext.request.contextPath}/business/alerts',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            bAlertsLoaded = true;
            var html = '';
            if (data.count === 0) {
                html = '<div class="text-center py-3 small text-gray-500">최근 7일 새 예약이 없습니다.</div>';
            } else {
                $.each(data.list, function(i, item) {
                    html += '<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/business/listReservation">' +
                        '<div class="mr-3"><div class="icon-circle bg-success"><i class="fas fa-hotel text-white"></i></div></div>' +
                        '<div style="min-width:0;">' +
                            '<div class="small text-gray-500">' + (item.user_name || item.user_id || '') + ' · ' + (item.check_in_d || '') + '</div>' +
                            '<span class="font-weight-bold text-truncate d-block" style="max-width:200px;">' + (item.pen_name || '') + ' · ' + (item.rm_name || '') + '</span>' +
                        '</div>' +
                    '</a>';
                });
            }
            $('#bAlertList').html(html);
        },
        error: function() {
            $('#bAlertList').html('<div class="text-center py-3 small text-danger">오류가 발생했습니다.</div>');
        }
    });
}

/* 미답변 리뷰 클릭 시 로드 */
function loadBMessages() {
    if (bMsgsLoaded) return;
    $.ajax({
        url: '${pageContext.request.contextPath}/business/messages',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            bMsgsLoaded = true;
            var html = '';
            if (data.count === 0) {
                html = '<div class="text-center py-3 small text-gray-500">미답변 리뷰가 없습니다.</div>';
            } else {
                $.each(data.list, function(i, item) {
                    html += '<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/business/b_reviewlist">' +
                        '<div class="mr-3"><div class="icon-circle bg-warning"><i class="fas fa-star text-white"></i></div></div>' +
                        '<div style="min-width:0;">' +
                            '<div class="small text-gray-500">' + (item.user_name || item.user_id || '') + ' · ' + (item.rev_date || '') + '</div>' +
                            '<span class="font-weight-bold text-truncate d-block" style="max-width:200px;">' + (item.rev_title || '') + '</span>' +
                        '</div>' +
                    '</a>';
                });
            }
            $('#bMsgList').html(html);
        },
        error: function() {
            $('#bMsgList').html('<div class="text-center py-3 small text-danger">오류가 발생했습니다.</div>');
        }
    });
}
</script>
