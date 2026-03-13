<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입 | 부산온나</title>
    <!-- bootstrap v5.13 -->
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
	<!-- css -->  
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loginSt.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/togglebutton.css" />
	<link rel="stylesheet" href="https://www.goodchoice.kr/css/common.css?rand=1660711669">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/email_certify_ajax.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/daum_address_api.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 


</head>
<body>
<script>
AOS.init({
	  duration: 1000
	});

</script>
<div class="layer_fix pop_login pop_mem_reserve fix_disable">
    <section>
    <form id="joinForm" action="joinPro" method="get" onsubmit="return joincheck()">

		<div  data-aos="fade-down" data-aos-easing="ease-out-cubic" data-aos-duration="1500" id ="id-finish" data-aos-once="true">
    		<div class="logo">
     		<a href="${pageContext.request.contextPath }/search/main"><img src="${pageContext.request.contextPath }/resources/images/busan_onna_logo.png"></a>
    		</div>


        <div class="join">
            <strong class="sub_title">회원가입 - <span id="joinkindtext" style="font-size: 20px; color: blue;">회원</span></strong>
			
			<div id="togglekind">
				<input type="checkbox" id="toggle" onchange="joinkind()" hidden>
					<label for="toggle" class="toggleSwitch"><span class="toggleButton"></span>
				</label>
			</div>
			
			
            <b>아이디(이메일형식) &nbsp <button type="button" class="btn btn-danger" onclick="iddup()">중복확인</button></b>
            <div class="inp_type_2 form-errors" style="margin-bottom: 3px;"><!-- focus / err -->
                <input type="email" name="user_id" id="user_id" placeholder="이메일 주소를 입력해주세요.">
				<label id="gcuseremail_msg" class="validate_msg_label" style="color: red;"></label>
				<input type="hidden" name="user_type" id="user_type" value="1">
            </div><span id="checkIdResult"><!-- 이메일아이디 일치 여부 표시 영역 --></span><br>
            <button type="button" class="btn btn-danger" id="emailbutton" onclick="emailcer()" disabled>인증번호 전송</button>  
            <div class="inp_type_2 form-errors" id="emailcertify" style="margin-bottom: 3px; display:none "><!-- focus / err -->
                <input type="text" name="uemail" id="emailcerfifytext" placeholder="인증번호" maxlength="6"  onblur='certifycheck()'>
                <input type="hidden" id="emailcheck" value="false">
                <input type="hidden" name="user_zipcode" id="user_zipcode" value="0">
            </div></div><span id="mail-check-warn"><!-- 인증번호 일치여부 --></span><br>
            </div>
            <div data-aos="fade-right"  data-aos-delay="1500" data-aos-anchor="#logo" >
	            <b>비밀번호</b>
	            <div class="inp_type_2 form-errors form-password-rule" >
	                <input type="password" name="password" placeholder="비밀번호를 입력해주세요." id="password" onkeyup="checkPass(this.value)">
					<label id="new_pw_msg" class="validate_msg_label"></label>
					<div id="passmsg"><!-- 패스워드 정규식 조건 만족 여부1 --></div>
	            </div>
			</div>	            
			 <div data-aos="fade-right"  data-aos-anchor="#logo" data-aos-delay="1700">
	            <b>비밀번호 확인</b><span id="checkRetypePassResult"><!-- 비밀번호 일치 여부 표시 영역 --></span>
	            <div class="inp_type_2 form-errors">
	                <input type="password" name="password2" placeholder="비밀번호를 확인해주세요." id="password2" onblur="checkRetypePass(this.value)">
					<label id="new_pw_re_msg" class="validate_msg_label"></label>
					<div id="pass2msg"><!-- 패스워드 일치여부 --></div>
	            </div>
	        </div>
				<div data-aos="fade-right"  data-aos-anchor="#logo" data-aos-delay="1900">
	            <b>이름</b>
	            <div class="inp_type_2 form-errors"><!-- focus / err -->
	                <input type="text" name="user_name" id="user_name" placeholder="이름을 입력해주세요.">
					<label id="gcusertel_msg" class="validate_msg_label" style="color: red;"></label>
	            </div>
			</div>
			
			<div data-aos="fade-right"  data-aos-anchor="#logo" data-aos-delay="2100">
	            <b>주민번호</b>
	            <div class="inp_type_2 form-errors"><!-- focus / err -->
	                <input type="text" name="jumin" id="jumin" placeholder="-(하이픈)없이 숫자만 13자리" maxlength="13" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
					<label id="gcusertel_msg" class="validate_msg_label" style="color: red;"></label>
	            </div>
            </div>
            
            <div data-aos="fade-right"  data-aos-anchor="#logo" data-aos-delay="2300">
	            <b>휴대폰 번호</b>
	            <div class="inp_type_2 form-errors"><!-- focus / err -->
	                <input type="tel" name="user_phonenumber" id="user_phonenumber" placeholder="ex)000-0000-0000" maxlength="13" oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');">
					<label id="gcusertel_msg" class="validate_msg_label" style="color: red;"></label>
	            </div>
            </div>
            
			<div data-aos="fade-up" data-aos-anchor="#logo" data-aos-delay="2500">
	            <b>주소</b>
	            <button type="button" class="btn btn-danger" id="" onclick="addressSearch()">검색</button>
	
	            <div class="inp_type_2 form-errors">
	            <input type="text" name="postNum" class="" value="" id="postNum" placeholder="우편번호(검색 버튼 클릭)" readonly/> 
	            </div>
	
	            <div class="inp_type_2 form-errors">
	            <input type="text" name="user_address" class="" value="" id="user_address" placeholder="주소(검색 버튼 클릭)" style="" readonly/> 
	            </div>
	<!--             ada -->
	            <div class="inp_type_2 form-errors">
	            <input type="text" name="user_address2" class="" value="" id="user_address2" placeholder="상세주소" style=""/> 
	            </div>
	            <button type="submit" class="btn btn-danger w-100" style="margin-bottom: 20px; font-size: 27.7px; font-family: 'Do Hyeon', sans-serif;">가 입 하 기</button>
            </div>
        </div>
    </form>
</section>



</div>
</body>
</html>