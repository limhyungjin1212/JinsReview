<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${userid ne null}">
	아이디 : ${userid.uid}
<a href="login">로그인 이동</a>
	</c:when>
	<c:otherwise>
		일치하는 아이디가 없습니다.
			<a href="userIdFind">아이디 찾기 이동</a>
	</c:otherwise>
</c:choose>

</body>
</html>