<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    <table class="table">
    	<thead>
    	<tr>
    		<th scope="col">유저 아이디</th>
    		<th scope="col">유저 닉네임</th>
    		<th scope="col">유저 이메일</th>
    		<th scope="col">유저 성별</th>
    		<th scope="col">가입 날짜</th>
    	</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${userList }" var="userVO">
		<tr>
    		<td scope="row">${userVO.uid }</td>
    		<td>${userVO.uname }</td>
    		<td>${userVO.umail }</td>
    		<td>${userVO.gender }</td>
    		<td>${userVO.regdate }</td>
    		
    	</tr>
		</c:forEach>
    	</tbody>
    	<tfoot>
    	<tr>
    	<td colspan="5">
    	<c:if test="${page.prev }">
			<a href="userList?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}">[이전]</a>
		</c:if>
			 <c:forEach begin="${page.startPage }" end="${page.endPage}" var="num">
								<%-- <a href="list?pageNum=${num }">${num }</a> --%>
					<c:choose>
						<c:when test="${page.cri.pageNum == num }">
							<b><a
								href="userList?pageNum=${num }&keyword=${page.cri.keyword}"
								class="w3-bar-item w3-button w3-green">${num }</a></b>
						</c:when>
						<c:otherwise>
							<a href="userList?pageNum=${num }&keyword=${page.cri.keyword}"
								class="w3-bar-item w3-button">${num }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> <c:if test="${page.next }">
					<a
						href="userList?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}">[다ㅁ음]</a>
				</c:if>
		</td>
    	</tr>
    	</tfoot>
    </table>
    