var naver_id_login = new naver_id_login("U_Ht1pZyNghdI8b2w6mU", "http://BusanOn14.cafe24.com/BusanOn/apilogin/itwillnaverlogin");
// 접근 토큰 값 출력
//alert(naver_id_login.oauthParams.access_token);
// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");

// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
	var user_id = naver_id_login.getProfileData('email');
	var user_name = naver_id_login.getProfileData('name');
	location.href='naverlogin?user_id='+user_id+'&user_name='+user_name+'&user_type=1'
//    alert(naver_id_login.getProfileData('email'));
//    alert(naver_id_login.getProfileData('nickname'));
//    alert(naver_id_login.getProfileData('name'));
//    alert(naver_id_login.getProfileData('id'));
}