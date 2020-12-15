<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>ZipZom | Log in</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/animate.css">
<!-- Custom Stylesheet -->
<link rel="stylesheet" href="./resources/css/style.css">

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="./resources/plugins/jquery/jquery.min.js"></script>
<!-- 네이버 로그인 js -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<script type="text/javascript">
	$(document).ready(function () {
		$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
    	
    	$("#btn").button().on('click', function() {
    		var id = $('#id').val();
    		var password = $('#password').val();
    		//console.log(id);
    		//console.log(password);
    		loginOk(id, password);
    	});
    	
        $("#login").keypress(function (e) {
            if (e.keyCode === 13) {
            	var id = $('#id').val();
        		var password = $('#password').val();
            	loginOk(id, password);;
            }
        });

	});
	
	
	var loginOk = function( id, password ){
		$.ajax({
			url: './login.action',
			data: {
				id: id,
				password: password
			},
			type: 'post',
			datatype: 'json',
			success: function( json ) {
				if( json.flag == 1 ){
					//alert('성공');
					location.href = './newDashboard.do';
				} else {
					alert("아이디/패스워드 오류");
					//location.href = './newDashboard.jsp';
				}
				
			}
		}); 
	}

</script>
</head>
<body>
	<div class="container">
		<div class="top">
			<h1 style="width: 400px;" id="title" class="hidden"><span id="logo">Zip<span>Zom</span></span></h1>
		</div>
		<form method="post" id="login">
		<div class="login-box">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<label for="username">Userid</label>
			<br/>
			<input type="text" id="id" name="id" />
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" name="password" />
			<br/>
			<button type="button" id="btn">로그인</button>
			<br/><br />
			<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<div id="naverIdLogin"></div>
			<!-- <a href="./naverlogin.action"><img src="./image/naverbutton.png" width="200px" border='0'></a> -->
			<a href="./forgot_id.action"><p class="small">아이디 찾기</p></a>
			
			<a href="./forgot_password.action"><p class="small">비밀번호 찾기</p></a>
			
			<a href="./register.action"><p class="small">회원가입</p></a>
		</div>
		</form>
	</div>
	
	<!-- Bootstrap 4 -->
<script src="./resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="./resources/js/adminlte.min.js"></script>
<script type="text/javascript">
	var callback = "http://localhost:8080/ZipZom/navercallback.action";
	var client = "20A8IB2Xc7jvgR2sa9WZ";
	
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: client,
			callbackUrl: callback,
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 50}, /* 로그인 버튼의 타입을 지정 */ 
			callbackHandle: false // callback 페이지 합치는지
		}
	); 
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
</script>
</body>
</html>