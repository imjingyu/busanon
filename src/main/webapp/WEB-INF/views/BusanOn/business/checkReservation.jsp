<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="b_head.jsp"/>

    <title>관리자페이지 : 펜션예약조회</title>
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
                            <h6 class="m-0 font-weight-bold text-primary">펜션 예약 내역 확인</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="text-center">
                                            <th>예약번호</th>
                                            <th>숙소이름</th>
                                            <th>예약자</th>
                                            <th>체크인</th>
                                            <th>체크아웃</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${reservation2}" var="r">
	                                        <tr>
	                                            <td class="text-center">${r.res_number}</td>
	                                            <td class="text-center text-truncate">${r.pen_name}(${r.rm_name})</td>
	                                            <td class="text-center">${r.user_name}</td>
	                                    		<td class="text-center">${r.check_in_d}</td>
	                                            <td class="text-center">${r.check_out_d}</td>
	                                            <td style="text-align: center;">
	                                            <c:choose>
	                                            <c:when test="${r.res_status == '1'}">
	                                            <button class="btn btn-primary w-30" style="border-radius:7px;font-family: 'Do Hyeon', sans-serif;" onclick="cancelReservation('${r.res_number}')" >취소하기
                                                </button> 
	                                            </c:when>
	                                            <c:otherwise>
	                                            <input type="button" value="취소하기" style="width:90px; height:30px; border:none; border-radius:7px; height: 40px; background-color: gray; color:white; font-family: 'Do Hyeon', sans-serif;" disabled>
	                                            </c:otherwise>
	                                            </c:choose>
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
				order : [[3,"desc"]]
			})
		})
		
   function cancelReservation(res_number){
    	if(confirm('취소하시겠습니까?')){
    		location.href='checkReservation2?res_number='+res_number+'';
    	}
	  }
	</script>

</body>

</html>