<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>

<style>
body{
    margin:0;
    font-family:Arial;
    background:#0f172a;
    color:white;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.container{
    text-align:center;
}

h1{
    font-size:80px;
    margin-bottom:10px;
}

h2{
    margin-bottom:20px;
}

a{
    padding:12px 20px;
    background:#2563eb;
    color:white;
    text-decoration:none;
    border-radius:6px;
}
</style>

</head>

<body>

<div class="container">

    <h1>${statusCode}</h1>

    <c:choose>
        <c:when test="${statusCode == 404}">
            <h2>페이지를 찾을 수 없습니다.</h2>
        </c:when>

        <c:when test="${statusCode == 500}">
            <h2>서버 내부 오류가 발생했습니다.</h2>
        </c:when>

        <c:otherwise>
            <h2>알 수 없는 오류가 발생했습니다.</h2>
        </c:otherwise>
    </c:choose>

    <p>${path}</p>

    <br>

    <a href="${pageContext.request.contextPath}/search/main">
        메인으로 이동
    </a>

</div>

</body>
</html>