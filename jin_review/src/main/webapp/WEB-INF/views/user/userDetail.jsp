<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script type="text/javascript" src="resources/js/userDetail.js"></script> -->
<div class="container">
	<div class="row p-3 my-2 border">
		<div class='col-md-3'>
			<div class='card'>
				<c:choose>
					<c:when test="${user.file ne null }">
						<img class='rounded-circle' id="profileImg"
							src='displayFile?fileName=${user.file}' alt='Card image'
							style='width: 100%'>
					</c:when>
					<c:otherwise>
						<img class='rounded-circle' src='resources/image/blankprofile.png'
							alt='Card image' style='width: 100%'>
					</c:otherwise>
				</c:choose>
				<div class='card-body'>
					<h4 class='card-title'>${user.uname }</h4>
				</div>
			</div>
		</div>
		<div class="col">
			<h5>작성한 리뷰 개수 : ${mrcnt }</h5>
			<h5>팔로워 수 : ${flcnt }</h5>
			<div class="">
				<label for="user_info" class="col-sm-2 col-form-label">자기소개</label>
				<div class="col-sm-10">${user.user_info }</div>
			</div>

			<div id="fbtn">
				<button type='button' id='followBtn' class='btn btn-primary'>팔로우</button>
			</div>
			
		</div>
		<div class="col">
			<div id="demo" class="collapse">
				<form action="message" method="post" >
						<div class="form-group">
						    <label for="messageWriter">보내는 사람</label>
						    <input type="text" class="form-control" id="messageWriter" value="${login.uname }" readonly>
					  	</div>
						<div class="form-group">
						    <label for="messageContent">내용 </label>
						    <textarea class="form-control" id="messageContent" rows="3"></textarea>
					  </div>
					  <div align="right">
					  	<input type="submit" class="btn btn-primary" value="보내기">
					  </div>
				</form>    
  				</div>
  			</div>
	</div>



	<script>
		$(document)
				.ready(
						function() {

							function flwlChk() {
								$(".flwl a").each(function(index) {
									var str = "";
									var flwl = $(this).text();
									console.log(flwl);
									if (flwl == "${login.uid}") {
										str += "<button type='button' id='followDisBtn' class='btn btn-primary'>팔로우해제</button>"+
										"<button type='button' id='messagewrite' class='btn btn-outline-success' data-toggle='collapse' data-target='#demo'>메세지 작성</button>";
										$("#fbtn").html(str);
										return false;
									} else {
										str += "<button type='button' id='followBtn' class='btn btn-primary'>팔로우</button>";
									}
								});
							}
							flwlChk();

							$(document)
									.on(
											"click",
											"#followBtn",
											function() {

												//유저의 정보
												var uid = "${user.uid}";
												//로그인한 유저의 정보
												var myid = "${login.uid}";

												//유저의 정보가 없으면 로그인.
												if (myid == "") {
													alert("로그인이 필요합니다");
													location.href = "login";
													return false;
												} else {
													$
															.ajax({
																url : "follow",
																type : "post",
																data : {
																	uid : uid,
																	myid : myid
																},
																dataType : "text",
																success : function(
																		data) {
																	console
																			.log(data);
																	if (data == "success") {
																		alert("팔로우 성공");
																		$("#fbtn").append("<span class='flwl' id='"+myid+"'>"
																								+ myid
																								+ "</span>");
																		flwlChk();
																	}
																},
																error : function(
																		err) {
																	alert("팔로우 실패");
																}

															});

												}

											});

							$(document).on(
									"click",
									"#followDisBtn",
									function() {
										//유저의 정보
										var uid = "${user.uid}";
										//로그인한 유저의 정보
										var myid = "${login.uid}";

										//유저의 정보가 없으면 로그인.
										if (myid == "") {
											alert("로그인이 필요합니다");
											location.href = "login";
											return false;
										} else {
											$.ajax({
												url : "unfollow",
												type : "post",
												data : {
													uid : uid,
													myid : myid
												},
												dataType : "text",
												success : function(data) {
													console.log(data);
													if (data == "success") {
														alert("팔로우 해제");
														$("#" + myid + "")
																.remove();
														flwlChk();
													}
												},
												error : function(err) {
													alert("팔로우 실패");
												}

											});

										}

									});

						});
	</script>




	<div class="row">
		<div class="col-md-6">
			<table>
				<tr>
					<td>${user.uname }</td>
				</tr>
			</table>
			<h4>리뷰</h4>
			<c:if test="${myRevList.size() == 0 }">
				<h3>등록한 리뷰가 없습니다.</h3>
			</c:if>

			<c:forEach items="${myRevList }" var="reviewVO">
				<div class="card">
					<div class="card-header">
						<div class="col">
							<a href="detail?pno=${reviewVO.pno }">${reviewVO.pname }</a>
						</div>
						<div class="col">
							<c:forEach begin="1" end="${reviewVO.rate }" var="rateAvg">
								<i class='fas fa-star' style='color: #99ccff;'></i>
							</c:forEach>
							<c:choose>
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
							</c:choose>
						</div>
					</div>
					<div class="card-body">
						<div>
							<c:forEach items="${revMyFile }" var="rmf">
								<c:if test="${rmf.rno eq reviewVO.rno}">
									<img class='img-thumbnail'
										src='displayFile?fileName=${rmf.fn }' />
								</c:if>
							</c:forEach>
						</div>
						<div>${reviewVO.content }</div>
					</div>
					<div class="card-footer">${reviewVO.regdate }</div>
				</div>
			</c:forEach>
			<div>
				<c:if test="${page.prev }">
					<a
						href="userDetail?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}&uname=${user.uname}">[이전]</a>
				</c:if>
				<c:forEach begin="${page.startPage }" end="${page.endPage}"
					var="num">
					<%-- <a href="list?pageNum=${num }">${num }</a> --%>
					<c:choose>
						<c:when test="${page.cri.pageNum == num }">
							<b><a
								href="userDetail?pageNum=${num }&keyword=${page.cri.keyword}&uname=${user.uname}"
								class="w3-bar-item w3-button w3-green">${num }</a></b>
						</c:when>
						<c:otherwise>
							<a
								href="userDetail?pageNum=${num }&keyword=${page.cri.keyword}&uname=${user.uname}"
								class="w3-bar-item w3-button">${num }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${page.next }">
					<a
						href="userDetail?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}&uname=${user.uname}">[다ㅁ음]</a>
				</c:if>
			</div>

		</div>

		<div class="col">
			<h1>이사람의 팔로워 목록</h1>
			<c:choose>
				<c:when test="${not empty followerList }">
					<c:forEach items="${followerList }" var="fl">

						<div class="card mb-3" style="max-width: 540px;">
							<div class="row no-gutters">
								<div class="col-md-4">
									<c:choose>
										<c:when test="${fl.file ne null }">
											<img src="displayFile?fileName=${fl.file}" class="card-img"
												alt="...">
										</c:when>
										<c:otherwise>
											<div>
												<img class='card-img' src='resources/image/blankprofile.png'
													alt='Card image'>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">
											<span class="flwl" id="${fl.follower }">
											<a href="userDetail?uname=${fl.uname }">${fl.follower }</a>
											</span>
										</h5>
										<p class="card-text">리뷰 수 : ${fl.frcnt }
										</p>
										<p class="card-text">
											<small class="text-muted">팔로워 수 :${fl.ffcnt }</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<span class="flwl">팔로워가 없습니다.</span>
				</c:otherwise>
			</c:choose>
			<h1>추천.</h1>
		</div>
	</div>
</div>
