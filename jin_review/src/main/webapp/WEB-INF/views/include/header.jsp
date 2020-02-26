<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#navbar a {
	color: black;
}
.uinfo {
	color: DodgerBlue;
}



</style>

<!-- Navigation -->
	<nav id="navbar"
		class="navbar navbar-expand-lg navbar-dark ">
		<b><a class="navbar-brand lr-4" href="main">JinsReview</a></b>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="main">Home
						<span class="sr-only">(current)</span>
				</a></li>

				<c:choose>
					<c:when test="${login ne null }">
						<label class="uinfo">${login.uname } 님 환영합니다!</label>
						<b><a href="mypage?uid=${login.uid }&uname=${login.uname}">마이페이지</a></b> 
						<li class="nav-item active"><b><a class="nav-link"
							href="logout">로그아웃</a></b></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item active">
						<b><a class="nav-link"
							href="join">회원가입</a></b></li>
						<li class="nav-item active">
						<b><a class="nav-link"
							href="login">로그인</a></b></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<br>
	
	</nav>
	<div class="container mt-2" id="searchform" >
			<!-- Topbar -->
			<!-- Sidebar Toggle (Topbar) -->
			<button id="sidebarToggleTop"
				class="btn btn-link d-md-none rounded-circle mr-3">
				<i class="fa fa-bars"></i>
			</button>
			<form autocomplete="off" id="sform" action="productSearch" method="get"
				class="d-none d-sm-inline-block form-inline navbar-search">
				<div class="input-group input-group-lg">
					<input type="hidden" name="pageNum" value="1">
						
					<input type="text" size="70px" height="100px" id="category" name="keyword" class="form-control col-md-6"
						list="cate" placeholder="Search for..." aria-label="Search"
						aria-describedby="inputGroup-sizing-lg" value="">
					<datalist id="cate">
						<option value="병원">병원</option>
						<option value="음식">음식</option>
						<option value="카페">카페 & 디저트</option>
						<option value="제품">제품</option>
						<option value="헬스장">헬스장</option>
						<option value="세탁소">세탁소</option>
						<option value="호텔">호텔</option>
						<option value="pc방">pc방</option>
					</datalist>
					<input type="text" name="place" id="placekeyword" class="form-control"
						placeholder="Search for..." aria-label="Search"
						aria-describedby="inputGroup-sizing-lg" value="울산광역시">
						<input class="btn btn-primary" type="submit" value="검색">
				</div>
			</form>
		</div>
	<c:if test="${uri == '/main' }">
		<script>
			$("#sform").css("marginTop","300px");
		</script>
	</c:if>
	
