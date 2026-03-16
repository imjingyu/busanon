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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/auth-premium.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/togglebutton.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/email_certify_ajax.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/daum_address_api.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>



    <style>
        .auth-join .join-field.full {
            grid-column: 1 / -1;
        }
        .auth-join .join-field > b {
            display: block;
            margin: 0 0 10px !important;
            font-size: 18px !important;
            color: #264764 !important;
            font-weight: 800 !important;
        }

        .auth-join .join-field.full .join-inline {
            display: grid !important;
            grid-template-columns: minmax(0, 1fr) 110px;
            align-items: start !important;
        }
        .auth-join .inp_type_2 input,
        .auth-join input[type="text"],
        .auth-join input[type="password"],
        .auth-join input[type="email"],
        .auth-join input[type="tel"] {
            width: 100% !important;
            height: 58px !important;
            padding: 0 18px !important;
            border-radius: 16px !important;
            border: 1px solid #a9c8e5 !important;
            background: #f4faff !important;
            color: #17324d !important;
            box-shadow: none !important;
        }
        .auth-join input::placeholder {
            color: #7c95ad !important;
        }
        .auth-join input:focus {
            outline: none !important;
            border-color: #2f7edb !important;
            background: #fff !important;
            box-shadow: 0 0 0 4px rgba(47,126,219,.13) !important;
        }
        .auth-join .btn,
        .auth-join .btn-primary,
        .auth-join .btn-primary,
        .auth-join .btn-success,
        .auth-join #emailbutton,
        .auth-join .address-search-btn,
        .auth-join .join-submit {
            border: 0 !important;
            border-radius: 16px !important;
            background: linear-gradient(135deg, #2f7edb 0%, #49b1da 100%) !important;
            color: #fff !important;
            box-shadow: 0 14px 28px rgba(47,126,219,.18) !important;
            font-weight: 800 !important;
        }
        .auth-join .join-inline .btn,
        .auth-join #emailbutton,
        .auth-join .address-search-btn {
            width: 110px !important;
            min-width: 110px !important;
            height: 50px !important;
            padding: 0 18px !important;
            font-size: 15px !important;
            white-space: nowrap;
            align-self: stretch !important;
        }
        .auth-join .validate-row,
        .auth-join .help-row,
        .auth-join #checkRetypePassResult {
            display: block;
            margin-top: 8px !important;
            color: #5b7692 !important;
            min-height: 20px;
        }
        .auth-join .address-stack .inp_type_2 + .inp_type_2 {
            margin-top: 10px !important;
        }
        .auth-join .join-submit {
            width: 100% !important;
            height: 62px !important;
            margin-top: 10px !important;
            font-size: 28px !important;
            letter-spacing: .18em;
        }
        .auth-join .toggleSwitch {
            width: 76px !important;
            height: 40px !important;
            border-radius: 999px !important;
            background: #d8e7f5 !important;
            display: inline-block !important;
            position: relative !important;
            box-shadow: inset 0 0 0 1px rgba(47,126,219,.18);
        }
        .auth-join .toggleSwitch .toggleButton {
            position: absolute !important;
            top: 5px !important;
            left: 5px !important;
            width: 30px !important;
            height: 30px !important;
            border-radius: 50% !important;
            background: #a0aec0 !important;
            transition: all .2s ease;
        }
        .auth-join #toggle:checked + .toggleSwitch .toggleButton {
            left: 41px !important;
            background: linear-gradient(135deg, #2f7edb 0%, #49b1da 100%) !important;
        }
        .auth-join #toggle:checked + .toggleSwitch {
            background: #dcecff !important;
        }
        @media (max-width: 820px) {
            .auth-join .join {
                padding: 28px 20px 30px !important;
            }
            .auth-join .join::before {
                width: calc(100% + 40px);
                margin: -28px -20px 24px;
            }
            .auth-join .join-grid {
                grid-template-columns: 1fr !important;
            }
            .auth-join .join-top {
                flex-direction: column !important;
                align-items: flex-start !important;
            }
        }
        @media (max-width: 560px) {
            .auth-join body,
            body.auth-join {
                padding: 22px 12px 28px !important;
            }
            .auth-join .sub_title {
                font-size: 28px !important;
            }
            .auth-join #joinkindtext {
                font-size: 22px !important;
            }
            .auth-join .join-inline {
                display: flex !important;
                flex-direction: column !important;
                align-items: stretch !important;
            }
            .auth-join .join-field.full .join-inline {
                grid-template-columns: 1fr !important;
            }
            .auth-join .join-inline .btn,
            .auth-join #emailbutton,
            .auth-join .address-search-btn {
                width: 100% !important;
            }
            .auth-join .join-submit {
                font-size: 24px !important;
                letter-spacing: .12em;
            }
        }
    </style>

</head>
<body class="auth-join">
<script>
AOS.init({
	  duration: 1000
	});

</script>
<div class="layer_fix pop_login pop_mem_reserve fix_disable">
    <section>
        <form id="joinForm" action="joinPro" method="get" onsubmit="return joincheck()">
            <div class="logo" data-aos="fade-down" data-aos-easing="ease-out-cubic" data-aos-duration="1200" data-aos-once="true" style="text-align:center;margin-bottom:10px;">
                <a href="${pageContext.request.contextPath}/search/main" style="text-decoration:none;display:inline-block;">
                    <span style="display:block;font-family:'Do Hyeon',sans-serif;font-size:36px;color:#38b2d8;line-height:1;letter-spacing:2px;">부산온나</span>
                    <span style="display:block;font-size:11px;color:#718096;letter-spacing:4px;margin-top:3px;">BUSAN ONNA</span>
                </a>
            </div>

            <div class="join" data-aos="fade-up" data-aos-duration="1200" style="padding-top: 50px;">
                <div class="join-top">
                    <strong class="sub_title">회원가입 - <span id="joinkindtext" style="font-size: 20px; color: blue;">회원</span></strong>
                    <div id="togglekind">
                        <input type="checkbox" id="toggle" onchange="joinkind()" hidden>
                        <label for="toggle" class="toggleSwitch"><span class="toggleButton"></span></label>
                    </div>
                </div>

                <div class="join-grid">
                    <div class="join-field full">
                        <b>아이디(이메일형식)</b>
                        <div class="join-inline">
                            <div class="form-errors" style="margin-bottom: 0;">
                                <input type="email" name="user_id" id="user_id" placeholder="이메일 주소를 입력해주세요.">
                                <label id="gcuseremail_msg" class="validate_msg_label" style="color: red;"></label>
                                <input type="hidden" name="user_type" id="user_type" value="1">
                            </div>
                            <button type="button" class="btn btn-primary" onclick="iddup()">중복확인</button>
                        </div>
                        <div class="validate-row"><span id="checkIdResult"></span></div>
                    </div>

                    <div class="join-field full">
                        <div class="join-inline">
                            <button type="button" class="btn btn-primary" id="emailbutton" onclick="emailcer()" disabled>인증번호 전송</button>
                            <div class="form-errors" id="emailcertify" style="margin-bottom: 0; display:none;">
                                <input type="text" name="uemail" id="emailcerfifytext" placeholder="인증번호" maxlength="6" onblur='certifycheck()'>
                                <input type="hidden" id="emailcheck" value="false">
                                <input type="hidden" name="user_zipcode" id="user_zipcode" value="0">
                            </div>
                        </div>
                        <div class="validate-row"><span id="mail-check-warn"></span></div>
                    </div>

                    <div class="join-field">
                        <b>비밀번호</b>
                        <div>
                            <input type="password" name="password" placeholder="비밀번호를 입력해주세요." id="password" onkeyup="checkPass(this.value)">
                            <label id="new_pw_msg" class="validate_msg_label"></label>
                            <div id="passmsg"></div>
                        </div>
                    </div>

                    <div class="join-field">
                        <b>비밀번호 확인</b>
                        <div class="form-errors">
                            <input type="password" name="password2" placeholder="비밀번호를 확인해주세요." id="password2" onblur="checkRetypePass(this.value)">
                            <label id="new_pw_re_msg" class="validate_msg_label"></label>
                            <div id="pass2msg"></div>
                        </div>
                    </div>

                    <div class="join-field">
                        <b>이름</b>
                        <div class="form-errors">
                            <input type="text" name="user_name" id="user_name" placeholder="이름을 입력해주세요.">
                            <label id="gcusertel_msg" class="validate_msg_label" style="color: red;"></label>
                        </div>
                    </div>

                    <div class="join-field">
                        <b>주민번호</b>
                        <div class="form-errors">
                            <input type="text" name="jumin" id="jumin" placeholder="-(하이픈)없이 숫자만 13자리" maxlength="13" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
                        </div>
                    </div>

                    <div class="join-field full">
                        <b>휴대폰 번호</b>
                        <div class="form-errors">
                            <input type="tel" name="user_phonenumber" id="user_phonenumber" placeholder="ex)000-0000-0000" maxlength="13" oninput="this.value = this.value.replace(/[^0-9-]/g, '').replace(/(\..*)\./g, '$1');">
                        </div>
                    </div>

                    <div class="join-field full address-stack">
                        <div class="join-inline" style="justify-content: space-between; align-items: center;">
                            <b style="margin:0;">주소</b>
                            <button type="button" class="btn btn-primary address-search-btn" onclick="addressSearch()">검색</button>
                        </div>
                        <div class="form-errors">
                            <input type="text" name="postNum" value="" id="postNum" placeholder="우편번호(검색 버튼 클릭)" readonly/>
                        </div>
                        <div class="form-errors">
                            <input type="text" name="user_address" value="" id="user_address" placeholder="주소(검색 버튼 클릭)" readonly/>
                        </div>
                        <div class="form-errors">
                            <input type="text" name="user_address2" value="" id="user_address2" placeholder="상세주소"/>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100 join-submit" style="margin-bottom: 8px; font-size: 27.7px; font-family: 'Do Hyeon', sans-serif;">가 입 하 기</button>
            </div>
        </form>
    </section>
</div>



</body>
</html>
