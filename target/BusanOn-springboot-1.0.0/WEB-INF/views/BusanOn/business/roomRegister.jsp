<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="b_head.jsp"/>
    <title>부산온나 : 숙소등록</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/daum_address_api.js"></script>
    <style>
    /* ===== 숙소등록 페이지 ===== */
    .rr-wrap { max-width: 860px; margin: 0 auto; padding: 32px 20px 60px; }
    .rr-page-title {
        font-size: 1.6rem; font-weight: 800; color: #1a2332;
        margin: 0 0 28px; display: flex; align-items: center; gap: 10px;
    }
    .rr-page-title i { color: #38b2d8; font-size: 1.4rem; }

    /* 섹션 카드 */
    .rr-card {
        background: #fff; border-radius: 16px; border: 1px solid #e8edf2;
        box-shadow: 0 2px 12px rgba(0,0,0,.06); margin-bottom: 20px; overflow: hidden;
    }
    .rr-card-header {
        background: linear-gradient(135deg, #1a2332 0%, #2d4a6e 100%);
        padding: 16px 24px; display: flex; align-items: center; gap: 10px;
    }
    .rr-card-header i { color: #38b2d8; font-size: 1rem; }
    .rr-card-title { color: #fff; font-size: 0.95rem; font-weight: 700; margin: 0; }
    .rr-card-body { padding: 24px 28px; }

    /* 입력 필드 */
    .rr-label {
        font-size: 0.76rem; font-weight: 700; color: #2d4a6e;
        margin-bottom: 6px; display: block; text-transform: uppercase; letter-spacing: .04em;
    }
    .rr-input {
        width: 100%; height: 46px; padding: 0 14px;
        border: 1.5px solid #e2e8f0; border-radius: 10px;
        font-size: 0.9rem; outline: none; color: #1a2332; background: #f7fbff;
        font-family: inherit; transition: border-color .2s, box-shadow .2s;
    }
    .rr-input:focus { border-color: #38b2d8; background: #fff; box-shadow: 0 0 0 3px rgba(56,178,216,.12); }
    .rr-input[readonly] { background: #f0f4f8; color: #718096; cursor: default; }
    .rr-textarea {
        width: 100%; min-height: 120px; padding: 12px 14px;
        border: 1.5px solid #e2e8f0; border-radius: 10px;
        font-size: 0.9rem; outline: none; resize: vertical;
        color: #1a2332; background: #f7fbff; line-height: 1.65;
        font-family: inherit; transition: border-color .2s, box-shadow .2s;
    }
    .rr-textarea:focus { border-color: #38b2d8; background: #fff; box-shadow: 0 0 0 3px rgba(56,178,216,.12); }
    .rr-field { margin-bottom: 18px; }
    .rr-field:last-child { margin-bottom: 0; }
    .rr-row { display: grid; gap: 14px; }
    .rr-row-2 { grid-template-columns: 1fr 1fr; }
    .rr-row-3 { grid-template-columns: 1fr 1fr 1fr; }

    /* 주소 버튼 */
    .rr-addr-btn {
        height: 46px; padding: 0 18px; background: #38b2d8; color: #fff;
        border: none; border-radius: 10px; font-size: 0.88rem; font-family: 'Do Hyeon', sans-serif;
        cursor: pointer; white-space: nowrap; transition: background .2s;
    }
    .rr-addr-btn:hover { background: #2c9fc4; }
    .rr-addr-row { display: flex; gap: 10px; align-items: flex-end; }
    .rr-addr-row .rr-field { flex: 0 0 180px; }

    /* 이미지 업로드 */
    .rr-img-upload { display: flex; align-items: center; gap: 14px; flex-wrap: wrap; }
    .rr-img-label {
        display: inline-flex; align-items: center; gap: 7px;
        padding: 10px 20px; background: #f0f4f8; border: 1.5px dashed #a0aec0;
        border-radius: 10px; cursor: pointer; font-size: 0.88rem; color: #2d4a6e;
        font-weight: 600; transition: all .2s; white-space: nowrap;
    }
    .rr-img-label:hover { border-color: #38b2d8; color: #38b2d8; background: #f0f8ff; }
    .rr-img-preview { width: 90px; height: 70px; object-fit: cover; border-radius: 8px; display: none; border: 1px solid #e2e8f0; }
    .rr-img-name { font-size: 0.82rem; color: #718096; }

    /* 객실 카드 */
    .room-section { margin-bottom: 16px; }
    .room-entry {
        background: #fff; border-radius: 14px; border: 1.5px solid #e2e8f0;
        overflow: hidden; transition: border-color .2s;
    }
    .room-entry:hover { border-color: #38b2d8; }
    .room-entry-header {
        background: #f7f9fc; padding: 14px 20px;
        display: flex; align-items: center; justify-content: space-between;
        cursor: pointer; user-select: none;
    }
    .room-entry-title {
        display: flex; align-items: center; gap: 8px;
        font-size: 0.92rem; font-weight: 700; color: #1a2332;
    }
    .room-entry-title i { color: #38b2d8; }
    .room-entry-actions { display: flex; align-items: center; gap: 8px; }
    .room-toggle-btn {
        background: none; border: none; color: #718096; font-size: 1rem;
        cursor: pointer; padding: 2px 6px; transition: color .2s;
    }
    .room-toggle-btn:hover { color: #38b2d8; }
    .room-delete-btn {
        background: none; border: 1px solid #fed7d7; color: #e53e3e;
        border-radius: 6px; font-size: 0.78rem; padding: 4px 10px; cursor: pointer;
        transition: all .2s;
    }
    .room-delete-btn:hover { background: #fff5f5; }
    .room-entry-body { padding: 20px 24px; border-top: 1px solid #e8edf2; }

    /* 객실 추가 버튼 */
    .rr-add-room-btn {
        width: 100%; padding: 14px; background: #fff;
        border: 2px dashed #38b2d8; border-radius: 12px;
        color: #38b2d8; font-size: 0.95rem; font-family: 'Do Hyeon', sans-serif;
        cursor: pointer; display: flex; align-items: center; justify-content: center;
        gap: 8px; transition: all .2s; margin-top: 4px;
    }
    .rr-add-room-btn:hover { background: #f0f8ff; border-color: #2c9fc4; }

    /* 등록 버튼 */
    .rr-submit-btn {
        width: 100%; height: 56px; border: none; border-radius: 14px;
        background: linear-gradient(135deg, #38b2d8 0%, #2c9fc4 100%);
        color: #fff; font-size: 1.2rem; font-family: 'Do Hyeon', sans-serif;
        cursor: pointer; box-shadow: 0 4px 18px rgba(56,178,216,.35);
        transition: all .2s; display: flex; align-items: center; justify-content: center; gap: 10px;
    }
    .rr-submit-btn:hover { background: linear-gradient(135deg, #2c9fc4 0%, #247fa0 100%); transform: translateY(-1px); box-shadow: 0 6px 24px rgba(56,178,216,.45); }

    @media (max-width: 640px) {
        .rr-row-2, .rr-row-3 { grid-template-columns: 1fr; }
        .rr-card-body { padding: 18px 16px; }
    }
    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <jsp:include page="b_sidebar.jsp"/>
    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <jsp:include page="b_nav.jsp"/>

            <div class="rr-wrap">
                <h1 class="rr-page-title"><i class="fas fa-home"></i> 숙소 등록</h1>

                <form method="post" action="${pageContext.request.contextPath}/business/roomRegisterPro" enctype="multipart/form-data">

                    <!-- 1. 기본 정보 -->
                    <div class="rr-card">
                        <div class="rr-card-header">
                            <i class="fas fa-info-circle"></i>
                            <h2 class="rr-card-title">기본 정보</h2>
                        </div>
                        <div class="rr-card-body">
                            <div class="rr-field">
                                <label class="rr-label">숙소 고유번호</label>
                                <input type="text" class="rr-input" name="PEN_ID" value="${pen_id}" readonly>
                            </div>
                            <div class="rr-row rr-row-2">
                                <div class="rr-field">
                                    <label class="rr-label">숙소 이름</label>
                                    <input type="text" class="rr-input" name="PEN_NAME" placeholder="숙소 이름을 입력하세요" required>
                                </div>
                                <div class="rr-field">
                                    <label class="rr-label">전화번호</label>
                                    <input type="text" class="rr-input" name="PEN_TEL" placeholder="010-0000-0000" required>
                                </div>
                            </div>
                            <div class="rr-field">
                                <label class="rr-label">주소</label>
                                <div class="rr-addr-row" style="margin-bottom:10px;">
                                    <div class="rr-field" style="margin:0;">
                                        <input type="text" class="rr-input" id="postNum" name="postNum" placeholder="우편번호" readonly>
                                    </div>
                                    <button type="button" class="rr-addr-btn" onclick="addressSearch()">
                                        <i class="fas fa-search"></i> 주소 검색
                                    </button>
                                </div>
                                <input type="text" class="rr-input" id="user_address" name="user_address" placeholder="기본 주소 (검색 버튼 클릭)" readonly style="margin-bottom:10px;">
                                <input type="text" class="rr-input" id="user_address2" name="user_address2" placeholder="상세 주소를 입력하세요" required>
                            </div>
                        </div>
                    </div>

                    <!-- 2. 숙소 소개 -->
                    <div class="rr-card">
                        <div class="rr-card-header">
                            <i class="fas fa-quote-left"></i>
                            <h2 class="rr-card-title">숙소 소개</h2>
                        </div>
                        <div class="rr-card-body">
                            <div class="rr-field">
                                <label class="rr-label">숙소 소개글</label>
                                <textarea class="rr-textarea" name="PEN_INTRODUCE"
                                    placeholder="숙소를 소개하는 글을 입력해주세요. 주변 환경, 편의시설, 특징 등을 자유롭게 작성하세요."></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- 3. 대표 이미지 -->
                    <div class="rr-card">
                        <div class="rr-card-header">
                            <i class="fas fa-image"></i>
                            <h2 class="rr-card-title">대표 이미지</h2>
                        </div>
                        <div class="rr-card-body">
                            <div class="rr-img-upload">
                                <label for="attach" class="rr-img-label">
                                    <i class="fas fa-cloud-upload-alt"></i> 이미지 선택
                                </label>
                                <input type="file" id="attach" name="PEN_IMAGE" class="d-none" accept="image/*" required onchange="setPenThumbnail(event)">
                                <img id="penPreview" class="rr-img-preview" alt="미리보기">
                                <span class="rr-img-name" id="penImgName">선택된 파일 없음</span>
                            </div>
                        </div>
                    </div>

                    <!-- 4. 객실 세부정보 -->
                    <div class="rr-card">
                        <div class="rr-card-header">
                            <i class="fas fa-door-open"></i>
                            <h2 class="rr-card-title">객실 세부정보</h2>
                        </div>
                        <div class="rr-card-body">
                            <div id="roomInfoadd" class="room-section"></div>
                            <button type="button" class="rr-add-room-btn" onclick="roomInfoAdd()">
                                <i class="fas fa-plus-circle"></i> 객실 추가
                            </button>
                        </div>
                    </div>

                    <!-- 등록 버튼 -->
                    <button type="submit" class="rr-submit-btn">
                        <i class="fas fa-check-circle"></i> 숙소 등록하기
                    </button>

                </form>
            </div>
        </div>
        <!-- End of Main Content -->
        <jsp:include page="b_footer.jsp"/>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/resources/assets/admin/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/admin/js/sb-admin-2.min.js"></script>

<script>
var cnt = 0;

function roomInfoAdd() {
    var n = cnt;
    var html = '<div id="rme_' + n + '" class="room-entry" style="margin-bottom:12px;">'
        + '<div class="room-entry-header" onclick="toggleRoom(' + n + ')">'
        +   '<div class="room-entry-title"><i class="fas fa-bed"></i> <span id="rme_title_' + n + '">객실 ' + (n + 1) + '</span></div>'
        +   '<div class="room-entry-actions">'
        +     '<button type="button" class="room-toggle-btn" id="rme_arrow_' + n + '"><i class="fas fa-chevron-up"></i></button>'
        +     '<button type="button" class="room-delete-btn" onclick="event.stopPropagation();deleteRoom(' + n + ')"><i class="fas fa-trash-alt"></i> 삭제</button>'
        +   '</div>'
        + '</div>'
        + '<div class="room-entry-body" id="rme_body_' + n + '">'
        +   '<div style="margin-bottom:16px;">'
        +     '<label class="rr-label">객실 이름</label>'
        +     '<input type="text" class="rr-input" name="RM_NAME" placeholder="객실 이름을 입력하세요" required oninput="updateRoomTitle(' + n + ', this.value)">'
        +   '</div>'
        +   '<div class="rr-row rr-row-3" style="margin-bottom:16px;">'
        +     '<div><label class="rr-label"><i class="fas fa-sign-in-alt"></i> 체크인</label>'
        +       '<input type="time" class="rr-input" name="checkin" required></div>'
        +     '<div><label class="rr-label"><i class="fas fa-sign-out-alt"></i> 체크아웃</label>'
        +       '<input type="time" class="rr-input" name="checkout" required></div>'
        +     '<div><label class="rr-label"><i class="fas fa-users"></i> 최대 인원</label>'
        +       '<input type="number" class="rr-input" name="people" min="1" placeholder="명" required></div>'
        +   '</div>'
        +   '<div style="margin-bottom:16px;">'
        +     '<label class="rr-label"><i class="fas fa-won-sign"></i> 1박 가격 (원)</label>'
        +     '<input type="number" class="rr-input" name="RM_Price" min="0" placeholder="예: 150000" required>'
        +   '</div>'
        +   '<div>'
        +     '<label class="rr-label"><i class="fas fa-image"></i> 객실 대표 이미지</label>'
        +     '<div class="rr-img-upload">'
        +       '<label class="rr-img-label">'
        +         '<i class="fas fa-cloud-upload-alt"></i> 이미지 선택'
        +         '<input type="file" name="RM_IMAGE" class="d-none" accept="image/*" required onchange="setRoomPreview(event, ' + n + ')">'
        +       '</label>'
        +       '<img id="rme_img_' + n + '" class="rr-img-preview" alt="미리보기">'
        +       '<span class="rr-img-name" id="rme_imgname_' + n + '">선택된 파일 없음</span>'
        +     '</div>'
        +   '</div>'
        + '</div>'
        + '</div>';
    $('#roomInfoadd').append(html);
    cnt++;
}

function toggleRoom(n) {
    var body = $('#rme_body_' + n);
    var arrow = $('#rme_arrow_' + n + ' i');
    if (body.is(':visible')) {
        body.slideUp(200);
        arrow.removeClass('fa-chevron-up').addClass('fa-chevron-down');
    } else {
        body.slideDown(200);
        arrow.removeClass('fa-chevron-down').addClass('fa-chevron-up');
    }
}

function deleteRoom(n) {
    if ($('#roomInfoadd').children().length <= 1) {
        alert('최소 1개 이상의 객실 정보가 필요합니다.');
        return;
    }
    $('#rme_' + n).remove();
}

function updateRoomTitle(n, val) {
    $('#rme_title_' + n).text(val || ('객실 ' + (n + 1)));
}

function setRoomPreview(event, n) {
    var file = event.target.files[0];
    if (!file) return;
    $('#rme_imgname_' + n).text(file.name);
    var reader = new FileReader();
    reader.onload = function(e) {
        $('#rme_img_' + n).attr('src', e.target.result).show();
    };
    reader.readAsDataURL(file);
}

function setPenThumbnail(event) {
    var file = event.target.files[0];
    if (!file || !file.type.match('image/.*')) { alert('이미지 파일만 업로드 가능합니다.'); return; }
    document.getElementById('penImgName').textContent = file.name;
    var reader = new FileReader();
    reader.onload = function(e) {
        var img = document.getElementById('penPreview');
        img.src = e.target.result;
        img.style.display = 'block';
    };
    reader.readAsDataURL(file);
}

$(document).ready(function() {
    roomInfoAdd(); // 기본 1개 추가
});
</script>
</body>
</html>
