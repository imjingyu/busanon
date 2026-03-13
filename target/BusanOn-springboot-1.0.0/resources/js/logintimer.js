var ti;

function timer(path, sT, ts){
	debugger;
	
	var now = new Date();
	var year = now.getFullYear();    
	var month = now.getMonth()+1;                              
	var day = now.getDate();         
	var hours = now.getHours();    
	var minutes = now.getMinutes();
	var sec = now.getSeconds();

	var sttDt = sT;
	sttDt = sttDt.split('-');
	var sttYear = sttDt[0];
	var sttMonth = sttDt[1];
	var sttDay = sttDt[2];
	var stthours = sttDt[3];
	var sttminutes = sttDt[4];
	var sttsec = sttDt[5];

	var date1 = new Date(year, month, day, hours, minutes, sec);                    // 현재 
	var date2 = new Date(sttYear, sttMonth, sttDay, stthours, sttminutes, sttsec);
	date2.setMinutes(date2.getMinutes() + ts)

	var h = parseInt((date2.getTime() - date1.getTime()) / 1000 / 60 / 60);
	var m = parseInt((date2.getTime() - date1.getTime()) / 1000 / 60) - h * 60;
	var s = parseInt((date2.getTime() - date1.getTime()) / 1000 % 60);
	
	document.getElementById('timer').innerHTML = 
		(h.toString().length < 2 ? "0" + h : h) + " : " +  
		(m.toString().length < 2 ? "0" + m : m) + " : " + 
		(s.toString().length < 2 ? "0" + s : s) + '&nbsp;<input type="button" value="연장" class="btn btn-primary w-30" onclick="resettimer()">';
		
	clearInterval(ti);
	ti = setInterval(() => {
		
		
		if((h == 0 && m == 0 && s == 0) || h < 0) {
			alert('웹 사이트에서 로그아웃 되셧습니다.');
			clearInterval(ti);
			location.href=""+path+"/member/logout";
			return;
		}
		
		s--;
		
		if(s < 0) {
			s = 59;
			m--;
			if(m < 0) {
				m = 59;
				h--;
			}
		}
			
		document.getElementById('timer').innerHTML = 
		(h.toString().length < 2 ? "0" + h : h) + " : " +  
		(m.toString().length < 2 ? "0" + m : m) + " : " + 
		(s.toString().length < 2 ? "0" + s : s) + '&nbsp;<input type="button" value="연장" class="btn btn-primary w-30" onclick="resettimer()">';
	},1000)
}