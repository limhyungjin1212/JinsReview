/**


 * 
 */
$(function() {
		
		$.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
        });
		  //input을 datepicker로 선언
        $("#datepicker1").datepicker();                    
        $("#datepicker2").datepicker();
      //From의 초기값을 오늘 날짜로 설정
      	
      	$('#datepicker1').datepicker('setDate', "+7D"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)	
      	
      	
      	$('#datepicker2').datepicker('setDate', "+1M"); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)	
      	
       
        $("#datepicker1").change(function(){
        	console.log("1change");
        });
        
        $("#datepicker2").change(function(){
        	console.log("2change");
        });
    	
      
	});

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

$(".fileDrop").on("dragenter dragover",function(event){
		event.preventDefault();
	});
	

$("#eventfile").change(function(event) {
	// var files =
		// event.originalEvent.dataTransfer.files;
		// //?
		var file = $("#eventfile")[0].files[0]; // ?
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
						console.log(checkImageType(data));
						if (checkImageType(data)) {
							str = "<div>"
									+ "<a href=displayFile?fileName="
									+ getImageLink(data)
									+ "><img style='max-width:400px;' src='displayFile?fileName="
									+ getImageLink(data)
									+ "'/>"
									+ "</a><small data-src="
									+ data
									+ ">X</small>"
									+ "</div>";
						} else {
							str = "<div><a href='displayFile?fileName="
									+ data
									+ "'>"
									+ getOriginalName(data)
									+ "</a>"
									+ "<small data-src="
									+ data
									+ ">X</small></div>";
						}

						$("#uploadedEventFile").append(str);
					}
				});

	});

//small 태그를 클릭
$("#uploadedEventFile").on("click","small",function(event){
	var that = $(this);
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
	})
	
	
}); //small click end
$(".fileDrop").on("drop",function(event){
		event.preventDefault();
		var files = event.originalEvent.dataTransfer.files; 
		var file = files[0]; 
		console.log(file);
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
				var str = "";
				if(checkImageType(data)){
					str="<div><a href=displayFile?fileName="+getImageLink(data)+">" +
							"<img style='max-width:400px;' src='displayFile?fileName="+getImageLink(data)+"'/>"
						+ "</a><small data-src="+data+">삭제</small>" +"</div>";
				} else {
					str = "<div><a href='displayFile?fileName="+data+"'>"
						+getOriginalName(data) +"</a>" +
						"<small data-src="+data+">삭제</small></div>";
				}
				
				$("#uploadedList").append(str);
			}
		});
		});	//drop end
	
	
	//small 태그를 클릭
	$("#uploadedList").on("click","small",function(event){
		var that = $(this);
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
		})
		
		
	}); //small click end
	$("#registerForm").submit(function(event){
		event.preventDefault();
		var that = $(this);
		
		var str = "";
		
		$("#uploadedList small").each(function(index){
			str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("data-src")+"' > ";
		});
		$("#uploadedEventFile small").each(function(){
			str += "<input type='hidden' name='pevent_file' value='"+$(this).attr("data-src")+"' > ";
		});
		that.append(str);
		that.get(0).submit();
		
		
	});
	$("#goList").on("click",function(){
		
	});
	
	$("#selectBox").on("change",function(){
		var sv = $(this).val();
		console.log(sv);
		if(sv == "제품"){
			 $("#map").hide();
			 $("#pac-container").hide();
		} else{
			 $("#map").show();
		}
	});
	
	
	function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 35.5528, lng: 129.3309}, //지도 초기화면 중앙의 좌표
          zoom: 15 //확대의 정도
        });
        
        var card = document.getElementById('pac-card');
        var input = document.getElementById('pac-input');
        
        map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

        var autocomplete = new google.maps.places.Autocomplete(input);

        autocomplete.bindTo('bounds', map);

        autocomplete.setFields(['address_components', 'geometry', 'icon', 'name']); //자동완성

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	