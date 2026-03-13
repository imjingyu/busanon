<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로그인 | 부산온나</title>
    <!-- bootstrap v5.13 -->
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loginSt.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/email_certify_ajax.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/daum_address_api.js"></script>
</head>
<body>

 <div class="login_form_width" style="padding-top:100px; margin-bottom: 100px">

 <div id="member-login" class="container tab-pane active" data-aos="flip-left" data-aos-anchor-placement="top-center">		
  <div class="login">
    <div class="fix_title">
	    <div class="logo">
	     	<span style="font-size:40px; font-style: italic;"><b>비밀번호 찾기</b></span><br>
	    </div>
   </div>
   <form class="needs-vallidation" action="repass" method="get">
    <div class="form-group">
     <input class="form-control" type="email" name="user_id" id="user_id" required placeholder="이메일주소" style="margin-bottom: 5px;">
     	<div class="inp_type_2 form-errors" id="emailcertify" style="margin-bottom: 3px; display:none;"><!-- focus / err -->
	        <input class="form-control" type="text" name="uemail" id="emailcerfifytext" placeholder="인증번호" maxlength="6" >
	        <input class="btn btn-danger w-100" id="cerbtn" type="button" value="인증번호 확인" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif; padding: 0.75px 0.75px;" onclick='certifycheck2()'><br>
	        <input type="hidden" name="user_type" id="user_type" value="${user_type}">
	        <span id="mail-check-warn" style="font-size: 15px;"><!-- 인증번호 일치여부 --></span><br>
		</div>
		<input type="hidden" id="emailcheck" value="false">
		<input class="btn btn-danger w-100" id="emailbtn" type="button" value="인증번호 전송" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif; padding: 0.75px 0.75px; margin-bottom: 4px;" onclick="emailcer2()"><br>
		<input class="btn btn-danger w-100" id="passbtn" type="submit" value="패스워드 변경" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif; padding: 0.75px 0.75px; margin-bottom: 4px; display: none;">
	     <input class="btn btn-danger w-100" id="canclebtn" type="button" value="취 소" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif; padding: 0.75px 0.75px;"
	      onclick="location.href='login'">
    </div>
     
     
    <div class="link_half">
    </div>
     
   </form>
  </div>
 </div>

</body>
</html>