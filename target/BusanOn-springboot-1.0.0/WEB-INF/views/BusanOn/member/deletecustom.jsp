<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
</head>
<body>
<script type="text/javascript">
modalalert('회원탈퇴','탈퇴 되셧습니다!');
$('#myModal').on('hidden.bs.modal', e => {    
	location.href="${pageContext.request.contextPath}/search/main";
});
</script>
</body>
</html>