<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="uri" value="${pageContext.request.requestURI}" />
<footer class="site-footer">
    <div class="footer-main">
        <div class="container">
            <div class="row footer-grid">
                <div class="col-lg-5 col-md-12 mb-4">
                    <h3 class="footer-brand">부산온나</h3>
                    <p>부산의 감성을 담은 숙소를 더 쉽고 편하게 찾을 수 있도록 구성한 예약 플랫폼입니다. 여행 조건 검색, 숙소 탐색, 예약 확인까지 한 흐름으로 이어지도록 구성했습니다.</p>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <h4>Busan Stay Curation</h4>
                    <ul>
                        <li>부산 여행을 위한 숙소 탐색</li>
                        <li>예약 · 리뷰 · 마이페이지 연동</li>
                        <li>사용자와 사업자 흐름을 함께 구성</li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 mb-4">
                    <h4>바로가기</h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/search/main">메인</a></li>
                        <li><a href="${pageContext.request.contextPath}/search/searchP">펜션목록</a></li>
                        <li><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/event/eventList">이벤트</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-copy">© 부산온나 | come to Busan</div>
        </div>
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    </div>
</footer>
<c:if test="${not fn:contains(uri, '/search/main') and not fn:contains(uri, '/admin/') and not fn:contains(uri, '/business/')}">
    <button type="button" class="floating-back-btn" onclick="history.back()">뒤로가기</button>
</c:if>
=======
=======
>>>>>>> parent of fee9d09 (1234)
=======
>>>>>>> parent of fee9d09 (1234)
        

    </footer>
    <div class="copy">
            <div class="container">
                <a href="https://www.smarteyeapps.com/">2022 &copy; 부산온나 | come to Busan</a>
                
                <span>
                <a><i class="fab fa-github"></i></a>
                <!-- <a><i class="fab fa-google-plus-g"></i></a> -->
               <!-- <a><i class="fab fa-pinterest-p"></i></a> -->
				<!-- <a><i class="fab fa-twitter"></i></a> -->
                <!-- <a><i class="fab fa-facebook-f"></i></a> -->
        </span>
            </div>

        </div> 

    </body>

</html>
>>>>>>> parent of fee9d09 (1234)
