/**
 * 
 */

function key() {
	var str = document.getElementById("firstNum").value;
	var pattern_num = /[0-9]/; // 숫자
	var pattern_eng = /[a-zA-Z]/; // 문자
	var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크
	
	//
	if ((pattern_num.test(str)) && !(pattern_eng.test(str) )
			&& !(pattern_spc.test(str)) && !(pattern_kor.test(str))) {
		return true
	} else {
		alert("숫자만 입력 가능합니다.")
		return false
	}
}


 

function pwequalscheck() {
	var pw = document.getElementById("upw").value;
	var pwchk = document.getElementById("pwchk").value;

	if(pw == ""){
		document.getElementById("pwequals").innerHTML = "";
	}else if (pw == pwchk) {
		document.getElementById("pwequals").innerHTML = "비밀번호 일치";
	} else if(pwchk == ""){
		document.getElementById("pwequals").innerHTML = "비밀번호를 재입력 해주세요.";
	}else {
		document.getElementById("pwequals").innerHTML = "비밀번호가 다릅니다.";
	}
}
var s = "";
function sendNum() {
	var a = "";
		a = Math.floor(Math.random() * 10000) + 1;
		s = parseInt(a);
		document.getElementById("receiveNum").value = s;
	alert(s);
}

function equalsNum() {
	var receiveNum = document.getElementById("receiveNum").value;
	alert(s == receiveNum && s!="" ? "인증완료" : "인증 실패");
}

function selectEmail() {
	var select = document.getElementById("emailselect").value;
	
	if (select==1){
		document.getElementById("email2").value = "";
		document.getElementById("email2").readOnly = false;
	} else{
		document.getElementById("email2").value = select;
		document.getElementById("email2").readOnly = true;
	}
}

$(document).ready(function(){
	var EcheckNum = 0;	
	
	$("#emailCheck").hide();
	$("#idchkBtn").hide();
	
		$("#idchkBtn").on("click",function(){
			var uid = $("#uid").val();
			if(uid == ""){
				alert("아이디를 입력해주세요.");
				return false;
			}
			$.ajax({
				url : "idCheck",
				data : "uid="+uid,
				dataType : "text",
				type : "get",
				success : function(data) {
					console.log(data.length);
					if(data == 0){
						alert("사용가능한 아이디 입니다.");
						if(uid.length < 8 || uid.length >20 ){
							$("#idcheck").text("id는 8자이상 20자 이하로 입력하셔야 합니다.").css("color","red");
							$("#uid").focus();
						} else{
							$("#idcheck").text("멋진 아이디네요!").css("color","green");
						}
						
					} else{
						alert("아이디가 이미 사용중입니다.");
						$("#idcheck").text("id는 8자이상 20자 이하로 입력하셔야 합니다.").css("color","red");
						$("#uid").focus();
					}
				}
			});
		});

		$("#uid").on("blur",function(){
			var uid = $(this).val();
			if(uid == ""){
				return false;
			}
			if(uid.length < 8 || uid.length >20 ){
				$("#idcheck").text("id는 8자이상 20자 이하로 입력하셔야 합니다.").css("color","red");
				$("#uid").focus();
			} else{
				$("#idcheck").text("멋진 아이디네요!").css("color","green");
				$("#idchkBtn").show();
			}
			
		}); //uname blur end
		
		
		$("#uname").keyup(function(){
			var uname = $(this).val();
			if(uname == ""){
				return false;
			}
			$.ajax({
				url : "nameCheck",
				data : "uname="+uname ,
				dataType : "text",
				type : "get",
				success : function(data) {
					console.log(data.length);
					if(data == 0){
						if(uname.length < 2 || uname.length > 20){
							$("#nameCheckBox").text("닉네임은 2글자 이상 20자 이하만 가능합니다.!").css("color","red");
						} else{
							$("#nameCheckBox").text("아주 멋진 닉네임 입니다.!").css("color","green");
						}
					} else{
						$("#nameCheckBox").text("닉네임이  이미 사용중입니다.").css("color","red");
						$("#uname").focus();
					}
				}
			});
		}); //uname blur end
		
		
		
			$("#joinForm").submit(function(){ //회원가입 유효성 검사.
			
			var uid = $("#uid").val();
			var nameCheckBox = $("#nameCheckBox").text(); 
			var pwcheck = $("#pwcheck").text();
			var idCheck = $("#idcheck").text();
			
			if(idCheck !="멋진 아이디네요!"){
				console.log(idCheck);
				console.log(uid);
				alert("id양식에 맞게 작성");
				return false;
			}
			if(nameCheckBox != "아주 멋진 닉네임 입니다.!" ){
				alert("name양식에 맞게 작성");
				return false;
			}
			if(pwcheck != "비밀번호 사용 가능합니다."){
				alert("비번 양식에 맞게 작성");
				return false;
			}
			
				
			var ecn = $("#emailCheckNum").val();
			var ect = $("#ectrue").val();
			
			if(ect == 1){
				alert("회원 가입 완료! 로그인 된 상태로 메인페이지로 이동합니다.");
				
			} else {
				alert("이메일 인증을 해주세요");
				return false;
			}
		});
		
			$("#upw").on("blur",	function() {
				var pattern_num = /[0-9]/; // 숫자
				var pattern_eng = /[a-zA-Z]/; // 문자
				var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
				var pw = $("#upw").val();
					if (pw.length > 7 && pattern_num.test(pw) && pattern_eng.test(pw) && pattern_spc.test(pw) ) {
						$("#pwcheck").text("비밀번호 사용 가능합니다.").css("color","green");
						} else {
							$("#pwcheck").text("8자리이상  비밀번호는 특수문자1개이상포함 , 영문자 와 숫자 포함하여야합니다.")
							.css("color", "red");
						}
			});
			
				var year = "<option>연도</option>";
				for(i=2019;i>1980;i--){
					year +="<option>";
					year += i;
					year +="</option>";
				}
				
				$("#year").html(year);
				
				$("#submit").on("click",function(){
						$("#umail").val();
				});
				
				
				$("#emailSendbtn").on("click",function(){
					var mail1 = $("#email").val();
					var mail2 = $("#email2").val();
					console.log(mail1);
					console.log(mail2);
					$("#umail").val(mail1+"@"+mail2);
					var umail = $("#umail").val();
					console.log(umail);
					
					var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
					
					if(!getMail.test(umail)){
						alert("이메일 형식을 맞춰주세요. ex)email아이디@naver.com");
						return false;
					}
					
					
					
					alert(umail);
					$.ajax({
						url : "mailSending",
						data : "umail="+umail,
						type : 'post',
						dataType : "text",
						success : function(data) {
							$("#emailCheck").show();
							
							EcheckNum = data;
							
						}

					});
					
				}); 
				
					$("#emailCheckBtn").on("click",function(){
						
						var ecn = $("#emailCheckNum").val();
						
						if(ecn == EcheckNum){
							alert("인증 완료");
							$("#ectrue").val("1");
						} else{
							alert("인증실패 . 다시확인해주세요");
						}
						
					});
				
		});