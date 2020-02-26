<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<style>
#myContent {
	margin-top: 200px;
}
</style>


<script>
	$(function() {
		
		$.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
        });
		  //input을 datepicker로 선언
        $("#datepicker1").datepicker();                    
        $("#datepicker2").datepicker();
      //From의 초기값을 오늘 날짜로 설정
       var date1Value = "${page.cri.date1}";
        var date2Value = "${page.cri.date2}";
      	if(date1Value == ""){
      		$('#datepicker1').datepicker('setDate', "-1M"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)	
      	}else{
      		$('#datepicker1').datepicker('setDate', date1Value); 
      	}
      	if(date2Value == ""){
      		$('#datepicker2').datepicker('setDate', new Date); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)	
      	}else{
      		$('#datepicker2').datepicker('setDate', date2Value); 
      	}
       
        $("#datepicker1").change(function(){
        	console.log("1change");
        });
        
        $("#datepicker2").change(function(){
        	console.log("2change");
        });
    	
      	console.log("${page.cri.date1}");
      	console.log("${page.cri.date2}");
	});
</script>
</head>
<body>
	<!-- Navigation -->
	<nav id="navbar"
		class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="main">SemoRE</a>
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
							<li class="nav-item active"><a class="nav-link"
								href="logout">로그아웃</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>

	</nav>


	<div class="container" id="myContent">
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Home</a>
				 <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
					href="#nav-profile" role="tab" aria-controls="nav-profile"
					aria-selected="false">Profile</a> 
					
				
				<a class="nav-item nav-link"
					id="nav-follow-tab" data-toggle="tab" href="#nav-follow" role="tab"
					aria-controls="nav-follow" aria-selected="false">follow</a>
			</div>
		</nav>
		<div class="tab-content" id="nav-tabContent">
			<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
				aria-labelledby="nav-home-tab">

				<div class="col" id="myrevList">
					<h4>내가 등록한 리뷰</h4>
					
					<form  class="form-inline my-2 my-lg-0" action="mypage" method="get">
					<input type="hidden" name="uid" value="${user.uid }">
					<input type="hidden" name="uname" value="${user.uname }">
					<input type="text" id="datepicker1" class="form-control mr-sm-2" name="date1"> ~
					 <input type="text" id="datepicker2" class="form-control mr-sm-2" name="date2">
						<input type="text" class="form-control mr-sm-2" id="keyword" name="keyword" placeholder="검색할 키워드를 입력하세요.">
						<input type="submit" class="btn btn-outline-success my-2 my-sm-0" value="검색">
					</form>
					<c:choose>
						<c:when test="${myRevList.size() == 0 }">
							<h3>등록한 리뷰가 없습니다.</h3>
						</c:when>
					<c:otherwise>
					<table class="table">
						<c:forEach items="${myRevList }" var="reviewVO" varStatus="">

							<tr>
								<td><a href="detail?pno=${reviewVO.pno }">${reviewVO.pname }</a>
									<c:forEach begin="1" end="${reviewVO.rate }" var="rateAvg">
										<i class='fas fa-star' style='color: #99ccff;'></i>
									</c:forEach> <c:choose>
										<c:when test="${(reviewVO.rate *2) % 2 eq 1}">
											<i class="fas fa-star-half-alt" style='color: #99ccff;'></i>
											<c:forEach begin="${reviewVO.rate+1 }" end="4">
												<i class='far fa-star' style='color: #99ccff;'></i>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach begin="${reviewVO.rate }" end="4">
												<i class='far fa-star' style='color: #99ccff;'></i>
											</c:forEach>
										</c:otherwise>
									</c:choose></td>

								<td>${reviewVO.regdate }</td>
							</tr>
							<tr>
								<td width="70%"><strong>${reviewVO.rev_subject }</strong><br>${reviewVO.content }</td>
								<td width="30%"><input type="hidden" id="myRno"
									value="${reviewVO.rno }">
									<button type="button" id="my_up_btn" class="btn btn-outline-info">수정</button></td>
							</tr>
							<tr>
								<td><c:forEach items="${revMyFile }" var="rmf">

										<c:if test="${rmf.rno eq reviewVO.rno}">
											<img class='img-thumbnail'
												src='displayFile?fileName=${rmf.fn }' />
										</c:if>
									</c:forEach></td>
							</tr>

						</c:forEach>
						<tr>
							<td colspan="4"><c:if test="${page.prev }">
									<a
										href="mypage?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}&uid=${login.uid}&uname=${login.uname}">[이전]</a>
								</c:if> <c:forEach begin="${page.startPage }" end="${page.endPage}"
									var="num">
									<%-- <a href="list?pageNum=${num }">${num }</a> --%>
									<c:choose>
										<c:when test="${page.cri.pageNum == num }">
											<b><a
												href="mypage?pageNum=${num }&keyword=${page.cri.keyword}&uid=${login.uid}&uname=${login.uname}"
												class="w3-bar-item w3-button w3-green">${num }</a></b>
										</c:when>
										<c:otherwise>
											<a
												href="mypage?pageNum=${num }&keyword=${page.cri.keyword}&uid=${login.uid}&uname=${login.uname}"
												class="w3-bar-item w3-button">${num }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach> <c:if test="${page.next }">
									<a
										href="mypage?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}&uid=${login.uid}&uname=${login.uname}">[다ㅁ음]</a>
								</c:if></td>
						</tr>
					</table>
						</c:otherwise>
					</c:choose>

				</div>

			</div>
			<!-- home tab end  -->
			<div class="tab-pane fade" id="nav-profile" role="tabpanel"
				aria-labelledby="nav-profile-tab">
				<form id="up_user_info_form" action="updateUserInfo" method="post" enctype="multipart/form-data">
				
				<input type="hidden" name="uid" value="${user.uid }">
					<div class='row p-2 my-3 border'>
						<div class='col-md-4'>
							<div class='card' id="profile">
								<c:choose>
									<c:when test="${user.file ne null }">
									<img class='rounded-circle' id="profileImg"  src='displayFile?fileName=${user.file}'
									alt='Card image' style='width: 100%'>
									</c:when>
									<c:otherwise>
										<img class='rounded-circle'   src='resources/image/blankprofile.png'
									alt='Card image' style='width: 100%'>
									</c:otherwise>
								</c:choose>
								
							</div>
							<input type="hidden" data-src="${user.file }" id="profileImgHidden">
						</div>
						<div class="col">
							<div class="custom-file">
								<input type="file" class="custom-file-input mx-sm-3" 
									id="user_profile"> <label
									class="custom-file-label" for="user_profile">프로필 사진 변경</label>
							</div>
							<br>10MB 이내의 JPEG, PNG, GIF 형식이어야 합니다.

						</div>
					</div>

					<div class="">
						<h1>프로필 설정</h1>
						<p>계정 프로필 변경</p>
					</div>

					<div id="" class="border">
						  <div class="form-group row">
							  <label for="uname" class="col-sm-2 col-form-label">닉네임</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" id="uname" name="uname" value="${user.uname }" disabled>
						    </div>
					</div>
						<div class="form-group row">
							<label for="email" class="col-sm-2 col-form-label">Email</label>
						   <div class="col-sm-10">	
						 <input type="email" class="form-control" value="${user.umail }" id="email" name="umail" placeholder="name@example.com">
						 </div>
						</div>
						
						<div class="form-group row">
							<label for="user_info" class="col-sm-2 col-form-label">자기소개</label>
							 <div class="col-sm-10">
							<textarea class="form-control" id="user_info"
								name="user_info" rows="3" placeholder="자기소개는 300자 이하로 해주세요.">${user.user_info }</textarea>
								</div>
						</div>
					
					</div>
					<input type="submit">
				</form>
				
				<div class="row">
					<div class="col-md-6 offset-md-5">
					<button type="button" id="up_info_btn" class="btn btn-primary btn-lg">수정</button>
					</div>
				</div>
			<script type="text/javascript">
				
				$(document).ready(function(){
					
					var originalProfile = "${user.file }";
					
					var start = originalProfile.substring(0,12);
					var end = originalProfile.substring(14);
					console.log(start+end);
					$("#profileImg").attr("src","displayFile?fileName="+start+end);
					console.log(originalProfile);
				});
				
				$("#user_profile").change(function(event) {
					
					//기존에 있는 프로필 사진이 null이 아닐경우 업로드할시 삭제먼저한다. 
					
					
				
					
					
					// var files =
						// event.originalEvent.dataTransfer.files;
						// //?
						var file = $("#user_profile")[0].files[0]; // ?
						var formData = new FormData(); // FormData는
														// 가상의
														// form태그
														// .
						formData.append("file", file); // 파일을
														// 추가.
														// 드래그앤드랍된
														// 파일을
														// 담는다.

						$.ajax({
									url : "uploadAjax",
									data : formData,
									dataType : 'text',
									processData : false,
									contentType : false,
									type : "POST",
									success : function(data) {
										var first = data.substring(0,12);
										var second = data.substring(14);
										var str = "";
											str += "<div><a href=displayFile?fileName="+first+second+">";
											str += "<img class='rounded-circle' style='width: 100%' src='displayFile?fileName="+first+second+"'/>";
											str += "</a><input type='hidden' data-src="+data+">X</small></div>";

										$("#profile").html(str);
									}
								});

					});
				
				
				$("#up_info_btn").on("click",function(){
					var str="";
					
					var origin = $("#profileImgHidden").attr("data-src");
					
					$.ajax({
						url:"deleteFile",
						type:"post",
						data: {
							fileName:$("#profileImgHidden").attr("data-src")
							},
						dataType:"text",
						success:function(result){
							if(result == 'deleted'){
							}
						}
					})
					
					$("#profile input[type=hidden]").each(function() {
						str += "<input type='hidden' name='file' value='"+$(this).attr("data-src")+"'>";
					});
					
					$("#up_user_info_form").append(str);
					
					
					$("#up_user_info_form").submit();
				});
				
			</script>


			</div>
			<!-- profile tab end  -->
			<div class="tab-pane fade" id="nav-follow" role="tabpanel"
				aria-labelledby="nav-follow-tab">


				<div class="row">

					<div class="col">
						<table class="table">

							<tr>
								<td>팔로우 목록</td>
							</tr>
							<c:forEach items="${followList }" var="follow">
								<tr>
									<td><a href="userDetail?uname=${follow.uname }">${follow.follow }</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<div class="row">
						<table class="table">
							<tr>
								<td>팔로워 목록</td>
							</tr>
							<c:forEach items="${followerList }" var="follower">
								<tr>
									<td><a href="userDetail?uname=${follower.follower}">${follower.follower }</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				


			</div>
			<!-- follow tab end  -->
		</div>




	</div>
	<script>
		$("#myrevList")
				.on(
						"click",
						".table button",
						function() {
							var rno = $(this).parent().children("input:hidden")
									.val(); //리뷰의 글번호

							console.log(rno);
							window
									.open("reviewUpdate?rno=" + rno + "", "새창",
											"width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
						});
	</script>

</body>
</html>