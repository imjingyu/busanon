<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="a_head.jsp"/>

    <title>부산온나 : 회원 목록 조회</title>
</head>
<style>
#pen_id{
 color:blue;
}
#pen_id:hover{
 text-decoration: underline;
 cursor:pointer;
}
</style>

<script type="text/javascript">
function pen(id, name){
	var a = confirm('팬션으로 이동하시겠습니까?')
	if(a){
		location.href="${pageContext.request.contextPath }/search/pensionDetail?pen_id="+id+"&pen_name="+name+"";
	}
	
}
</script>
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

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">전체 펜션 목록 조회</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>팬션 번호</th>
                                            <th>팬션 이름</th>
                                            <th>팬션 주소</th>
                                            <th style="text-align: center; width: 15%">평균 별점</th>
                                            <th>리뷰 수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${list}" var="pension">
	                                        <tr>
	                                            <td>${pension.pen_id}</td>
	                                            <td id="pen_id" onclick="pen('${pension.pen_id}', '${pension.pen_name}')">${pension.pen_name}</td>
	                                            <td>${pension.pen_address}</td>
	                                            <td style="text-align: center;">
	                                            <c:forEach var="i" begin="1" end="5">
                                           			<c:choose>
                                           			<c:when test="${i <= pension.star}">
                                           			<i class="fa fa-star" style="color: #fdae5c"></i>
                                           			</c:when>
                                           			<c:otherwise>
                                           			<i class="fa fa-star" style="color: #fdae5c; font-weight: 100;"></i>
                                           			</c:otherwise>
                                           			</c:choose>
                                           		</c:forEach>
	                                            ${pension.star}점</td>
	                                            <td>${pension.rv} 건</td>
	                                            
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
            

            <jsp:include page="a_footer.jsp"/>
            
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

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/assets/admin/js/demo/datatables-demo.js"></script>

</body>
</html>

<%-- 		<jsp:include page="a_sidebar.jsp"/> --%>
		
<!--         Content Wrapper -->
<!--         <div id="content-wrapper" class="d-flex flex-column"> -->

<!--             Main Content -->
<!--             <div id="content"> -->
<%-- 			<jsp:include page="a_nav.jsp"/> --%>

<!--                 Begin Page Content -->
<!--                 <div class="container-fluid"> -->
<%-- 					${members} --%>
<!--                     Page Heading -->
<!--                     <h1 class="h3 mb-2 text-gray-900">전체 회원 목록</h1> -->
                    
<!--                     DataTales Example -->
<!--                     <div class="card shadow mb-4"> -->
<!--                         <div class="card-body"> -->
<!--                         	<ul class="list-group text-gray-900"> -->
<%--                         		<c:forEach items="${memberList}" var="m" varStatus="stat"> --%>
<!-- 								<li class="list-group-item" > -->
<!-- 									<form method="post"> -->
									
<%-- 									<div data-toggle="collapse" data-target="#list${stat.index}">  --%>
<%-- 										<h4>${m.userId}</h4>  --%>
<!-- 										<div class="row mb-3" style="size: .5rem"> -->
<%-- 											<span class="font-weight-bold ml-3">이름</span><p style="width:50px" class="col-2" >${m.name}</p> --%>
<%-- 											<span class="font-weight-bold ml-2">닉네임</span><p style="width:50px" class="col-3" >${m.nickName}</p> --%>
<!-- 											<div class="col-12"> -->
<%-- 												<span class="font-weight-bold ml-1">이메일</span><a class="col-2" href="mailto:${m.email}">${m.email}</a>  --%>
<%-- 												<span class="font-weight-bold ml-1">핸드폰번호</span><a class="col-12" href="#">${m.phone}-${m.phone2}-${m.phone3} </a> --%>
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<%-- 									<div class="collapse" id="list${stat.index}"> --%>
<!-- 										<div class="row mb-3"> -->
<%-- 										<span class="font-weight-bold ml-3">메일인증</span><p class="col-1 mr-5">${m.authEmail}</p> --%>
<%-- <%-- 											<select name="delStatus"> --%>
<%-- 													<option>선택</option> --%>
<%-- 													<option value=1 ${m.delStatus == '1'}>true</option> --%>
<%-- 													<option value=0 ${m.delStatus == '0'}>false</option> --%>
<%-- 												</select> --%>
<%-- 											</p> --%>
											
<%-- 											<p class="col-3">${m.regDate}</p> --%>
<%-- 											<p class="col-3">${m.updateDate}</p> --%>
<%-- 												</select> --%>
<%-- 											</p> --%>
<%-- 											<p class="col-3">${m.regDate}</p> --%>
<%-- 											<p class="col-3">${m.updateDate}</p> --%>
<%-- 												</select> --%> --%>
											
<!-- 										<div class="custom-control custom-switch"> -->
<%-- 											<label class="custom-control-label font-weight-bold ml-3" for="id${p.pensionid}">탈퇴상태</label> --%>
<%-- 											<input type="checkbox" id="${m.delStatus}" data-userId='${m.userId}' class="custom-control-input auth-change" ${m.delStatus ? 'checked' : ''}> --%>
<!-- 										</div> -->
										
<!-- 										<div class="row mb-3" style="size: .5rem"> -->
<!-- 											<div class="col-12"> -->
<%-- 												<span class="font-weight-bold ml-3">등록일</span><p class="ml-3 mr-5 d-inline-block" >${m.regDate}</p> --%>
<%-- 												<span class="font-weight-bold ml-2">업데이트일</span><p class="ml-3 d-inline-block" >${m.updateDate}</p> --%>
<!-- 											</div> -->
											
<!-- 										<div class="form-group row"> -->
<%-- 											<input class="form-control col-3" type="text" name="zipNo" placeholder="우편번호" value="${m.zipNo}" readonly> --%>
<%-- 											<p class="col-3"><input class="form-control" type="text" name="roadAddr" value="${m.roadAddr}" readonly></p> --%>
<%-- 											<p class="col-3"><input class="form-control" type="text" name="jibunAddr" value="${m.jibunAddr}"></p> --%>
<%-- 											<p class="col-3"><input class="form-control" type="text" name="addrDetail" value="${m.addrDetail}"></p> --%>
<!-- 											<p class="col-3"><button type="button" class="btn btn-primary w-50 mr-3 d-inline-block btn-addr" >주소검색</button></p> -->
<!-- 										</div> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="col-3"> -->
												
<!-- 												<div class="form-check"> -->
<%-- 													<label class="form-check-label" for="auth1"><input class="form-check-input" type="checkbox" value="ROLE_MEMBER" ${m.auths.toString().contains('ROLE_MEMBER') ? 'checked' : ''}>회원</label> --%>
<!-- 												</div>  -->
<!-- 												<div class="form-check"> -->
<%-- 													<label class="form-check-label" for="auth2"><input class="form-check-input" type="checkbox" value="ROLE_MANAGER" ${m.auths.toString().contains('ROLE_MANAGER') ? 'checked' : ''}>업체회원</label> --%>
<!-- 												</div>  -->
<!-- 												<div class="form-check"> -->
<%-- 													<label class="form-check-label" for="auth3"><input class="form-check-input" type="checkbox" value="ROLE_ADMIN" ${m.auths.toString().contains('ROLE_ADMIN') ? 'checked' : ''}>관리자</label> --%>
<!-- 												</div>  -->
<!-- 											</div> -->
<%-- 											<p class="col-2"><input class="form-control" type="text" name='phone' value="${m.phone}"></p> --%>
<%-- 											<p class="col-2"><input class="form-control" type="text" name='phone2' value="${m.phone2}"></p> --%>
<%-- 											<p class="col-2"><input class="form-control" type="text" name='phone3' value="${m.phone3}"></p> --%>
<!-- 											<p class="col-3"><button type="submit" name="modifyBtn" class="btn btn-primary btn-modify">수정</button> </p> -->
<!-- 											<sec:csrfInput/> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
<%-- 									<input type="hidden" name="userId" value="${m.userId}">  --%>
<%-- 									<input type="hidden" name="email" value="${m.email}"> --%>
<%-- 									<input type="hidden" name="name" value="${m.name}"> --%>
<%-- 									<input type="hidden" name="nickName" value="${m.nickName}"> --%>
									
<!-- 									</form>  -->
<!-- 								</li> -->
<%-- 								</c:forEach> --%>
<!-- 							</ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <ul class="pagination justify-content-center"> -->
<%-- 						<c:if test="${page.prev}"> --%>
<%-- 							<li class="page-item"><a class="page-link" href="memberList${page.cri.paramWithoutPageNum}&pageNum=${page.start-1}">이전</a></li> --%>
<%-- 						</c:if> --%>
<%-- 						<c:forEach begin="${page.start}" end="${page.end}" var="p"> --%>
<%-- 							<li class="page-item ${page.cri.pageNum == p ? 'active' : ''}"><a class="page-link" href="memberList${page.cri.paramWithoutPageNum}&pageNum=${p}">${p}</a></li> --%>
<%-- 						</c:forEach> --%>
<%-- 						<c:if test="${page.next}"> --%>
<%-- 							<li class="page-item"><a class="page-link" href="memberList${page.cri.paramWithoutPageNum}&pageNum=${page.end+1}">다음</a></li> --%>
<%-- 						</c:if> --%>
<!-- 					</ul> -->
<!--                 </div> -->
<!--                 /.container-fluid -->

<!--             </div> -->
<!--             End of Main Content -->

<%--             <jsp:include page="a_footer.jsp"/> --%>

<!--         </div> -->
<!--         End of Content Wrapper -->
		
		
<!--     </div> -->
<!--     End of Page Wrapper -->

<!--     Scroll to Top Button -->
<!--     <a class="scroll-to-top rounded" href="#page-top"> -->
<!--         <i class="fas fa-angle-up"></i> -->
<!--     </a> -->

<!--     Logout Modal -->
<!--     <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" -->
<!--         aria-hidden="true"> -->
<!--         <div class="modal-dialog" role="document"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="modal-header"> -->
<!--                     <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5> -->
<!--                     <button class="close" type="button" data-dismiss="modal" aria-label="Close"> -->
<!--                         <span aria-hidden="true">×</span> -->
<!--                     </button> -->
<!--                 </div> -->
<!--                 <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div> -->
<!--                 <div class="modal-footer"> -->
<!--                     <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button> -->
<!--                     <a class="btn btn-primary" href="login.html">Logout</a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

<!--     Bootstrap core JavaScript -->
<%--     <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/jquery/jquery.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>

<!--     Core plugin JavaScript -->
<%--     <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script> --%>

<!--     Custom scripts for all pages -->
<%--     <script src="${pageContext.request.contextPath }/resources/assets/admin/js/sb-admin-2.min.js"></script> --%>
    
    	
<!-- </body> -->
<!-- </html> -->