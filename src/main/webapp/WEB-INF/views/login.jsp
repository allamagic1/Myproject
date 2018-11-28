<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">

#naver_login, #kakao_login{
	text-align: center;
	margin-top: 13px;
}

.col-lg-7{
	margin: auto;
}
</style>
</head>
<body>
	<%@include file="template/header.jsp" %>
	
	<div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">LogIn</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="/test/">Home</a></li>
                <li class="breadcrumb-item active">LogIn</li>
              </ul>
            </div>
          </div>
        </div>
      </div>

	<%
		String clientId = "iI8MG8h75yLI392SGQep";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost:8080/test/navercallback", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
	%>


	<div class="col-lg-7">
              <div class="box">
                <h2 class="text-uppercase">Login</h2>
                  <div class="form-group">
                    <label for="id">Email</label>
                    <input  name="id" id="id" type="text" class="form-control">
                  </div>
                  <div class="form-group">
                    <label for="password-login">Password</label>
                    <input id="password-login" type="password" class="form-control">
                  </div>
                  <div class="text-center">
                    <button id="login2" class="btn btn-template-outlined"><i class="fa fa-sign-in"></i> Log in</button>
                  </div>
                  <hr>
                  <label>SNS LOGIN</label>
                  <!-- 네이버/카카오 -->
                  <div id="naver_login">
					<a id="naver-login-btn" href="<%=apiURL%>" ><img height="48px" src="img/naver_login.PNG" /></a>
                  </div>
                  <div id="kakao_login">
					<a id="kakao-login-btn"></a>

					<a href="http://developers.kakao.com/logout"></a>
                  </div>
              </div>
            </div>


<!-- 기본 로그인 js -->
	<script type="text/javascript">
		var doc = document;
		var login2 = doc.getElementById('login2');
		//입력 값들 변수로 지정
		var func = function() {
			var id = doc.getElementById('id').value;
			var password = doc.getElementById('password-login').value;
			empty(id, password);
		}

		login2.addEventListener('click', func);

		//값이 비어있을경우
		function empty(id, password) {
			if (!id) {
				alert('아이디를 입력해주세요');
				doc.getElementById('id').focus();
				return;
			}

			if (!password) {
				alert('패스워드를 입력해주세요');
				doc.getElementById('password-login').focus();
				return;
			}
			ajax(id, password);
		}

		//ajax
		function ajax(id, password) {
			$.ajax({
				type : "POST",
				url : "login",
				data : {
					'id' : id,
					'password' : password
				},
				success : function(data) {
					if (data == 'success') {
						window.location.href = 'http://localhost:8080/test/';
					} else {
						alert('아이디 또는 비밀번호가 다릅니다');
					}
				}
			});
		}//ajax끝
	</script>
	
	<!-- Kakao Login -->
	<script type="text/javascript">
	
	var id='';
	var pw='';
	var name='';
	
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('bcca0cab7517cabb5e6210650b68e6eb');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				// 로그인 성공시, API를 호출합니다.
				Kakao.API.request({
					url : '/v1/user/me',
					success : function(res) {
						/*console.log(JSON.stringify(res));
						console.log(JSON.stringify(res.kaccount_email));
						console.log(JSON.stringify(res.id));
						console.log(JSON.stringify(res.properties.profile_image));
						console.log(JSON.stringify(res.properties.nickname));*/
						id=JSON.stringify(res.id);
						name=JSON.stringify(res.properties.nickname);
						kakaoLogin(id,pw,name);
					},
					fail : function(error) {
						alert(JSON.stringify(error));
					}
				});
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
		
		
		
		function kakaoLogin(id,pw,name){
		$.ajax({
			type : 'POST',
			url :'kakaologin',
			data : {
				'id' : id,
				'pw' : pw,
				'name' : name
			},
			success : function(data) {
				window.location.href = data;
			}
		});
	}
		
	</script>

	<%@include file="template/footer.jsp" %>
</body>
</html>