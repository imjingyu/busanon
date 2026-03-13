<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>

	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Free Tour and Travel Website Tempalte | Smarteyeapps.com</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css" />
     
</head>
<style>
a > b{
font-size: 19px;
}
a > b:hover{
color:blue;
}

#dataTable_filter{
    display: grid;
    justify-content: end;
    
}
</style>
<body>
<!--헤더 -->
<%@ include file="../../header.jsp" %>
 
<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
    <div class="container">
        <div class="row">
            <h2>예약내역조회</h2>
        </div>
    </div>
</div>

<!-- 마이페이지 폼 시작-->
<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow my-5">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">예약내역조회</h6>
                        </div>
                        <div class="card-body">
                            <div>
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="text-center">
                                            <th>예약번호</th>
                                            <th style="width: 20%">숙소이름</th>
                                            <th style="width: 20%">방 이름</th>
                                            <th>체크인</th>
                                            <th>체크아웃</th>
                                            <th>예약상태</th>
                                            <th>예약취소</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${list}" var="r">
	                                        <tr>
	                                            <td class="text-center">${r.res_number}</td>
	                                            <td class="text-center"><a href="${pageContext.request.contextPath }/search/pensionDetail?pen_id=${r.pen_id}&pen_name=${r.pen_name}"><b>${r.pen_name}</b></a></td>
	                                            <td class="text-center">${r.rm_name}</td>
	                                            <td class="text-center">${r.check_in_d}</td>
	                                            <td class="text-center">${r.check_out_d}</td>
	                                            <td class="text-center">
	                                            <c:choose>
	                                            <c:when test="${r.res_status == '1'}">
	                                            <span style="color:blue"><b>예약확정</b></span>
	                                            </c:when>
	                                            <c:when test="${r.res_status == '2'}">
	                                            <span style="color:green;"><b>취소불가</b></span>
	                                            </c:when>
	                                            <c:otherwise>
	                                            <span style="color:red"><b>취소완료</b></span>
	                                            </c:otherwise>
	                                            </c:choose>
	                                            
	                                            </td>
	                                            <td style="text-align: center;">
	                                            <c:choose>
	                                            <c:when test="${r.res_status == '1'}">
	                                            <button class="btn btn-primary w-30" style="border-radius:7px;font-family: 'Do Hyeon', sans-serif;" onclick="cancelreservation('${r.res_number}')" >취소하기
	                                             </button> 
	                                            </c:when>
	                                            <c:otherwise>
	                                            <input type="button" value="취소하기" style="width:90px; height:38px; border:none; border-radius:7px; height: 40px; background-color: gray; color:white; font-family: 'Do Hyeon', sans-serif;" disabled>
	                                            </c:otherwise>
	                                            </c:choose>
	                                             
	                                            </td>
<!-- 	                                            <td class="text-center"> -->
<%-- 	                                            <c:choose> --%>
<%-- 	                                            <c:when test="${r.res_status}"> --%>
<!-- 	                                            <b style="color: purple;">예약</b> -->
<%-- 	                                            </c:when> --%>
<%-- 	                                            <c:otherwise> --%>
<!-- 	                                            <b style="color: red;">취소</b> -->
<%-- 	                                            </c:otherwise> --%>
<%-- 	                                            </c:choose> --%>
<!-- 	                                            </td> -->
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>


<!-- 마이페이지 폼 끝-->

<!--  ************************* Footer Start Here ************************** --> 

    <script type="text/javascript">
    function cancelreservation(res_number){
    	if(confirm('취소하시겠습니까?')){
    		location.href='listReservation2?res_number='+res_number+'';
    	}
    }
    </script>
    
    <script>
		$(function() {
			$('#dataTable').DataTable({
				order : [[2,"desc"]]
			})
		})
	</script>
	
	<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/script.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<%--     <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/jquery/jquery.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>

<!--     Core plugin JavaScript -->
<%--     <script src="${pageContext.request.contextPath }/resources/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script> --%>

<!--     Custom scripts for all pages -->
<%--     <script src="${pageContext.request.contextPath }/resources/assets/admin/js/sb-admin-2.min.js"></script> --%>
    
    </body>
   
</html>
