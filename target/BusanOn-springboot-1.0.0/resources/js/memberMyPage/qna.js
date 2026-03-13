function showQna(id){
	debugger;
	$(document).ready(function(){
		var disc = $('.'+id+'');
		if(disc.css('display') == 'none'){
			disc.css('display','');	
		}else{
			disc.css('display','none');
		}
		
	});	
}
 
function lenc(){
	var title = $('#title');
	var content = $('#content');
	
	if(title.val().length > 100){
		alert("제목은 100자 이내입니다.");
		return false;
	}
	if(content.val().length > 500){
		alert("내용은 500자 이내로 기입하여 주십시오.");
		return false;
	}
	
	return true;
}

function lenc(){
	var anwser = $('#anwser');
	
	if(anwser.val().length > 500){
		alert("내용은 500자 이내로 기입하여 주십시오.");
		return false;
	}
	
	return true;
}