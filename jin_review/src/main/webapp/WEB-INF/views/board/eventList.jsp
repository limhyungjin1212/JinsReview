<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<table class="table">
    	<thead>
    	<tr>
    		<th scope="col">글번호</th>
    		<th scope="col">이벤트</th>
    		<th scope="col">등록일</th>
    		<th scope="col">만료일</th>
    		<th scope="col">행사포스터</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${peventList }" var="boardVO">
		<tr>
    		<td scope="row">${boardVO.pno }</td>
    		<td>${boardVO.pevent }</td>
    		<td>${boardVO.pevent_startDay }</td>
    		<td>${boardVO.pevent_endDay }</td>
    		<td>
    			<img src="displayFile?fileName=${boardVO.pef}">
    		</td>
    	</tr>
		</c:forEach>
    	</tbody>
    	<tfoot>
    	<tr>
    	<td colspan="5">
    	<c:if test="${page.prev }">
			<a href="eventList?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}">[이전]</a>
		</c:if>
			 <c:forEach begin="${page.startPage }" end="${page.endPage}" var="num">
								<%-- <a href="list?pageNum=${num }">${num }</a> --%>
					<c:choose>
						<c:when test="${page.cri.pageNum == num }">
							<b><a
								href="eventList?pageNum=${num }&keyword=${page.cri.keyword}"
								class="w3-bar-item w3-button w3-green">${num }</a></b>
						</c:when>
						<c:otherwise>
							<a href="eventList?pageNum=${num }&keyword=${page.cri.keyword}"
								class="w3-bar-item w3-button">${num }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:if test="${page.next }">
					<a
						href="eventList?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}">[다ㅁ음]</a>
				</c:if>
		</td>
    	</tr>
    	</tfoot>
    </table>
