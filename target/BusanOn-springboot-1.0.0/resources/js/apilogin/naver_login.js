var a = $('#naver_id_login_div').html("<div id='naver_id_login'></div>");
var naver_id_login = new naver_id_login("U_Ht1pZyNghdI8b2w6mU", "http://BusanOn14.cafe24.com/BusanOn/apilogin/itwillnaverlogin");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("green", 3,45);
naver_id_login.setDomain("https://BusanOn14.cafe24.com/");
naver_id_login.setState(state);
naver_id_login.init_naver_id_login();
$(a).find('img').width('300px');   