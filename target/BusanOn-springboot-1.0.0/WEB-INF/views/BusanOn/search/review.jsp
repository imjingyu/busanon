<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/fileupload/review.js"></script>

<style>
/* ===== 리뷰 탭 ===== */
.rv-summary {
    background: #fff; border-radius: 20px; border: 1px solid #e8edf2;
    padding: 32px; margin-bottom: 24px;
    display: flex; align-items: center; justify-content: space-between; gap: 24px;
    box-shadow: 0 2px 12px rgba(0,0,0,.06); flex-wrap: wrap;
}
.rv-score-left { display: flex; flex-direction: column; align-items: center; gap: 6px; }
.rv-big-score { font-size: 3.6rem; font-weight: 900; color: #1a2332; line-height: 1; }
.rv-stars-row { display: flex; gap: 4px; }
.rv-stars-row i { font-size: 1.3rem; color: #f59e0b; }
.rv-stars-row i.far { color: #e2e8f0; }
.rv-score-label { font-size: 0.82rem; color: #a0aec0; font-weight: 600; margin-top: 2px; }
.rv-stats { display: flex; gap: 32px; }
.rv-stat-item { display: flex; flex-direction: column; align-items: center; gap: 4px; }
.rv-stat-num { font-size: 1.8rem; font-weight: 800; color: #1a2332; }
.rv-stat-label { font-size: 0.78rem; color: #a0aec0; font-weight: 600; }
.rv-write-btn {
    background: linear-gradient(135deg, #38b2d8 0%, #2c9fc4 100%);
    color: #fff; border: none; border-radius: 12px; padding: 13px 26px;
    font-size: 0.95rem; font-family: 'Do Hyeon', sans-serif; cursor: pointer;
    display: flex; align-items: center; gap: 8px;
    box-shadow: 0 4px 14px rgba(56,178,216,.30); transition: all .2s; white-space: nowrap;
}
.rv-write-btn:hover { background: linear-gradient(135deg, #2c9fc4 0%, #247fa0 100%); transform: translateY(-1px); box-shadow: 0 6px 20px rgba(56,178,216,.40); }

/* 리뷰 작성 폼 */
.rv-form-wrap { background: #fff; border-radius: 16px; border: 1px solid #e8edf2; overflow: hidden; margin-bottom: 24px; box-shadow: 0 4px 24px rgba(0,0,0,.08); display: none; }
.rv-form-header { background: linear-gradient(135deg, #1a2332 0%, #2d4a6e 100%); padding: 18px 24px; display: flex; align-items: center; justify-content: space-between; }
.rv-form-title { display: flex; align-items: center; gap: 10px; color: #fff; font-size: 1rem; font-weight: 700; }
.rv-form-title i { color: #38b2d8; }
.rv-form-close { background: none; border: none; color: rgba(255,255,255,.6); font-size: 1.2rem; cursor: pointer; line-height: 1; padding: 0; transition: color .2s; }
.rv-form-close:hover { color: #fff; }
.rv-form-body { padding: 28px; }
.rv-label { font-size: 0.76rem; font-weight: 700; color: #2d4a6e; margin-bottom: 6px; display: block; text-transform: uppercase; letter-spacing: .04em; }
.rv-input { width: 100%; height: 46px; padding: 0 14px; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 0.9rem; outline: none; color: #1a2332; background: #f7fbff; font-family: inherit; transition: border-color .2s, box-shadow .2s; }
.rv-input:focus { border-color: #38b2d8; background: #fff; box-shadow: 0 0 0 3px rgba(56,178,216,.12); }
.rv-textarea { width: 100%; min-height: 110px; padding: 12px 14px; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 0.9rem; outline: none; resize: vertical; color: #1a2332; background: #f7fbff; line-height: 1.6; font-family: inherit; transition: border-color .2s, box-shadow .2s; }
.rv-textarea:focus { border-color: #38b2d8; background: #fff; box-shadow: 0 0 0 3px rgba(56,178,216,.12); }
.rv-star-section { text-align: center; margin-bottom: 22px; padding: 20px; background: #f7f9fc; border-radius: 12px; }
.rv-star-hint { font-size: 0.82rem; color: #718096; margin-bottom: 12px; font-weight: 600; }
.rv-star-input { display: inline-flex; flex-direction: row-reverse; gap: 6px; }
.rv-star-input i { font-size: 2.4rem; color: #e2e8f0; cursor: pointer; transition: color .15s; user-select: none; }
.rv-star-label { font-size: 0.9rem; color: #4a5568; margin-top: 8px; font-weight: 700; }
.rv-field-row { display: grid; grid-template-columns: 1fr 100px; gap: 12px; margin-bottom: 16px; }
.rv-field-col { margin-bottom: 16px; }
.rv-attach-label { display: inline-flex; align-items: center; gap: 6px; padding: 9px 18px; background: #f0f4f8; border-radius: 8px; cursor: pointer; font-size: 0.85rem; color: #2d4a6e; font-weight: 600; border: 1.5px dashed #a0aec0; transition: all .2s; }
.rv-attach-label:hover { border-color: #38b2d8; color: #38b2d8; background: #f0f8ff; }
.rv-btn-row { display: flex; gap: 10px; margin-top: 20px; }
.rv-submit-btn { flex: 1; height: 48px; border: none; border-radius: 10px; background: linear-gradient(135deg, #38b2d8 0%, #2c9fc4 100%); color: #fff; font-size: 1.1rem; font-family: 'Do Hyeon', sans-serif; cursor: pointer; box-shadow: 0 4px 14px rgba(56,178,216,.30); transition: all .2s; }
.rv-submit-btn:hover { background: linear-gradient(135deg, #2c9fc4 0%, #247fa0 100%); }
.rv-cancel-btn { width: 80px; height: 48px; border: 1.5px solid #e2e8f0; border-radius: 10px; background: #fff; color: #718096; font-size: 0.9rem; cursor: pointer; transition: all .2s; }
.rv-cancel-btn:hover { border-color: #a0aec0; }

/* 리뷰 카드 */
.rv-card { background: #fff; border-radius: 16px; border: 1px solid #e8edf2; padding: 24px; margin-bottom: 14px; box-shadow: 0 2px 8px rgba(0,0,0,.04); transition: box-shadow .2s; }
.rv-card:hover { box-shadow: 0 6px 20px rgba(0,0,0,.08); }
.rv-card-header { display: flex; align-items: flex-start; justify-content: space-between; gap: 12px; margin-bottom: 14px; }
.rv-user-row { display: flex; align-items: center; gap: 12px; }
.rv-avatar { width: 44px; height: 44px; border-radius: 50%; background: linear-gradient(135deg, #ebf8ff, #bee3f8); display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.rv-avatar i { color: #38b2d8; font-size: 1.1rem; }
.rv-user-name { font-size: 0.95rem; font-weight: 700; color: #1a2332; margin: 0; }
.rv-user-meta { font-size: 0.78rem; color: #a0aec0; margin: 2px 0 0; }
.rv-card-stars { display: flex; gap: 3px; }
.rv-card-stars i { font-size: 0.92rem; color: #f59e0b; }
.rv-card-stars i.far { color: #e2e8f0; }
.rv-title { font-size: 1rem; font-weight: 700; color: #1a2332; margin: 0 0 8px; }
.rv-content { font-size: 0.9rem; color: #4a5568; line-height: 1.75; margin: 0 0 12px; }
.rv-img-row { display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 12px; }
.rv-img-row img { width: 90px; height: 70px; object-fit: cover; border-radius: 8px; cursor: pointer; transition: opacity .2s, transform .2s; }
.rv-img-row img:hover { opacity: .85; transform: scale(1.04); }
.rv-date { font-size: 0.76rem; color: #a0aec0; display: block; }

/* 사장님 답변 */
.rv-reply { background: #fffbeb; border-radius: 12px; border: 1px solid #fef3c7; padding: 16px 18px; margin-top: 14px; display: flex; gap: 12px; align-items: flex-start; }
.rv-reply-avatar { width: 36px; height: 36px; border-radius: 50%; background: #fef9c3; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.rv-reply-avatar i { color: #d69e2e; font-size: 0.9rem; }
.rv-reply-body { flex: 1; min-width: 0; }
.rv-reply-label { font-size: 0.78rem; font-weight: 700; color: #b7791f; margin: 0 0 5px; }
.rv-reply-txt { font-size: 0.88rem; color: #4a5568; line-height: 1.65; margin: 0 0 5px; }
.rv-reply-date { font-size: 0.73rem; color: #a0aec0; }

/* 더보기 버튼 */
.rv-more-btn { display: block; width: 100%; padding: 14px; background: #fff; border: 1.5px solid #e2e8f0; border-radius: 12px; color: #718096; font-size: 0.95rem; font-family: 'Do Hyeon', sans-serif; cursor: pointer; text-align: center; transition: all .2s; margin-top: 8px; }
.rv-more-btn:hover { border-color: #38b2d8; color: #38b2d8; background: #f0f8ff; }

/* 로그인 유도 */
.rv-login-notice { text-align: center; padding: 24px; background: #f7f9fc; border-radius: 12px; border: 1.5px dashed #e2e8f0; margin-bottom: 20px; color: #718096; font-size: 0.9rem; }
.rv-login-notice i { display: block; font-size: 1.4rem; color: #a0aec0; margin-bottom: 8px; }
.rv-login-notice a { color: #38b2d8; font-weight: 700; text-decoration: none; }
.rv-login-notice a:hover { text-decoration: underline; }

/* 빈 리뷰 */
.rv-empty { text-align: center; padding: 48px 24px; color: #a0aec0; }
.rv-empty i { font-size: 2.5rem; display: block; margin-bottom: 12px; }
</style>

<article id="review" class="review on">

    <!-- 리뷰 요약 -->
    <div class="rv-summary">
        <div class="rv-score-left">
            <div class="rv-big-score">
                <c:choose>
                    <c:when test="${fn:length(avg.AVG.toString()) == 0}">5.0</c:when>
                    <c:otherwise>${avg.AVG}</c:otherwise>
                </c:choose>
            </div>
            <div class="rv-stars-row">
                <c:choose>
                    <c:when test="${fn:length(avg.AVG.toString()) == 0}">
                        <c:forEach var="i" begin="1" end="5"><i class="fas fa-star"></i></c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="i" begin="1" end="5">
                            <c:choose>
                                <c:when test="${i <= avg.AVG}"><i class="fas fa-star"></i></c:when>
                                <c:otherwise><i class="far fa-star"></i></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
            <span class="rv-score-label">종합 만족도</span>
        </div>
        <div class="rv-stats">
            <div class="rv-stat-item">
                <span class="rv-stat-num">${avg.R_COUNT}</span>
                <span class="rv-stat-label">전체 리뷰</span>
            </div>
            <div class="rv-stat-item">
                <span class="rv-stat-num">${avg.A_COUNT}</span>
                <span class="rv-stat-label">사장님 답변</span>
            </div>
        </div>
        <c:if test="${sessionScope.user_id != null}">
            <button type="button" class="rv-write-btn" id="replyEvent">
                <i class="fas fa-pen"></i> 이용후기 남기기
            </button>
        </c:if>
    </div>

    <!-- 로그인 유도 -->
    <c:if test="${sessionScope.user_id == null}">
        <div class="rv-login-notice">
            <i class="fas fa-lock"></i>
            <a href="${pageContext.request.contextPath}/member/login">로그인</a> 후 이용후기를 남길 수 있습니다.
        </div>
    </c:if>

    <!-- 리뷰 작성 폼 -->
    <div id="replyForm" class="rv-form-wrap">
        <div class="rv-form-header">
            <div class="rv-form-title"><i class="fas fa-pen"></i> 이용 후기 작성</div>
            <button type="button" class="rv-form-close" onclick="$('#replyForm').slideUp()">✕</button>
        </div>
        <div class="rv-form-body">
            <form action="reviewPro?pen_name=${param.pen_name}&rm_checkin=${param.rm_checkin}&rm_checkout=${param.rm_checkout}" method="post" onsubmit="return fileupload()">
                <input type="hidden" id="pen_id" name="pen_id" value="${param.pen_id}">
                <input type="hidden" id="user_id" name="user_id" value="${sessionScope.user_id}">
                <input type="hidden" id="user_type" name="user_type" value="${sessionScope.user_type}">
                <input type="hidden" id="reply" name="reply" value="N">
                <input type="hidden" id="rev_star" name="rev_star" value="5">

                <!-- 별점 -->
                <div class="rv-star-section">
                    <div class="rv-star-hint">별점을 선택해주세요</div>
                    <div class="rv-star-input">
                        <i class="fa fa-star review-star" data-val="5"></i>
                        <i class="fa fa-star review-star" data-val="4"></i>
                        <i class="fa fa-star review-star" data-val="3"></i>
                        <i class="fa fa-star review-star" data-val="2"></i>
                        <i class="fa fa-star review-star" data-val="1"></i>
                    </div>
                    <div class="rv-star-label" id="starLabel">5점</div>
                </div>

                <!-- 제목 & 작성자 -->
                <div class="rv-field-row">
                    <div>
                        <label class="rv-label">제목</label>
                        <input type="text" id="rev_title" name="rev_title" class="rv-input" placeholder="리뷰 제목을 입력해주세요.">
                    </div>
                    <div>
                        <label class="rv-label">작성자</label>
                        <input type="text" id="user_name" name="user_name" class="rv-input" readonly value="${sessionScope.user_name}" style="color:#718096;background:#f0f4f8;">
                    </div>
                </div>

                <!-- 내용 -->
                <div class="rv-field-col">
                    <label class="rv-label">내용</label>
                    <textarea id="rev_content" name="rev_content" class="rv-textarea" placeholder="솔직한 리뷰를 남겨주세요."></textarea>
                </div>

                <!-- 사진 첨부 -->
                <div class="uploadDiv rv-field-col">
                    <label for="attach" class="rv-attach-label">
                        <i class="fas fa-paperclip"></i> 사진 첨부
                    </label>
                    <input type="file" class="form-control d-none" id="attach" name="attach" multiple>
                </div>
                <ul class="list-group small upload-files" id="fileList1" style="margin-bottom:10px;"></ul>
                <div class="row thumbs" style="margin:0 0 14px 0;"></div>

                <div class="rv-btn-row">
                    <button type="submit" id="btnReg" class="rv-submit-btn">작 성</button>
                    <button type="button" class="rv-cancel-btn" onclick="$('#replyForm').slideUp()">닫기</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 리뷰 목록 -->
    <div id="chat">
        <c:choose>
            <c:when test="${empty List}">
                <div class="rv-empty">
                    <i class="fas fa-comment-slash"></i>
                    아직 등록된 리뷰가 없습니다.
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${List}" var="review">
                <div class="rv-card">
                    <div class="rv-card-header">
                        <div class="rv-user-row">
                            <div class="rv-avatar"><i class="fas fa-user"></i></div>
                            <div>
                                <p class="rv-user-name">${review.user_name}</p>
                                <p class="rv-user-meta">펜션 이용</p>
                            </div>
                        </div>
                        <div class="rv-card-stars">
                            <c:forEach var="i" begin="1" end="5">
                                <c:choose>
                                    <c:when test="${i <= review.rev_star}"><i class="fas fa-star"></i></c:when>
                                    <c:otherwise><i class="far fa-star"></i></c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </div>
                    <h4 class="rv-title">${review.rev_title}</h4>
                    <p class="rv-content">${review.rev_content}</p>
                    <c:if test="${review.image != null}">
                        <div class="rv-img-row">
                            <c:set var="limage" value="${fn:split(review.image,',')}"/>
                            <c:forEach items="${limage}" var="item">
                                <img src="${pageContext.request.contextPath}/review_upload/${item}" alt="리뷰 이미지" onclick="window.open(this.src)">
                            </c:forEach>
                        </div>
                    </c:if>
                    <span class="rv-date">${review.rev_date}</span>
                    <c:if test="${review.reply == 'Y'}">
                        <div class="rv-reply">
                            <div class="rv-reply-avatar"><i class="fas fa-store"></i></div>
                            <div class="rv-reply-body">
                                <p class="rv-reply-label">사장님 답변</p>
                                <p class="rv-reply-txt">${review.ans_content}</p>
                                <span class="rv-reply-date">${review.ans_date}</span>
                            </div>
                        </div>
                    </c:if>
                </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <button class="rv-more-btn" id="more_btn" onclick="moreReview()">
        <i class="fas fa-chevron-down" style="margin-right:6px;"></i>더보기
    </button>

</article>

<script>
(function(){
    var stars = document.querySelectorAll('.review-star');
    var hidden = document.getElementById('rev_star');
    var label = document.getElementById('starLabel');
    if (!stars.length) return;
    updateStars(5);
    stars.forEach(function(s) {
        s.addEventListener('click', function() {
            var val = parseInt(this.getAttribute('data-val'));
            hidden.value = val;
            label.textContent = val + '점';
            updateStars(val);
        });
        s.addEventListener('mouseenter', function() {
            highlightStars(parseInt(this.getAttribute('data-val')));
        });
    });
    document.querySelector('.rv-star-input').addEventListener('mouseleave', function() {
        updateStars(parseInt(hidden.value));
    });
    function updateStars(val) {
        stars.forEach(function(s) {
            s.style.color = parseInt(s.getAttribute('data-val')) <= val ? '#f59e0b' : '#e2e8f0';
        });
    }
    function highlightStars(val) {
        stars.forEach(function(s) {
            s.style.color = parseInt(s.getAttribute('data-val')) <= val ? '#f59e0b' : '#e2e8f0';
        });
    }
})();
</script>

<script type="text/javascript">
var index = 0;
var check = true;
var ctx = '${pageContext.request.contextPath}';

function buildReviewCard(review) {
    var stars = '';
    for (var i = 1; i <= 5; i++) {
        stars += i <= review.rev_star
            ? '<i class="fas fa-star"></i>'
            : '<i class="far fa-star"></i>';
    }
    var imgs = '';
    if (review.image) {
        var imgArr = review.image.split(',');
        for (var j = 0; j < imgArr.length; j++) {
            imgs += '<img src="' + ctx + '/review_upload/' + imgArr[j] + '" alt="리뷰 이미지"'
                + ' onclick="window.open(this.src)"'
                + ' style="width:90px;height:70px;object-fit:cover;border-radius:8px;cursor:pointer;">';
        }
        imgs = '<div class="rv-img-row">' + imgs + '</div>';
    }
    var reply = '';
    if (review.reply === 'Y') {
        reply = '<div class="rv-reply">'
            + '<div class="rv-reply-avatar"><i class="fas fa-store"></i></div>'
            + '<div class="rv-reply-body">'
            + '<p class="rv-reply-label">사장님 답변</p>'
            + '<p class="rv-reply-txt">' + review.ans_content + '</p>'
            + '<span class="rv-reply-date">' + review.ans_date + '</span>'
            + '</div></div>';
    }
    return '<div class="rv-card">'
        + '<div class="rv-card-header">'
        +   '<div class="rv-user-row">'
        +     '<div class="rv-avatar"><i class="fas fa-user"></i></div>'
        +     '<div><p class="rv-user-name">' + review.user_name + '</p><p class="rv-user-meta">펜션 이용</p></div>'
        +   '</div>'
        +   '<div class="rv-card-stars">' + stars + '</div>'
        + '</div>'
        + '<h4 class="rv-title">' + review.rev_title + '</h4>'
        + '<p class="rv-content">' + review.rev_content + '</p>'
        + imgs
        + '<span class="rv-date">' + review.rev_date + '</span>'
        + reply
        + '</div>';
}

function moreReview() {
    if (!check) return;
    index += 1;
    check = false;
    $.ajax({
        url: 'reviewajax',
        type: 'get',
        data: { amount: 1, index: index, pen_id: '${param.pen_id}' },
        success: function(data) {
            if (data.length == 0) {
                showToast('마지막 리뷰입니다.', 'info');
                index -= 1;
                check = true;
                return;
            }
            $.each(data, function(i, review) {
                $('#chat').append(buildReviewCard(review));
            });
            check = true;
        }
    });
}
</script>
