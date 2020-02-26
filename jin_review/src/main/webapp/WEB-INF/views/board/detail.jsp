<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#map {
	width: 300px;
	height: 300px;
	background-color: grey;
}

#reply {
	background-color: #66ccff;
}

.carousel-inner img {
	width: 25%;
	height: 300px;
}

.attach {
	list-style-type: none;
}

.attach li {
	display: inline;
}

</style>


<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<!-- The slideshow -->
	<div class="carousel-inner" id="carouselBox">
		
	</div>

	<!-- Left and right controls -->
	<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>

</div>

<script>
	var result = "${msg}";

	if (result == 'wsuccess') {
		alert('글 등록 완료');
	} else if (result == 'dsuccess') {
		alert('글 삭제 완료');
	} else if (result == 'fail') {
		alert('로그인 실패');
	} else if (result == 'usuccess') {
		alert('수정 완료');
	}

	// This example requires the Places library. Include the libraries=places
	// parameter when you first load the API. For example:
	// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

	var map;
	var service;
	var infowindow;

	function initMap() {
		var sydney = new google.maps.LatLng(35.907801, 127.767662);

		infowindow = new google.maps.InfoWindow();

		map = new google.maps.Map(document.getElementById('map'), {
			center : sydney,
			zoom : 17
		});

		var request = {
			query : '${detail.place}',
			fields : [ 'name', 'geometry' ],
		};

		service = new google.maps.places.PlacesService(map);

		service.findPlaceFromQuery(request, function(results, status) {
			if (status === google.maps.places.PlacesServiceStatus.OK) {
				for (var i = 0; i < results.length; i++) {
					createMarker(results[i]);
				}

				map.setCenter(results[0].geometry.location);
			}
		});
	}

	function createMarker(place) {
		var marker = new google.maps.Marker({
			map : map,
			position : place.geometry.location
		});

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(place.name);
			infowindow.open(map, this);
		});
	}
</script>


<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap"
	async defer></script>



<div class="container">

	<div class="row">
		<div class="col-sm-4">
			<table class="table table-borderless">
				<tr>
					<td><strong>${detail.pname }</strong></td>
				</tr>
				<tr>
					<td>${detail.rate }
					<c:forEach begin="1" end="${detail.rate }"
							var="rateAvg">
							<i class='fas fa-star' style='color: #99ccff;'></i>
						</c:forEach> 
					<c:choose>
							<c:when test="${(detail.rate *2) % 2 eq 1}">
								<i class="fas fa-star-half-alt" style='color: #99ccff;'></i>
								<c:forEach begin="${detail.rate+1 }" end="4">
									<i class='far fa-star' style='color: #99ccff;'></i>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach begin="${detail.rate }" end="4">
									<i class='far fa-star' style='color: #99ccff;'></i>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</td>
					<td>리뷰 총 갯수 : ${detail.rcnt }</td>
				</tr>
				<tr>
					<td class="pcate">${detail.pcate }</td>
				</tr>
			</table>
		</div>
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			연락처 :${detail.ptel } <br> 등록일 :${detail.regdate }
		</div>
	</div>

	<div class="bestReviewBox"></div>
	<div class="col-md-6">
		<div id="map"></div>
	</div>
	<div class="col-md-6">
		<div>영업시간 :</div>
	</div>


	<div class="form-group">
		<label for="comment">Comment:</label>
		<textarea rows="5" class="form-control" readonly>${detail.pinfo }</textarea>

		<c:if test="${login.uid eq 'admin' }">
			<button class="btn-primary"
				onclick="location.href='update?pno=${detail.pno}'">수정</button>
			<button onclick="location.href='delete?pno=${detail.pno}'">삭제</button>
		</c:if>


	</div>
	<br>

	<div class="reviewBox">
		<ul id="replies" class="w3-ul"></ul>
	</div>
	<br>

	<ul class="pagination"></ul>

	<input type="hidden" id="loginfo" value="${login.uname}">



	<c:choose>
		<c:when test="${not empty login }">
			<div>
				<form id="rvWrite" name="rvWrite" enctype="multipart/form-data">
					<input type="hidden" name="writer" id="newWriter" value="${login.uname}">
					 <input type="hidden" name="pno" id="newPno" value="${detail.pno }"> 리뷰 
					 <span class="rate">
					 	<i class='fas fa-star'></i> 
					 	<i class='fas fa-star'></i> 
					 	<i class='fas fa-star'></i> 
					 	<i class='fas fa-star'></i> 
					 	<i class='fas fa-star'></i>
					</span> <br> 
					<input type="hidden" id="rate" name="rate" value="1">
					<input type="text" class="form-control" id="rev_subject"
						name="rev_subject" autocomplete="off" placeholder="한줄 요약을 해주세요" required="required"><br>
					<textarea placeholder="리뷰는 도움이 됩니다." class="form-control" rows="5"
						name="content" id="newReplyText"></textarea>


					<!-- // 파일 선택창에서 하나의 파일만 선택 가능
				<input name="files" id="fileupload" type="file" />
				// 파일 선택창에서 여러개의 파일을 한번에 
				<input name="files" id="fileupload" type="file" multiple />
 -->

					<input type="file" id="files" multiple="multiple">
					<div class="rvUploadedlist"></div>
					
					<div align="right">
					<button id="replyAddBtn" class="btn btn-primary">리뷰 등록</button>
					<button class="btn btn-light" onclick="location.href='main'">목록</button>
					</div>
				</form>

			</div>
		</c:when>
		<c:otherwise>
			<div>
				<h5>
					리뷰 등록을 원하시면 로그인을 해주세요
				</h5>
			</div>

			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#myModal">로그인하러가기a</button>
			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">로그인</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<form action="loginPost" method="post">
								<input type="hidden" id="ref" name="ref">
								<script>
									$("#ref").val(location.href);
								</script>
								<input class="w3-input w3-border" type="text" name="uid"
									placeholder="아이디"> <input class="w3-input w3-border"
									type="password" name="upw" placeholder="비밀번호"> <input
									type="checkbox" name="useCookie">로그인 유지<br> <input
									class="w3-input w3-border" type="submit" value="로그인">
							</form>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>

					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<!-- The Modal -->
			<div class="modal" id="myImgModal">
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title"></h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body" id="imgModalBody">
								<ul class="nav nav-tabs" id="myTab" role="tablist">
  								</ul>
								<div class="tab-content" id="myTabContent">
									
								</div>
							</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>

					</div>
				</div>
			</div>
	<script>
		var str2 = "";
		var pno = ${detail.pno};
		var loginfo = $("#loginfo").val();
		
		function getPageList(page) {
			$.getJSON("replies/" + pno + "/" + page,function(data) { //getJSON으로 데이터를 불러온다.
								var str2 = "";
								$(data.list).each(function() {
									var reno = this.rno;
									var btnHelp = false;
									var userName = this.writer;
									
									str2+="<div class='row p-2 my-3 border'>";
									str2 += "<div class='col-md-2'><div class='card'><div class='card-body'>";
												$(data.userDetail).each(function(){
													if(this.uname == userName){
														if(this.file != null){
															str2 += "<a href='userDetail?uname="+this.uname+"'><img class='rounded-circle' src='displayFile?fileName="+this.file+"' alt='Card image' style='width:100%'></a>";	
															return false;
														}else{
															str2 += "<a href='userDetail?uname="+this.uname+"'><img class='rounded-circle' src='resources/image/coffee1.jpg' alt='Card image' style='width:100%'></a>";
															return false;
														}
													}
												});
													
												str2 += "<h4 class='card-title'>"+this.writer+"</h4>";
													str2 += "<p class='card-text'>"
															+ this.urCnt
															+ " 리뷰 갯수</p>";
													if(loginfo != userName){
														str2 += "<a href='userDetail?uname="+this.writer+"' class='btn btn-primary' >follow</a>";	
													}
													
													str2 += "</div></div></div>";
													str2 += "<div class='col-md-10 border' id='repl'><li data-rno='"+this.rno+"' class='replyLi'><br><span>"+this.rate+"</span>";

													for (var i = 0; i < this.rate; i++) { //댓글의 별점에따른 별 갯수
														str2 += "<i class='fas fa-star' style='color :#99ccff;'></i>";
													}
													if (this.rate != 5) { //5점이아니면 
														for (var j = this.rate; j < 5; j++) {
															str2 += "<i class='far fa-star'  style='color :#99ccff;'></i>	 ";
														}
													}

													str2 += "" + this.regdate
															+ "<br>"
															+ this.helpful
															+ "명 에게 도움됨<br>";

													$(data.rfd).each(function() {
																if(this.rno == reno ) { //첨부파일이 있으면
																
																str2 += "<a href='#' id='oriImg' data-toggle='modal' data-target='#myImgModal'><img class ='img-thumbnail' id='revImg' style='width:150px; height:150px;' src='displayFile?fileName="
																		+ this.fn
																		+ "'/></a>";
																} 
															});
													
															
													str2 += "<br><p><strong>"
															+ this.rev_subject
															+ "</strong></p><br><br>"
															+ "<span>"+this.content+"</span>";
													
													if (loginfo == this.writer) {
														str2 += "<input type='button' id='rev_up_btn' class='btn btn-outline-info' id='btnUpdate' value='수정'></p></li></div></div>";
													} else {
														str2 += "<p>리뷰가 도움이 되셧나요?";
														
														
														$.each(data.revHelpfulList,function(key,value){ //도움이 된 사람의 리스트
																
																//console.log("key="+key);
																//console.log("reno="+reno);
																
																if(key == reno){ //key값으로 받아온 댓글의 번호가 리뷰의 rno와 같으면
																	//console.log(this);
																	$.each(value,function(){ //도움이 된 사람의 목록을 불러옴
																		//console.log(this);
																		if(loginfo == this){ //로그인한 정보가 도움이 된 사람의 목록이랑 같으면
																			//console.log("true="+this);
																			btnHelp = true;  //버튼help를 트루로
																		} else{
																			//console.log("false="+this);
																			btnHelp = false; //그렇지 않으면 false
																		}
																	});
																}
															
														});
														//console.log("rno="+this.rno+"btnHelp="+btnHelp);
														if(btnHelp){
															str2 += "<button type='button' id='btnHelpful' class='btn btn-outline-primary btn-sm' disabled ><small>도움이 돼요</small></button>"	
															+ "<button type='button' id='btnHelpfuldis' class='btn btn-outline-primary btn-sm'><small>도움 안 돼요</small></button>";
														} else{
															str2 += "<button type='button' id='btnHelpful' class='btn btn-outline-primary btn-sm' ><small>도움이 돼요</small></button>"	
																+ "<button type='button' id='btnHelpfuldis' class='btn btn-outline-primary btn-sm' disabled><small>도움 안 돼요</small></button>";
														}
														str2 += "</p></li></div></div>";
													}
												});
								
								$("#replies").html(str2);

								printPaging(data.page);

							});
		}
		function printPaging(page) {

			var str3 = "";

			if (page.prev) {
				str3 += "<li><a href='" + (page.startPage - 1)
						+ "' > [이전] </a></li> ";
			}

			for (var i = page.startPage, len = page.endPage; i <= len; i++) {
				var strClass = page.cri.page == i ? 'class=active' : '';
				str3 += "<li "+strClass+"><a class='page-link' href='"+i+"'>"
						+ i + "</a></li>";
			}
			if (page.next) {
				str3 += "<li><a class='page-link' href='" + (page.endPage + 1)
						+ "' > [다음] </a></li> ";
			}
			$('.pagination').html(str3);
		}
		var replyPage = 1;
		$(".pagination").on("click", "li a", function(event) {
			event.preventDefault(); //<a href=""> 태그의 기본동작인 페이지 전환을 막는 역할을 한다. 

			replyPage = $(this).attr("href"); //이동을 막고 현재 클릭된 페이지의 번호를 얻어내고. 리스트 호출

			getPageList(replyPage);
		});

		getPageList(1); //첫댓글은 1페이지.

		$(".rate i").on("click", function() {
			var thisrate = $(this);
			$(".rate i").css("color", "");

			$(this).css("color", "#99ccff").prevAll().css("color", "#99ccff");
			var j = $(this).index();
			$("#rate").val(j + 1);

		});
		
		
		
	
		
		
	</script>


	
<div>
					<h1></h1>
					</div>
					<div>
					<h1></h1>
					</div>
	
</div>




<!-- The Modal -->
			<div class="modal" id="modDiv">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">수정</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<h1>모달수정?</h1>
							<div id="updateDiv">
							<span id="up_rate">
					 	
							</span> 
					<br> 
						
					<input type="text" class="form-control" id="up_rev_subject" name="rev_subject" autocomplete="off" placeholder="한줄 요약을 해주세요"><br>
					<textarea placeholder="리뷰는 도움이 됩니다." class="form-control" rows="5"
						name="content" id="up_replytext"></textarea>
					
						</div>
						<div align="right">
							<button id="replyModBtn" class="btn btn-outline-primary">수정</button>
							<button id="replyDelBtn" class="btn btn-outline-danger">삭제</button>
							<button id="closeBtn" class="btn btn-outline-dark">닫기</button>
						</div>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>

					</div>
				</div>
				
				
			</div>


<script>
	function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}

	function getImageLink(fileName) {
		if (!checkImageType(fileName)) {
			return;
		}
		var front = fileName.substr(0, 12); //   /2020/01/07/
		var end = fileName.substr(14); //  7163ad49-a36d-4afe-bf82-e496526b4b40_coffee2.jpg 앞에 s_를 떼준다.

		//alert("front"+front);
		//alert("end"+end);

		return front + end;
	}

	function getOriginalName(fileName) {
		if (checkImageType(fileName)) { //이미지 파일이면 skip
			return;
		}

		var idx = fileName.indexOf("_") + 1; //uuid를 제외한 파일이름을 리턴함
		return fileName.substr(idx);
		/*alert("fileName :" + fileName);
		return fileName;*/
	}

	
	var pno = ${detail.pno};

	$.getJSON("detailJSON?pno=" + pno,function(data) {
						console.log(data.length);
						
						var str = "";
						var strr = "";
						
						$(data).each(function(index, data) {
											//// 첫 번째 index는 배열의 인덱스 또는 객체의 키를 의미하고 
											// 두 번째 매개 변수 item은 해당 인덱스나 키가 가진 값을 의미.
											var idx = this.boardAttachList.length;
											$(this.boardAttachList).each(function(index,data){
												if(index == 0){
													str += "<div class='carousel-item active'><ul class='attach'>"+
													 "<li><img class ='img-thumbnail'  src='displayFile?fileName="
														+ getImageLink(data)
														+ "'/></li>";
												} else if(index == idx){
													str += "</ul></div>";
												}else{
													if (index % 4 != 0) {
														str += "<li><img class ='img-thumbnail'  src='displayFile?fileName="
															+ getImageLink(data)
															+ "'/></li>";
													} else{
														str += "</ul></div><div class='carousel-item'>";
														str += "<ul class='attach'><li><img class ='img-thumbnail'  src='displayFile?fileName="
																+ getImageLink(data)
																+ "'/></li>";
													}
												}
											});
											console.log("idx2번쨰:"+idx);
											var idxResult = idx % 4;
											console.log("idxResult"+idxResult);
											var idxxlength = this.repFileDetail.length;
											$(this.repFileDetail).each(function(idxx){
												
												if((idxx+idxResult) % 4 == 0){ //위에서 보드 사진의 길이와 리뷰의 사진 길이를더해서 4로나눈 몫이 0이면 캐러샐 div 생성 
													str += "</ul></div><div class='carousel-item'>";
													str += "<ul class='attach'><li><img class ='img-thumbnail'  src='displayFile?fileName="
														+ getImageLink(this.fn)
														+ "'/></li>";
												} else if(idxx == idxxlength){ //리뷰의 사진의 길이가 마지막이면 닫는다.
													str += "</ul></div>";
												} else{
													if ((idxx+idxResult) % 4 != 0) { //보드사진의 길이와 리뷰사진의 길이를 더해서 4로나눈 몫이 0이 아니면 li생성
														str += "<li><img class ='img-thumbnail'  src='displayFile?fileName="
															+ getImageLink(this.fn)
															+ "'/></li>";
													} 
												}
												
												console.log(this.fn);
												
											});
											
										});

						$("#carouselBox").append(str);
					});
	
	
	
</script>


<script type="text/javascript" src="resources/js/reply.js?ver=87"></script>

