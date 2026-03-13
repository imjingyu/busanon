//document.write('<script src="join.js"></script>');
var code;

function emailcer(){
	var email = $('#user_id').val();
	$.ajax({
		url:'emailsend?email=' + email,
		type:'get',
		success:(data) => {
			if(data == '0'){
				alert("이메일이 존재하지 않습니다.");
				return;
			}
			console.log('data : ' + data);
			$('#mail-check-input').attr('disabled',false);
			code = data;
			alert('인증번호가 전송되었습니다.')
			$('#emailcertify').css('display','block')
		}
	})	
}

function emailcer2(){
	iddup()
	
	if(strpasscheck == "false"){
		emailcer();
		return;
	}
	alert('아이디가 존재하지 않습니다!');
}

function certifycheck(){
	const inputCode = $('#emailcerfifytext').val();
	const $resultMsg = $('#mail-check-warn');
	const emailcheck = $('#emailcheck');
	const togglediv = $('#togglekind');
	
	var msg = '인증번호가 불일치 합니다. 다시 확인해주세요!';
	var color = 'red';
	
	if(inputCode == code){
		msg = '인증번호가 일치합니다.';
		color = 'green';
		$('#emailcerfifytext').attr('disabled',true);
		emailcheck.val('true');
		togglediv.css('display','none');
	}
	$resultMsg.html(msg);
	$resultMsg.css('color',color);
}

function certifycheck2(){
	certifycheck();
	const emailcheck = $('#emailcheck').val();
	const emailbtn = $('#emailbtn');
	const passbtn = $('#passbtn');
	if(emailcheck == 'true'){
		emailbtn.css('display','none');
		passbtn.css('display','block');
	}
}
