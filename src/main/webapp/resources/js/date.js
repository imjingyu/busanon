
		
		// 날짜 일수 더하는 함수
		function dateAdd(date, days) {
			var d = new Date(date);
			d.setDate(d.getDate() + days);
			return d;
		}
		
		function zero(value) {
			if (value < 10) {
				return '0' + value;
			}
	       
			return value;
		}
	   
		function dateFormat(source, delimiter = '-') {
			const year = source.getFullYear();
			const month = zero(source.getMonth() + 1);
			const day = zero(source.getDate());
			
			return [year, month, day].join(delimiter);
		}
	   
	   // 체크인 날짜 값 변경 시 체크아웃 날짜 값 변경(지원)
		$(document).ready( function() {

			// 체크인 날짜 값이 변경되면
			$('#checkin').change( function() {
				var checkin = $('#checkin').val();
				var nd = dateAdd(checkin, 1);
// 				console.log("다음날 : " + nd);
				
				var checkout = $('#checkout').val();

				let dateElement = document.getElementById('checkout');
				let nextDay = dateFormat(nd);   // 체크인 날짜의 다음날
// 				console.log(nextDay);
				
				dateElement.setAttribute("min", nextDay);   // 체크아웃의 최소값 지정
				
				// 다음날이 원래 체크아웃날짜보다 크면
				if(nextDay > checkout) {
					$('#checkout').val(nextDay);   // 체크아웃 value값을 다음날로 변경
				}
				
			});
		});