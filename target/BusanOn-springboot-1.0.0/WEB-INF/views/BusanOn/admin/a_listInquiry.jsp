<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">


<head>
	<jsp:include page="a_head.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/memberMyPage/qna.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <title>관리자페이지 : 1:1문의</title>
</head>

<body id="page-top">
 
    <!-- Page Wrapper -->
    <div id="wrapper">

		<jsp:include page="a_sidebar.jsp"/>
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
			<jsp:include page="a_nav.jsp"/>

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="card shadow my-5">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">1:1문의</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th style="width: 15%"></th>
                                            <th>제목</th>
                                            <th style="width: 25%">문의자/답변자</th>
                                            <th style="width: 20%">문의시간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${list}" var="qna">
                                    		<tr style="cursor: pointer;" id="rep${qna.count}" onclick="showQna(this.id)">
                                    			<c:choose>
                                    			<c:when test="${qna.reply == 'Y'}">
	                                        	<td><span class="badge badge-info p-2">처리 완료</span></td>
	                                        	</c:when>
	                                        	<c:when test="${qna.reply == 'N'}">
	                                        	<td><span class="badge badge-danger p-2">미답변 </span></td>
	                                        	</c:when>
                                    			</c:choose>
	                                    		<td>${qna.title}</td>
	                                            <td>${qna.user_name}</td>
	                                            <td>${qna.time}</td>
	                                        </tr>
	                                        <tr class="rep${qna.count}" style="display: none;">
	                                        	<td colspan="4" style="height: 200px; text-align: center;"><span style="font-size: 25px; color: blue;">&lt;문의 내용&gt;</span><br>
					                             ${qna.content}
					                             </td>
	                                        </tr>
	                                        <c:choose>
                                    			<c:when test="${qna.reply == 'N'}">
	                                        	<tr class="rep${qna.count}" style="display: none;">
	                                        	<td colspan="4">
	                                        	<form action="a_listInquiryPro" method="post" class="col-10 mx-auto" onsubmit="return ">
				                                <input type="text" class="form-control mb-4" name="title" placeholder="답변 제목을 입력하세요" value="re : ${qna.title}" disabled>
				                                <textarea class="form-control mb-4" name="answer" placeholder="답변 내용을 입력하세요" style="min-height: 400px; resize: none;"></textarea>
				                                <button class="btn btn-primary btn-block">답변글 등록</button>
				                                <input type="hidden" name="count" value="${qna.count}">
				                                <input type="hidden" name="writer" value="관리자">
<%-- 				                                <input type="hidden" name="writer" value='<sec:authentication property="principal.username"/>'> --%>
				                                </form>
	                                        	</td>
	                                        </tr>
	                                        	</c:when>
	                                        	<c:when test="${qna.reply == 'Y'}">
	                                        	<tr class="rep${qna.count}" style="display: none;">
                                    		<td><span class="badge badge-warning p-2">답변글</span></td>
                                    		<td>Q & A : ${qna.title }</td>
                                            <td>${qna.writer}</td>
                                            <td>${qna.answer_time}</td>
                                            </tr>
                                            <tr class="rep${qna.count}" style="display: none;">
	                                        	<td colspan="4" style="height: 200px; text-align: center;"><span style="font-size: 25px; color:green;">&lt;답변 내용&gt;</span><br>
	                                        	${qna.answer}
	                                        	</td>
	                                        </tr>
	                                        	</c:when>
                                    			</c:choose>
	                                        
<%-- 	                                        <c:if test="${qna.reply == 'Y'}"> --%>
                                            
<%-- 	                                        </c:if> --%>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            <ul class="pagination justify-content-center">
				<c:if test="${page.prev}">
					<li class="page-item"><a class="page-link" href="a_listInquiry?pageNum=${page.startPage-1}">이전</a></li>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
					<li class="page-item ${page.pageNum == p ? 'active' : ''}"><a class="page-link" href="a_listInquiry?pageNum=${p}">${p}</a></li>
				</c:forEach>
				<c:if test="${page.next}">
					<li class="page-item"><a class="page-link" href="a_listInquiry?&pageNum=${page.endPage+1}">다음</a></li>
				</c:if>
			</ul>
            </div>
            <!-- End of Main Content -->

            <jsp:include page="a_footer.jsp"/>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->


    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/js/demo/datatables-demo.js"></script>
</body>

</html>