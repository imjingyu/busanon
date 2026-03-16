<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="b_head.jsp"/>

    <title>부산온나 : 숙소목록</title>
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

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">숙소관리</h1>
						
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="width: 15%">펜션명</th>
                                            <th style="width: 15%">객실명</th>
                                            <th style="width: 12%">체크인</th>
                                            <th style="width: 12%">체크아웃</th>
                                            <th style="width: 12%">객실이용가능인원</th>
                                            <th style="width: 12%">가격</th>
                                            <th style="width: 12%">예약상태</th>
                                            <th style="width: 10%">객실번호</th>
                                        </tr>
                                    </thead>
	                                    <tbody >
	                                    	<c:forEach items="${rList}" var="businessDTO" >
		                                    <tr data-toggle="collapse" data-target="#demo1" class="accordion-toggle room1" >
			                                    <td>${businessDTO.PEN_NAME}</td>
			                                    <td>${businessDTO.RM_NAME}</td>
			                                    <td>${businessDTO.RM_CHECKIN}</td>
			                                    <td>${businessDTO.RM_CHECKOUT}</td>
			                                    <td>${businessDTO.RM_RESABLE_NUM}</td>
			                                    <td>${businessDTO.RM_PRICE}</td>
			                                    <td>${businessDTO.RES_STATUS}</td>
			                                    <td>${businessDTO.ROOM_ID}</td>
			                                    <td class="d-none">${businessDTO.PEN_ID}</td>
                                            </tr>
		                                    </c:forEach>
	                                     </tbody>
            <td colspan="12" class="hiddenRow">
							<div class="accordian-body collapse" id="demo1"> 
              <table class="table table-striped">
                      <thead>
                        <tr class="info">
													<th>숙소명</th>
													<th>체크인</th>
													<th>체크아웃</th>
													<th>가격</th>		
												</tr>
											</thead>
											<tbody>
												<tr>
							<form class="user" method="post" action="${pageContext.request.contextPath}/business/roomListPro">
									<td>
                                     <input type="text" class="form-control form-control-user" id="name" name="RM_NAME" >
                                    </td>
                                    <td>
                                     <input type="text" class="form-control form-control-user" id="startline" name="RM_CHECKIN" >
                                    </td>
                                    <td>
                                     <input type="text" class="form-control form-control-user" id="deadline" name="RM_CHECKOUT" >
                                    </td>
                                    <td>
                                     <input type="text" class="form-control form-control-user" id="price" name="RM_PRICE" >
                                    </td>
                                <hr>
                                <input type="hidden" id="PEN_ID" name="PEN_ID" >
		                		<input type="hidden" id="num" name="RM_NUM" >
                                <button class="btn btn-primary btn-user btn-block" id="btnReg">
                                    숙소 수정하기
                                </button>
                                <button class="btn btn-primary btn-user btn-block" id="btnReg" formaction="remove">
                                    삭제하기
                                </button>
                                <security:csrfInput/>
                            </form>
												</tr>
											</tbody>	
								  		

                                </table>
                                </div>
                                </td>
                                
                                              </table>
                                              
                            </div>
                            
                        </div>
                    </div>

                </div>


            </div>



            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>

        </div>

    </div>

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

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/js/demo/datatables-demo.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/room.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(document).on("click", ".room1", function() {
			
			var str = ""
			var tdArr = new Array();
				
			var tr = $(this);
			var td = tr.children();
				
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});
				
				// 배열에 담긴 값을 확인하기 위한 log코드
//	 			console.log("배열 값 : " + tdArr);

			var PEN_ID = td.eq(8).text();
			var RM_NUM = td.eq(7).text();
			var RM_NAME = td.eq(1).text();
			var RM_CHECKIN = td.eq(2).text();
			var RM_CHECKOUT = td.eq(3).text();
			var RM_PRICE = td.eq(5).text();
				
				// 각 변수에 담긴 값을 확인 하기위한 log코드
//	 			console.log("RM_NUM : " + RM_NUM)
//	 			console.log("RM_NAME : " + RM_NAME)
//	 			console.log("RM_CHECKOUT : " + RM_CHECKOUT)
//	 			console.log("RM_PRICE : " + RM_PRICE)
				
				// 각 값에 입력
			$('#PEN_ID').val(PEN_ID);
			$('#num').val(RM_NUM);
			$('#name').val(RM_NAME);
			$('#startline').val(RM_CHECKIN);
			$('#deadline').val(RM_CHECKOUT);
			$('#price').val(RM_PRICE);
				
				
		});
	});

</script>
  

</body>

</html>