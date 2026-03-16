<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<%@ include file="../loading.jsp" %>
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	
	    <!-- Sidebar - Brand -->
	    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/business/b_index">
	        <div class="sidebar-brand-icon rotate-n-15">
	            <i class="fas fa-laugh-wink"></i>
	        </div>
	        <div class="sidebar-brand-text mx-3">사업자페이지</div>
	    </a>
		
	    <!-- Heading -->
	    <hr class="sidebar-divider">
	    <div class="sidebar-heading text-light">
	        펜션 관리
	    </div>
	
	    <!-- Nav Item - Pages Collapse Menu -->
	    <li class="nav-item">
	        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOne"
	            aria-expanded="true" aria-controls="collapseOne">
	            <i class="fas fa-fw fa-home"></i>
	            <span>숙소 관리</span>
	        </a>
	        <div id="collapseOne" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	            <div class="bg-white py-2 collapse-inner rounded">
	                <a class="collapse-item" href="${pageContext.request.contextPath}/business/roomList">- 숙소 목록 조회</a>
	                <a class="collapse-item" href="${pageContext.request.contextPath}/business/roomRegister">- 신규 숙소 등록</a>
	            </div>
	        </div>
	    </li>
	    
	    <!-- Nav Item - Pages Collapse Menu -->
	    <li class="nav-item">
	        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
	            aria-expanded="true" aria-controls="collapseTwo">
	            <i class="fas fa-fw fa-calendar"></i>
	            <span>예약 관리</span>
	        </a>
	        <div id="collapseTwo" class="collapse" aria-labelledby="headingOne" data-parent="#accordionSidebar">
	            <div class="bg-white py-2 collapse-inner rounded">
	                <a class="collapse-item" href="${pageContext.request.contextPath}/business/listReservation">- 이용 내역 조회</a>
	                <a class="collapse-item" href="${pageContext.request.contextPath}/business/checkReservation">- 예약 내역 확인</a>
	            </div>
	        </div>
	    </li>
	
	    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/business/listPayment">
            <i class="fas fa-fw fa-coins"></i>
            <span>매출 조회</span></a>
	    </li>
	    
	    <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/business/b_reviewlist">
            <i class="fas fa-fw fa-comment"></i>
            <span>댓글 조회</span></a>
	    </li>
	    <hr class="sidebar-divider">
		
		<div class="sidebar-heading text-light">
		        사이트 이동
	    </div>
		<li class="nav-item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/search/main">
	            <i class="fas fa-fw fa-plane-departure"></i>
	            <span>메인페이지로</span></a>
	    </li>
	    
	    <hr class="sidebar-divider">
	
	    <!-- Sidebar Toggler (Sidebar) -->
	    <div class="text-center d-none d-md-inline">
	        <button class="rounded-circle border-0" id="sidebarToggle"></button>
	    </div>
	</ul>
	<!-- End of Sidebar -->

<script>
$(document).ready(function() {
    var url = window.location.pathname;
    $('#accordionSidebar a.collapse-item').each(function() {
        var href = $(this).attr('href');
        if (href && url.indexOf(href.split('?')[0].replace(/.*\//, '')) !== -1) {
            $(this).addClass('active font-weight-bold');
            var collapseEl = $(this).closest('.collapse');
            collapseEl.addClass('show');
            collapseEl.prev('.nav-link').removeClass('collapsed').attr('aria-expanded', 'true');
        }
    });
    $('#accordionSidebar a.nav-link:not([data-toggle])').each(function() {
        var href = $(this).attr('href');
        if (href && url.indexOf(href.split('?')[0].replace(/.*\//, '')) !== -1) {
            $(this).closest('.nav-item').addClass('active');
        }
    });
});
</script>