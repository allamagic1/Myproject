<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>  -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style type="text/css">

#naver_login, #kakao_login{
	text-align: center;
	margin-top: 13px;
}
</style>
</head>
<body>
<%@include file="template/header.jsp" %>
	<!-- <div>
		이메일: <input type="email" id="email" placeholder="이메일을 입력해주세요">
		<button id="idcke">중복확인</button>
	</div>
	<div>
		이름: <input type="text" id="name" placeholder="이름을 입력해주세요">
	</div>
	<div>
		비밀번호: <input type="password" id="password" placeholder="비밀번호를 입력해주세요">
	</div>
	<div>
		비밀번호 확인: <input type="password" id="passwordcke"
			placeholder="비밀번호를 한번더 입력해주세요">
	</div>
	<button id="signup">회원가입</button> -->
	
	<div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">New Account / LogIn</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="/test/">Home</a></li>
                <li class="breadcrumb-item active">New Account / LogIn</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="box">
                <h2 class="text-uppercase">New account</h2>
                <!-- <p class="lead">Not our registered customer yet?</p> -->
                  <div class="form-group">
                    <label for="name">Name</label>
                    <input id="name" placeholder="이름을 입력해주세요" type="text" class="form-control">
                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input  id="email" placeholder="이메일을 입력해주세요" type="email" class="form-control">
                    <button id="idcke" class="btn btn-sm btn-template-main">중복확인</button>
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" placeholder="비밀번호를 입력해주세요" type="password" class="form-control">
                  </div>
                  <div class="form-group">
                    <label for="passwordcke">Password Confirm</label>
                    <input id="passwordcke" placeholder="비밀번호를 한번더 입력해주세요" type="password" class="form-control">
                  </div>
                  <div class="text-center">
                    <button id="signup2" class="btn btn-template-outlined"><i class="fa fa-user-md"></i> Register</button>
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

			<div class="col-lg-6">
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
          </div>
        </div>
      </div>
	
	<%@include file="template/footer.jsp" %>
	
	<script type="text/javascript">
		var doc = document;
		var sign = doc.getElementById('signup2');
		var idcke = doc.getElementById('idcke');
		//입력 값들 변수로 지정
		var func = function() {
			var email = doc.getElementById('email').value;
			var name = doc.getElementById('name').value;
			var password = doc.getElementById('password').value;
			var passwordcke = doc.getElementById('passwordcke').value;
			empty(email, name, password, passwordcke);
		}
		
		//이메일 중복검사
		var func2 = function() {
			var email = doc.getElementById('email').value;
			if (!email) {
				alert('이메일을 입력해주세요');
				doc.getElementById('email').focus();
				return;
				var emailform = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				if (!emailform.test(email)) {
					alert('이메일 형식이 아닙니다');
					return;
				}
			}
			$.ajax({
				type : "POST",
				url : "signupcek",
				data : {
					'email' : email
				},
				success : function(data) {
					if (data == 'success') {
						alert('사용할수 있는 아이디입니다');
						//회원가입 버튼을 누르면 채크 시작 
						sign.removeEventListener('click', func3);
						sign.addEventListener('click', func);
					} else {
						alert('중복된아이디입니다');
					}
				}
			});
		}//func2 end
		idcke.addEventListener('click', func2);
		sign.addEventListener('click', func3);
		function func3() {
			alert('중복 체크를 해주세요');
		}
		
		//값이 비었을경우
		function empty(email, name, password, passwordcke) {
			if (!email) {
				alert('이메일을 입력해주세요');
				doc.getElementById('email').focus();
				return;
			}
			if (!name) {
				alert('이름을 입력해주세요');
				doc.getElementById('name').focus();
				return;
			}
			if (!password) {
				alert('비밀번호를 입력해주세요');
				doc.getElementById('password').focus();
				return;
			}
			if (!passwordcke) {
				alert('비밀번호확인을 입력해주세요');
				doc.getElementById('passwordcke').focus();
				return;
			}
			if (8 > password.length) {
				alert('비밀번호는 8자리이상으로 입력해주세요');
				return;
			}
			//비밀번호가 길이 검사후 일치 확인 
			if (password != passwordcke) {
				alert('비밀번호가 같지않습니다');
				return;
			}
			//이메일 형식 채크
			var emailform = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			if (!emailform.test(email)) {
				alert('이메일 형식이 아닙니다');
				return;
			}
			var stringcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			if (!stringcheck.test(name)) {
				alert('이름을 올바르게 입력해주세요');
				return;
			}

			//모든 체크가 끝나면 ajax
			$.ajax({
				type : "POST",
				url : "signup",
				data : {
					'email' : email,
					'password' : password,
					'name' : name
				},
				success : function(data) {
					window.location.href = data;
				}
			});
		}
	</script>
	
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
	
</body>
</html>