<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
<h1>아이디 찾기</h1>
<div class="container">
		<div class="text-center">
			<h1>
				<a href="main">JinsReview</a>
			</h1>
		</div>

	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8">
				<form class="form" action="userIdFind" method="post">
					<div class="form-group">
					<label for="uid">이메일</label> <input class="form-control  form-control-lg" id="umail" type="text"
							name="umail" placeholder="이메일">
					</div>
					
					<div class="form-group">
					<label for="uname">이름</label> <input class="form-control  form-control-lg" id="uname" type="text"
							name="uname" placeholder="이름">
					</div>
					<div class="form-group">
						<input class="btn btn-primary btn-block" type="submit" value="아이디 찾기">
					</div>
				</form>
			</div>
		</div>
		</div>
</body>
</html>