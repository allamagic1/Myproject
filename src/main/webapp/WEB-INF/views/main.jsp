<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous" /> -->

<!-- Optional theme -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous" /> -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<!-- <script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script> -->
<title>Insert title here</title>
</head>
<body>
<%@include file="template/header.jsp" %>
 <section class="no-mb relative-positioned">
        <!--
        *** JUMBOTRON ***
        _________________________________________________________
        -->
        <div style="background: url('img/main2.jpg') center center repeat; background-size: cover;" class="jumbotron relative-positioned color-white text-md-center">
          <div class="dark-mask mask-primary"></div>
          <div class="container">
            <div class="row mb-small">
              <div class="col-md-12 text-center">
                <h1 class="text-uppercase">search hospital</h1>
                <h2 class="text-uppercase">                                                                                </h2>
              </div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-small"><img src="img/nurse.png" alt="..." class="img-fluid"><img src="img/doctor.png" alt="..." class="img-fluid"></div>
              <div class="col-md-6 text-center-sm">
                <p class="text-uppercase text-bold">                          <br>                      <br>				</p>
                <p class="no-letter-spacing">						<br>							</p>
                <p><a href="#" class="scroll-to btn btn-template-outlined-white">search hospital</a></p>
              </div>
            </div>
          </div>
        </div>
        <!-- *** JUMBOTRON END ***-->
      </section>
	<!-- <div id="menu">
		<a href="ready?homemenu=1" class="ajaxMenu" id="emergency">응급의료기관</a>
		<a href="ready?homemenu=2" class="ajaxMenu" id="moonlight">달빛어린이병원(실시간)</a>
		<a href="search" id="search">검색</a> <a href="ready?homemenu=3"
			class="ajaxMenu" id="pharmacy">약국</a> <a href="ready?homemenu=4"
			class="ajaxMenu" id="realTime">실시간</a>
	</div>
   <div>
      <a href="list">리스트</a> <a id="login" href="login">로그인</a> <a id="signup" href="signup">회원가입</a>
      <a href="adbbs">이벤트 게시판</a>
   </div> -->
   <%-- <div id="mypagediv">
      <label id="idInfo">${sessionname } 님 환영합니다.</label>
      <a id="logout" href="loginout">로그아웃</a>
      <a id="mypage" href="mypage">마이페이지</a>
   </div> --%>

   
<%@include file="template/footer.jsp" %>
</body>
</html>