<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	var result = "${msg}";

	if (result == 'wsuccess') {
		alert('글 등록 완료');
	} else if (result == 'dsuccess') {
		alert('글 삭제 완료');
	}
</script>
<div class="container">
<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">상품 리스트</h6>
	</div>

	<!-- Topbar Search -->
	<form action="main" method="get"
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<%-- <input type="hidden" name="pageNum" value="${page.cri2.pageNum }"> --%>
			<input type="text" name="keyword"
				class="form-control bg-light border-0 small"
				placeholder="키워드를 검색하세요." aria-label="Search"
				aria-describedby="basic-addon2">
			<div class="input-group-append">
				<input class="btn btn-primary" type="submit" value="검색">
			</div>
		</div>
	</form>

	<div class="card-body">
		<div class="table-responsive">
			<table class="table" id="dataTable">
				<thead class="thead-dark">
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">분류</th>
						<th scope="col">제목</th>
						<th scope="col">연락처</th>
						<th scope="col">작성일자</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>글번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>연락처</th>
						<th>작성일자</th>
					</tr>
					
					<tr>
						<td><a href="register">글쓰기</a></td>
						<td colspan="4">
						<c:if test="${page.prev }">
								<a
									href="main?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}">[이전]</a>
							</c:if> <c:forEach begin="${page.startPage }" end="${page.endPage}"
								var="num">
								<%-- <a href="list?pageNum=${num }">${num }</a> --%>
								<c:choose>
									<c:when test="${page.cri.pageNum == num }">
										<b><a
											href="main?pageNum=${num }&keyword=${page.cri.keyword}"
											class="w3-bar-item w3-button w3-green">${num }</a></b>
									</c:when>
									<c:otherwise>
										<a href="main?pageNum=${num }&keyword=${page.cri.keyword}"
											class="w3-bar-item w3-button">${num }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach> <c:if test="${page.next }">
								<a
									href="main?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}">[다ㅁ음]</a>
							</c:if></td>
					</tr>
				</tfoot>
				<tbody>
					<c:if test="${plist.size() == 0 }">
						<h3>데이터가 없습니다.</h3>
					</c:if>
					<c:forEach items="${adminList }"  var="boardVO">
						<tr>
							<td>${boardVO.pno }</td>
							<td>${boardVO.pcate }</td>
							<td>
							<a href="detail?pno=${boardVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}">${boardVO.pname }</a>
							</td>
							<td>${boardVO.ptel }</td>
							<td>${boardVO.regdate }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

		</div>
	</div>
</div>
</div>
