<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
   href="vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Bootstrap Select-->
<link rel="stylesheet"
   href="vendor/bootstrap-select/css/bootstrap-select.min.css">
<!-- owl carousel-->
<link rel="stylesheet"
   href="vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
   href="vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="css/style.blue.css"
   id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="css/custom.css">
<!-- Favicon and apple touch icons-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57"
   href="img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72"
   href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
   href="img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
   href="img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
   href="img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
   href="img/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
   href="img/apple-touch-icon-152x152.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<style type="text/css">
p {
   text-align: center;
}

a {
   text-align: center;
}
i{
   font-size: medium;
}
</style>
<script type="text/javascript">
   $(function() {
      $('#tab1').mouseenter(function() {
         console.log('11111');
         $('#tab4-4-tab').addClass("nav-item nav-link active");
         $('#tab4-5-tab').removeClass("nav-item nav-link active");
         $('#tab4-6-tab').removeClass("nav-item nav-link active");
         $('#tab4-7-tab').removeClass("nav-item nav-link active");
         $('#tab4-5-tab').addClass("nav-item nav-link");
         $('#tab4-6-tab').addClass("nav-item nav-link");
         $('#tab4-7-tab').addClass("nav-item nav-link");

         $('#tab4-4').addClass("tab-pane fade show active");
         $('#tab4-5').removeClass("tab-pane fade show active");
         $('#tab4-6').removeClass("tab-pane fade show active");
         $('#tab4-7').removeClass("tab-pane fade show active");
         $('#tab4-7').addClass("tab-pane fade");
         $('#tab4-6').addClass("tab-pane fade");
         $('#tab4-5').addClass("tab-pane fade");
         /* $('#tab4-5').removeClass("tab-pane fade show active");
         $('#tab4-6').removeClass("tab-pane fade show active");
         $('#tab4-4').addClass("tab-pane fade show active"); */
      });
      $('#tab2').mouseenter(function() {
         console.log('22222');

         $('#tab4-5').addClass("tab-pane fade show active");
         $('#tab4-4-tab').removeClass("nav-item nav-link active");
         $('#tab4-6-tab').removeClass("nav-item nav-link active");
         $('#tab4-7-tab').removeClass("nav-item nav-link active");
         $('#tab4-4-tab').addClass("nav-item nav-link");
         $('#tab4-5-tab').addClass("nav-item nav-link active");
         $('#tab4-6-tab').addClass("nav-item nav-link");
         $('#tab4-7-tab').addClass("nav-item nav-link");
         $('#tab4-4').removeClass("tab-pane fade show active");
         $('#tab4-6').removeClass("tab-pane fade show active");
         $('#tab4-7').removeClass("tab-pane fade show active");
         $('#tab4-6').addClass("tab-pane fade");
         $('#tab4-4').addClass("tab-pane fade");
         $('#tab4-7').addClass("tab-pane fade");
         /* $('#tab4-5').addClass("tab-pane fade show active");
         $('#tab4-4').removeClass("tab-pane fade show active");
         $('#tab4-6').removeClass("tab-pane fade show active"); */
      });
      $('#tab3').mouseenter(function() {
         console.log('33333');

         $('#tab4-6').addClass("tab-pane fade show active");
         $('#tab4-4').removeClass("tab-pane fade show active");
         $('#tab4-5').removeClass("tab-pane fade show active");
         $('#tab4-7').removeClass("tab-pane fade show active");

         $('#tab4-5-tab').removeClass("nav-item nav-link active");
         $('#tab4-4-tab').removeClass("nav-item nav-link active");
         $('#tab4-7-tab').removeClass("nav-item nav-link active");
         $('#tab4-4-tab').addClass("nav-item nav-link");
         $('#tab4-5-tab').addClass("nav-item nav-link");
         $('#tab4-7-tab').addClass("nav-item nav-link");
         $('#tab4-6-tab').addClass("nav-item nav-link active");
         $('#tab4-4').addClass("tab-pane fade");
         $('#tab4-5').addClass("tab-pane fade");
         $('#tab4-7').addClass("tab-pane fade");

         /*    $('#tab4-6').addClass("tab-pane fade show active");
         $('#tab4-4').removeClass("tab-pane fade show active");
         $('#tab4-5').removeClass("tab-pane fade show active"); */
      });
      $('#tab4').mouseenter(function() {
         console.log('4444');

         $('#tab4-7').addClass("tab-pane fade show active");
         $('#tab4-4').removeClass("tab-pane fade show active");
         $('#tab4-5').removeClass("tab-pane fade show active");
         $('#tab4-6').removeClass("tab-pane fade show active");
         $('#tab4-5-tab').removeClass("nav-item nav-link active");
         $('#tab4-4-tab').removeClass("nav-item nav-link active");
         $('#tab4-6-tab').removeClass("nav-item nav-link active");
         $('#tab4-4-tab').addClass("nav-item nav-link");
         $('#tab4-5-tab').addClass("nav-item nav-link");
         $('#tab4-6-tab').addClass("nav-item nav-link");
         $('#tab4-7-tab').addClass("nav-item nav-link active");
         $('#tab4-5').addClass("tab-pane fade");
         $('#tab4-4').addClass("tab-pane fade");
         $('#tab4-6').addClass("tab-pane fade");

         /*    $('#tab4-6').addClass("tab-pane fade show active");
         $('#tab4-4').removeClass("tab-pane fade show active");
         $('#tab4-5').removeClass("tab-pane fade show active"); */
      });
      
   });
</script>

<div id="all">
   <!-- Top bar-->
   <div class="top-bar">
      <div class="container">
         <div class="row d-flex align-items-center">
            <div class="col-md-6 d-md-block d-none">
               <!-- <p>Contact us on +420 777 555 333 or hello@universal.com.</p> -->
            </div>
            <div class="col-md-6">
               <div class="d-flex justify-content-md-end justify-content-between">
                  <ul class="list-inline contact-info d-block d-md-none">
                     <li class="list-inline-item"><a href="#"><i
                           class="fa fa-phone"></i></a></li>
                     <li class="list-inline-item"><a href="#"><i
                           class="fa fa-envelope"></i></a></li>
                  </ul>
                  <!-- 회원가입 원래 href   href="customer-register.html"  -->
                  <!-- login a태그에  data-toggle="modal" data-target="#login-modal" -->
                  <c:if test="${sessionScope.name eq null }">
                     <div class="login">
                        <a id="login" href="login" class="login-btn"><i
                           class="fa fa-sign-in"></i><span
                           class="d-none d-md-inline-block">LOGIN</span></a><a id="signup"
                           href="signup" class="signup-btn"><i class="fa fa-user"></i><span
                           class="d-none d-md-inline-block">Sign Up</span></a>
                     </div>
                  </c:if>
                 <c:if test="${sessionScope.name ne null}">
                     <label id="idInfo">${sessionScope.name } 님 환영합니다&nbsp;&nbsp;</label>
                     <a id="logout" href="loginout"><i class="fa fa-sign-out"></i>LOGOUT&nbsp;&nbsp;</a>
                     <a id="mypage" href="mypage"><i class="fa fa-user"></i>MYPAGE</a>
                  </c:if>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Top bar end-->
   <!-- Navbar Start-->
   <header class="nav-holder make-sticky">
      <div id="navbar" role="navigation" class="navbar navbar-expand-lg">
         <div style="margin: 0px 0px 0px 0px;" class="container-fluid">
            <a href="/test/" class="navbar-brand home"> <img
               src="img/logo.jpg" alt="Universal logo"
               class="d-none d-md-inline-block"> <img
               src="img/logo-small.png" alt="Universal logo"
               class="d-inline-block d-md-none"></a>
            <button type="button" data-toggle="collapse"
               data-target="#navigation"
               class="navbar-toggler btn-template-outlined">
               <span class="sr-only">Toggle navigation</span><i
                  class="fa fa-align-justify"></i>
            </button>
            <div style="width: 100%" id="navigation"
               class="navbar-collapse collapse">
               <ul class="nav navbar-nav ml-auto">
                  <li class="nav-item dropdown menu-large"><a href="#"
                     data-toggle="dropdown" class="dropdown-toggle">주변 병원 찾기<b
                        class="caret"></b></a>
                     <ul class="dropdown-menu megamenu">
                        <li>
                           <div class="row">
                              <div class="col-lg-12 col-md-6">
                                 <ul class="list-unstyled mb-3">
                                    
                                    <div class="col-md-12">
                                       <nav id="myTab" role="tablist" class="nav nav-tabs">
                                          <a style="width:120px" id="tab4-4-tab" data-toggle="tab" href="#tab4-4"
                                             role="tab" aria-controls="tab4-4" aria-selected="true"
                                             class="nav-item nav-link active"> <i id="tab1"
                                             class="icon-star">진료과목별</i>
                                          </a><a style="width:120px" id="tab4-5-tab" data-toggle="tab" href="#tab4-5"
                                             role="tab" aria-controls="tab4-5" aria-selected="false"
                                             class="nav-item nav-link"><i id="tab2"
                                             class="icon-star">증상별</i></a><a style="width:120px" id="tab4-6-tab"
                                             data-toggle="tab" href="#tab4-6" role="tab"
                                             aria-controls="tab4-6" aria-selected="false"
                                             class="nav-item nav-link"><i id="tab3"
                                             class="icon-star">테마별</i></a> <a style="width:120px" id="tab4-7-tab"
                                             data-toggle="tab" href="#tab4-6" role="tab"
                                             aria-controls="tab4-7" aria-selected="false"
                                             class="nav-item nav-link"><i id="tab4"
                                             class="icon-star">실시간</i></a>
                                       </nav>
                                       <div id="nav-tabContent" class="tab-content">
                                          <div id="tab4-4" role="tabpanel"
                                             aria-labelledby="tab4-4-tab"
                                             class="tab-pane fade show active">
                                             <a style="width: 10%;" href="ready?homemenu=500"><img
                                                src="/test/icon/hospital.png">
                                                <p>내과</p></a><a style="width: 10%;"
                                                href="ready?homemenu=501"><img
                                                src="/test/icon/brain.png">
                                                <p>신경과</p></a><a style="width: 10%;"
                                                href="ready?homemenu=502"><img
                                                src="/test/icon/emotions.png">
                                                <p>정신건강의학과</p></a><a style="width: 10%;"
                                                href="ready?homemenu=503"><img
                                                src="/test/icon/finger.png">
                                                <p>외과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=504"><img
                                                src="/test/icon/bone.png">
                                                <p>정형외과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=505"><img
                                                src="/test/icon/intelligence.png">
                                                <p>신경외과</p></a><a style="width: 10%;"
                                                href="ready?homemenu=506"><img
                                                src="/test/icon/plastic-surgery.png">
                                                <p>성형외과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=507"><img
                                                src="/test/icon/syringe.png">
                                                <p>마취과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=508"><img
                                                src="/test/icon/pregnant.png">
                                                <p>산부인과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=509"><img
                                                src="/test/icon/baby-boy.png">
                                                <p>소아청소년과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=510"><img
                                                src="/test/icon/eye.png">
                                                <p>안과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=511"><img
                                                src="/test/icon/ear.png">
                                                <p>이비인후과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=512"><img
                                                src="/test/icon/allergic.png">
                                                <p>피부과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=513"><img
                                                src="/test/icon/kidneys.png">
                                                <p>비뇨기과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=514"><img
                                                src="/test/icon/cardiogram.png">
                                                <p>영상/검진의학</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=515"><img
                                                src="/test/icon/infrared.png">
                                                <p>재활의학과</p> </a><a style="width: 10%;"
                                                href="ready?homemenu=516"><img
                                                src="/test/icon/1.png">
                                                <p>치과</p> </a>
                                          </div>
                                          <div id="tab4-5" role="tabpanel"
                                             aria-labelledby="tab4-5-tab" class="tab-pane fade">
                                             <a style="width: 10%;" href="ready?homemenu=600"><img
                                                src="/test/icon/headache.png">
                                                <p>두통</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=601"><img
                                                src="/test/icon/hair.png">
                                                <p>탈모</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=602"><img
                                                src="/test/icon/pacient.png">
                                                <p>흉터</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=603"><img
                                                src="/test/icon/leggings.png">
                                                <p>하지정맥</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=604"><img
                                                src="/test/icon/burn.png">
                                                <p>화상</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=605"><img
                                                src="/test/icon/spine.png">
                                                <p>체형/척추/자세</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=606"><img
                                                src="/test/icon/back-part-of-the-body-showing-butt-area.png">
                                                <p>항문</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=607"><img
                                                src="/test/icon/thyroid.png">
                                                <p>갑상선</p></a> <a style="width: 11%;"
                                                href="ready?homemenu=608"><img
                                                src="/test/icon/allergic.png">
                                                <p>아토피/알레르기</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=609"><img
                                                src="/test/icon/neuron.png">
                                                <p>대상포진</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=610"><img
                                                src="/test/icon/chin.png">
                                                <p>턱관절</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=611"><img
                                                src="/test/icon/knee.png">
                                                <p>관절</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=612"><img
                                                src="/test/icon/sugar-blood-level.png">
                                                <p>당뇨</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=613"><img
                                                src="/test/icon/brain1.png">
                                                <p>뇌혈관질환</p></a>
                                          </div>
                                          <div id="tab4-6" role="tabpanel"
                                             aria-labelledby="tab4-6-tab" class="tab-pane fade">
                                             <a style="width: 10%;" href="ready?homemenu=1"><img
                                                src="/test/icon/alarm.png">
                                                <p>응급의료기관</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=701"><img
                                                src="/test/icon/hospital1.png">
                                                <p>보건소</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=702"><img
                                                src="/test/icon/hospital2.png">
                                                <p>종합병원</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=703"><img
                                                src="/test/icon/pharmacy2.png">
                                                <p>요양병원</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=704"><img
                                                src="/test/icon/baby.png">
                                                <p>어린이치과</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=705"><img
                                                src="/test/icon/traditional-medicine.png">
                                                <p>한의원</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=706"><img
                                                src="/test/icon/baby3.png">
                                                <p>어린이한의원</p></a>
                                          </div>
                                          <div id="tab4-7" role="tabpanel"
                                             aria-labelledby="tab4-7-tab" class="tab-pane fade">
                                             <a style="width: 10%;" href="ready?homemenu=2"><img
                                                src="/test/icon/moon.png">
                                                <p>달빛어린이병원</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=4"><img src="/test/icon/hospital1.png">
                                                <p>병원</p></a> <a style="width: 10%;"
                                                href="ready?homemenu=800"><img
                                                src="/test/icon/pharmacy.png">
                                                <p>약국</p></a>
                                          </div>
                                       </div>
                                    </div>
                                 </ul>
                              </div>
                           </div>
                        </li>
                     </ul></li>
                  <li class="nav-item"><a href="ready?homemenu=3"
                     class="nav-link">주변 약국 찾기 <b class="caret"></b></a> <!-- 첫 번째 메뉴 시작 -->

                  </li>

                  <li class="nav-item dropdown"><a href="#"
                     data-toggle="dropdown" class="dropdown-toggle">실시간 병원/약국 <b
                        class="caret"></b></a>
                     <ul class="dropdown-menu">
                        <li>
                           <div class="row">

                              <div class="col-lg-auto col-md-6">
                                 <ul class="list-unstyled mb-6">
                                    <li class="nav-item"><a style="font-size: 15px" href="ready?homemenu=4"
                                       class="nav-link">병원(실시간)</a></li>
                                    <li class="nav-item"><a style="font-size: 15px" href="ready?homemenu=800"
                                       class="nav-link">약국(실시간)</a></li>
                                 </ul>
                              </div>

                           </div>
                        </li>
                     </ul></li>
                  <!-- ========== FULL WIDTH MEGAMENU ==================-->
                  <li class="nav-item"><a href="ready?homemenu=1"
                     class="nav-link">응급의료기관 <b class="caret"></b>
                  </a></li>
                  <!-- ========== FULL WIDTH MEGAMENU END ==================-->
                  <!-- ========== Contact dropdown ==================-->
                  <li class="nav-item"><a href="ready?homemenu=2"
                     class="nav-link">달빛어린이병원(실시간) <b class="caret"></b>
                  </a></li>
                  <!-- ========== Contact dropdown end ==================-->
                  <!-- ========== Contact dropdown ==================-->
                  <li class="nav-item "><a href="/test/adbbs" class="nav-link">이벤트 <b
                        class="caret"></b></a></li>
                  <!-- ========== Contact dropdown end ==================-->
                  <!-- ========== Contact dropdown ==================-->
                  <li class="nav-item"><a href="/test/list" class="nav-link">건강정보 <b
                        class="caret"></b></a></li>
                  <!-- ========== Contact dropdown end ==================-->
               </ul>
            </div>
         </div>
      </div>
   </header>
   <!-- Navbar End-->