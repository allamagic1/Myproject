<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
   href="https://cdn.jsdelivr.net/npm/css-toggle-switch@latest/dist/toggle-switch.css" />
<title>지도</title>

<style type="text/css">
.list-group, #map ,.main-footer{
   float: left;
}
.main-footer{
	width: 100%;
}
#map {
   clear: left;
}

.list-group-item-heading {
   font-size: 20px;
}

.list-group-item {
   margin: 4px 4px 4px 4px;
}

.list-group {
   display: inline-block;
   width: 35%;
   height: 600px;
   overflow: auto;
}

.wrap {
   position: absolute;
   left: 0;
   bottom: 50px;
   width: 280px;
   height: auto;
   margin-left: -144px;
   text-align: left;
   /* overflow: hidden; */
   font-size: 14px;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   line-height: 1.5;
}

.wrap * {
   padding: 0;
   margin: 0;
}

.wrap .info {
   width: 280px;
   height: auto;
   border-radius: 5px;
   border-bottom: 2px solid #ccc;
   border-right: 1px solid #ccc;
   overflow: auto;
   background: #fff;
}

.wrap .info:nth-child(1) {
   border: 0;
   box-shadow: 0px 1px 2px #888;
}

.info .title {
   padding: 5px 0 0 10px;
   height: 30px;
   background: #D5D5D5a;
   font-size: 16px;
   font-weight: bold;
   overflow: hidden;
   text-overflow: ellipsis;
   width: 255px;
   /*display : block; */
}

.info .close {
   position: absolute;
   top: 5px;
   right: 10px;
   color: #888;
   width: 17px;
   height: 17px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
   color: #888;
}

.info .close:hover {
   cursor: pointer;
}

.info .body {
   border-top: 1px solid #CC9999;
   position: relative;
   white-space: pre-line;
   width: auto;
}

.info .desc {
   border-bottom: 1px solid #CC9999;
   position: relative;
   margin: 5px 5px 5px 5px;
   height: auto;
   width: 270px;
   white-space: pre-line;
}

.desc .iaddress {
   margin: 0px 0px 5px 0px;
   white-space: pre-line;
   width: 270px;
}

.desc .itelno {
   margin: 0px 0px 5px 0px;
   white-space: pre-line;
   width: 270px;
   font-size: 14px;
   color: black;
   margin-top: -2px;
}

.desc .distance {
   margin: 0px 0px 5px 0px;
   font-size: 14px;
   width: 270px;
   color: black;
   margin-top: -2px;
   white-space: pre-line; /*white-space: nowrap*/
}

.info:after {
   content: '';
   position: absolute;
   margin-left: -12px;
   left: 52%;
   bottom: -10px;
   width: 22px;
   height: 12px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.search2 {
   display: inline-block;
   width: 32%;
   text-align: center;
}

.search1 {
   border-right: 1px solid #CC9999;
   display: inline-block;
   width: 32%;
   text-align: center;
}

.search0 {
   text-align: center;
   border-right: 1px solid #CC9999;
   display: inline-block;
   width: 32%;
}

select {
   float: left;
   display: inline-block;
   width: 250px;
   height: 45px;
   font-size: 15px;
}

fieldset {
   display: inline-block;
}
.img0>img{
   height: auto;
   width: 30%;
}
.list-group-item>p{
   text-align: left;
   margin-bottom: 0px;
}
</style>
</head>

<body>
	<%@include file="template/header.jsp" %>
   <script type="text/javascript" src="./js/distance.js"></script>
   <script type="text/javascript" src="./js/loading.js?ver=1"></script>
   <script type="text/javascript">
      //AJAX 통신 시작
      $(document).ajaxStart(function() {
         //마우스 커서를 로딩 중 커서로 변경
         /* $('html').css("cursor", "wait");  */
         /* $('#loading').hide(); */
         wrapWindowByMask();
      });
      //AJAX 통신 종료
      $(document).ajaxStop(function() {
         //마우스 커서를 원래대로 돌린다
         //$('#loading').show();
         closeWindowByMask();
      });
   </script>

   </script>
   <div id="menu">
      <!-- <a href="#" class="ajaxMenu" id="emergency">응급의료기관</a> <a href="#"
         class="ajaxMenu" id="moonlight">달빛어린이병원(실시간)</a> <a href="search"
         id="search">검색</a> <a href="#" class="ajaxMenu" id="pharmacy">약국</a>
      <a href="#" class="ajaxMenu" id="realTime">실시간</a> -->
      <button id="nowL" type="button" class="btn btn-default">현재위치</button>
      <fieldset>
         <div class="switch-toggle alert alert-light">
            <input id="RToff" name="view" type="radio" checked="checked">
            <label for="RToff" onclick="">off</label> <input id="RTon"
               name="view" type="radio"> <label for="RTon" onclick="">on</label>

            <a class="btn btn-warning"></a>
         </div>
      </fieldset>
   </div>
   <div id="select">
      <select name="sido" id="sido"><option value="">-시도-</option></select>

      <select name="gugun" id="gugun"><option value="">-시군구-</option></select>

      <select name="dong" id="dong"><option value="">-읍면동-</option></select>

      <select name="what" id="what">
         <option value="00" selected="selected">-상세 분류-</option>
         <option value="99" id="pharmacy">주변약국</option>
         <optgroup label="진료과목">
            <option value="01">내과</option>
            <option value="02">신경과</option>
            <option value="03">정신건강의학과</option>
            <option value="04">외과</option>
            <option value="05">정형외과</option>
            <option value="06">신경외과</option>
            <option value="08">성형외과</option>
            <option value="09">마취과</option>
            <option value="10">산부인과</option>
            <option value="11">소아청소년과</option>
            <option value="12">안과</option>
            <option value="13">인비인후과</option>
            <option value="14">피부과</option>
            <option value="15">비뇨기과</option>
            <option value="16">영상/검진의학과</option>
            <option value="21">재활의학과</option>
            <option value="49">치과</option>
         </optgroup>
         <optgroup label="테마" id="thema">
            <option value="77">응급의료기관</option>
            <option value="2080">보건소</option>
            <option value="2010">종합병원</option>
            <option value="2040">요양병원</option>
            <option value="53">어린이 치과</option>
            <option value="2060">한의원</option>
            <option value="82">어린이 한의원</option>
         </optgroup>
         <optgroup label="증상">
            <option value="06">두통</option>
            <option value="14">탈모</option>
            <option value="14">흉터</option>
            <option value="04">하지정맥</option>
            <option value="08">화상</option>
            <option value="23">비만</option>
            <option value="05">체형/척추/자세</option>
            <option value="04">항문</option>
            <option value="13">갑상선</option>
            <option value="14">아토피/알레르기</option>
            <option value="09">대상포진</option>
            <option value="50">턱관절</option>
            <option value="05">관절</option>
            <option value="01">당뇨</option>
            <option value="06">뇌혈관질환</option>
         </optgroup>
         <optgroup label="실시간">
            <option value="88">실시간 달빛어린이병원</option>
            <option value="000">실시간 병원</option>
            <option value="999">실시간 약국</option>
         </optgroup>
      </select>
   </div>

   <div id="map" style="width: 65%; height: 600px;"></div>
   <div id="mapList" class="list-group">
      <!-- <li class="list-group-item">
       <h4 class="list-group-item-heading"></h4>
     </li> -->
   </div>

	<%@include file="template/footer.jsp" %>

   <!-- services와 clusterer, drawing 라이브러리 불러오기 -->
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=177af53ddad8864dab8498322bdb3f8a&libraries=services,clusterer,drawing"></script>
   <script>
      var result; //json 결과 데이터를 받을 변수
      var markers = []; //마커배열
      var overlays = [];
      var item; //거리순으로 정렬시킨 item배열을 사용하기위해
      var positions;//마커를 표시할 위치와 title 객체 배열
      var clat;//중심 위도
      var clon;//중심 경도
      var MAX = -1; //지도에 표시할 마커 및 리스트 갯수
      var ay = [];
      var map;//지도 
   </script>

   <script type="text/javascript" src="./js/addList.js?ver=10"></script>
   <script type="text/javascript" src="./js/showMarker.js?ver=9"></script>
   <script type="text/javascript" src="./js/showMarkerRT.js?ver=13"></script>
   <script type="text/javascript" src="./js/nowFocus.js?ver=1"></script>
   <script type="text/javascript" src="./js/ajaxFunc.js?ver=13"></script>
   <script>
      //리스트에 마우스 올리면 인포윈도우가 뜨는 함수
      function list_info(i) {
         $(document).on('mouseenter', '#mapList>li:eq(' + i + ')', function() {
            overlays[i].setMap(map);
         });
         $(document).on('mouseleave', '#mapList>li:eq(' + i + ')', function() {
            overlays[i].setMap(null);
         });
      }//list_info() end

      //before 마우스 클릭 마커의 오버레이
      //다른 마커를 클릭하여 오버레이를 띄울 경우 이전 오버레이를 닫기위해서 필요한 변수
      var beforeMark;
      var infowindow;
      var clckMarker = new daum.maps.Marker();
      var markerImage1 = new daum.maps.MarkerImage(//클릭하기 전 마커이미지
             './js/noclckM.png',
             new daum.maps.Size(44, 46), new daum.maps.Point(20, 45));
      var markerImage2 = new daum.maps.MarkerImage(//클릭한 마커이미지
             './js/clckM.png',
             new daum.maps.Size(44, 46), new daum.maps.Point(20, 45));
      
      var centerMarker = new daum.maps.Marker();   //중심좌표 마커(전역)
      var markerImage = new daum.maps.MarkerImage(//중심마커 이미지
            './js/centerM.png',
            new daum.maps.Size(44, 46), new daum.maps.Point(22, 46));
      
      // 마커 클릭이벤트 함수
      function makeClickListener(overlay, i, marker) {
         return function() {
            
            clckMarker.setImage(markerImage1);//클릭하기 이전마커의 이미지를 원래대로 되돌리기
            clckMarker = marker;
            marker.setImage(markerImage2);//클릭한 마커의 이미지를 바꾸기
            
            $('.list-group-item').css('border', '');//선택된 리스트 색 초기화
            console.log(i);
            map.panTo(positions[i].latlng);//선택한 마커를 지도의 중심으로 
            var sum = 0;//겹친 마커의 개수
            ay = new Array();
            //마커의 좌표차이를 구해서 겹쳐있는 마커의 개수를 구하고, 겹친마커의 인덱스를 배열에 넣기 
            for (var cnt = 0; cnt < MAX; cnt++) {
               var dib = positions[cnt].latlng.ib - positions[i].latlng.ib;
               var djb = positions[cnt].latlng.jb - positions[i].latlng.jb;
               if ((Math.abs(dib) < 0.00005) && (Math.abs(djb) < 0.00005)) {
                  sum += 1;
                  ay.push(cnt);
               }

            }

            if (infowindow != null) {
               infowindow.close();
            }
            if (beforeMark != null) {//beforeMark에 overlay가 들어있지 않을 경우 setMap 함수를 사용할 수 없는 변수이기 때문에 에러가 출력된다. 처음에 null값만 피하면 되는 상황이다.
               beforeMark.setMap(null);
            }
            if (sum > 1) {//겹친 마커가 2개 이상일때
               var iwContent = '<div style="margin: 5px 25px 5px 5px;">';

               for (var ii = 0; ii < sum; ii++) {
                  iwContent += '<a style="white-space:nowrap;text-overflow: ellipsis;" id="'+ay[ii]+'">'
                        + positions[ay[ii]].title + '</a></br>';
                  //겹친 마커 리스트의 a태그를 클릭하면 오버레이 띄우기 
                  aClick(ay[ii]);
               }
               iwContent += '</div>';

               //겹친마커들의 리스트 > a태그 클릭시 오버레이 띄우기 함수
               function aClick(idx) {
                  $(document).on(
                        'click',
                        '#' + idx,
                        function() {
                           map.panTo(positions[idx].latlng);//선택한 마커를 지도의 중심으로 
                           $('.list-group-item').css('border', '');//선택된 리스트 색 초기화
                           beforeMark = overlays[idx];
                           beforeMark.setMap(map);
                           //클릭한 a태그의 정보가 리스트에서 맨 위에 뜨게
                           document.getElementById(idx + "list")
                                 .scrollIntoView({
                                    block : 'start',
                                    behavior : 'smooth'
                                 });
                           $('#' + idx + 'list').css('border',
                                 '2px solid red');
                        });
               }
               ;// aClick() end

               // 인포윈도우를 생성합니다
               infowindow = new daum.maps.InfoWindow({
                  content : iwContent,
                  removable : true
               });
               infowindow.open(map, marker);

               //클릭한 마커의 정보가 리스트에서 맨 위에 뜨게
               document.getElementById(ay[0] + "list").scrollIntoView({
                  block : 'start',
                  behavior : 'smooth'
               });
               $('#' + ay[0] + 'list').css('border', '2px solid red');

            } else {
               beforeMark = overlay;
               beforeMark.setMap(map);

               //클릭한 마커의 정보가 리스트에서 맨 위에 뜨게
               document.getElementById(i + "list").scrollIntoView({
                  block : 'start',
                  behavior : 'smooth'
               });
               $('#' + i + 'list').css('border', '2px solid red');
            }

         };
      }//makeClickListener() end

      //겹친 마커에 마우스를 올릴때 함수
      function sameMarker(map, marker, i) {
         var su = 0;
         for (var cnt = 0; cnt < MAX; cnt++) {
            var dib = positions[cnt].latlng.ib - positions[i].latlng.ib;
            var djb = positions[cnt].latlng.jb - positions[i].latlng.jb;
            if ((Math.abs(dib) < 0.00005) && (Math.abs(djb) < 0.00005)) {
               su++;
            }
         }
         if (su >= 2) {//겹쳐있는 마커가 2개 이상일때
            // 마커에 표시할 인포윈도우를 생성합니다 
            var infowindow2 = new daum.maps.InfoWindow({
               content : '<p style="margin:3px 0px 0px 3px">' + su
                     + '개의 결과가 있습니다</p>'// 인포윈도우에 표시할 내용 
            });
            daum.maps.event.addListener(marker, 'mouseover',
                  makeOverListener(map, marker, infowindow2));
            daum.maps.event.addListener(marker, 'mouseout',
                  makeOutListener(infowindow2));
         }
      }//sameMarker() end

      // 겹친마커 인포윈도우 표시하는 함수
      function makeOverListener(map, marker, infowindow2) {
         return function() {
            infowindow2.open(map, marker);
         };
      }//makeOverListener() end

      //  겹친마커 인포윈도우 닫는 함수
      function makeOutListener(infowindow2) {
         return function() {
            infowindow2.close();
         };
      }//makeOutListener() end

      // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
      function makeOutListener(overlay) {
         return function() {
            overlay.setMap(null);
         };
      }//makeOutListener() end

      // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
      function setMarkers(map) {
         for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
         }
      }//setMarkers() end

      // "마커 감추기" 
      function hideMarkers() {
         setMarkers(null);
         markers = new Array();
      }//hideMarkers() end

      function closeOverlay(i) {
         //console.log(overlays[i]);
         overlays[i].setMap(null);
      }//closeOverlay() end

      
      /* document.ready 시점 */
      $(function() {

         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            //center: new daum.maps.LatLng(37.56639, 126.97952), // 지도의 중심좌표
            center : new daum.maps.LatLng(37.64380428170851,
                  126.657217694395),
            level : 3, // 지도의 확대 레벨
            mapTypeId : daum.maps.MapTypeId.ROADMAP
         // 지도종류
         };

         // 지도를 생성한다 
         map = new daum.maps.Map(mapContainer, mapOption);

         // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
         var mapTypeControl = new daum.maps.MapTypeControl();

         // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
         // daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
         map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPLEFT);

         // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
         var zoomControl = new daum.maps.ZoomControl();
         map.addControl(zoomControl, daum.maps.ControlPosition.LEFT);

         //'현재위치'버튼을 클릭했을때
         $('#nowL').click(function() {
            //이전마커들 없애기
            hideMarkers();
            centerMarker.setMap(null);
            //지역 셀렉트박스 초기화
            if (($(this).attr('id')) == 'nowL') {
               $('#sido').children().eq(0).prop('selected', 'selected');
               $('#gugun').children().eq(0).prop('selected', 'selected');
               $('#dong').children().eq(0).prop('selected', 'selected');
            }
            nowFocus();
         });

            nowFocus(); //맨 처음에 현재위치 기준으로 데이터 띄우기
          //메뉴구분
            //1:응급 2:달빛실시간 3:약국 4:병원실시간
            //1 테마 2 증상 3 실시간
            if(${homemenu}==1){
               $('#what optgroup:eq(1)').children().eq(0).prop('selected', 'selected');
               //ajaxm();
            }
            else if(${homemenu}==2){
               $('input[id="RTon"]').prop('checked','checked');
               $('#what optgroup:eq(3)').children().eq(0).prop('selected', 'selected');
               //ajaxm();
            }else if(${homemenu}==3){
               $('#what').children().eq(1).prop('selected', 'selected');
            }else if(${homemenu}==4){
               $('input[id="RTon"]').prop('checked','checked');
               $('#what optgroup:eq(3)').children().eq(1).prop('selected', 'selected');//실시간병원이 default
            }else if(${homemenu}==500){
                  $('#what optgroup:eq(0)').children().eq(0).prop('selected', 'selected');//내과
           }else if(${homemenu}==501){
                  $('#what optgroup:eq(0)').children().eq(1).prop('selected', 'selected');//내과
           }else if(${homemenu}==502){
                  $('#what optgroup:eq(0)').children().eq(2).prop('selected', 'selected');//내과
           }else if(${homemenu}==503){
                  $('#what optgroup:eq(0)').children().eq(3).prop('selected', 'selected');//내과
           }else if(${homemenu}==504){
                  $('#what optgroup:eq(0)').children().eq(4).prop('selected', 'selected');//내과
           }else if(${homemenu}==505){
                  $('#what optgroup:eq(0)').children().eq(5).prop('selected', 'selected');//내과
           }else if(${homemenu}==506){
                  $('#what optgroup:eq(0)').children().eq(6).prop('selected', 'selected');//내과
           }else if(${homemenu}==507){
                  $('#what optgroup:eq(0)').children().eq(7).prop('selected', 'selected');//내과
           }else if(${homemenu}==508){
                  $('#what optgroup:eq(0)').children().eq(8).prop('selected', 'selected');//내과
           }else if(${homemenu}==509){
                  $('#what optgroup:eq(0)').children().eq(9).prop('selected', 'selected');//내과
           }else if(${homemenu}==510){
                  $('#what optgroup:eq(0)').children().eq(10).prop('selected', 'selected');//내과
           }else if(${homemenu}==511){
                  $('#what optgroup:eq(0)').children().eq(11).prop('selected', 'selected');//내과
           }else if(${homemenu}==512){
                  $('#what optgroup:eq(0)').children().eq(12).prop('selected', 'selected');//내과
           }else if(${homemenu}==513){
                  $('#what optgroup:eq(0)').children().eq(13).prop('selected', 'selected');//내과
           }else if(${homemenu}==514){
                  $('#what optgroup:eq(0)').children().eq(14).prop('selected', 'selected');//내과
           }else if(${homemenu}==515){
                  $('#what optgroup:eq(0)').children().eq(15).prop('selected', 'selected');//내과
           }else if(${homemenu}==516){
                  $('#what optgroup:eq(0)').children().eq(16).prop('selected', 'selected');//내과
           }else if(${homemenu}==600){
                  $('#what optgroup:eq(2)').children().eq(0).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==601){
                  $('#what optgroup:eq(2)').children().eq(1).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==602){
                  $('#what optgroup:eq(2)').children().eq(2).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==603){
                  $('#what optgroup:eq(2)').children().eq(3).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==604){
                  $('#what optgroup:eq(2)').children().eq(4).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==605){
                  $('#what optgroup:eq(2)').children().eq(5).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==606){
                  $('#what optgroup:eq(2)').children().eq(6).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==607){
                  $('#what optgroup:eq(2)').children().eq(7).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==608){
                  $('#what optgroup:eq(2)').children().eq(8).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==609){
                  $('#what optgroup:eq(2)').children().eq(9).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==610){
                  $('#what optgroup:eq(2)').children().eq(10).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==611){
                  $('#what optgroup:eq(2)').children().eq(11).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==612){
                  $('#what optgroup:eq(2)').children().eq(12).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==613){
                  $('#what optgroup:eq(2)').children().eq(13).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==701){
                  $('#what optgroup:eq(1)').children().eq(1).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==702){
                  $('#what optgroup:eq(1)').children().eq(2).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==703){
                  $('#what optgroup:eq(1)').children().eq(3).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==704){
                  $('#what optgroup:eq(1)').children().eq(4).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==705){
                  $('#what optgroup:eq(1)').children().eq(5).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==706){
                  $('#what optgroup:eq(1)').children().eq(6).prop('selected', 'selected');//증상/////////////////////////
           }else if(${homemenu}==800){
                 $('input[id="RTon"]').prop('checked','checked');
                  $('#what optgroup:eq(3)').children().eq(2).prop('selected', 'selected');//증상/////////////////////////
           }

         var div = document.querySelector('#map');
         //지도에서 마우스 드래그 끝날때
         daum.maps.event.addListener(map, 'dragend', function() {
            
            console.log('지도의 중심 좌표는 ' + map.getCenter().toString()
                  + ' 입니다.');

            var lat = map.getCenter().jb;//변경된 위도
            var lon = map.getCenter().ib;//변경된 경도
            //변경된 좌표와의 차이
            var gapLat = Math.abs(lat - clat);
            var gapLon = Math.abs(lon - clon);

            //중심좌표가 많이 움직였을때 다시 데이터 받아오기
            if (gapLat > 0.005 || gapLon > 0.005) {
               console.log('중심좌표를 많이 움직였습니다.');
               //이전마커 지우기
               hideMarkers();
               centerMarker.setMap(null);//중심마커 없애기
                  
               clat = lat;
               clon = lon;
               centerMarker = new daum.maps.Marker({//지도 중심마커
                  map : map, // 마커를 표시할 지도
                  position : map.getCenter(), // 마커를 표시할 위치
                  image : markerImage//마커이미지
               });
               centerMarker.setMap(map);
               geo();//ajax 파싱->지도
            }

         });

         //실시간 토글버튼 이벤트 함수
         real();

         //상세분류 셀렉트박스 이벤트 함수
         select();

         //응급,달빛,약국 상단메뉴 클릭 이벤트 함수
         click();

      });//document.ready end
   </script>

   <script type="text/javascript" src="./js/sojaeji.js?ver=11"></script>
   <script type="text/javascript">
      //selectbox로 주소 선택할때 함수 
      new sojaeji("map", $("#sido option:selected").val(), $(
            "#gugun option:selected").val(), $("#dong option:selected")
            .val());
   </script>
   
</body>
</html>