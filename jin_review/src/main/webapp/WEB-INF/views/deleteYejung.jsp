<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
/*var rev_subject = $(this).parent().parent().children("p:first"); //리뷰의 제목
var rate = $(this).parent().parent().children("span:first"); //리뷰의 별점


var reply = $(this).parent().parent().children("span:last"); //리뷰의 내용
console.log(reply);


var fn = $(this).parent().parent().children("img"); // 업로드된 파일
var up_fn = fn.attr("src");
console.log(up_fn);


var up_rate = rate.text();
console.log("rate="+up_rate);
var up_rev_subject = rev_subject.text(); //리뷰의 제목의 text를 담는다
console.log(up_rev_subject);
var replytext = reply.text();

var rateStr = "";
for (var i = 0; i < up_rate; i++) { //댓글의 별점에따른 별 갯수
	rateStr += "<i class='fas fa-star' style='color :#99ccff;'></i> ";
}
if (up_rate != 5) { //5점이아니면 
	for (var j = up_rate; j < 5; j++) {
		rateStr += "<i class='far fa-star'  style='color :#99ccff;'></i> ";
	}
}
var up_img_src = "";

if(up_fn !=null){
	up_img_src="<img src='"+up_fn+"' style='width:150px; height:150px;'></img>";
	$("#updateDiv").append(up_img_src);
}



$(".modal-title").html(rno);
$("#up_rate").html(rateStr);
$("#up_rev_subject").val(up_rev_subject);
$("#up_replytext").val(replytext);


$("#up_rate i").on("click", function() {
	var thisrate = $(this);
	$("#up_rate i").css("color", "");

	$(this).css("color", "#99ccff").prevAll().css("color", "#99ccff");
	var j = $(this).index();
	alert(j + 1);
	$("#up_rate").val(j + 1);

});
*/
</script>
<body>

</body>
</html>

<%-- 	<c:if test="${page.prev }">
								<a	href="?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}">[이전]</a>
							</c:if> <c:forEach begin="${page.startPage }" end="${page.endPage}"
								var="num">
								<a href="list?pageNum=${num }">${num }</a>
								<c:choose>
									<c:when test="${page.cri.pageNum == num }">
										<b><a
											href="?pageNum=${num }&keyword=${page.cri.keyword}"
											class="w3-bar-item w3-button w3-green">${num }</a></b>
									</c:when>
									<c:otherwise>
										<a href="?pageNum=${num }&keyword=${page.cri.keyword}"
											class="w3-bar-item w3-button">${num }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${page.next }">
								<a href="?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}">[다ㅁ음]</a>
							</c:if> --%>