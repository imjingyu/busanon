<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="a_head.jsp" %>
    <title>공지사항 관리 | 관리자</title>
</head>
<body id="page-top">
<div id="wrapper">
    <%@ include file="a_sidebar.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <%@ include file="a_nav.jsp" %>
            <div class="container-fluid">
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 font-weight-bold">공지사항 관리</h1>
                    <a href="${pageContext.request.contextPath}/admin/noticeWrite" class="btn btn-primary btn-sm">
                        <i class="fas fa-plus"></i> 공지 작성
                    </a>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary"><i class="fas fa-bullhorn"></i> 전체 공지사항</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th style="width:60px;">번호</th>
                                        <th>제목</th>
                                        <th style="width:120px;">작성자</th>
                                        <th style="width:80px;">조회수</th>
                                        <th style="width:150px;">작성일</th>
                                        <th style="width:80px;">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${empty list}">
                                        <tr><td colspan="6" class="text-center py-4">등록된 공지사항이 없습니다.</td></tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${list}" var="notice">
                                            <tr>
                                                <td class="text-center">${notice.notice_id}</td>
                                                <td><a href="${pageContext.request.contextPath}/notice/noticeDetail?notice_id=${notice.notice_id}">${notice.title}</a></td>
                                                <td class="text-center">${notice.writer_id}</td>
                                                <td class="text-center">${notice.views}</td>
                                                <td class="text-center">${notice.created_at}</td>
                                                <td class="text-center">
                                                    <a href="${pageContext.request.contextPath}/admin/noticeDelete?notice_id=${notice.notice_id}"
                                                       class="btn btn-danger btn-sm"
                                                       onclick="return confirm('삭제하시겠습니까?')">삭제</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                        <!-- 페이징 -->
                        <c:if test="${page != null}">
                            <nav>
                                <ul class="pagination justify-content-center">
                                    <c:if test="${page.prev}">
                                        <li class="page-item"><a class="page-link" href="?pageNum=${page.startPage - 1}">이전</a></li>
                                    </c:if>
                                    <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
                                        <li class="page-item ${i == page.pageNum ? 'active' : ''}">
                                            <a class="page-link" href="?pageNum=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${page.next}">
                                        <li class="page-item"><a class="page-link" href="?pageNum=${page.endPage + 1}">다음</a></li>
                                    </c:if>
                                </ul>
                            </nav>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="a_footer.jsp" %>
    </div>
</div>
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/assets/admin/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/js/sb-admin-2.min.js"></script>
</body>
</html>
