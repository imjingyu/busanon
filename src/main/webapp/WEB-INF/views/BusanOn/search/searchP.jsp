<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <title>${pensionDTO.pen_name } | 부산온나</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <!-- <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> -->
<style type="text/css">
.pensionlist {
margin: 0 auto 0 auto !important;  /* 이미지 사이 공백 삭제 */
}

@media (max-width: 768px) {
 .order {width:100% !important;}

}

@media (max-width: 1440px) {
 .order {width:257px;}

}
</style>

</head>
<body>
<%@ include file="../header.jsp" %>
<!--헤더 -->

<div style="padding-bottom: 85px;"></div>

		<!-- 검색창 시작 -->
	<div class="search container-fluid" style="background-color: #e2e6e9;"><!-- gainsboro -->
		<div class="container" style="background-color: white; border-radius: 10px; padding: 2.5px 2.5px 2.5px 2.5px;">
			<form action="${pageContext.request.contextPath}/search/searchP" name="f" method="get"  style="margin: auto ;border: solid white !important;">
				<div class="row form-detail" style="margin: auto;">
					<div class="col-md-2 ffb">
                            <input type='date' id="checkin" min="${today }" value="${rm_checkin }" class="main_checkin_1" name="rm_checkin" onchange="dateChk()"
                            style="width: 99%; margin: 0px 2.25px;" required>
					</div>
					<div class="col-md-2 ffb">
                            <input type='date' id="checkout" min="${tomorrow }" value="${rm_checkout }" class="main_checkout_1" name="rm_checkout" onchange="dateChk()"
                            style="width: 99%; margin: 0px 2.25px; border-left: 0;" required>
					</div>
					<div class="col-md-1 ffb">
<!-- 					<input type="hidden" name="ro_count" value="2"> -->
						<!-- select 저장용 -->
						<div>
							<input type="hidden" name="rm_resable_num" value="${rm_resable_num}">
                           <select id="select_ro_count" class="form-select form-select-lg" onchange="change_ro_count()" name="rm_resable_num" value="${rm_resable_num }"
                           style="border: none; width: 99%; height: 48px; margin: 0px 2.25px; padding: 13px;">
                              <option value="1" <c:if test="${rm_resable_num == 1}">selected</c:if>>1</option>
                              <option value="2" <c:if test="${rm_resable_num == 2}">selected</c:if>>2</option>
                              <option value="3" <c:if test="${rm_resable_num == 3}">selected</c:if>>3</option>
                              <option value="4" <c:if test="${rm_resable_num == 4}">selected</c:if>>4</option>
                           </select>
						</div>
					</div>
                 	<div class="col-md-2 ffb">
						<input type=search class=main_search_text placeholder="지 역" id="pen_address" name="pen_address" value="${pen_address }"
						style="width:99%; height: 48px; margin: 0px 2.25px; padding-left: 0;"><!--  required -->
					</div>
					<div class="col-md-2 ffb">
						<input type=search class=main_search_text placeholder="숙 소 명" id="pen_name" name="pen_name" value="${pen_name }"
						style="width:99%; height: 48px; margin: 0px 2.25px; padding-left: 0;"><!--  required -->
					</div>
					<div class="col-md-3 ffb">
						<button class="btn btn-primary w-100" type=submit id="btnSearchFilter"
						style="border: none; border-radius: 10px; height: 48px; font-size: 27px; font-family: 'Do Hyeon', sans-serif;" >검 색</button>
					</div>
				</div>
			</form> 
		</div>
	</div>
<!-- 검색창 끝 -->
			<div class="col-lg-8 btn_wrap width_4 pensionlist" style="">
			 <div style="text-align: center;margin-left: 4px;">
              <button type="button" data-sort="HIT" class="order" id="rev"> <!-- style="width: 256px;" -->
              	<span>리뷰 순</span></button>
              <button type="button" data-sort="LOWPRICE" class="order" id="lPr">
              	<span>낮은 가격 순</span></button>
              <button type="button" data-sort="HIGHPRICE" class="order" id="hPr">
              	<span>높은 가격 순</span></button>
              </div>
            </div>

				<!-- 숙소 리스트 불러오기 -->
				<div id="penlist123123">

  				   <c:forEach items="${pensionList }" var="PensionDTO">
					<div class="col-lg-8  pensionlist">
						<div class="pensions" data-pensionid="${PensionDTO.pen_id}">
						  <div class="container">
							<a href="${pageContext.request.contextPath }/search/pensionDetail?pen_id=${PensionDTO.pen_id}&rm_checkin=${rm_checkin }&rm_checkout=${rm_checkout }" >
								<img src="${pageContext.request.contextPath }/resources/upload/${PensionDTO.pen_image }" alt="Image" class="img-fluid">
							</a>
							<div class="pensionInfo">
							  <div class="infoBox1">
								<h2><a href="${pageContext.request.contextPath }/search/pensionDetail?&pen_id=${PensionDTO.pen_id}&rm_checkin=${rm_checkin }&rm_checkout=${rm_checkout }">${PensionDTO.pen_name }</a>
								</h2>
								<p>${PensionDTO.pen_address }</p>
							  </div>
							  
							  <div class="infoBox2">
								<p>가격 <fmt:formatNumber type="number" maxFractionDigits="3" value="${PensionDTO.rm_price }" /> 원</p>
							  </div>
							  
							  <div class="infoBox3">
								<p>별점 ${PensionDTO.star }</p>
								<p>리뷰 ${PensionDTO.rv }개</p>
							  </div>
							</div>
						  </div>
						</div>
					</div>
					</c:forEach>
				</div>  
				
				<div style="padding-bottom: 10px;"></div>
				<%@ include file="../footer.jsp" %>
</body>
<script type="text/javascript">
var index = 2;
var curr_order = "";
var check = true;


/* 무한스크롤*/
window.addEventListener('scroll', () => {
	var scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
	var windowHeight = window.innerHeight; // 스크린 창
	var fullHeight = document.body.scrollHeight;
	if(scrollLocation + windowHeight >= fullHeight) {
		//debugger;
		var count = ${page.amount};
	    if(!check){
	    	return;
	    }
	    check = false;
	    $.ajax({
	        url : 'searchPajax?pen_name=${param.pen_name}&pen_address=${param.pen_address}',
	        type : "get",
	        data : {'count': count, 'index2' : index, 'gb' : 'scroll', 'order': curr_order},
	   		success:(data) => {
	   			
				if(data.length == 0){
					index--;
					return;
				} 
				
	   			$.each(data, function (i, PensionDTO) {
	   				
	   				
		   			$('#penlist123123').append('<div class="col-lg-8 pensionlist">' + 
									'<div class="pensions" data-pensionid='+PensionDTO.pen_id+'">'+
									'<div class="container">'+
									'<a href="${pageContext.request.contextPath }/search/pensionDetail?pen_id='+PensionDTO.pen_id+'&rm_checkin=${param.rm_checkin}&rm_checkout=${param.rm_checkout}">'+
										'<img src="${pageContext.request.contextPath }/resources/upload/'+PensionDTO.pen_image+'" alt="Image" class="img-fluid">'+
									'</a>'+
									'<div class="pensionInfo">'+
									'<div class="infoBox1">'+
									'<h2><a href="${pageContext.request.contextPath }/search/pensionDetail?pen_id='+PensionDTO.pen_id+'&rm_checkin=${param.rm_checkin}&rm_checkout=${param.rm_checkout}">'+PensionDTO.pen_name+'</a>'+
										'</h2>'+
										'<p>'+PensionDTO.pen_address+'</p>'+
										'</div>'+
										'<div class="infoBox2">'+
										'<p>가격 '+PensionDTO.rm_price+'원</p>'+
										'</div>'+
										'<div class="infoBox3">'+
										'<p>별점 '+PensionDTO.star+'</p>'+
										'<p>리뷰 '+PensionDTO.rv+'개</p>'+
										'</div>'+
									'</div>'+
								  '</div>'+
								'</div>'+ 
							'</div>');
	   			})
	   			check = true;
	   			index++;
			}
	    });
	}

});

// 버튼
window.onload = function(){
	$(".order").on('click', function() {
	    
	    var pen_name = $('#pen_name').val();
	    var pen_address =  $('#pen_address').val();
	    var order = this.id;
	    //var amount = $('.pensions').length;
	    var count = ${page.amount};
	    
	   //debugger;
	    
	    if(!check){
	    	return;
	    }
	    check = false;
	    
		$.ajax({
			type: 'get',
			url: 'searchPajax?pen_name=${param.pen_name}&pen_address=${param.pen_address}',
			data: {
				'pen_name': pen_name
			  , 'pen_address' : pen_address
			  , 'order' : order
			  , 'index2' : 2
			  , 'count': count
			  , 'gb': 'button'
			},
	   		success:(data) => {
	   			

				if(data.length == 0){
					index--;
					return;
				} 
				$('#penlist123123').empty();
	   			$.each(data, function (i, PensionDTO) {
	   //				isFetching = true;
// 	   				
		   			$('#penlist123123').append('<div class="col-lg-8 pensionlist">' + 
									'<div class="pensions" data-pensionid='+PensionDTO.pen_id+'">'+
									'<div class="container">'+
									'<a href="${pageContext.request.contextPath }/search/pensionDetail?pen_id='+PensionDTO.pen_id+'&rm_checkin=${param.rm_checkin}&rm_checkout=${param.rm_checkout}">'+
										'<img src="${pageContext.request.contextPath }/resources/upload/'+PensionDTO.pen_image+'" alt="Image" class="img-fluid">'+
									'</a>'+
									'<div class="pensionInfo">'+
									'<div class="infoBox1">'+
									'<h2><a href="${pageContext.request.contextPath }/search/pensionDetail?pen_id='+PensionDTO.pen_id+'&rm_checkin=${param.rm_checkin}&rm_checkout=${param.rm_checkout}">'+PensionDTO.pen_name+'</a>'+
										'</h2>'+
										'<p>'+PensionDTO.pen_address+'</p>'+
										'</div>'+
										'<div class="infoBox2">'+
										'<p>가격 '+PensionDTO.rm_price+'원</p>'+
										'</div>'+
										'<div class="infoBox3">'+
										'<p>별점 '+PensionDTO.star+'</p>'+
										'<p>리뷰 '+PensionDTO.rv+'개</p>'+
										'</div>'+
									'</div>'+
								  '</div>'+
								'</div>'+ 
							'</div>');
	   			})
	   			check = true;
	   			index++;
	   			
	   			// 전역번수 초기화
	   			index = 2;
	   			curr_order = order;
			}
			
		});
	});
} 
</script>


     <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/date.js"></script>
    </html>
