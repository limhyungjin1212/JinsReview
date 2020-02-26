<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Clustering</title>
       <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&callback=initMap">
    </script>
    
    <script>
    function initMap() {
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 8,
        center: {lat: -34.397, lng: 150.644}
      });
      var geocoder = new google.maps.Geocoder();

     geocodeAddress(geocoder, map);
    }

    function geocodeAddress(geocoder, resultsMap) {
      var address = ["울산 동구 방어동" , "울산 삼산동"];
      for(var i=0; i<address.length; i++){
    	  geocoder.geocode({'address': address[i]}, function(results, status) {
    	        if (status === 'OK') {
    	          resultsMap.setCenter(results[0].geometry.location);
    	          var marker = new google.maps.Marker({
    	            map: resultsMap,
    	            position: results[0].geometry.location
    	          });
    	          var content = "방어동입니다.";
    	          var infowindow = new google.maps.InfoWindow({ content: content});
    	          google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});

    	        } else {
    	          console.log('Geocode was not successful for the following reason: ' + status);
    	        }
    	      });
    	  }
      }
      
  </script>
    
  </head>
  <body>
    <div id="map" style="width: 100%; height: 340px"></div>
    
    <!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
    

  
  </body>
</html>