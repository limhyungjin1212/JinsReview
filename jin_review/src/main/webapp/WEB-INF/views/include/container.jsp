<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- Jumbotron Header -->
<div class="container">
<div class="text-center">
<h1>주변 지역을 찾아보세요!</h1>  
</div>
<div class="row">
	<div class="col-md-4">
		<a href="productSearch?keyword=헬스"><img alt="" src="resources/image/health.jpg" class="img-thumbnail" >
		Gyms</a>
	</div>
	<div class="col-md-4">
		<a href="productSearch?keyword=호텔"><img alt="" src="resources/image/hotelthumbnail.jpg" class="img-thumbnail">
		Hotels</a>
	</div>
	<div class="col-md-4">
		<a href="productSearch?keyword=카페"><img alt="" src="resources/image/coffee1.jpg" class="img-thumbnail">
		Coffee</a>
	</div>
</div>  

<div class="row text-center">
	<div class="col-md-12">
		<h1> Hot & new Businesses</h1>
	</div>
	
	<c:forEach items="${plist }" var="pVO">
		<div class="col-lg-3 col-md-6 mb-4">
		<div class="card h-100" id="attach">
			<a href="detail?pno=${pVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}"><img class="img-thumbnail" src='displayFile?fileName=${pVO.fn }' height="" alt="not image"></a>
			<div class="card-body">
				<h4 class="card-title"><a href="detail?pno=${pVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}">${pVO.pname }</a></h4>
				<c:forEach  begin="1" end="${pVO.rate }" var="rateAvg">
				<i class='fas fa-star' style='color :#99ccff;' ></i>
			</c:forEach>
			<c:choose>
				<c:when test="${(pVO.rate *2) % 2 eq 1}">
					<i class="fas fa-star-half-alt" style='color :#99ccff;'></i>
					<c:forEach begin="${pVO.rate+1 }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${pVO.rate }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>	
				</c:otherwise>
			</c:choose>
			<p class="card-text">${pVO.rcnt } reviews</p>
			</div>
			<div class="card-footer">
				등록한 날짜 : ${pVO.regdate }
			</div>
		</div>
	</div>
	</c:forEach>
	
	<div class="col-md-8 ">
	<h1>주간 리뷰</h1>
		<div class="container p-3 my-3 bg-primary text-white">
		<h1>${weekReview.rev_subject }</h1>
				<a href="userDetail?uname=${weekReview.writer }">
					<img class="img-thumbnail" style="max-width:100px;" src='displayFile?fileName=${weekReview.us_pf }' alt="not image">
				</a>
		<h3>${weekReview.writer }</h3>
		
		<div>
			${weekReview.content }
		</div>
		<div data-rno="${weekReview.rno }">
		<a href='#' id='oriImg' data-toggle='modal' data-target='#myImgModal'>
			<img style="max-width:60%;" class="img-thumbnail" src="displayFile?fileName=${weekReview.fn }">
			</a>
		</div>
		</div>
	</div>
	
	<div class="col-md-4 ">
		<h3>이벤트</h3>
		<table>
			
		</table>
	</div>
</div>
<!-- Page Features -->


	<p class="display-2 text-center">최근 리뷰</p>

<div id="revBox" class="row">
	<div class="card-columns">
	<c:forEach items="${revlist }" var="reviewVO">
	<c:choose>
		<c:when test="${reviewVO.content == '' }"> <!--내용이 없고 사진만 있을 경우  -->
			<div class="card" id="attach">
			<div class="card-header">
			<div class="row">
			<div class="thumbnail-wrapper" style="width: 25%;">	
			<c:if test="${reviewVO.us_pf != null }">
				<a href="userDetail?uname=${reviewVO.writer }">
					<img class="img-thumbnail" style="max-width:100%;" src='displayFile?fileName=${reviewVO.us_pf }' alt="not image">
				</a>
				</c:if>
			</div>
			<h5 class="mt-0"><a href="userDetail?uname=${reviewVO.writer }">${reviewVO.writer }</a></h5>
					</div>
				</div>
				<div class="card-body">
			<h5 class="card-title">${reviewVO.pname }</h5>
			<div data-rno="${reviewVO.rno }">
			<c:if test="${reviewVO.fn != null }">
				<a href='#' id='oriImg' data-toggle='modal' data-target='#myImgModal'><img class="img-thumbnail" style="max-width:300px;" src='displayFile?fileName=${reviewVO.fn }' alt="not image"></a>
			</c:if>
			</div>
				</div>
				<div class="card-footer">
					<a href="detail?pno=${reviewVO.pno }&pageNum=${rpage.cri.pageNum}&keyword=${rpage.cri.keyword}">리뷰</a>
					<i class="far fa-heart"></i>
					<i class="far fa-bell"></i>
				</div>
			</div>
		</c:when>
		
		<c:otherwise>
		<div class="card" id="attach">
			<div class="card-header">
			<div class="row">
			<div class="thumbnail-wrapper" style="width: 25%;">	
				<c:choose>
				<c:when test="${reviewVO.us_pf != null }">
				<a href="userDetail?uname=${reviewVO.writer }">
					<img class="img-thumbnail" style="max-width:100%;" src='displayFile?fileName=${reviewVO.us_pf }' alt="not image">
				</a>
				</c:when>
				<c:otherwise>
					<img class="img-thumbnail" style="max-width:100%;" src='resources/image/blankprofile.png' alt="not image">
				</c:otherwise>
				</c:choose>
			</div>
			<h5 class="mt-0"><a href="userDetail?uname=${reviewVO.writer }">${reviewVO.writer }</a></h5>
				</div>
			</div>
			<div data-rno="${reviewVO.rno }">
			<c:if test="${reviewVO.fn != null }">
				<a href='#' id='oriImg' data-toggle='modal' data-target='#myImgModal'><img class="img-thumbnail" style="width:100%;" src='displayFile?fileName=${reviewVO.fn }' alt="not image"></a>
			</c:if>
			</div>
			<div class="card-body">
			<h5 class="card-title">${reviewVO.pname }</h5>
				<c:forEach  begin="1" end="${reviewVO.rate }" var="rateAvg">
				<i class='fas fa-star' style='color :#99ccff;' ></i>
			</c:forEach>
			<c:choose>
				<c:when test="${(reviewVO.rate *2) % 2 eq 1}">
					<i class="fas fa-star-half-alt" style='color :#99ccff;'></i>
					<c:forEach begin="${reviewVO.rate+1 }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${reviewVO.rate }" end="4">
						<i class='far fa-star' style='color :#99ccff;' ></i>
					</c:forEach>	
				</c:otherwise>
			</c:choose>
				<p class="card-text">${reviewVO.content }</p>
			</div>
			<div class="card-footer">
				<a href="detail?pno=${reviewVO.pno }&pageNum=${rpage.cri.pageNum}&keyword=${rpage.cri.keyword}">리뷰</a>
				<i class="far fa-heart"></i>
				<i class="far fa-bell"></i>
			</div>
		</div>
		</c:otherwise>
	</c:choose>	
	<!-- </div> -->
</c:forEach>

	</div>
</div>
	<div id="addBtnDiv">
		<button type="button" id="addRevList" class="btn btn-link btn-block">
		<i class=""></i>더보기</button>				
	</div>
</div>

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

var pageNum = ${page.cri.pageNum};

	
	$("#addRevList").on("click",function(){
	
		$.getJSON("addRevList?pageNum="+pageNum, function(data) {
			var str = "";
			var dl = data.length;
			console.log(pageNum);
			console.log(dl);
			if(dl == 0){
				$("#addBtnDiv").hide();
			}
			$(data).each(function(index,data) {
				//// 첫 번째 index는 배열의 인덱스 또는 객체의 키를 의미하고 
				// 두 번째 매개 변수 item은 해당 인덱스나 키가 가진 값을 의미.
				console.log(index);
				
				str += "<div class='card' id='attach'>"
					+ "<div class='card-header'><div class='row'><div class='thumbnail-wrapper' style='width: 25%;'>";
				if(data.us_pf != null){
					str +="<a href='userDetail?uname="+data.writer+"'>";
					str +="<img class='img-thumbnail' style='max-width:100%;' src='displayFile?fileName="+data.us_pf+"' alt='not image'></a>";
				} else{
					str += "<img class='img-thumbnail' style='max-width:100%;' src='resources/image/blankprofile.png' alt='not image'>";
				}
				str += "</div><h5 class='mt-0'><a href='userDetail?uname="+data.writer+"'>"+data.writer+"</a></h5></div></div>";
				if(data.content == null){
					  str +="사진만 나온 것입니다";
				} 
				if(data.fn != null){
					str += "<div data-rno='"+data.rno+"'><a href='#' id='oriImg' data-toggle='modal' data-target='#myImgModal'><img class='img-thumbnail' style='max-width:300px;'  src='displayFile?fileName="+data.fn+"' alt='not image'></a></div>";
				}		
				str += "<div class='card-body'><h4 class='card-title'>"+data.pname+"</h4>";
				for(var i =1; i<=data.rate;i++){
					str+="<i class='fas fa-star' style='color :#99ccff;' ></i>"
				}
				if((data.rate*2) % 2 == 1 ){
					str += "<i class='fas fa-star-half-alt' style='color :#99ccff;'></i>";
					for(var i = data.rate+1;i<=4;i++){
						str += "<i class='far fa-star' style='color :#99ccff;' ></i>";
					}
				} else{
					for(var i = data.rate;i<=4;i++){
						str += "<i class='far fa-star' style='color :#99ccff;' ></i>";
					}
				}
				str += "<p class='card-text'>"+data.content+"</p></div>";
				str += "<div class='card-footer'><a href='detail?pno="+data.pno+"&pageNum=${rpage.cri.pageNum}&keyword=${rpage.cri.keyword}'>리뷰</a>";
				str += "<i class='far fa-heart'></i><i class='far fa-bell'></i></div>" ;
				str += "</div>";
				
			});
			
		
			$(".card-columns").append(str);
			pageNum++;
		});
		
	});
	
	$(document).on("click","#oriImg",function(){
		var rno = $(this).parent().attr("data-rno");
		$.getJSON("replies/revAttach/" + rno,function(data) {
			console.log(data.length);
			var revAttachStr="";
			var revStr ="";
			var revStr2 ="";
				$(data).each(function(index) {
					var start = this.fn.substring(0,12);
					var end = this.fn.substring(14);
					revAttachStr +="<img src='displayFile?fileName="+start+end+"'>";
					if(index == 0){
						console.log(index);
						revStr +="<li class='nav-item'><a class='nav-link active'id='h"+index+"-tab'  data-toggle='tab' href='#h"+index+"' role='tab' aria-controls='h"+index+"' aria-selected='true'>" +
						"<img src='displayFile?fileName="+this.fn+"'></a></li>";
						revStr2 +="<div class='tab-pane fade show active' id='h"+index+"' role='tabpanel' aria-labelledby='h"+index+"-tab'>" +
				         "<img style='width:100%; max-height:500px;' src='displayFile?fileName="+start+end+"'>" +
						"</div>" ;
					} else{
					revStr +="<li class='nav-item'><a class='nav-item nav-link' id='h"+index+"-tab' data-toggle='tab' href='#h"+index+"' role='tab' aria-controls='h"+index+"' aria-selected='true'>" +
					"<img src='displayFile?fileName="+this.fn+"'></a></li>";
					
					revStr2 +="<div class='tab-pane fade'  id='h"+index+"' role='tabpanel' aria-labelledby='h"+index+"-tab'>" +
					         "<img style='max-width:400px;' src='displayFile?fileName="+start+end+"'>" +
							"</div>" ;
					}
					console.log("revStr="+revStr);
					console.log("revStr2="+revStr2);
				});
		
			//$("#oriImgList").html(revStr);
			//$("#oriImgBox").html(revAttachStr);
			
			$("#myTab").html(revStr);
			$("#myTabContent").html(revStr2);
		});
		
	});
</script>

<!-- /.row -->