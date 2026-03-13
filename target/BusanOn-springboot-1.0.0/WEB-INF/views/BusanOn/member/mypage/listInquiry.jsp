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
    
     
</head>

<body>
<!--헤더 -->
<%@ include file="../../header.jsp" %>
 
<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
    <div class="container">
        <div class="row">
            <h2>1:1문의내역</h2>
        </div>
    </div>
</div>
<!-- 마이페이지 폼 시작-->
<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow my-5" style="margin: 15px" data-aos="zoom-in-up">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">부산온나 고객센터</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th style="width: 15%"></th>
                                            <th>제목</th>
                                            <th style="width: 25%">답변자</th>
                                            <th style="width: 20%">문의시간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                    	<c:when test="${fn:length(list) eq 0}">
	                                    	<tr>
		                                       	<td colspan="4" style="height: 50px; text-align: center;"><span style="font-size: 25px; color: Green;">
		                                       	<b>문의 내역이 없습니다.</b>
		                                       	</span></td>
	                                     	</tr>
										</c:when>
										<c:otherwise>
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
			                                    		<td>${qna.title }</td>
			                                            <td></td>
			                                            <td>${qna.time }</td>
		                                        	</tr>
			                                        <tr class="rep${qna.count}" style="display: none;">
			                                        	<td colspan="4" style="height: 200px; text-align: center;"><span style="font-size: 25px; color: blue;">
			                                        	&lt;문의 내용&gt;
			                                        	</span><br>${qna.content}</td>
			                                        </tr>
	                                    			<c:if test="${qna.reply == 'Y'}">
			                                    		<tr class="rep${qna.count}" style="display: none;">
			                                    		<td><span class="badge badge-warning p-2">부산온나의 답변</span></td>
			                                    		<td>Q & A : ${qna.title }</td>
			                                            <td>${qna.writer}</td>
			                                            <td>${qna.answer_time}</td>
			                                            </tr>
			                                            <tr class="rep${qna.count}" style="display: none;">
				                                        	<td colspan="4" style="height: 200px; text-align: center;"><span style="font-size: 25px; color:green;">
				                                        	&lt;답변 내용&gt;
				                                        	</span><br>${qna.answer}</td>
				                                        </tr>
			                                        </c:if>
	                                    	</c:forEach>
										</c:otherwise>
                                    </c:choose>
                                    
                                    	
                                    </tbody>
                                </table>
                                
                                <hr>
                                <div data-aos="flip-left" data-aos-delay="1000">
                                <div style="width:100%; text-align: center;">
                                <span style="font-size: 30px; color: navy;"><b>문의 작성</b></span>
                                </div><br>
                                <form action="qnainput" method="get" class="col-8 mx-auto" onsubmit="return lenc()">
                                <input type="text" class="form-control" name="title" id="title" placeholder="문의 제목을 입력하세요">
                                <textarea class="form-control" name="content" id="content" placeholder="문의 내용을 입력하세요" style="min-height: 400px; resize: none;"></textarea>
                                <input type="submit" class="btn btn-primary btn-block" value="1:1문의 등록">
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<!-- 마이페이지 폼 끝-->

<!--  ************************* Footer Start Here ************************** --> 
     
    <%@ include file="../../footer.jsp" %>
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
