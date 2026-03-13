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
<%@ include file="../header.jsp" %>
 
<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
    <div class="container">
        <div class="row">
            <h2>객실 삭제</h2>
            <ul>
                <li> <a href="#"><i class="fas fa-home"></i> 사업자 페이지</a></li>
                <li><i class="fas fa-angle-double-right"></i> 객실 삭제</li>
            </ul>
        </div>
    </div>
</div>

<!-- 객실 등록 삭제 폼 시작-->

 <div align="center" class = "roominfo_div_box" style="margin-top: 50px; margin-bottom: 50px;">
  <form action="${pageContext.request.contextPath}/roomDeletePro" method="post">
	<div class="mb-3 mt-3">
		<div style="margin-right: 220px;">
	      <label>비밀번호</label>
	    </div>
	      <div style=width:30%>
      		<input class="form-control" type="password" id="password" required placeholder="비밀번호">
     	  </div>
	      <input type="hidden" name = "RM_NUM" value="${RM_NUM}">
	</div>
	<div class="col-md-3 ffb">
     <input style=width:40% type="submit" class="btn-primary" value="객실삭제" onclick="location.href='${pageContext.request.contextPath}/roomDeletePro?ro_num=${ro_num}'">                       
    </div>
  </form>
 </div>

<!-- 객실 등록 삭제 폼 끝-->

<!--  ************************* Footer Start Here ************************** --> 
     
    </body>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>
</html>
