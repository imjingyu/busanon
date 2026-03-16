<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로그인 | 부산온나</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/loginajax.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <style>
        * { box-sizing: border-box; }
        body {
            background: linear-gradient(135deg, #e8f4fd 0%, #d1eaf8 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Noto Sans KR', sans-serif;
            padding: 40px 16px;
        }
        .login-wrap {
            width: 100%;
            max-width: 420px;
        }
        /* 로고 */
        .login-logo {
            text-align: center;
            margin-bottom: 28px;
            text-decoration: none;
            display: block;
        }
        .login-logo .logo-text {
            display: block;
            font-family: 'Do Hyeon', sans-serif;
            font-size: 36px;
            color: #38b2d8;
            line-height: 1;
            letter-spacing: 2px;
        }
        .login-logo .logo-sub {
            display: block;
            font-size: 11px;
            color: #718096;
            letter-spacing: 4px;
            margin-top: 3px;
        }
        /* 카드 */
        .login-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 12px 40px rgba(56,178,216,.15);
            overflow: hidden;
        }
        /* 탭 */
        .login-tabs {
            display: flex;
            border-bottom: 1px solid #e2e8f0;
        }
        .login-tab-btn {
            flex: 1;
            padding: 15px 10px;
            background: none;
            border: none;
            font-size: 15px;
            font-weight: 600;
            color: #a0aec0;
            cursor: pointer;
            border-bottom: 3px solid transparent;
            transition: all 0.2s;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .login-tab-btn.active {
            color: #38b2d8;
            border-bottom-color: #38b2d8;
        }
        /* 탭 패널 */
        .login-panel {
            display: none;
            padding: 28px 32px 32px;
        }
        .login-panel.active { display: block; }
        /* 소셜 로그인 */
        .social-login { margin-bottom: 18px; }
        .social-login img { display: block; width: 100%; height: 48px; object-fit: cover; border-radius: 10px; margin-bottom: 10px; }
        /* 구분선 */
        .divider {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #a0aec0;
            font-size: 13px;
            margin: 16px 0;
        }
        .divider::before, .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: #e2e8f0;
        }
        /* 폼 필드 */
        .login-field {
            margin-bottom: 14px;
        }
        .login-field input {
            width: 100%;
            height: 52px;
            padding: 0 16px;
            border: 1.5px solid #e2e8f0;
            border-radius: 12px;
            font-size: 15px;
            color: #1a2332;
            background: #f7fbff;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .login-field input:focus {
            border-color: #38b2d8;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(56,178,216,.12);
        }
        .login-field input::placeholder { color: #a0aec0; }
        /* 로그인 버튼 */
        .login-btn {
            width: 100%;
            height: 52px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #38b2d8 0%, #2c9fc4 100%);
            color: #fff;
            font-size: 20px;
            font-family: 'Do Hyeon', sans-serif;
            cursor: pointer;
            margin-top: 6px;
            box-shadow: 0 6px 20px rgba(56,178,216,.30);
            transition: background 0.2s, box-shadow 0.2s;
        }
        .login-btn:hover {
            background: linear-gradient(135deg, #2c9fc4 0%, #1e8fb0 100%);
            box-shadow: 0 8px 24px rgba(56,178,216,.40);
        }
        /* 링크 */
        .login-links {
            display: flex;
            justify-content: space-between;
            margin-top: 14px;
        }
        .login-links a {
            font-size: 13px;
            color: #718096;
            text-decoration: none;
        }
        .login-links a:hover { color: #38b2d8; }
        /* 홈 링크 */
        .back-home {
            text-align: center;
            margin-top: 20px;
        }
        .back-home a {
            font-size: 13px;
            color: #718096;
            text-decoration: none;
        }
        .back-home a:hover { color: #38b2d8; }
    </style>
</head>
<body>
<div class="login-wrap">
    <a class="login-logo" href="${pageContext.request.contextPath}/search/main">
        <span class="logo-text">부산온나</span>
        <span class="logo-sub">BUSAN ONNA</span>
    </a>

    <div class="login-card">
        <div class="login-tabs">
            <button class="login-tab-btn active" onclick="switchTab('member')">고객</button>
            <button class="login-tab-btn" onclick="switchTab('business')">사업자</button>
            <button class="login-tab-btn" onclick="switchTab('admin')">관리자</button>
        </div>

        <!-- 고객 로그인 -->
        <div class="login-panel active" id="tab-member">
            <div class="social-login">
                <div id="naver_id_login_div">
                    <script src="${pageContext.request.contextPath}/resources/js/apilogin/naver_login.js"></script>
                </div>
                <a href="https://kauth.kakao.com/oauth/authorize?client_id=47791105334d48d9d0b4bf1ca0cea8ba&redirect_uri=http://BusanOn14.cafe24.com/BusanOn/apilogin/kakao_login&response_type=code">
                    <img src="${pageContext.request.contextPath}/resources/images/kakao_login_medium_wide.png" alt="카카오 로그인">
                </a>
            </div>
            <div class="divider">또는</div>
            <form action="loginPro" method="get">
                <div class="login-field">
                    <input type="email" name="user_id" id="user_id" required placeholder="이메일 주소">
                </div>
                <div class="login-field">
                    <input type="password" name="password" id="password" required placeholder="비밀번호">
                    <input type="hidden" name="user_type" value="1">
                    <input type="hidden" name="path" value="${path}">
                </div>
                <button type="submit" class="login-btn">로 그 인</button>
                <span id="loginspan"></span>
                <div class="login-links">
                    <a href="${pageContext.request.contextPath}/member/passSearch?user_type=1">비밀번호 찾기</a>
                    <a href="${pageContext.request.contextPath}/member/join">회원가입</a>
                </div>
            </form>
        </div>

        <!-- 사업자 로그인 -->
        <div class="login-panel" id="tab-business">
            <form action="loginPro" method="get">
                <div class="login-field">
                    <input type="email" name="user_id" required placeholder="이메일 주소">
                </div>
                <div class="login-field">
                    <input type="password" name="password" required placeholder="비밀번호">
                    <input type="hidden" name="user_type" value="2">
                    <input type="hidden" name="path" value="${path}">
                </div>
                <button type="submit" class="login-btn">로 그 인</button>
                <div class="login-links">
                    <a href="${pageContext.request.contextPath}/member/passSearch?user_type=2">비밀번호 찾기</a>
                    <a href="${pageContext.request.contextPath}/member/join">회원가입</a>
                </div>
            </form>
        </div>

        <!-- 관리자 로그인 -->
        <div class="login-panel" id="tab-admin">
            <form action="loginPro" method="get">
                <div class="login-field">
                    <input type="text" name="user_id" required placeholder="관리자 아이디">
                </div>
                <div class="login-field">
                    <input type="password" name="password" required placeholder="비밀번호">
                    <input type="hidden" name="user_type" value="0">
                    <input type="hidden" name="path" value="${path}">
                </div>
                <button type="submit" class="login-btn">로 그 인</button>
            </form>
        </div>
    </div>

    <div class="back-home">
        <a href="${pageContext.request.contextPath}/search/main"><i class="fas fa-arrow-left"></i> 홈으로 돌아가기</a>
    </div>
</div>

<script>
function switchTab(name) {
    document.querySelectorAll('.login-tab-btn').forEach(function(btn, i) {
        btn.classList.remove('active');
    });
    document.querySelectorAll('.login-panel').forEach(function(p) {
        p.classList.remove('active');
    });
    var tabs = ['member','business','admin'];
    var idx = tabs.indexOf(name);
    document.querySelectorAll('.login-tab-btn')[idx].classList.add('active');
    document.getElementById('tab-' + name).classList.add('active');
}
</script>
</body>
</html>
