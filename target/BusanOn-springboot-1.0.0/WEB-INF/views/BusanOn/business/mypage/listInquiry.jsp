<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
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
                    <div class="card shadow my-5">
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
                                    	<%-- <c:forEach items="${list}" var="qna">
                                        
                                        <tr data-toggle="collapse" data-target="#rep${qna.bno}">
                                        	<c:choose>
                                        	<c:when test="${qna.bno != qna.groupno}">
                                        	<td class="pl-5"><span class="badge badge-warning p-2">여수어때의 답변</span></td>
                                        	</c:when>
                                        	<c:when test="${!qna.reply}">
                                        	<td><span class="badge badge-info p-2">처리 완료</span></td>
                                        	</c:when>
                                        	<c:when test="${qna.bno == qna.groupno}">
                                        	<td><span class="badge badge-danger p-2">미답변 </span></td>
                                        	</c:when>
                                        	</c:choose>
                                            <td>${qna.title }</td>
                                            <td>${qna.writer}</td>
                                            <td><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd"/></td>
                                        </tr>
                                        <tr class="collapse" id="rep${qna.bno}">
                                        	<td colspan="4">
                                        	${qna.content}
                                        	</td>
                                        </tr>
                                    	
                                    	</c:forEach> --%>
                                    	
                                    	<c:forEach items="${list}" var="qna">
                                    		<c:choose>
                                    		<c:when test="${qna.bno == qna.groupno}">
                                    		<tr style="cursor: pointer;" data-toggle="collapse" data-target="#rep${qna.bno}">
                                    			<c:choose>
                                    			<c:when test="${!qna.reply}">
	                                        	<td><span class="badge badge-info p-2">처리 완료</span></td>
	                                        	</c:when>
	                                        	<c:when test="${qna.bno == qna.groupno}">
	                                        	<td><span class="badge badge-danger p-2">미답변 </span></td>
	                                        	</c:when>
                                    			</c:choose>
	                                    		<td>${qna.title }</td>
	                                            <td></td>
	                                            <td><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd"/></td>
	                                        </tr>
	                                        <tr class="collapse" id="rep${qna.groupno}">
	                                        	<td colspan="4" style="height: 200px">${qna.content}</td>
	                                        </tr>
                                    		</c:when>
                                    		<c:otherwise>
                                    		<tr class="collapse" id="rep${qna.groupno}">
                                    		<td><span class="badge badge-warning p-2">여수어때의 답변</span></td>
                                    		<td>${qna.title }</td>
                                            <td>${qna.writer}</td>
                                            <td><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd"/></td>
                                            </tr>
                                            <tr class="collapse" id="rep${qna.groupno}">
	                                        	<td colspan="4" style="height: 200px">${qna.content}</td>
	                                        </tr>
                                    		</c:otherwise>
                                    		</c:choose>
                                    	</c:forEach>
                                    </tbody>
                                </table>
                                <hr>
                                <sec:authorize access="!hasAnyRole('ROLE_ADMIN')">
                                <form method="post" class="col-8 mx-auto">
                                <input type="text" class="form-control" name="title" placeholder="문의 제목을 입력하세요">
                                <textarea class="form-control" name="content" placeholder="문의 내용을 입력하세요" style="min-height: 400px; resize: none;"></textarea>
                                <button class="btn btn-primary btn-block">1:1문의 등록</button>
                                <input type="hidden" name="writer" value='<sec:authentication property="principal.username"/>'>
                                <sec:csrfInput/>
                                </form>
                                </sec:authorize>
                            </div>
                        </div>
                    </div>
                </div>

<!-- 마이페이지 폼 끝-->

<!--  ************************* Footer Start Here ************************** --> 
     
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <h2>About Us</h2>
                    <p>
                        Smart Eye is a leading provider of information technology, consulting, and business process services. Our dedicated employees offer strategic insights, technological expertise and industry experience.
                    </p>
                    <p>We focus on technologies that promise to reduce costs, streamline processes and speed time-to-market, Backed by our strong quality processes and rich experience managing global... </p>
                </div>
                <div class="col-md-4 col-sm-12">
                    <h2>Useful Links</h2>
                    <ul class="list-unstyled link-list">
                        <li><a ui-sref="about" href="#/about">About us</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="portfolio" href="#/portfolio">Portfolio</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="products" href="#/products">Latest jobs</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="gallery" href="#/gallery">Pricing</a><i class="fa fa-angle-right"></i></li>
                        <li><a ui-sref="contact" href="#/contact">Contact us</a><i class="fa fa-angle-right"></i></li>
                    </ul>
                </div>
                <div class="col-md-4 col-sm-12 map-img">
                    <h2>Contact Us</h2>
                    <address class="md-margin-bottom-40">
                        BlueDart Hosting <br>
                       765th Boulevard, <br>
                        Rochester, CA <br>
                        Phone: +1 831 143 556 <br>
                        Email: <a href="mailto:info@bluedart.com" class="">info@bluedart.in</a><br>
                        Web: <a href="https://smarteyeapps.com/" class="">www.bluedart.in</a>
                    </address>

                </div>
            </div>
        </div>
        

    </footer>
    <div class="copy">
            <div class="container">
                <a href="https://www.smarteyeapps.com/">2019 &copy; All Rights Reserved | Designed and Developed by Smarteyeapps</a>
                
                <span>
                <a><i class="fab fa-github"></i></a>
                <a><i class="fab fa-google-plus-g"></i></a>
                <a><i class="fab fa-pinterest-p"></i></a>
                <a><i class="fab fa-twitter"></i></a>
                <a><i class="fab fa-facebook-f"></i></a>
        </span>
            </div>

        </div> 

    </body>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>
</html>
