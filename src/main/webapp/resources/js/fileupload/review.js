var count = 0;
var formData = new FormData;
$(document).ready(() => {
	$('#attach').on('change',() =>{
		var files = $('#attach')[0].files;
		if(files.length > 3){
			alert('파일은 3개까지 업로드 가능합니다.');
			return;
		}
		var i = 0;
		for(i; i < files.length; i++){
			//확장자 체크
			if(!/\.(jpg|jpeg|png|JPG|JPEG|PNG)$/i.test(files[i].name)){
				alert('업로드 형식에 어긋난 파일이 포함되어 있습니다.\n다시선택하여 주십시오.');
				$('#attach').val('');
				return;
			}
			//파일크기체크(10MB)
			if(files[i].size > 10485760){
				alert('파일 용량이 10MB를 초과한 파일이 존재합니다.');
				$('#attach').val('');
				return;
			}
			//중복된 파일 체크
			for (const filename of formData.values()) {
				var name = filename.name;
				if(name == files[i].name){
					alert('같은 파일이 존재합니다.');
					$('#attach').val('');
					return;
				}
			}
			if(count >= 3){
				alert('3개 넘음');
				return;
			}
			count++;
			formData.append('files',files[i]);
			$('#fileList1').append('<li>'+files[i].name+'</l1>')	
		}
	})
})

	
function fileupload(){
	
	$.ajax({
		type:'post',
		url: 'reviewimagePro',
		enctype: 'multipart/form-data',
		data: formData,
		async:false,
		cache : false,
		contentType : false,
		processData : false,
		success:(data) =>{
			return true;
		},error : e => {
			alert(e);
			return false;	
		}
	});
}