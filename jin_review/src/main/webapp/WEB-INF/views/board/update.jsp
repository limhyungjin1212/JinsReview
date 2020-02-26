<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#map {
	width: 100%;
	height: 400px;
	background-color: grey;
}
</style>
<div class="container">
	<script>

	function checkImageType(fileName){
		var pattern = /jpg|gif|png|jpeg|/i;
		return fileName.match(pattern);
	}

	function getImageLink(fileName){
		if(!checkImageType(fileName)){
			return;
		}
		var front = fileName.substr(0,12); //   /2020/01/07/
		var end = fileName.substr(14);	//  7163ad49-a36d-4afe-bf82-e496526b4b40_coffee2.jpg 앞에 s_를 떼준다.
		
		
		//alert("front"+front);
		//alert("end"+end);
		
		return front + end;
	}

	function getOriginalName(fileName){
		 if(checkImageType(fileName)){ //이미지 파일이면 skip
	         return;
	     }
	     
	     var idx=fileName.indexOf("_")+1; //uuid를 제외한 파일이름을 리턴함
	     return fileName.substr(idx);
		/*alert("fileName :" + fileName);
		return fileName;*/
	}
	
		var str = "";
		var pno = ${update.pno};
		
		
		$(document).ready(function(){
			var selectCate = "${update.pcate}";
			$("#selectCateBox").val(selectCate).attr("selected","selected");	
		})
		
		
		
		$.getJSON("detailJSON?pno=" + pno, function(data) {
			$(data).each(function(index, data) {
				$(this.boardAttachList).each(function(index,data) {
					str += "<div><img class ='thumbnail'  src='displayFile?fileName="+data+"'/>"
						+ "<small class='imgdelBtn' data-src="+data+">[삭제]</small></div>";
					});

			});
		
			$("#uploadedList").append(str);
			
		});
		
	
		
		
		// This example requires the Places library. Include the libraries=places
		// parameter when you first load the API. For example:
		// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

		var map;
		var service;
		var infowindow;

		function initMap() {
			  var sydney = new google.maps.LatLng(35.907801, 127.767662);

		        infowindow = new google.maps.InfoWindow();

		        map = new google.maps.Map(
		            document.getElementById('map'), {center: sydney, zoom: 17});
		        
			 var request = {
			          query: '${update.place}',
			          fields: ['name', 'geometry'],
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
			 
			        var input = document.getElementById('pac-input');

		        var autocomplete = new google.maps.places.Autocomplete(input);

		        // Bind the map's bounds (viewport) property to the autocomplete object,
		        // so that the autocomplete requests use the current map bounds for the
		        // bounds option in the request.
		        autocomplete.bindTo('bounds', map);

		        // Set the data fields to return when the user selects a place.
		        autocomplete.setFields(
		            ['address_components', 'geometry', 'icon', 'name']);

		        var infowindow = new google.maps.InfoWindow();
		        var infowindowContent = document.getElementById('infowindow-content');
		        infowindow.setContent(infowindowContent);
		        var marker = new google.maps.Marker({
		          map: map,
		          anchorPoint: new google.maps.Point(0, -29)
		        });

		        autocomplete.addListener('place_changed', function() {
		          infowindow.close();
		          marker.setVisible(false);
		          var place = autocomplete.getPlace();
		          if (!place.geometry) {
		            // User entered the name of a Place that was not suggested and
		            // pressed the Enter key, or the Place Details request failed.
		            window.alert("No details available for input: '" + place.name + "'");
		            return;
		          }

		          // If the place has a geometry, then present it on a map.
		          if (place.geometry.viewport) {
		            map.fitBounds(place.geometry.viewport);
		          } else {
		            map.setCenter(place.geometry.location);
		            map.setZoom(17);  // Why 17? Because it looks good.
		          }
		          marker.setPosition(place.geometry.location);
		          marker.setVisible(true);

		          var address = '';
		          if (place.address_components) {
		            address = [
		              (place.address_components[0] && place.address_components[0].short_name || ''),
		              (place.address_components[1] && place.address_components[1].short_name || ''),
		              (place.address_components[2] && place.address_components[2].short_name || '')
		            ].join(' ');
		          }

		          infowindowContent.children['place-icon'].src = place.icon;
		          infowindowContent.children['place-name'].textContent = place.name;
		          infowindowContent.children['place-address'].textContent = address;
		          infowindow.open(map, marker);
		        });
		}
		
		  function createMarker(place) {
		        var marker = new google.maps.Marker({
		          map: map,
		          position: place.geometry.location
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


	<div>
		<form id="updateForm" action="update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pno" value="${update.pno }">
			<table class="table table-hover" border="1">
				<tr>
					<td>
						<select class="form-control col-lg-5" id="selectCateBox" name="pcate">
								<option value="병원">병원</option>
								<option value="음식">음식</option>
								<option value="제품">제품</option>
								<option value="헬스장">헬스장</option>
								<option value="세탁소">세탁소</option>
								<option value="호텔">호텔</option>
								<option value="pc방">pc방</option>
								<option value="공원">공원</option>
								<option value="놀이동산">놀이 동산</option>
								<option value="문화회관">문화회관</option>
						</select>
					</td>
					<td>이름 : <input type="text" name="pname" class="col-sm-4 form-control"
						value=" ${update.pname }"></td>
				</tr>
				<tr>
					<td>연락처 : <input type="text" name="ptel" class="form-control" 
						value=" ${update.ptel }">
					</td>
					<td>등록일 : ${update.regdate }</td>
				</tr>
			</table>
			<div>
				<textarea name="pinfo" class="form-control" >${update.pinfo }</textarea>

				<div id="pac-container">
					<input id="pac-input" class="form-control col-lg-4"  name="place" type="text"
						placeholder="Enter a location" value="${update.place }">
				</div>

				<div id="map"></div>
				<div id="infowindow-content">
					<img src="" width="16" height="16" id="place-icon"> 
					<span id="place-name" class="title"></span><br> 
					<span id="place-address"></span>
				</div>
				
				
				<div class="attach"></div>
				<div class="fileDrop">파일을 끌어다 놓으세요</div>
				<h3>이곳이 업로드 되는 위치입니다.</h3>
				<div id="uploadedList" class="row">
				</div>
				<div align="center">
					<input type="submit" class="btn-primary" value="수정">
					<a href="detail?pno=${update.pno }">취소</a>
				</div>
			</div>

		</form>
	</div>
</div>
<script>


//$(".fileDrop").hide();
$(".fileDrop").show();
$(".fileDrop").on("dragenter dragover",function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop",function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files; //?
		var file = files[0]; //?
		//console.log(file);
		
		var formData = new FormData(); //FormData는 가상의 form태그 . 
		
		formData.append("file",file); //파일을 추가. 드래그앤드랍된 파일을 담는다.
		
		
		$.ajax({
			url:"uploadAjax",
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : "POST",
			
			success : function(data){
				//console.log(data);
				//alert(data);
				//alert(checkImageType(data));
				var str = "";
				console.log(checkImageType(data));
				if(checkImageType(data)){
					str +="<div>";
					str +="<a href='#'>"+data+"</a><img src='displayFile?fileName="+getImageLink(data)+"'/>";
					str += "</a><small data-src="+data+">[삭제]</small></div>";
				} else {
					str = "<div><a href='displayFile?fileName="+data+"'>"
						+getOriginalName(data) +"</a>" +
						"<small data-src="+data+">[삭제]</small></div>";
				}
				
				$("#uploadedList").append(str);
			}
		});
		});	//drop end
	
//small 태그를 클릭

	//small 태그를 클릭
	$("#uploadedList").on("click","small",function(event){
		var that = $(this);
		var filedel = confirm("파일을 삭제하면 완전히 사라집니다.");
		if(filedel){
			$.ajax({
				url:"deleteFile",
				type:"post",
				data: {fileName:$(this).attr("data-src")},
				dataType:"text",
				success:function(result){
					if(result == 'deleted'){
						alert("deleted");
						that.parent("div").remove();
					}
				}
			});
		}else{
		    alert("파일삭제취소");
		}
		
		
		
	}); //small click end
$(".attach").on("click","small",function(event){
	var that = $(this);
	var arr = [];
	$(".attach small").each(function(index){
		arr.push($(this).attr("data-src"));
		console.log(arr);
	});
	
	$.ajax({
		url:"deleteAllFiles",
		type:"post",
		data: {files : arr},
		dataType:"text",
		success:function(result){
			if(result == 'deleted'){
				alert("deleted");
				that.parent("div").remove();
				
			}
		}
	})
	
	
}); //small click end
$("#updateForm").submit(function(event){
	event.preventDefault();
	var that = $(this);
	
	var str = "";
	
	$("#uploadedList small").each(function(index){
		str +="<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src")+"' >";
	});
	that.append(str);
	that.get(0).submit(); //get(0) 선택한 요소의 0번쨰.	
	 
	
	
});
</script>