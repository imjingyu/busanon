<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 
<style type="text/css">
#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	opacity: 0.8;
	background: white;
	z-index: 99;
	text-align: center;
	transition: 3.5s;
}

#load > img {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	transition: 3.5s;
    -webkit-transform: translate(-50%, -50%);
    -moz-transform: translate(-50%, -50%);
    -ms-transform: translate(-50%, -50%);
    -o-transform: translate(-50%, -50%);
	z-index: 100;
}
</style>
 
<div id="load">
	<img src="${pageContext.request.contextPath }/resources/images/333.gif" alt="loading">
</div>
 
    <script type="text/javascript">
        window.onbeforeunload = function () { $('#load').show(); }  //현재 페이지에서 다른 페이지로 넘어갈 때 표시해주는 기능
        $(window).load(function () {          //페이지가 로드 되면 로딩 화면을 없애주는 것
            $('#load').hide();
        });
        
        window.onpageshow = function(event) {
            if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
                // Back Forward Cache로 브라우저가 로딩될 경우 혹은 브라우저 뒤로가기 했을 경우
                // 이벤트 추가하는 곳
            	 $('#load').hide();
            }
        }   
    </script>
    
    
