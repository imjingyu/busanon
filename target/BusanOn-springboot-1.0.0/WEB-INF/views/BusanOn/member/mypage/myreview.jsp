<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

<head>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/memberMyPage/qna.js"></script>
     <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
    
<style>
#pensionSearch :hover{
	color:blue;
}
</style>
</head>
<body>
<!--헤더 -->
<%@ include file="../../header.jsp" %>
 
<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
    <div class="container">
        <div class="row">
            <h2>ReView</h2>
        </div>
    </div>
</div>
<!-- 마이페이지 폼 시작-->
<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow my-5" style="margin: 15px" data-aos="zoom-in-up">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">숙박시설 리뷰</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th style="width: 10%"></th>
                                            <th>제목</th>
                                            <th style="width: 40%; text-align: center;">별점</th>
                                            <th style="width: 25%">숙박시설 상호명</th>
                                            <th style="width: 10%">리뷰 작성시간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                    	<c:when test="${fn:length(list) eq 0}">
	                                    	<tr>
		                                       	<td colspan="4" style="height: 50px; text-align: center;"><span style="font-size: 25px; color: Green;">
		                                       	<b>리뷰 내역이 없습니다.</b>
		                                       	</span></td>
	                                     	</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${list}" var="review">
	                                    		<tr style="cursor: pointer;" id="rep${review.rev_num}" onclick="showQna(this.id)">
	                                    			<c:choose>
		                                    			<c:when test="${review.reply == 'Y'}">
			                                        	<td><span class="badge badge-info p-2">처리 완료</span></td>
			                                        	</c:when>
			                                        	<c:when test="${review.reply == 'N'}">
			                                        	<td ><span class="badge badge-danger p-2">미답변</span></td>
			                                        	</c:when>
	                                    			</c:choose>
			                                    		<td>${review.rev_title }</td>
			                                            <td style="text-align: center;">
			                                            	<ul class="ret">
			                                            		<li>
			                                            		<c:forEach var="i" begin="1" end="5">
			                                            			<c:choose>
			                                            			<c:when test="${i <= review.rev_star}">
			                                            			<i class="fa fa-star" style="color: #fdae5c"></i>
			                                            			</c:when>
			                                            			<c:otherwise>
			                                            			<i class="fa fa-star" style="color: #fdae5c; font-weight: 100;"></i>
			                                            			</c:otherwise>
			                                            			</c:choose>
			                                            		</c:forEach>
			                                            		<span style="margin-left: 5px; font-weight: bolder;">${review.rev_star } 점</span>
			                                            		</li>
			                                            	</ul>
			                                            </td>
			                                            <td onclick="event.stopPropagation()">
				                                            <a href="${pageContext.request.contextPath }/search/pensionDetail?pen_name=${review.pen_name }&pen_id=${review.pen_id }" 
				                                            id="pensionSearch" style="font-size: 18px; color: fuchsia;">
				                                            	<b>${review.pen_name }</b>
				                                            </a>
			                                            </td>
			                                            <td>${review.rev_date }</td>
		                                        	</tr>
			                                        <tr class="rep${review.rev_num}" style="display: none;">
			                                        	<td colspan="5" style="height: 200px; text-align: center;"><span style="font-size: 25px; color: blue;">
			                                        	&lt;리뷰 본문&gt;
			                                        	</span><br>${review.rev_content}</td>
			                                        </tr>
	                                    			<c:if test="${review.reply == 'Y'}">
			                                    		<tr class="rep${review.rev_num}" style="display: none;">
			                                    		<td><span class="badge badge-warning p-2">팬션 답변</span></td>
			                                    		<td colspan="3" style="text-align: center; font-size: 18px;"><b>정성 스러운 리뷰 감사드립니다.</b></td>
			                                            <td>${review.ans_date}</td>
			                                            </tr>
			                                            <tr class="rep${review.rev_num}" style="display: none;">
				                                        	<td colspan="5" style="height: 200px; text-align: center;"><span style="font-size: 25px; color:green;">
				                                        	&lt;답변 본문&gt;
				                                        	</span><br>${review.ans_content}</td>
				                                        </tr>
			                                        </c:if>
	                                    	</c:forEach>
										</c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
<!-- 마이페이지 폼 끝-->

<!--  ************************* Footer Start Here ************************** --> 
     

    </body>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>
    <script>AOS.init({
    	  duration: 1000
    });</script>
    
</html>
