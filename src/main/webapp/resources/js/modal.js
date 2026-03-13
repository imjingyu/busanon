//document.write('<script src="join.js"></script>');
//<button type="button" class="close" data-dismiss="modal">×</button>
$('body').append('<div class="modal fade" id="myModal" role="dialog"></div>');
document.getElementById('myModal').innerHTML = '<div class="modal-dialog">' + 
	'<div class="modal-content"><div class="modal-header" style="margin-bottom: 2px;">' + 
	'<h2 class="modal-title" id="modaltitle" style="text-align: center;">입력오류</h2></div>' + 
	'<div class="modal-body"><p id="modalcontent" style="text-align: center;">패스워드가 잘못되었습니다</p></div><div class="modal-footer">' + 
	'<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></div></div></div>';

function modalalert(title, content){
    $("#modaltitle").html(title);
    $("#modalcontent").html(content);

    $("#myModal").modal();
}