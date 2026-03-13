<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/logintimer.js"></script>
       <style>
       

/* #menu a { */
/*   position: relative; */
/*   display: inline-block; */
/*   transition: .3s; */
/* } */
/* #menu a::after { */
/*   position: absolute; */
/*   bottom: 0; */
/*   left: 50%; */
/*   content: ''; */
/*   width: 0; */
/*   height: 1px; */
/*   background-color: rgb(235,70,70); */
/*   transition: .3s; */
/*   -webkit-transform: translateX(-50%); */
/*   transform: translateX(-50%); */
/* } */
/* #menu a:hover::after { */
/*   width: 100%; */
/* } */

.title_color:hover {
	color:#007bff;
	transition: all .3s;
}
.navbar-nav > li > .dropdown-menu {
    margin-top: 0;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    display: block;
    opacity: 0;
    transition: ease-out 0.3s;
}
/* .dropdown-menu > li{ */
/*     font-size: 50px; */
/* } */
.dropdown-menu1 {
min-width: 8rem;
}
.dropdown:hover .dropdown-menu > li{
	width:100%;
    font-size: 1rem;
}
.dropdown:hover .dropdown-menu > li:hover{
	text-align:left;
	background-color: gray;
	transition: all .5s;
/*     font-style: italic; */
}
.dropdown:hover .dropdown-menu > li:hover > a{
	color:white;
}
.dropdown:hover .dropdown-menu {
     opacity:1;
}
.dropdown-menu1
{
	border:none;
	display: block;
  	opacity:1;
	height: 0px;
	overflow: hidden;
	padding: 0px;
	top: 180px;
	transition: all .3s;
}
.dropdown:hover .dropdown-menu1
{
	display:block;
	top: 70%;
	height: inherit;
}


header .navs ul li ul li {
    padding: 10px;

}
    </style>
</head>

    <body>
     <!--로딩 -->
		<%@ include file="loading.jsp" %>
        <header id="menu-jk" class="container-fluid">
            <div class="row">
                <div class="col logo">
               
                	<a href="${pageContext.request.contextPath }/search/main"><!-- 로고에 메인페이지 링크 추가 -->
                    	<img src="${pageContext.request.contextPath }/resources/images/busan_onna_logo.png" alt="">
                    	
                	</a>
                	
                     <a data-toggle="collapse" data-target="#menu" href="#menu"><i class="fas d-block d-md-none  small-menu fa-bars"></i></a>
                </div>
                <div class="col-md-auto"></div>
                <div id="menu" class="col-lg-8 col-md-8	 d-none d-md-block navs ">
                    <ul>
<!--                         <li><input type="text" style="visibility: hidden;"></li> -->
                        <li class="dropdown">
				           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">	더보기<span class="caret"></span></a>
				        	<ul class="dropdown-menu dropdown-menu1">
				            	<li><a href="#" onclick="alert('준비중입니다.')">공지사항</a></li>
				            	<li><a href="#" onclick="alert('준비중입니다.')">이벤트</a></li>
				        	</ul>
				        </li>
				        <li><a class="title_color" href="${pageContext.request.contextPath }/search/searchP">펜션목록</a></li>
                     <c:choose> 
						<c:when test="${sessionScope.user_id == null}">
							<li><a class="title_color" href="${pageContext.request.contextPath }/member/join">회원가입</a></li>
							<li><a class="title_color" href="${pageContext.request.contextPath }/member/login">로그인</a></li>
						</c:when> 
						<c:otherwise>
							<li class="dropdown">
							   <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user_name }<span class="caret"></span></a>
							   <ul class="dropdown-menu dropdown-menu1">
							   	  <c:choose>
							   	  	<c:when test="${sessionScope.user_type == '0'}">
							   	  		<li style="border-bottom: solid 1px;"><a href="${pageContext.request.contextPath}/admin/a_index">관리자페이지</a></li>
							   	  	</c:when>
							   	  	<c:otherwise>
							   	  		<li><a href="${pageContext.request.contextPath}/member/m_myPage/">마이페이지</a></li>
							            <li><a href="${pageContext.request.contextPath}/member/mypage/listReservation">예약내역</a></li>
							            <li><a href="${pageContext.request.contextPath}/member/mypage/myreview" >내가쓴 리뷰</a></li>
							            <li style="border-bottom: solid 1px;"><a href="${pageContext.request.contextPath}/member/mypage/listInquiry">1:1 문의</a></li>	
							   	  	</c:otherwise>
							   	  </c:choose>
						          <li><a href="#" onclick="logout()">로그아웃</a></li>
						       </ul>    
						     </li>
						</c:otherwise> 
					</c:choose>
					<!-- <li><a class="title_color" href="${pageContext.request.contextPath }/map">찾아오는 길</a></li>-->
					<li id="timer" style=";padding: 0;margin-top: 22px;"></li>
                    </ul>
                </div>
                <div class="col-sm-1">
                    <ul>
<!--                         <li> --> <!-- 페이스북 --> 
<!--                             <i class="fab fa-facebook-square"></i> -->
<!--                         </li> -->
<%-- 							<c:if test="${sessionScope.user_id != null}"> --%>
<%-- 								<c:choose>  --%>
<%-- 									<c:when test="${sessionScope.user_type == '0'}"> --%>
<%-- 										<li><a href="${pageContext.request.contextPath }/admin/a_index">관리자 페이지</a></li> --%>
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										<li><a href="${pageContext.request.contextPath }/member/m_myPage">My Page</a></li>  --%>
<%-- 									</c:otherwise>  --%>
<%-- 								</c:choose> --%>
<%-- 							</c:if> --%>
                    </ul>
                </div>
            </div>
        </header>
        
<script type="text/javascript">
var user_id = "${sessionScope.user_id}";
var ts = 170;
if(user_id != null && user_id != '' && user_id.length != 0){
	timer('${pageContext.request.contextPath}',"${sessionScope.TT}", ts);
}


function logout(){
	if(confirm("로그아웃 하시겠습니까?")){
		location.href="${pageContext.request.contextPath }/member/logout";
	}
}

function resettimer(){
	
	$(document).ready(() => {
		$.ajax({
			url:'${pageContext.request.contextPath}/timerreset',
			type:'get',
			success:(data) => {
				debugger;
				timer('${pageContext.request.contextPath}',data, ts);
			}
		})
	})
	
}
</script>
        