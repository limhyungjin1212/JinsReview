<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no,user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<title>JinsReview</title>
<link href="resources/css/bootstrap.min.css?ver=2" rel="stylesheet">
<!-- Custom styles for this template -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="resources/css/all.min.css?ver=35" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="resources/css/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="resources/js/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" href="resources/css/upload.css">
<!-- icon을 사용하기위한 소스  -->
<script src="https://kit.fontawesome.com/474aec6043.js" crossorigin="anonymous"></script>
<!-- bxslider 위한 소스  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style>
	#cb{
		margin-top:200px;
	}
	
	#mrgaInfo a{
		text-decoration: none; 
		
	}
	
	a {
		text-decoration: none;
	}
	#ih{
		background:rgba(0,0,0,0.4); 
		
	}
</style>
</head>
<body>
	
<div class="wrap">
	<div id="ih">
	<div class="container-fluid mb-2" id="headerbar">
	<c:choose>
		<c:when test="${uri == '/main' && login.uid ne 'admin' }">
			<jsp:include page="include/header.jsp"></jsp:include>
		
		<script>
			var ranFn = "${mrga.fn}";
			var front = ranFn.substring(0,12);
			var end = ranFn.substring(14);
			var mrgaWriter = "${mrga.writer}";
			var mrgaPname = "${mrga.pname}";
				$("#headerbar").css({
						"background":"url(displayFile?fileName="+front+end+")",
						"background-repeat" : "no-repeat",
						"background-size" :"cover",
						"background-position":"center",
						 "height": "60vh",
						"z-index":"1"
				});
		
	</script>	
		
		<div id="mrgaInfo" class="text-center mt-3 pt-3">
			<span id="mrgaPname mt-2" >
				<b><a href="detail?pno=${mrga.pno }"> ${mrga.pname }</a></b>
			</span><br>
			<b><span id="mrgaWriter">Photo by <a href="userDetail?uname=${mrga.writer }">${mrga.writer }</a></span></b>
			
		</div>
		</c:when>	
		<c:otherwise>
			<c:choose>
			<c:when test="${login.uid eq 'admin'}">
				<jsp:include page="admin/adminHeader.jsp"></jsp:include>
			</c:when>
			<c:otherwise>
				<jsp:include page="include/header.jsp"></jsp:include>
			</c:otherwise>
			</c:choose>
			
		</c:otherwise>
		</c:choose>
		</div>
	</div>

	<!-- Page Content -->
	<div class="container-fluid" id="cb">
	<c:choose>
			<c:when test="${login.uid eq 'admin'}">
			<div class="row">
			<div class="col">
				
		
		<div class="btn-group-vertical btn-group-lg" >
		 <button type="button" role="group"  onclick="location.href='main'" class="list-group-item list-group-item-action">
    메인
			  </button>
			  <button type="button" role="group"  onclick="location.href='eventList'" class="list-group-item list-group-item-action">이벤트</button>
			  <button type="button" role="group"  onclick="location.href='userList'" class="list-group-item list-group-item-action">회원 정보</button>
			  <button type="button" role="group"  onclick="location.href='suggestions'" class="list-group-item list-group-item-action">건의사항</button>
			  <button type="button" role="group"  onclick="location.href='flagged'" class="list-group-item list-group-item-action" >신고함</button>
		
		</div>
		
		
		
			</div>
			<div class="col-9">
				<c:choose>
					<c:when test="${uri == '/register' }">
						<%@ include file="board/register.jsp"%>
					</c:when>
					<c:when test="${uri == '/detail' }">
						<%@ include file="board/detail.jsp"%>
					</c:when>
					<c:when test="${uri == '/update' }">
						<%@ include file="board/update.jsp"%>
					</c:when>
					<c:when test="${uri == '/userList' }">
						<%@ include file="user/userList.jsp"%>
					</c:when>
					<c:when test="${uri == '/eventList' }">
						<%@ include file="board/eventList.jsp"%>
					</c:when>
					<c:when test="${uri == '/flagged' }">
						<%@ include file="board/flagged.jsp"%>
					</c:when>
						<c:when test="${uri == '/suggestions' }">
						<%@ include file="board/suggestions.jsp"%>
					</c:when>
					<c:otherwise>
						<%@ include file="board/list.jsp"%>
					</c:otherwise>
					</c:choose>
				</div>
			<div class="col">
				
			</div>
			</div>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${uri == '/detail' }">
						<%@ include file="board/detail.jsp"%>
					</c:when>
					<c:when test="${uri == '/productSearch' }">
						<%@ include file="board/productSearch.jsp"%>
					</c:when>
					<c:when test="${uri == '/userDetail' }">
						<%@ include file="user/userDetail.jsp"%>
					</c:when>
					<c:otherwise>
						<%@ include file="include/container.jsp"%>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
</div>	

	<!-- /.container -->
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<jsp:include page="include/footer.jsp"></jsp:include>
	</footer>
</div>
</body>
</html>