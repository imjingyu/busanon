<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <title>${pensionDTO.pen_name } | 부산온나</title>

</head>


<body>
<%@ include file="../header.jsp" %>

	<div>
		<div style="padding-top: 100px;"></div>
		<div class="pdDetail">
			<div class="pdTop"><!--  style="border: 1px solid blue; margin: 0 10% 20px 10%;" -->
				<div class="pdLeft" ><!-- style="float: left; width: 500px" -->
					<!-- 펜션 사진 (지원) -->
					<div class="pdGallery">
						<img alt="" src="${pageContext.request.contextPath }/resources/upload/${pensionDTO.pen_image }"><!-- 펜션 사진 -->
					</div>
				</div>
				<!-- //pdGallery -->
				<div class="pdRight"><!--  style="text-align: left;" -->
					<!-- 펜션 정보(이름 주소) (지원) -->
					<div class="pdInfo">
						<!-- <p class="pdBadge"></p> -->
			 			<h2 style="font-weight: bold; color: black;">
			 				${pensionDTO.pen_name }</h2>
						<p class="pdAddress">${pensionDTO.pen_address }</p>
					</div>
					<!-- //pdInfo -->
				</div>
				<!-- //pdRight -->
				<div class="pdC">
					<strong class="pdStrong">사장님 한마디</strong>
					<button class="pdButton">더보기</button>	<!-- 나중에 누가 더보기 구현좀.. -->
					<div class="pdClamp pdDiv">
						일광 해수욕장과 인근에 있어 객실에서 편안하게 오션뷰 감상이 가능한 펜션입니다<!-- 
						<br>
						일상에서 벗어나 가족과 함께하는 여행, 연인과의 로맨틱한 휴가를 즐길 수 있습니다 -->
					</div>
					<!-- //pdClamp pdDiv -->
				</div>
				<!-- //pdC -->
			</div>
			<!-- //pdTop -->
		</div>
		<!-- //pdDetail -->
	</div>
	
	<div class="pdTab"><!-- style="border-bottom: 1px solid gainsboro; margin: 0 auto; padding: 0 16px; margin-top: 38px;" -->
			<ul class="nav nav-tabs">
         <li class="nav-item">
            <a class="nav-link active" data-bs-toggle="tab" href="#tabhome">객실안내/예약</a>
         </li>
         <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#">숙박정보</a>
         </li>
         <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#tabmenu">리뷰</a>
         </li>
      </ul>
	</div>

	<script type="text/javascript">
		
		// 날짜 일수 더하는 함수
// 		function dateAdd(date, days) {
// 			var d = new Date(date);
// 			d.setDate(d.getDate() + days);
// 			return d;
// 		}
		
// 		function zero(value) {
// 			if (value < 10) {
// 				return '0' + value;
// 			}
	       
// 			return value;
// 		}
	   
// 		function dateFormat(source, delimiter = '-') {
// 			const year = source.getFullYear();
// 			const month = zero(source.getMonth() + 1);
// 			const day = zero(source.getDate());
			
// 			return [year, month, day].join(delimiter);
// 		}
	   
	   // 체크인 날짜 값 변경 시 체크아웃 날짜 값 변경(지원)
// 		$(document).ready( function() {

			// 체크인 날짜 값이 변경되면
// 			$('#checkin').change( function() {
// 				var checkin = $('#checkin').val();
// 				var nd = dateAdd(checkin, 1);
// 				console.log("다음날 : " + nd);
				
// 				var checkout = $('#checkout').val();

// 				let dateElement = document.getElementById('checkout');
// 				let nextDay = dateFormat(nd);   // 체크인 날짜의 다음날
// 				console.log(nextDay);
				
// 				dateElement.setAttribute("min", nextDay);   // 체크아웃의 최소값 지정
				
				// 다음날이 원래 체크아웃날짜보다 크면
// 				if(nextDay > checkout) {
// 					$('#checkout').val(nextDay);   // 체크아웃 value값을 다음날로 변경
// 				}
				
// 			});
// 		});


	
	

	
	</script>
	
	<div style="margin: 15px 0;">
		<div class="roomInfo">
			<form action="${pageContext.request.contextPath}/search/pensionDetail">
<%-- 				<input id="" type="hidden" name="pen_name" value="${pen_name }"> --%>
				<input id="" type="hidden" name="pen_id" value="${pen_id }">
				<div style="padding: 2.5px 2.5px 2.5px 2.5px;">
					<div class="row form-detail" style="display: flex;margin: auto;border: 1px solid gainsboro;border-radius: 10px;width: auto;background: white;align-items: center;">
						<div class="col-md-2 ffb">
			               	<input type='date' id="checkin" min="${today }" value="${rm_checkin }" class="main_checkin_1" name="rm_checkin"
			               		style="width: 99%; margin: 0px 2.25px; padding: 0;" required><!--  onchange="dateChk()" -->
						</div>
						<div class="col-md-2 ffb">
			               	<input type='date' id="checkout" min="${tomorrow }" value="${rm_checkout }" class="main_checkout_1" name="rm_checkout"
								style="width: 99%; margin: 0px 2.25px; padding: 0; border-left: 0;" required><!--  onchange="dateChk()" -->
						</div>
						<div class="col-md-2 ffb">
							<button class="btn btn-primary w-100"
							 style="border: none;border-radius: 10px;height: 35px;font-size: 25px;font-family: 'Do Hyeon', sans-serif;display: flex;justify-content: center;align-items: center;padding-bottom: 4px;">변 경</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<!-- //tab -->
	<div class="tab-content">
	<div id="tabhome" class="container tab-pane fade active show">
	<c:forEach var="businessDTO" items="${searchRoomList }">
	<form action="${pageContext.request.contextPath }/search/reserve?rm_checkin=${rm_checkin}&rm_checkout=${rm_checkout}&room_id=${businessDTO.ROOM_ID }" method="get" data-sel-date="" data-sel-date2=""
		style="margin: 15px 0; padding: 0; border: 0; box-sizing: border-box;" onsubmit="return logincheck();">
<%-- 		<input id="" type="hidden" name="pen_name" value="${pensionDTO.pen_name }"> --%>
		<input id="" type="hidden" name="rm_checkin" value="${rm_checkin}">
		<input id="" type="hidden" name="rm_checkout" value="${rm_checkout}">
		<input id="" type="hidden" name="room_id" value="${businessDTO.ROOM_ID }">
		<input id="" type="hidden" name="rm_price" value="${businessDTO.RM_PRICE }">
		<!-- 객실안내/예약 -->
		<article class="roomInfo">
		 	<div><!--  style="border: 1px solid red; margin: 10px 25%;" -->
				<div style="padding: 0 2.5px;"><!-- padding: 15px 2.5px; -->
				 	<div class="room">
					 	<p class="pic_view" style="margin-block-start: auto;"><img class="pensionPic" src="${pageContext.request.contextPath }/resources/upload/${businessDTO.RM_IMAGE }"
					 		style="display: inline-block; width: auto; height: auto; filter: none;"></p>
					 	
						<strong class="penTitle" style="margin: 0;">${businessDTO.RM_NAME }</strong>
						
						<div><!--  class="roomInfo" -->
						
							<div class="roomCheckIO">
								<div class="sCheckIO">
									체크인 / 체크아웃
									<span style="float: right;">
										${businessDTO.RM_CHECKIN } / ${businessDTO.RM_CHECKOUT }
									</span>
								</div>
							</div>
									
							<div class="roomPrice">
								<div class="srPrice">
									
									<!-- 표시 금액 -->
									<div>
										<p style="color: black; font-size: 30px; overflow: hidden; border-top: 1px solid gainsboro; padding: 20px 0; overflow: hidden; margin: 0;"><!--  border-bottom: 1px solid gainsboro; padding-bottom:5px;  -->
										 <b style="float: left; font-size: 27px; color: #8c8c8c;">가격</b>
										<span style="float: right;"><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${businessDTO.RM_PRICE }"/> 원</b></span></p>
									</div>
								</div>
								
								
							</div>
						</div>
						
						<!-- <div style="margin: 15px 0;"></div> -->
					 	
					 	<div class="rButton">
					 		<input type="submit" class="btn btn-primary w-100"
					 			<c:if test="${businessDTO.OVERLAP != 0 }"> disabled value="예 약 불 가" style="border:none; border-radius:7px; height: 40px; background-color: gray; color:white; font-family: 'Do Hyeon', sans-serif; font-size: 20px;"</c:if>
					 			<c:if test="${businessDTO.OVERLAP == 0 }"> value="${businessDTO.BOOK }" style="border-radius:7px; height: 40px; color:white; font-family: 'Do Hyeon', sans-serif; font-size: 20px;"</c:if>>
<!-- 					 		<button class="btn btn-primary w-100" style="border-radius:7px; height: 40px; "> -->
<%-- 					 			<h4 style="color:white; font-family: 'Do Hyeon', sans-serif;">${businessDTO.BOOK }</h4> --%>
<!-- 					 		</button> -->
					 	</div>
					 	<div style="margin: 0 0 25px 0;"></div>
				 	</div>
				</div>
			</div>
		</article>
	</form>
	</c:forEach>
	<div style="padding-top: 100px;"></div>
	</div>
<%@ include file="review.jsp" %>
<%@ include file="../footer.jsp" %>
	</div>

<script type="text/javascript">
function logincheck(){
	debugger;
	const user_id = '${sessionScope.user_id}';
	if(user_id == null || user_id == ''){
		alert('로그인 이후에 이용 가능합니다.');
		location.href = '${pageContext.request.contextPath }/member/login';
		return false;
	}
	return true;
}
</script>
	
	
	
	
<!-- <table border="1"> -->
<!-- <tr><td>방 사진</td><td>방 호실</td></tr> -->
<%-- <c:forEach var="PensionDTO" items="${pensionList }"> --%>
<!-- <tr> -->
	<%-- <td>${PensionDTO.pen_image }</td> --%>
<%--     <td><a href="${pageContext.request.contextPath }/search/pensionDetail?pen_name=${PensionDTO.pen_name }">${PensionDTO.pen_name }</a></td> --%>
<%--     <td>${PensionDTO.pen_address }</td> --%>
<%--     <td>${PensionDTO.rm_price }</td> --%>  <!-- 방가격중 최저가가 나타나도록 구현 -->
<!--     <td>리뷰 갯수 </td></tr>	펜션 리뷰개수 쿼리 -->
<%-- </c:forEach> --%>
<!-- </table> -->
	
<!-- 	<div> -->
<!-- 		<ul> -->
<!-- 			<li><a href="#">객실안내/예약</a></li> -->
<!-- 			<li><a href="#">숙소정보</a></li> -->
<!-- 			<li><a href="#">리뷰</a></li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
	

</body>

    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/date.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/detailReplyStyle.css">
    <style>

.pic > img {
	filter: brightness(100%);
}
.card-body > ul > li{
	border: 1px solid rgba(0,0,0,0.08);
	text-align: center;
	font-size: 17px;
}

<style>
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
a {
    color: #444;
    text-decoration: none;
}

.btn-primary {
    color: #fff;
    background-color: #ff4a52d9;
    border-color: #ff4a52d9;
}

header .navs ul li ul li {
    padding: 10px;

}
</style> 
<script type="text/javascript">
	var btn = $('#replyForm');
	$(document).ready(() => {
		$('#replyEvent').click(() => {
			if(btn.css('display') == 'none'){
				$.ajax({
					url:'rescheck',
					data:{'user_id':"${sessionScope.user_id}", 'user_type':"${sessionScope.user_type}", 'pen_id':'${param.pen_id}'},
					type:'get',
					success:(data) => {
						debugger;
						if(data == true){
							if(btn.css('display') == 'none'){
								btn.css('display', 'block');
								return;
							}
						}
						alert('예약 이력이 없어 리뷰작성이 불가능합니다.');
						return;
					}
				})
			}
			btn.css('display', 'none');
			return;
		})
	})
	
</script>
</html>