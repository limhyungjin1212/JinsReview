<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/474aec6043.js" crossorigin="anonymous"></script>
</head>
<body>
<h1>리뷰 수정</h1>
<h1>모달수정?</h1>




					<div id="updateDiv">
					
					<span id="up_rate">
					${rv.rate }
					 	<c:forEach begin="1" end="${rv.rate }" >
							<i class='fas fa-star' style='color :#99ccff;'></i>
						</c:forEach> 
						
						<c:if test="${rv.rate ne 5 }">
							<c:forEach begin="${rv.rate }" end="4">
								<i class='far fa-star'  style='color :#99ccff;'></i>
							</c:forEach>
						</c:if>
					</span> 
					<input type="hidden" id="rate" name="rate" value="${rv.rate }">
					<br> 
					<input type="text" class="form-control" id="up_rev_subject" name="rev_subject" autocomplete="off" placeholder="한줄 요약을 해주세요" value="${rv.rev_subject }"><br>
					<textarea placeholder="리뷰는 도움이 됩니다." class="form-control" rows="5" name="content" id="up_replytext">${rv.content }</textarea>
					
					<div id="rev_up_file">
						<h1>${rvd.pno }</h1>
							<c:forEach items="${rfd}" var="rfd">
							<div>
							<img alt="" style="width:150px; height:150px;" src="displayFile?fileName=${rfd.fn }">
							<small data-src="${rfd.fn }">X</small>
							</div>
							</c:forEach>
					
					<div>
						<input type="file" id="files" multiple>
						<div id="rv_update_upload">
						
						</div>
					</div>
					</div>
						</div>
						<input type="submit" >
						<div align="right">
							<button type="button" id="replyModBtn" class="btn btn-outline-primary">수정</button>
							<button type="button" id="replyDelBtn" class="btn btn-outline-danger">삭제</button>
							<button type="button" id="closeBtn" onclick="self.close()" class="btn btn-outline-dark">닫기</button>
						</div>
					
				<script>
				
				
				$("#up_rate i").on("click", function() {
					var thisrate = $(this);
					$("#up_rate i").css("color", "");

					$(this).attr("class","fas fa-star").css("color", "#99ccff").prevAll().attr("class","fas fa-star").css("color", "#99ccff");
					var j = $(this).index();
					alert(j + 1);
					console.log(this);
					$("#rate").val(j + 1);

				});		
				
				
				$("#rev_up_file").on("click","small",function(event){
					var that = $(this);
					var filedel = confirm("파일을 삭제하면 완전히 사라집니다.");
					if(filedel){
						$.ajax({
							url:"deleteFile",
							type:"post",
							data: {
								fileName:$(this).attr("data-src")
								},
							dataType:"text",
							success:function(result){
								if(result == 'deleted'){
									alert("deleted");
									that.parent("div").remove();
								}
							}
						})
					}else{
					    alert("파일삭제취소");
					}
					
				}); //small click end
				
				
				
				$("#files").change(function(event) {
					// var files =
						// event.originalEvent.dataTransfer.files;
						// //?
						var file = $("#files")[0].files[0]; // ?
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
										// console.log(data);
										// alert(data);
										// alert(checkImageType(data));
										var str = "";
										str += "<div><a href=displayFile?fileName="+data+">";
										str += "<img src='displayFile?fileName="+data+"'/>";
										str += "</a><small data-src="+data+">X</small></div>";

										$("#rv_update_upload").append(str);
										
									}
								});

					});
				
				
				
				
				$("#replyModBtn").on("click", function() {
					var rno = ${rv.rno };
						
					var repMod = confirm("수정하시겟씁니까?");
					
					if(repMod){
						
						var content = $("#up_replytext").val();
						var rev_subject = $("#up_rev_subject").val();
						var rate = $("#rate").val();
						
						var arr = [];
						$("#rev_up_file small").each(function(index){
							arr.push($(this).attr("data-src"));
							console.log(arr);
						});
						var files = arr;
						
						
						console.log(arr);
						
						
						$.ajax({
							type : 'put',
							url : 'replies/'+rno,
							contentType : "application/json;charset=utf-8",
							data : JSON.stringify({
								rno : rno,
								content : content,
								rev_subject : rev_subject,
								rate : rate,
								files : files
							}),
							dataType : "text",
							success : function(data) {
								if (data == 'success') {
									alert("수정 정상처리 됨");
									opener.parent.location.reload(); //수정하고 닫으면서 팝업창의 부모창을 새로고침.
									self.close(); //팝업창을 닫음
								}
							},
							error : function(err) {
								alert("수정 실패!!")
							}
						});
					} else{
						alert("수정안함.");
						
					}
					 
					
				});
				
				$("#replyDelBtn").on("click", function() {
					var rno = ${rv.rno };
						
					var repDel = confirm("정말로 리뷰를 삭제할까요?");
					
					if(repDel){
							$.ajax({
								type : 'delete',
								url : 'replies/' + rno,
								contentType : "application/json;charset=utf-8",
								dataType : "text",
								success : function(data) {
									
									if (data == 'success') {
										alert("삭제 정상처리 됨");
										opener.parent.location.reload(); //수정하고 닫으면서 팝업창의 부모창을 새로고침.
										self.close(); //팝업창을 닫음
									}
								},
								error : function(err) {
									alert("삭제 실패!!")
								},
								complete : function(){
									
								}
							});
						}else{
							alert("삭제 취소.");
							
						}
						 
					 
					
				});
				
				</script>
				
</body>
</html>