<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Come to Busan - 부산온나</title><!-- Free Tour and Travel Website Tempalte | Smarteyeapps.com -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <style>
    .text-center {
    color: #007bff!important;
    margin: 0;
    padding: 0;
    border: 0;
    box-sizing: border-box;
    font-size: 26px;
    display: block;
    font-weight: 700;
    --bs-gutter-x: 1.0rem;
    --bs-gutter-y: 0;
    text-align: center!important;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Liberation Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
}
	
    </style>
</head>

<body>
<!--헤더 -->
<%@ include file="../header.jsp" %>
 
    <!-- ******************** Slider Starts Here ******************* -->
   	
    <div class="slider">
        <!-- Set up your HTML -->
        <div class="owl-carousel ">
            <div class="slider-img">
                <div class="item">
                    <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-0.jpg" alt=""></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                                <div class="animated bounceInDown slider-captions">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-1.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-2.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-3.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-4.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-5.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-6.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-8.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


	<!-- 검색창 시작 -->
	<div class="search container-fluid" style="background-color: #e2e6e9;"><!-- gainsboro -->
		<div class="container" style="background-color: white; border-radius: 10px; padding: 2.5px 2.5px 2.5px 2.5px;">
			<form action="${pageContext.request.contextPath}/search/searchP" name="f" method="get"  style="margin: auto ;border: solid white !important;">
				<div class="row form-detail" style="margin: auto;">
					<div class="col-md-2 ffb">
                            <input type='date' id="checkin" min="${today }" value="${today }" class="main_checkin_1" name="rm_checkin" onchange="dateChk()"
                            style="width: 99%; margin: 0px 2.25px;" required>
					</div>
					<div class="col-md-2 ffb">
                            <input type='date' id="checkout" min="${tomorrow }" value="${tomorrow }" class="main_checkout_1" name="rm_checkout" onchange="dateChk()"
                            style="width: 99%; margin: 0px 2.25px; border-left: 0;" required>
					</div>
					<div class="col-md-1 ffb">
<!-- 					<input type="hidden" name="ro_count" value="2"> -->
						<!-- select 저장용 -->
						<div>
                           <select id="select_ro_count" class="form-select form-select-lg" onchange="change_ro_count()" name="rm_resable_num" value="${rm_resable_num }"
                           style="border: none; width: 99%; height: 48px; margin: 0px 2.25px; padding: 13px;">
							     <option value="1">1</option>
							     <option value="2" selected>2</option>
							     <option value="3">3</option>
							     <option value="4">4</option>
                           </select>
						</div>
					</div>
                 	<div class="col-md-2 ffb">
						<input type=search class=main_search_text placeholder="지 역" name="pen_address" value="${pen_address }"
						style="width:99%; height: 48px; margin: 0px 2.25px; padding-left: 0;"><!--  required -->
					</div>
					<div class="col-md-2 ffb">
						<input type=search class=main_search_text placeholder="숙 소 명" name="pen_name" value="${pen_name }"
						style="width:99%; height: 48px; margin: 0px 2.25px; padding-left: 0;"><!--  required -->
					</div>
					<div class="col-md-3 ffb">
						<button class="btn btn-primary w-100" type=submit
						style="border: none; border-radius: 10px; height: 48px; font-size: 27px; font-family: 'Do Hyeon', sans-serif;" >검 색</button>
					</div>
				</div>
			</form>
		</div>
	</div>
<!-- 검색창 끝 -->

    

    <!-- ******************** Popular Packages Starts Here ******************* -->
  <section class="container-fluid popular-pack">
        <div class="container">
             <div class="session-title row">
             <%@ include file="../search/Keymap.jsp" %>
            </div>
            
            <div class="row pack-row">
             <c:forEach items="${TopList }" var="PensionDTO" begin="0" end="5">
                <div class="col-md-4">
                    <div class="colpack">
                    	<a href="${pageContext.request.contextPath }/search/pensionDetail?pen_id=${PensionDTO.pen_id}">
                        <img src="${pageContext.request.contextPath }/resources/upload/${PensionDTO.pen_image }" alt="" style="height: 250px;">
                        </a>
                        <div class="details row no-margin" style="height: 160px;">
                        	<input id="" type="hidden" name="pen_id" value="${PensionDTO.pen_id}">
                            <h4>${PensionDTO.pen_name}</h4>
                            <p>${PensionDTO.pen_address }</p>
                            <ul class="rat">
                            <li>
                            <c:choose>
                            <c:when test="${fn:length(PensionDTO.star.trim()) == 0}">
                            <p>평점 5점</p>
                            <c:forEach var="i" begin="1" end="5" step="1">
                          			<i class="fa fa-star" style="color: #fdae5c"></i>
                          		</c:forEach> 
                            </c:when>
                            <c:otherwise>
                            <p>평점 ${PensionDTO.star }</p>
                            <fmt:parseNumber var="star" type="number" value="${PensionDTO.star}" />
                            	<c:forEach var="i" begin="1" end="5" step="1">
                          			<c:choose>
                          			<c:when test="${i <= star}">
                          			<i class="fa fa-star" style="color: #fdae5c"></i>
                          			</c:when>
                          			<c:otherwise>
                          			<i class="fa fa-star" style="color: #fdae5c; font-weight: 100;"></i>
                          			</c:otherwise>
                          			</c:choose>
                          		</c:forEach> 
                            </c:otherwise>		
                            </c:choose>		
                            </li>
                            </ul>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>

    



       <!--  ************************* Footer Start Here ************************** --> 
  <%@ include file="../footer.jsp" %>


    </body>

    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/date.js"></script>
</html>
