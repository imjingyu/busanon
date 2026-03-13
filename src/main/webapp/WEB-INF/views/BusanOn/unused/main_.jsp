<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css" integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

<!-- <script type="text/javascript" src="/webjars/jquery/3.6.0/jquery.min.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(() => {
		$('#btn').bind('click', () => {
			$.ajax({
				url:'test',
				//data:{"id":$('#id').val()},
				success:(rdata) => {
					debugger;
				$('div').html(rdata).css('color', 'blue');				
				}
			})	
		})
	});
</script>
</head>
<body>



<section class="main_box_1">
체크인
<input type="date">
체크아웃
<input type="date">
</section>
<!-- <input type="button" value="asdasd" id="btn"> -->
<%-- ${pageContext.request.contextPath} --%>

</body>
</html>