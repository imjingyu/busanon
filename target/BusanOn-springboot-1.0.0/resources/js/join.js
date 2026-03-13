var iddupcheck = false;
var passcheck = false;
var passOrpass2check = false;
var strpasscheck = "";

function joinkind(){
	var checked = $('#toggle').is(':checked');
	if(!checked){
		$('#user_type').val('1');
		$('#joinkindtext').html('회원');
		
	}else{
		$('#user_type').val('2');
		$('#joinkindtext').html('사업자');
	}
}
function iddup(){
	$.ajax({
		url:'iddup',
		data:{'user_id':$('#user_id').val(), 'user_type':$('#user_type').val()},
		async:false,
		type:'get',
		success:(data) => {
			strpasscheck = data;
			var result;
			var color;
			var emaildisabled;
			if(data == 'true'){
				result = '사용 가능한 이메일 입니다.';
				color = 'green';
				emaildisabled = false;
				iddupcheck = true;
				
			}else {
				if(data == "false1"){
					result = "아이디를 입력하여 주십시오";
				}else if(data == "false2"){
					result = "이메일 형식이 아닙니다."
				}else{
					result = '사용 불가능한 이메일 입니다.';	
				}
				color = 'red';
				emaildisabled = true;
				iddupcheck = false;
			}
			$('#checkIdResult').html(result).css('color', color);
			$('#emailbutton').attr('disabled',emaildisabled)
		}
	})
}

// 패스워드 정규식
function checkPass(pass) {
	var div = $('#passmsg');
	var text;
	var color;
	
	//정규식
	var lengthRegex = /^[A-Za-z0-9!@#$%]{8,16}$/;
	var engUpperRegex = /[A-Z]/;
	var engLowerRegex = /[a-z]/;
	var engNumberRegex = /[0-9]/;
	var specRegex = /[!@#$%]/;
	
	var count = 0;
	
	if(lengthRegex.exec(pass)){
		
		if(engUpperRegex.exec(pass)) count++;
		if(engLowerRegex.exec(pass)) count++;
		if(engNumberRegex.exec(pass)) count++;
		if(specRegex.exec(pass)) count++;
		
		switch(count){
			case 2: text = "보안수준 낮음"; color = "Green"; break;
			case 3: text = "보안수준 보통"; color = "Orange"; break;
			case 4: text = "보안수준 높음"; color = "Indigo"; break;
			default : text = "영문자, 숫자, 특수문자 중 2가지 이상 필수"; 
					  color = "Red"; break;
		}
		div.html(text);
		div.css('color',color);
		passcheck = true;
		
	}else{
		div.html('영문자, 숫자, 특수문자 조합 8 ~ 16자리');
		div.css('color','Red');
		passcheck = false;
	}
}

//패스워드 일치여부
function checkRetypePass(pass2) {
	
	var pass = $('#password').val();
	var pass2msg = $('#pass2msg');
	var text;
	var color;
	
	if(pass == '') return;
	if(pass == pass2){
		text = '패스워드 일치';
		color = 'Green';
		passOrpass2check = true;
	}else{
		text = '패스워드 불일치';
		color = 'Red';
		passOrpass2check = false;
	}
	pass2msg.html(text);
	pass2msg.css('color',color); 
}

function repassfun(){
	if(passOrpass2check){
		return true;
	}
	alert("패스워드 불일치");
	return false;
}

function joincheck() {
	var id = $('#user_id');
	var name = $('#user_name');
	var pass = $('#password');
	var pass2 = $('#password2');
	var emailcheck = $('#emailcheck').val();
	var jumin = $('#jumin');
	var address1 = $('#user_address');
	var address2 = $('#user_address2');
	var phone = $('#user_phonenumber');
	debugger;
	if(id.val().length == 0){
		modalalert("아이디","아이디를 입력하여 주십시오!");
//		alert("아이디를 입력하여 주십시오!");
		id.focus();
		id.select();
		return false;
	}
	if(!iddupcheck){
		modalalert("아이디","아이디 중복체크를 해주십시오!");
//		alert('아이디 중복체크를 해주십시오!');
		return false;
	}
	if(!passcheck){
		modalalert("패스워드","패스워드 형식이 맞지 않습니다.");
//		alert('패스워드 형식이 맞지 않습니다.');
		pass.focus();
		pass.select();
		return false;
	}
	if(!passOrpass2check){
		modalalert("패스워드","패스워드가 다릅니다");
//		alert("패스워드가 다릅니다!");
		pass2.focus();
		pass2.select();
		return false;
	}
	if(name.val().length == 0){
		modalalert("이름","이름을 입력하여 주십시오!");
//		alert("이름을 입력하여 주십시오!");
		name.focus();
		name.select();
		return false;
	}
	if(emailcheck != 'true'){
		modalalert("이메일 인증","이메일 인증을 해주십시오!");
//		alert("이메일 인증을 해주십시오!");
		return false;
	}
	if(address1.val().length == 0 || address2.val().length == 0){
		modalalert("주소","주소를 입력하여 주십시오!");
//		alert("주소를 입력하여 주십시오.");
		address2.focus();
		address2.select();
		return false;
	}
	if(phone.val().length == 0){
		modalalert("휴대폰번호","휴대폰번호를 입력하여 주십시오!");
//		alert("휴대폰번호를 입력하여 주십시오");
		phone.focus();
		phone.select();
		return false;
	}
	if(jumin.val().length != 13){
		modalalert("주민번호","주민번호 입력하여 주십시오!");
//		alert("주민번호 13자리를 입력하여 주십시오");
		jumin.focus();
		jumin.select();
		return false;
	}
	
	return true;
}
