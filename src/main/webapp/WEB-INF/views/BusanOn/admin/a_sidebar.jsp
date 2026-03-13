<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Sidebar -->
<%@ include file="../loading.jsp" %>
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
<!-- 	test -->
	    <!-- Sidebar - Brand -->
	    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/admin/a_index">
	        <div class="sidebar-brand-icon rotate-n-15">
	            <i class="fas fa-laugh-wink"></i>
	        </div>
	        <div class="sidebar-brand-text mx-3">관리자페이지</div>
	    </a>
	 
	    <!-- Divider -->
	    <sec:authorize access="!hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
	    <hr class="sidebar-divider">
	    
	    <!-- Nav Item - Pages Collapse Menu -->
	    <li class="nav-item">
	        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
	            aria-expanded="true" aria-controls="collapsePages">
	            <i class="fas fa-fw fa-users"></i>
	            <span>회원 관리</span>
	        </a>
	        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
	            <div class="bg-white py-2 collapse-inner rounded">
	                <a class="collapse-item" href="${pageContext.request.contextPath }/admin/a_memberList">- 회원 목록 조회</a>
	                <a class="collapse-item" href="${pageContext.request.contextPath }/admin/a_listReservationAll">- 전체 예약 조회</a>
	                <a class="collapse-item" href="${pageContext.request.contextPath }/admin/a_listInquiry">- 1:1 문의내역 조회</a>
<!-- 	                <a class="collapse-item" href="#" onclick="alert('준비중입니다.')">- 회원 삭제 하기</a> -->
	            </div>
	        </div>
	    </li>
	    
	    <li class="nav-item">
	        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2"
	            aria-expanded="true" aria-controls="collapsePages2">
	            <i class="fas fa-fw fa-house-user"></i>
	            <span>사업자 관리</span>
	        </a>
	        <div id="collapsePages2" class="collapse" aria-labelledby="headingPages2" data-parent="#accordionSidebar">
	            <div class="bg-white py-2 collapse-inner rounded">
	                <a class="collapse-item" href="${pageContext.request.contextPath }/admin/a_pensionlist">- 전체 펜션 목록</a>
	                
<%-- 	                <a class="collapse-item" href="${pageContext.request.contextPath }/admin/pensionAdStatus">- 펜션 광고 승인</a> --%>
<%-- 	                <a class="collapse-item" href="${pageContext.request.contextPath }/admin/pensionListWithAd">- 광고 목록 조회</a> --%>
	                <a class="collapse-item" href="#" onclick="alert('준비중입니다.')">- 펜션 광고 승인</a>
	                <a class="collapse-item" href="#" onclick="alert('준비중입니다.')">- 광고 목록 조회</a>
	            </div>
	        </div>
	    </li>
	    
	    <li class="nav-item">
	        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3"
	            aria-expanded="true" aria-controls="collapsePages3">
	            <i class="fas fa-fw fa-user-cog"></i>
	            <span>사이트 관리</span>
	        </a>
	        <div id="collapsePages3" class="collapse" aria-labelledby="headingPages3" data-parent="#accordionSidebar">
	            <div class="bg-white py-2 collapse-inner rounded">
	                <a class="collapse-item" href="${pageContext.request.contextPath }/admin/a_reviewlist">- 리뷰 관리</a>
	                <a class="collapse-item" href="${pageContext.request.contextPath }/admin/a_paymentlist">- 전체 매출 조회</a>
	                <a class="collapse-item" href="#" onclick="alert('준비중입니다.')">- 관리자 권한 부여</a>
	            </div>
	        </div>
	    </li>
		
	    <!-- Divider -->
	    <hr class="sidebar-divider d-none d-md-block">
		</sec:authorize>
		
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