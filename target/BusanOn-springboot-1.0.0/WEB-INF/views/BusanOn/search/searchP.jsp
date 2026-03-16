<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>펜션 검색 | 부산온나</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
<%@ include file="../header.jsp" %>

<main class="main-content">
    <!-- 검색창 -->
    <div class="search">
        <div class="search-page-panel">
            <form action="${pageContext.request.contextPath}/search/searchP" name="f" method="get">
                <div class="search-panel-grid">
                    <div class="search-field">
                        <label for="checkin">체크인</label>
                        <input type="date" id="checkin" min="${today}" value="${rm_checkin}" class="main_checkin_1" name="rm_checkin" onchange="dateChk()" required>
                    </div>
                    <div class="search-field">
                        <label for="checkout">체크아웃</label>
                        <input type="date" id="checkout" min="${tomorrow}" value="${rm_checkout}" class="main_checkout_1" name="rm_checkout" onchange="dateChk()" required>
                    </div>
                    <div class="search-field">
                        <label for="select_ro_count">인원</label>
                        <select id="select_ro_count" onchange="change_ro_count()" name="rm_resable_num">
                            <option value="1" <c:if test="${rm_resable_num == 1}">selected</c:if>>1명</option>
                            <option value="2" <c:if test="${rm_resable_num == 2}">selected</c:if>>2명</option>
                            <option value="3" <c:if test="${rm_resable_num == 3}">selected</c:if>>3명</option>
                            <option value="4" <c:if test="${rm_resable_num == 4}">selected</c:if>>4명</option>
                        </select>
                    </div>
                    <div class="search-field">
                        <label for="pen_address">지역</label>
                        <input type="search" class="main_search_text" placeholder="지역" id="pen_address" name="pen_address" value="${pen_address}">
                    </div>
                    <div class="search-field">
                        <label for="pen_name">숙소명</label>
                        <input type="search" class="main_search_text" placeholder="숙소명" id="pen_name" name="pen_name" value="${pen_name}">
                    </div>
                    <button class="btn search-submit-btn" type="submit" id="btnSearchFilter">검 색</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 정렬 버튼 -->
    <div class="btn_wrap">
        <button type="button" data-sort="HIT" class="order" id="rev"><i class="fas fa-star"></i> 리뷰 순</button>
        <button type="button" data-sort="LOWPRICE" class="order" id="lPr"><i class="fas fa-arrow-up"></i> 낮은 가격 순</button>
        <button type="button" data-sort="HIGHPRICE" class="order" id="hPr"><i class="fas fa-arrow-down"></i> 높은 가격 순</button>
    </div>

    <!-- 숙소 리스트 -->
    <div id="penlist123123">
        <c:forEach items="${pensionList}" var="PensionDTO">
        <div class="pensionlist">
            <div class="pensions" data-pensionid="${PensionDTO.pen_id}">
                <div class="pen-card-inner">
                    <a class="pen-img-wrap" href="${pageContext.request.contextPath}/search/pensionDetail?pen_id=${PensionDTO.pen_id}&rm_checkin=${rm_checkin}&rm_checkout=${rm_checkout}">
                        <img src="${pageContext.request.contextPath}/upload/${PensionDTO.pen_image}" alt="${PensionDTO.pen_name}" class="pen-card-img"
                             onerror="this.style.display='none';this.parentElement.classList.add('no-img')">
                        <button class="wish-btn" onclick="toggleWish(event, '${PensionDTO.pen_id}', this)" title="찜하기">
                            <i class="fas fa-heart"></i>
                        </button>
                    </a>
                    <div class="pensionInfo">
                        <div class="infoBox1">
                            <h2><a href="${pageContext.request.contextPath}/search/pensionDetail?pen_id=${PensionDTO.pen_id}&rm_checkin=${rm_checkin}&rm_checkout=${rm_checkout}">${PensionDTO.pen_name}</a></h2>
                            <p><i class="fas fa-map-marker-alt" style="color:#38b2d8;margin-right:4px;"></i>${PensionDTO.pen_address}</p>
                        </div>
                        <div class="infoBox3">
                            <p><i class="fas fa-star" style="color:#f59e0b;margin-right:4px;"></i>별점 ${PensionDTO.star}&nbsp;|&nbsp;<i class="fas fa-comment-alt" style="color:#38b2d8;margin-right:4px;"></i>리뷰 ${PensionDTO.rv}개</p>
                        </div>
                        <div class="infoBox2">
                            <c:choose>
                                <c:when test="${PensionDTO.rm_price eq '0' or empty PensionDTO.rm_price}">
                                    <p style="color:#a0aec0;font-size:0.9rem;">가격 정보 없음</p>
                                </c:when>
                                <c:when test="${PensionDTO.rm_price eq PensionDTO.rm_price_max or empty PensionDTO.rm_price_max or PensionDTO.rm_price_max eq '0'}">
                                    <p><fmt:formatNumber value="${fn:replace(PensionDTO.rm_price, ',', '')}" type="number"/>원</p>
                                </c:when>
                                <c:otherwise>
                                    <p><fmt:formatNumber value="${fn:replace(PensionDTO.rm_price, ',', '')}" type="number"/>원 ~ <fmt:formatNumber value="${fn:replace(PensionDTO.rm_price_max, ',', '')}" type="number"/>원</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>

    <div style="padding-bottom: 40px;"></div>
</main>

<%@ include file="../footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/date.js"></script>

<<<<<<< HEAD
=======
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
>>>>>>> parent of fee9d09 (1234)
<script type="text/javascript">
var index = 2;
var curr_order = "";
var check = true;

function buildCard(dto) {
    var url = '${pageContext.request.contextPath}/search/pensionDetail?pen_id=' + dto.pen_id + '&rm_checkin=${param.rm_checkin}&rm_checkout=${param.rm_checkout}';
    return '<div class="pensionlist">' +
        '<div class="pensions" data-pensionid="' + dto.pen_id + '">' +
        '<div class="pen-card-inner">' +
        '<a class="pen-img-wrap" href="' + url + '">' +
            '<img src="${pageContext.request.contextPath}/upload/' + dto.pen_image + '" alt="' + dto.pen_name + '" class="pen-card-img"' +
            ' onerror="this.style.display=\'none\';this.parentElement.classList.add(\'no-img\')">' +
            '<button class="wish-btn" onclick="toggleWish(event,\'' + dto.pen_id + '\',this)" title="찜하기"><i class="fas fa-heart"></i></button>' +
        '</a>' +
        '<div class="pensionInfo">' +
            '<div class="infoBox1">' +
                '<h2><a href="' + url + '">' + dto.pen_name + '</a></h2>' +
                '<p><i class="fas fa-map-marker-alt" style="color:#38b2d8;margin-right:4px;"></i>' + dto.pen_address + '</p>' +
            '</div>' +
            '<div class="infoBox3">' +
                '<p><i class="fas fa-star" style="color:#f59e0b;margin-right:4px;"></i>별점 ' + dto.star + '&nbsp;|&nbsp;<i class="fas fa-comment-alt" style="color:#38b2d8;margin-right:4px;"></i>리뷰 ' + dto.rv + '개</p>' +
            '</div>' +
            '<div class="infoBox2"><p>' + (function(min, max) {
                if (!min || min == '0') return '<span style="color:#a0aec0;font-size:0.9rem;">가격 정보 없음</span>';
                var minF = parseInt(min).toLocaleString();
                var maxF = parseInt(max).toLocaleString();
                if (!max || max == '0' || min == max) return minF + '원';
                return minF + '원 ~ ' + maxF + '원';
            })(dto.rm_price, dto.rm_price_max) + '</p></div>' +
        '</div>' +
        '</div></div></div>';
}

/* 찜하기 토글 */
function toggleWish(e, pen_id, btn) {
    e.preventDefault();
    e.stopPropagation();
    var user_id = '${sessionScope.user_id}';
    if (!user_id) {
        showToast('로그인 후 찜하기를 이용할 수 있습니다.', 'warning');
        return;
    }
    $.ajax({
        url: '${pageContext.request.contextPath}/member/wishlistToggle',
        type: 'POST',
        data: { pen_id: pen_id },
        dataType: 'json',
        success: function(data) {
            $(btn).addClass('pop');
            setTimeout(function() { $(btn).removeClass('pop'); }, 350);
            if (data.status === 'added') {
                $(btn).addClass('wished');
                showToast('찜 목록에 추가했습니다. ❤', 'success');
            } else if (data.status === 'removed') {
                $(btn).removeClass('wished');
                showToast('찜 목록에서 제거했습니다.', 'info');
            }
        }
    });
}

/* 페이지 로드 시 찜 상태 일괄 확인 */
$(document).ready(function() {
    var user_id = '${sessionScope.user_id}';
    if (!user_id) return;
    $('.pensions').each(function() {
        var pen_id = $(this).data('pensionid');
        var btn = $(this).find('.wish-btn');
        $.ajax({
            url: '${pageContext.request.contextPath}/member/wishlistCheck',
            type: 'GET',
            data: { pen_id: pen_id },
            dataType: 'json',
            success: function(data) {
                if (data.wished) btn.addClass('wished');
            }
        });
    });
});

/* 무한스크롤 */
window.addEventListener('scroll', function() {
    var scrollLocation = document.documentElement.scrollTop;
    var windowHeight = window.innerHeight;
    var fullHeight = document.body.scrollHeight;
    if (scrollLocation + windowHeight >= fullHeight) {
        var count = ${page.amount};
        if (!check) return;
        check = false;
        $.ajax({
            url: 'searchPajax?pen_name=${param.pen_name}&pen_address=${param.pen_address}',
            type: 'get',
            data: { 'count': count, 'index2': index, 'gb': 'scroll', 'order': curr_order },
            success: function(data) {
                if (data.length == 0) { index--; check = true; return; }
                $.each(data, function(i, dto) { $('#penlist123123').append(buildCard(dto)); });
                check = true;
                index++;
            }
        });
    }
});

/* 정렬 버튼 */
window.onload = function() {
    $(".order").on('click', function() {
        var pen_name = $('#pen_name').val();
        var pen_address = $('#pen_address').val();
        var order = this.id;
        var count = ${page.amount};
        if (!check) return;
        check = false;
        $.ajax({
            type: 'get',
            url: 'searchPajax?pen_name=${param.pen_name}&pen_address=${param.pen_address}',
            data: { 'pen_name': pen_name, 'pen_address': pen_address, 'order': order, 'index2': 2, 'count': count, 'gb': 'button' },
            success: function(data) {
                if (data.length == 0) { index--; check = true; return; }
                $('#penlist123123').empty();
                $.each(data, function(i, dto) { $('#penlist123123').append(buildCard(dto)); });
                check = true;
                index = 2;
                curr_order = order;
            }
        });
    });
};
</script>
</body>
</html>
