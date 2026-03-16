<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="ko">
<head>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>결제페이지 | 부산온나</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

<%@ include file="../header.jsp" %>

<div class="page-nav no-margin row">
    <div class="container">
        <div class="row"><h2>예약 / 결제</h2></div>
    </div>
</div>

<main class="main-content">
    <div class="reserve-wrapper">

        <!-- 왼쪽: 예약자 정보 -->
        <div class="reserve-left-panel">
            <div class="reserve-card">
                <div class="reserve-card-header">
                    <h3><i class="fas fa-user-circle" style="margin-right:8px;"></i>예약자 정보</h3>
                </div>
                <div class="reserve-card-body">
                    <input type="hidden" name="user_id" value="${user_id}">

                    <div class="reserve-field-group">
                        <label class="reserve-field-label">예약자 이름</label>
                        <input class="reserve-field-value" type="text" name="user_name"
                               maxlength="20" value="${memberDTO.user_name}" readonly>
                    </div>

                    <div class="reserve-field-group">
                        <label class="reserve-field-label">
                            휴대폰 번호
                            <span style="font-weight:400;font-size:0.72rem;color:#a0aec0;margin-left:6px;text-transform:none;letter-spacing:0;">
                                개인정보 보호를 위해 안심번호로 전송됩니다
                            </span>
                        </label>
                        <input class="reserve-field-value" type="tel" name="user_phonenumber"
                               maxlength="13" value="${memberDTO.user_phonenumber}" readonly>
                    </div>
                </div>
            </div>

            <!-- 모바일: 결제 요약 카드 (작은 화면에서 표시) -->
            <div class="reserve-card d-lg-none" style="margin-top:20px;">
                <div class="reserve-card-header">
                    <h3><i class="fas fa-receipt" style="margin-right:8px;"></i>결제 요약</h3>
                </div>
                <div class="reserve-card-body">
                    <div class="reserve-summary-item">
                        <span class="reserve-summary-label">숙소</span>
                        <span class="reserve-summary-value">${businessDTO.PEN_NAME}</span>
                    </div>
                    <div class="reserve-summary-item">
                        <span class="reserve-summary-label">객실</span>
                        <span class="reserve-summary-value">${businessDTO.RM_NAME} / ${days}박</span>
                    </div>
                    <div class="reserve-summary-item">
                        <span class="reserve-summary-label">체크인</span>
                        <span class="reserve-summary-value">${rm_checkin} ${businessDTO.RM_CHECKIN}</span>
                    </div>
                    <div class="reserve-summary-item">
                        <span class="reserve-summary-label">체크아웃</span>
                        <span class="reserve-summary-value">${rm_checkout} ${businessDTO.RM_CHECKOUT}</span>
                    </div>
                    <div class="reserve-total-price">
                        <span class="label">총 결제 금액 (VAT포함)</span>
                        <div class="amount">
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${total}"/>원
                        </div>
                    </div>
                    <ul class="reserve-notice">
                        <li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
                        <li>결제완료 후 예약자 이름으로 바로 체크인하시면 됩니다</li>
                    </ul>
                    <button class="reserve-pay-btn" onclick="iamport()">결 제 하 기</button>
                </div>
            </div>
        </div>

        <!-- 오른쪽: 예약 요약 + 결제 (데스크탑) -->
        <div class="reserve-right-panel d-none d-lg-block">
            <div class="reserve-card">
                <div class="reserve-card-header">
                    <h3><i class="fas fa-receipt" style="margin-right:8px;"></i>예약 요약</h3>
                </div>
                <div class="reserve-card-body">
                    <div class="reserve-summary-item">
                        <span class="reserve-summary-label">숙소명</span>
                        <span class="reserve-summary-value">${businessDTO.PEN_NAME}</span>
                    </div>
                    <div class="reserve-summary-item">
                        <span class="reserve-summary-label">객실</span>
                        <span class="reserve-summary-value">${businessDTO.RM_NAME} / ${days}박</span>
                    </div>
                    <div class="reserve-summary-item">
                        <span class="reserve-summary-label">체크인</span>
                        <span class="reserve-summary-value">${rm_checkin}<br><small style="color:#a0aec0;">${businessDTO.RM_CHECKIN}</small></span>
                    </div>
                    <div class="reserve-summary-item">
                        <span class="reserve-summary-label">체크아웃</span>
                        <span class="reserve-summary-value">${rm_checkout}<br><small style="color:#a0aec0;">${businessDTO.RM_CHECKOUT}</small></span>
                    </div>

                    <div class="reserve-total-price">
                        <span class="label">총 결제 금액 (VAT포함)</span>
                        <div class="amount">
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${total}"/>원
                        </div>
                    </div>

                    <ul class="reserve-notice">
                        <li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
                        <li>결제완료 후 예약자 이름으로 바로 체크인하시면 됩니다</li>
                    </ul>

                    <button class="reserve-pay-btn" onclick="iamport2()">결 제 하 기</button>
                </div>
            </div>
        </div>

    </div>
</main>

<%@ include file="../footer.jsp" %>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/slider/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

<script>
    var res_num = '${businessDTO.PEN_ID}' + '${param.room_id}' + '${uidRandom}';

    function iamport2() {
        var rsp = {
            success: true,
            merchant_uid: "RES_" + Date.now(),
            imp_uid: "IMP_" + Math.floor(Math.random() * 1000000),
            paid_amount: '${total}',
            status: "paid"
        };
        if (rsp.success) {
            showToast('결제가 완료되었습니다.', 'success');
            $.ajax({
                url: "insertReservation",
                type: "POST",
                async: false,
                data: {
                    'user_id'    : '${sessionScope.user_id}',
                    'user_type'  : '${sessionScope.user_type}',
                    'pen_id'     : '${businessDTO.PEN_ID}',
                    'room_id'    : '${param.room_id}',
                    'rm_name'    : '${businessDTO.RM_NAME}',
                    'check_in_d' : '${rm_checkin}',
                    'check_out_d': '${rm_checkout}',
                    'check_in_t' : '${businessDTO.RM_CHECKIN}',
                    'check_out_t': '${businessDTO.RM_CHECKOUT}',
                    'rm_price'   : '${total}',
                    'res_status' : '1'
                },
                dataType: "json",
                success: function(data) {
                    location.href = '${pageContext.request.contextPath}/member/mypage/listReservation';
                }
            });
        }
    }

    function iamport() {
        var amount = '${total}';
        IMP.init('imp84747824');
        IMP.request_pay({
            pg          : 'html5_inicis',
            pay_method  : 'card',
            merchant_uid: res_num,
            name        : '(주)부산온나 ' + '${businessDTO.PEN_NAME}' + '(${businessDTO.RM_NAME})',
            amount      : amount,
            buyer_email : '${user_id}',
            buyer_name  : '${sessionScope.user_name}',
            buyer_tel   : '${user.phone}',
            buyer_addr  : '${user.roadAddr}',
            buyer_postcode: '${user.zipNo}'
        }, function(rsp) {
            if (rsp.success) {
                showToast('결제가 완료되었습니다.', 'success');
                $.ajax({
                    url      : "insertReservation",
                    type     : "POST",
                    async    : false,
                    data     : {
                        'user_id'    : '${sessionScope.user_id}',
                        'user_type'  : '${sessionScope.user_type}',
                        'pen_id'     : '${businessDTO.PEN_ID}',
                        'room_id'    : '${param.room_id}',
                        'rm_name'    : '${businessDTO.RM_NAME}',
                        'check_in_d' : '${rm_checkin}',
                        'check_out_d': '${rm_checkout}',
                        'check_in_t' : '${businessDTO.RM_CHECKIN}',
                        'check_out_t': '${businessDTO.RM_CHECKOUT}',
                        'rm_price'   : '${total}',
                        'res_status' : '1'
                    },
                    dataType : "json",
                    success  : function(data) {
                        location.href = '${pageContext.request.contextPath}/member/mypage/listReservation';
                    }
                });
            } else {
                showToast(rsp.error_msg, 'error');
            }
        });
    }
</script>
</body>
</html>
