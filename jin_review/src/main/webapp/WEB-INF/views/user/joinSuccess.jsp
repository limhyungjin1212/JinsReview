<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" name="frm" action="loginPost" method="post">
	<input type="hidden" name="uid" value="${uvo.uid }">
	<input type="hidden" name="upw" value="${uvo.upw }">
	
</form>
<script type="text/javascript">
var frm = document.getElementById("frm");
	window.onload = function(){
		frm.submit();
	}
</script>
</body>
</html>