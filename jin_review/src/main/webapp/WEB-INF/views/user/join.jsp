<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/css/join.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="resources/js/join.js?ver=57"></script>
</head>
<body>

<div class="container">
	<h1 align="center">회 원 가 입</h1>
	<p align="center">
		JinsReview는 고객님의 소중한 개인정보를 보호하기위해 주민번호를 수집하지 않습니다.<br>요청하시면 안내메일을
		보내드립니다
	</p>

	<form autocomplete="off" class="form-inline" id="joinForm" method="post" action="join">
		<table class="table">
			<tr>
				<td>닉네임(필수)</td>
				<td>
				<input type="text" id="uname" name="uname" class="form-control" required>
				<span id="nameCheckBox">닉네임은 2자이상 25자 이하로 입력하셔야 합니다. </span>
				</td>
				
			</tr>
			<tr>
				<td>아이디(필수)</td>
				<td><input type="text" id="uid" name="uid" class="form-control" required> 
				<span id="idcheck">id는 8자이상 12자 이하로 입력하셔야
						합니다</span>
				<button type="button" id="idchkBtn" class="btn btn-info">아이디 중복 확인</button>
				</td>
			</tr>
			<tr>
				<td>비밀번호(필수)</td>
				<td>
					<input type="password" id="upw" class="form-control" name="upw" required>
					<span id="pwcheck">비밀번호는 특수문자1개이상포함 , 영문자 와 숫자 포함하여야합니다.</span>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인(필수)</td>
				<td><input type="password" id="pwchk" class="form-control" onblur="pwequalscheck()"
					required> <span id="pwequals"></span></td>
			</tr>
			<tr>
				<td>이메일(필수)</td>
				<td>
				<input type="text" id="email" name="receive_front" class="form-control" required="required"> @ 
				<input type="text" id="email2" class="form-control"> 
					<select id="emailselect" class="form-control" name="receive_back" onchange="selectEmail()">
						<option value="1">직접입력</option>
						<option value="naver.com">네이버</option>
						<option value="daum.net">다음</option>
						<option value="google.com">구글</option>
				</select>
				
				<input type="button" id="emailSendbtn" value="이메일 인증 번호 발송" class="btn btn-outline-secondary">
				<input type="hidden" id="umail" name="umail" >
				<!-- <input type="hidden" id="umail" name="umail" value="dkatl12@naver.com"> -->
				
				</td>
			</tr>
			<tr id="emailCheck">
				<td>이메일 인증 번호 확인</td>
				<td>
					<input type="text" id="emailCheckNum"  class="form-control" >
					<input type="button" id="emailCheckBtn"  class="btn btn-outline-success" value="인증번호 확인">
					<input type="hidden" id="ectrue" >
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
				<div class="form-check-inline">
				<label class="form-check-label" for="radio1" >
					<input type="radio" class="form-check-input" id="radio1"  name="gender" value="남"> 남자
				</label>
				</div>
				<div class="form-check-inline">
				<label class="form-check-label" for="radio2" >
					<input type="radio" class="form-check-input" id="radio2" name="gender" value="여"> 여자
				</label>
				</div>
				</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><select  class="form-control">
						<option value="010">010</option>
						<option value="011">011</option>
						<option>012</option>
						<option>013</option>
				</select> 
			<input type="text" maxlength="4" onblur="key()" id="firstNum" class="form-control">
					- 
			<input type="text" id="secondNum" class="form-control"> 
			<input type="button" id="btn" onclick="sendNum()" value="인증 번호 발송" class="btn btn-outline-secondary">
			</td>
					
			</tr>
			<tr>
				<td>인증번호 입력</td>
				<td>
				<input type="text" class="form-control" id="receiveNum"> 
				<input type="button" id="btn2" onclick="equalsNum()" class="btn btn-outline-success" value="확인">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" id="btnsubmit" class="btn btn-outline-primary" value="회원가입"> 
				<input type="button" class="btn btn-outline-secondary" onclick="location.href='main'" value="취소"></td>
			</tr>
		</table>
	</form>
	
</div>	
</body>
</html>