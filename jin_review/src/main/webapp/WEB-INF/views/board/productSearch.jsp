<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div class="row">
<div class="col-md-6" id="slDiv">
	<c:forEach items="${searchList }" var="pVO"	>
	<div class="row p-3 my-3 border">	
	<div class="col-md-4">
		<img class="img-thumbnail" src='displayFile?fileName=${pVO.fn }' alt="not image">
	</div>
	<div class="col-md-8">
	<table class="table table-borderless">
		<tr>
			<td><h4><a href="detail?pno=${pVO.pno }&pageNum=${page.cri.pageNum}&keyword=${page.cri.keyword}">${pVO.pname }</a></h4>
			</td>
			<td>${pVO.ptel }</td>
		</tr>
	<tr>
		<td>
		<c:forEach begin="1" end="${pVO.rate }" var="rateAvg">
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
		</td>
		<td>${pVO.place }</td>
	</tr>
	<tr>
		<td><p>${pVO.pcate }</p></td>
		
	</tr>
	<tr>
		<td colspan="2">
		<p>
				"${pVO.pinfo }"
				</p>
		</td>
	</tr>
	</table>
	</div>
	</div>
	</c:forEach>	
<c:if test="${page.prev }">
			<a	href="productSearch?pageNum=${page.startPage-1 }&keyword=${page.cri.keyword}&place=${page.cri.place}">[이전]</a>
		</c:if>
		 <c:forEach begin="${page.startPage }" end="${page.endPage}" var="num">
				<c:choose>
					<c:when test="${page.cri.pageNum == num }">
						<b><a href="productSearch?pageNum=${num }&keyword=${page.cri.keyword}&place=${page.cri.place}"
											class="w3-bar-item w3-button w3-green">${num }</a></b>
					</c:when>
					<c:otherwise>
						<a href="productSearch?pageNum=${num }&keyword=${page.cri.keyword}&place=${page.cri.place}"
											class="w3-bar-item w3-button">${num }</a>
					</c:otherwise>
				</c:choose>
				</c:forEach> 
				
		<c:if test="${page.next }">
			<a href="productSearch?pageNum=${page.endPage +1 }&keyword=${page.cri.keyword}&place=${page.cri.place}">[다ㅁ음]</a>
		</c:if> 

</div>
<div class="col-md-6" id="mapDiv" >
	<div id="map" style="width: 800px; "></div>
</div>		
</div>
  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap">
    </script>
<script>
			
		var keyword ="${page.cri.keyword}";
		var place="${page.cri.place}";
		
		$("#category").val(keyword);
		$("#placekeyword").val(place);
		
		$("#category").on("click",function(){
			$(this).val("");
		});
		// This example requires the Places library. Include the libraries=places
		// parameter when you first load the API. For example:
		

    function initMap() {
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: {lat: 35.5528, lng: 129.3309}
      });
      var geocoder = new google.maps.Geocoder();

     geocodeAddress(geocoder, map);
    }
		
    function geocodeAddress(geocoder, resultsMap) { //좌표가 아닌 주소로 저장되어 있는 장소를 좌표형태로 변환시켜줍니다.
    	
    var arrAddress= new Array(); //검색된 주소를 넣을 배열
    <c:forEach items="${searchList}" var="sl"> 
    	<c:if test='${sl.place ne ""}'>
    		arrAddress.push({place: "${sl.place}",fn:"${sl.fn}",rate:"${sl.rate}",pname:"${sl.pname}",pno:"${sl.pno}",ptel:"${sl.ptel}"});		
    	</c:if>
    </c:forEach>
      for(var i=0; i<arrAddress.length; i++){
    	  geocoder.geocode({'address': arrAddress[i].place}, (function (i) {
    		  return function(results, status) {

    	        if (status === 'OK') {
    	          resultsMap.setCenter(results[0].geometry.location);
    	          var marker = new google.maps.Marker({
    	            map: resultsMap,
    	            position: results[0].geometry.location
    	          });
    	        		  
    	          var infowindow = new google.maps.InfoWindow(); //마커 클릭시 작은 팝업창을 띄운다.
    	          google.maps.event.addListener(marker, "click", function() {
    	          var contentString = "";
    	          contentString += '<div id="content">'+
    	  					'<br><div id="adress"><br>'+
    	  					'<a href=detail?pno='+arrAddress[i].pno+'>'+arrAddress[i].pname+'</a><br><p>'; //제목에 a태그로 상세보기페이지로 이동
    	  		for(var j=1;j<=arrAddress[i].rate;j++){ //별점 start
    	  			contentString += "<i class='fas fa-star' style='color :#99ccff;'></i>";
    	  		}
    	  		if((arrAddress[i].rate*2) % 2 == 1){
    	  			contentString += "<i class='fas fa-star-half-alt' style='color: #99ccff;'></i>";
    	  			for(var j=arrAddress[i].rate+1;j<4;j++){
    	  				contentString += "<i class='far fa-star' style='color: #99ccff;'></i>";
    	  			}
    	  		} else{
    	  			for(var j=arrAddress[i].rate;j<=4;j++){
    	  				contentString += "<i class='far fa-star' style='color: #99ccff;'></i>";
    	  			}
    	  		} // 별점 end
    	  					
    	  		contentString +='</p><a href=detail?pno='+arrAddress[i].pno+'><img style="width:300px; height:200px;" class=img-thumbnail src=displayFile?fileName='+arrAddress[i].fn+'></a>'+
    	  					'<br></div><p><b>주소 :</b> ' +arrAddress[i].place+
    	         '<br><b>연락처 :</b> ' +arrAddress[i].ptel+'</p></div>';
    	         
    	        	  infowindow.setContent(contentString);
    	        	  infowindow.open(map,marker);
    	        	});
    	        } else {
    	          console.log('Geocode was not successful for the following reason: ' + status);
    	        }
    		  };
    	      })(i)
    	  );
    	  }
      }
      
    
    /*
    	우선, geocode 함수는 비동기 함수입니다. 즉 geocode 함수의 2번째 인자로 넘긴 function(콜백 함수라고 부르겠습니다.)을 호출하는 시기는 geocode 함수를 호출한 그 당시가 아닌 약간의 시간이 지난 이후입니다.

소스를 보면 콜백 함수에서 for문의 i 변수를 사용하고 있는데요. 콜백 함수를 생성하는 당시에는 i값이 순차적으로 변화하고 있었겠지만 실제로 geocode가 완료되고 콜백이 호출되는 시점은 for문이 끝난 이후입니다. 그때의 i 변수에는 for 루프의 최종 값인 addrArr.length가 대입되어 있습니다. 이것은 배열의 범위를 벗어나는 값이기 때문에 당연히 null이 들어가겠죠.

왜 콜백 함수가 생성시의 값을 쓰지 않고 호출되는 시점의 값을 쓰느냐? 하는 것은 자바스크립트의 클로저는 변수를 값이 아닌 참조로 가르키기 때문입니다. 

그럼 여기서 해야할 일은 콜백 함수 생성시에 i를 참조가 아닌 값으로 가져오는 것이겠죠. 일반적으로 많이 쓰는 방법은 function을 하나 더 만들어 감싸는 것입니다. 

geocoder.geocode({ 'address': addrArr[i] }, 
(function (i) {
return fucntion (results, status) {
... 콜백함수 본문 ...
};
})(i)
);

함수에 값으로 인자를 전달한 후, 해당 인자를 사용하는 함수를 생성해 리턴합니다. 중간에 값으로 복사하는 과정이 있기 때문에 함수 생성시의 i값을 그대로 사용할 수 있습니다.

위와 같이 사용하시면 일단 문제는 해결될 것으로 보입니다. 혹 이해가 안되신다면 javascript의 closure와 scpoe에 대해 공부하시면 도움이 될 겁니다.
    */
    
    var slH = $("#slDiv").css("height");
    var wh = $(window).height();
    console.log(wh);
    $("#mapDiv").css("height",wh);
    $("#map").css({"width":"100%","height":wh,"position":"fixed"});
	$("#mapDiv").css("position","sticky");
	$("#mapDiv").css("display","inline-block");
	$("#mapDiv a").css("textDecoration","none");
  </script>
 
   <!-- Replace following script src -->
  
    
	 <!-- <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap"
		async defer></script> -->
		
		
