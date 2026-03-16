<%@ page pageEncoding="UTF-8" %>
<style type="text/css">
#load {
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    display: block;
    background: rgba(255, 255, 255, 0.96);
    z-index: 9999;
    text-align: center;
    backdrop-filter: blur(4px);
    transition: opacity 0.4s;
}

.load-inner {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 18px;
}

.load-logo-text {
    font-size: 2rem;
    font-weight: 800;
    color: #38b2d8;
    letter-spacing: -1px;
    font-family: 'Noto Sans KR', 'Open Sans', sans-serif;
}

.load-spinner {
    width: 48px;
    height: 48px;
    border: 4px solid #e2e8f0;
    border-top-color: #38b2d8;
    border-radius: 50%;
    animation: busanon-spin 0.75s linear infinite;
}

@keyframes busanon-spin {
    to { transform: rotate(360deg); }
}

.load-text {
    font-size: 0.88rem;
    color: #718096;
    font-weight: 600;
    letter-spacing: 1px;
}
</style>

<div id="load">
    <div class="load-inner">
        <div class="load-logo-text">부산온나</div>
        <div class="load-spinner"></div>
        <div class="load-text">로딩 중...</div>
    </div>
</div>

<script type="text/javascript">
    window.onbeforeunload = function () {
        var l = document.getElementById('load');
        if (l) { l.style.opacity = '1'; l.style.display = 'block'; }
    }
    window.addEventListener('load', function () {
        var l = document.getElementById('load');
        if (!l) return;
        var op = 1;
        var t = setInterval(function() {
            op -= 0.07;
            l.style.opacity = op;
            if (op <= 0) { clearInterval(t); l.style.display = 'none'; }
        }, 20);
    });
    window.onpageshow = function(event) {
        if (event.persisted || (window.performance && window.performance.navigation.type == 2)) {
            var l = document.getElementById('load');
            if (l) l.style.display = 'none';
        }
    }
</script>
