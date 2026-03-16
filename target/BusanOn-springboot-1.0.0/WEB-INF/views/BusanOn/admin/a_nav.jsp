<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top border-bottom">
        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>

        <!-- 현재 페이지 제목 -->
        <span id="navPageTitle" class="d-none d-sm-inline-block font-weight-bold text-gray-700 ml-3" style="font-size:1rem;"></span>

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">
            <!-- Nav Item - Alerts (미답변 1:1 문의) -->
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                    onclick="loadAlerts()">
                    <i class="fas fa-bell fa-fw"></i>
                    <span class="badge badge-danger badge-counter" id="alertBadge" style="display:none;"></span>
                </a>
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="alertsDropdown">
                    <h6 class="dropdown-header">
                        <i class="fas fa-bell mr-1"></i> 미답변 1:1 문의
                    </h6>
                    <div id="alertList">
                        <div class="text-center py-3 text-gray-500" id="alertLoading">
                            <i class="fas fa-spinner fa-spin"></i> 로딩 중...
                        </div>
                    </div>
                    <a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/admin/a_listInquiry">
                        전체 문의 보기 →
                    </a>
                </div>
            </li>

            <!-- Nav Item - Messages (최근 7일 예약) -->
            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                    onclick="loadMessages()">
                    <i class="fas fa-envelope fa-fw"></i>
                    <span class="badge badge-danger badge-counter" id="msgBadge" style="display:none;"></span>
                </a>
                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="messagesDropdown">
                    <h6 class="dropdown-header">
                        <i class="fas fa-calendar-check mr-1"></i> 최근 7일 예약 현황
                    </h6>
                    <div id="msgList">
                        <div class="text-center py-3 text-gray-500" id="msgLoading">
                            <i class="fas fa-spinner fa-spin"></i> 로딩 중...
                        </div>
                    </div>
                    <a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/admin/a_listReservationAll">
                        전체 예약 보기 →
                    </a>
                </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
            <sec:authorize access="isAuthenticated()">
                <a class="nav-link dropdown-toggle pl-0" href="#" id="userDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="mr-2 mt-1 d-none d-lg-inline text-gray-600 small"><sec:authentication property="principal.member.nickName"/></span>
                    <img class="img-profile rounded-circle ml-1"
                        src="${pageContext.request.contextPath }/resources/assets/admin/img/undraw_profile.svg">
                </a>
             </sec:authorize>
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="userDropdown">
                    <a class="dropdown-item" onclick="event.preventDefault(); confirm('로그아웃 하시겠습니까?') ? document.logout.submit() : ''" >
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        Logout
                    </a>
                    <form action="/logout" name="logout" method="post" onsubmit="return confirm('로그아웃 하시겠습니까?')">
					<sec:csrfInput/>
				</form>
                </div>
            </li>

        </ul>

    </nav>
    <!-- End of Topbar -->

<script>
var alertsLoaded = false;
var msgsLoaded = false;

/* 페이지 로드 시 배지 카운트 초기화 + 페이지 제목 표시 */
$(document).ready(function() {
    // 상단 nav 페이지 제목 설정
    var titleParts = document.title.split(':');
    var pageTitle = titleParts.length > 1 ? titleParts[titleParts.length - 1].trim() : document.title;
    $('#navPageTitle').text(pageTitle);
    $.ajax({
        url: '${pageContext.request.contextPath}/admin/alerts',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            if (data.count > 0) {
                $('#alertBadge').text(data.count > 9 ? '9+' : data.count).show();
            }
        }
    });
    $.ajax({
        url: '${pageContext.request.contextPath}/admin/messages',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            if (data.count > 0) {
                $('#msgBadge').text(data.count > 9 ? '9+' : data.count).show();
            }
        }
    });
});

/* 알림 벨 클릭 시 미답변 문의 로드 */
function loadAlerts() {
    if (alertsLoaded) return;
    $.ajax({
        url: '${pageContext.request.contextPath}/admin/alerts',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            alertsLoaded = true;
            var html = '';
            if (data.count === 0) {
                html = '<div class="text-center py-3 small text-gray-500">미답변 문의가 없습니다.</div>';
            } else {
                $.each(data.list, function(i, item) {
                    html += '<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/admin/a_listInquiry">' +
                        '<div class="mr-3"><div class="icon-circle bg-warning"><i class="fas fa-question text-white"></i></div></div>' +
                        '<div style="min-width:0;">' +
                            '<div class="small text-gray-500">' + (item.user_name || item.user_id) + ' · ' + (item.time || '') + '</div>' +
                            '<span class="font-weight-bold text-truncate d-block" style="max-width:200px;">' + (item.title || '') + '</span>' +
                        '</div>' +
                    '</a>';
                });
            }
            $('#alertList').html(html);
        },
        error: function() {
            $('#alertList').html('<div class="text-center py-3 small text-danger">오류가 발생했습니다.</div>');
        }
    });
}

/* 메시지 클릭 시 최근 예약 로드 */
function loadMessages() {
    if (msgsLoaded) return;
    $.ajax({
        url: '${pageContext.request.contextPath}/admin/messages',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            msgsLoaded = true;
            var html = '';
            if (data.count === 0) {
                html = '<div class="text-center py-3 small text-gray-500">최근 7일 예약이 없습니다.</div>';
            } else {
                $.each(data.list, function(i, item) {
                    html += '<a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/admin/a_listReservationAll">' +
                        '<div class="dropdown-list-image mr-3">' +
                            '<div class="icon-circle bg-success"><i class="fas fa-hotel text-white"></i></div>' +
                        '</div>' +
                        '<div class="font-weight-bold" style="min-width:0;">' +
                            '<div class="text-truncate" style="max-width:200px;">' + (item.pen_name || '') + ' · ' + (item.rm_name || '') + '</div>' +
                            '<div class="small text-gray-500">' + (item.user_name || item.user_id) + ' · ' + (item.res_time || '') + '</div>' +
                        '</div>' +
                    '</a>';
                });
            }
            $('#msgList').html(html);
        },
        error: function() {
            $('#msgList').html('<div class="text-center py-3 small text-danger">오류가 발생했습니다.</div>');
        }
    });
}
</script>
