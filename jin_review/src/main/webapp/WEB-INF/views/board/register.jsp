<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#map{
		width: 800px;
		height: 300px;
		
	}
	
	#selectBox{
		width:400px;
	}
	#registerForm{
		margin-bottom : 100px;
		padding : 20px 0px;
	}
</style>
<div class="container" id="reg">
<h1>글쓰기 하기 위한 폼 입니다.</h1>
<form id = "registerForm" action="register" method="post" enctype="multipart/form-data">
	<div class="row">
		<label class="col-sm-1 control-label">카테고리</label>
			<select id="selectBox" class="form-control col-lg-2" name="pcate">
				<option value="">직접 입력</option>
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
		
		<label class="col-sm-1 control-label">이름</label>
			<input type="text" id="pname" class="col-sm-4 form-control" name="pname" required> 
	</div>
	<label class="col-sm-1 control-label">영업시간</label>
	<div class="form-row">
		<label class="col-sm-1 control-label">월요일</label>
		<label class="col-sm-1 control-label" for="openMonTime">open : </label>
			<select id="openMonTime" class="form-control col-lg-2" name="openMon">
			<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option selected="selected" value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			<label class="col-sm-1 control-label" for="closeMonTime">close :</label>
			<select id="closeMonTime" class="form-control col-lg-2" name="closeMon">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option selected="selected" value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
		</div>
		<div class="form-row">
		<label class="col-sm-1 control-label">화요일</label>
		<label class="col-sm-1 control-label" for="openTueTime">open :</label>
			<select id="openTueTime" class="form-control col-lg-2" name="openTue">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option selected="selected" value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			<label class="col-sm-1 control-label" for="CloseTueTime">close :</label>
			<select id="CloseTueTime" class="form-control col-lg-2" name="closeTue">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option selected="selected" value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			</div>
			<div class="form-row">
		<label class="col-sm-1 control-label">수요일</label>
		<label class="col-sm-1 control-label" for="openWedTime">open :</label>
			<select id="openWedTime" class="form-control col-lg-2" name="openWed">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option selected="selected" value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			<label class="col-sm-1 control-label" for="closeWedTime">close :</label>
			<select id="closeWedTime" class="form-control col-lg-2" name="closeWed">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option selected="selected" value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			</div>
			<div class="form-row">
		<label class="col-sm-1 control-label">목요일</label>
		<label class="col-sm-1 control-label" for="openThuTime">open :</label>
			<select id="openThuTime" class="form-control col-lg-2" name="openThu">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option selected="selected" value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			<label class="col-sm-1 control-label" for="closeThuTime">close :</label>
			<select id="closeThuTime" class="form-control col-lg-2" name="closeThu">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option selected="selected" value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			</div>
			<div class="form-row">
		<label class="col-sm-1 control-label">금요일</label>
		<label class="col-sm-1 control-label" for="openFriTime">open</label>
			<select id="openFriTime" class="form-control col-lg-2" name="openFri">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option selected="selected" value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			<label class="col-sm-1 control-label" for="closeFriTime">close</label>
			<select id="closeFriTime" class="form-control col-lg-2" name="closeFri">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option selected="selected" value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			</div>
			<div class="form-row">
		<label class="col-sm-1 control-label">토요일</label>
		<label class="col-sm-1 control-label" for="openSatTime">open :</label>
			<select id="openSatTime" class="form-control col-lg-2" name="openSat">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option selected="selected" value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			<label class="col-sm-1 control-label" for="closeSatTime">close :</label>
			<select id="closeSatTime" class="form-control col-lg-2" name="closeSat">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option selected="selected" value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			</div>
			<div class="form-row">
		<label class="col-sm-1 control-label">일요일</label>
		<label class="col-sm-1 control-label" for="openSunTime">open :</label>
			<select id="openSunTime" class="form-control col-lg-2" name="openSun">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option selected="selected" value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			<label class="col-sm-1 control-label" for="closeSunTime">close :</label>
			<select id="closeSunTime" class="form-control col-lg-2" name="closeSun">
				<option value="00:00">00:00</option>
				<option value="01:00">01:00</option>
				<option value="02:00">02:00</option>
				<option value="03:00">03:00</option>
				<option value="04:00">04:00</option>
				<option value="05:00">05:00</option>
				<option value="06:00">06:00</option>
				<option value="07:00">07:00</option>
				<option value="08:00">08:00</option>
				<option value="09:00">09:00</option>
				<option value="10:00">10:00</option>
				<option value="11:00">11:00</option>
				<option value="12:00">12:00</option>
				<option value="13:00">13:00</option>
				<option value="14:00">14:00</option>
				<option value="15:00">15:00</option>
				<option value="16:00">16:00</option>
				<option value="17:00">17:00</option>
				<option selected="selected" value="18:00">18:00</option>
				<option value="19:00">19:00</option>
				<option value="20:00">20:00</option>
				<option value="21:00">21:00</option>
				<option value="22:00">22:00</option>
				<option value="23:00">23:00</option>
				<option value="24:00">24:00</option>
			</select>
			</div>
  <div id="pac-container">
        <input id="pac-input" class="form-control" name="place" type="text"
            placeholder="주소를 입력하세요">
      </div>
    
    <div id="map"></div>
      <div id="infowindow-content">
      <img src="" width="16" height="16" id="place-icon">
      <span id="place-name"  class="title"></span><br>
      <span id="place-address"></span>
    </div>
	<br>
	내용 : <textarea class="form-control" rows="10" cols="20" name="pinfo"></textarea> <br>
	연락처 : <input type="text" class="form-control" name="ptel"> <br>
	<div>
		<h1>진행하는 이벤트.</h1>
		<input type="text" name="pevent" class="form-control" placeholder="진행하는 이벤트 제목">
		<textarea class="form-control" rows="10" cols="20" name="pevent_info"></textarea> <br>
		<input type="file" class="form-control" id="eventfile" >
		<div id="uploadedEventFile">
		
		</div>
		
	</div>
	
	<div class="fileDrop">파일을 드래그앤 드랍</div>
	<div class="row p-3 mb-2 bg-info text-white" id="uploadedList"></div>
	<div class="text-center">
	<input type="submit" class="btn btn-primary" value="글쓰기">
	<input type="button" id="goList" class="btn btn-secondary"   value="목록" >
	</div>
</form>
</div>
<script type="text/javascript" src="resources/js/register.js?ver=125"></script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBggZ8qinjU9aNYY_vCqfzv_C7PBA5v680&libraries=places&callback=initMap"
        async defer></script>
