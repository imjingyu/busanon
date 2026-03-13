<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="b_head.jsp"/>

    <title>관리자페이지 : 펜션매출조회</title>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

		<jsp:include page="b_sidebar.jsp"/>
		
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
			<jsp:include page="b_nav.jsp"/>

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">펜션 매출조회</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="text-center">
                                            <th>결제번호</th>
                                            <th>숙소이름</th>
                                            <th>아이디</th>
                                            <th>상태</th>
                                            <th>결제금액</th>
                                            <th>결제일자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${listReservation3}" var="p">
	                                        <tr>
	                                            <td class="text-center">${p.res_number}</td>
	                                            <td class="text-center text-truncate">${p.pen_name}(${p.rm_name})</td>
	                                            <td class="text-center">${p.user_id}</td>
	                                            <td class="text-center">${p.res_status ? "취소" : "승인"}</td>
	                                            <td class="text-right text-truncate"><fmt:formatNumber type="number" maxFractionDigits="3" value="${p.rm_price}" />원</td>
	                                            <td class="text-center small pt-3">${p.res_time}</td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <jsp:include page="b_footer.jsp"/>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

   	<script>
		$(function() {
			$('#dataTable').DataTable({
				order : [[5,"desc"]]
			})
		})
	</script>

</body>

</html>