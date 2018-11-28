<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<title>${name }</title>
<style type="text/css">
ul {
	   list-style: none;
	   /* margin:0;
	    padding:0; */
	}
	
	#option>li {
	   margin: 0 0 5px 5px;
	   padding: 0 0 0 0;
	   border: 0;
	   float: left;
	}

	#hospital_name {
	   display: inline-block;
	}
	
	.list-group {
		display: inline-block;
		width: 100%;
		overflow: auto;
	}
	
	.star-input>.input,
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('/test/img/grade_img.png')no-repeat;}
	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
	.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
	star-input>.input.focus{outline:1px dotted #ddd;}
	.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.star-input>.input>label:hover~label{background-image: none;}
	.star-input>.input>label[for="p0.5"]{width:15px;z-index:10;}
	.star-input>.input>label[for="p1"]{width:30px;z-index:9;}
	.star-input>.input>label[for="p1.5"]{width:45px;z-index:8;}
	.star-input>.input>label[for="p2"]{width:60px;z-index:7;}
	.star-input>.input>label[for="p2.5"]{width:75px;z-index:6;}
	.star-input>.input>label[for="p3"]{width:90px;z-index:5;}
	.star-input>.input>label[for="p3.5"]{width:105px;z-index:4;}
	.star-input>.input>label[for="p4"]{width:120px;z-index:3;}
	.star-input>.input>label[for="p4.5"]{width:135px;z-index:2;}
	.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
	.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

	body{
		width: 70%;
		margin: auto;
		padding: 0px 80px;
		/* background-color: white; */
	}
	html{
		background-color: #F3F3F3;
	}
	.page-header{
		text-align: center;
		padding:0px;
		margin-top: 0px;
	}
	#staticMap{
		margin: auto;
		width: 100%;
		height: 350px;
	}
	#my_hospital{
		width: 45px;
		height: 45px;
	}
	.star-input{
		padding: 10px;
	}
	#content{
		width: 100%;
		height: 100px;
	}
	#basic{
		font-size: 13pt;
	}
	#option img{
		width: 30%;
		height: auto;
	}
</style>
</head>
<body>

	<div class="page-header">
		<!-- 로그인한 유저가 즐겨찾기를 한 업체인지 확인할 수 있는 별 이미지 -->
		<h1 id="hospital_name">${name }  <img id="my_hospital" src="../js/star0.png" /> </h1>
		<br><br>
		<div id="option">
	      <div style="display:inline-block;width:15%;" class="search0"><div  class="img0">
	      		<img style="align:center;" src="/test/js/road.png"/></div>
	            <a  href="http://map.daum.net/link/to/${name },${lat},${lon}">길찾기</a>
	      </div>
	      <div style="display:inline-block;width:15%;" class="search1"><div class="img0">
	      		<img style="align:center;" src="/test/js/view.png"/></div>
	            <a href="http://map.daum.net/link/roadview/${lat},${lon}">로드뷰</a>
	      </div>
	      <div style="display:inline-block;width:15%;" class="search2"><div class="img0">
	      		<img style="align:center;" src="/test/js/share.png"/></div>
	            <a id="kakao-link-btn" href="javascript:sendLink()">공유</a>
	      </div>
      </div>
	</div>
	
	 <script type="text/javascript">
      var name = '${name}';		//병원,약국 이름
      var url = window.document.URL;//현재 페이지 url
   $(function(){
      //로그인한 유저가 디테일 페이지에 해당하는 업체를 즐겨찾기 유/무를 디비로 부터 확인한 결과
      //1 : 즐겨찾기 함
      //2 : 즐겨찾기 안 함
      var my_hosp_detail_result = '${my_hosp_detail_result}';
      //디비에서 즐겨찾기 정보를 확인하기 위한 파라메타 값들
      //user : 유저의 아이디
      //detail_MyHp_select_source : 병원 이름과 병원 전화번호( 지역번호를 제외한 번호 )
      var user = '${user}';
      var detail_MyHp_select_source = '${detail_MyHp_select_source}';
      if(user==''){
         $('#my_hospital').hide();
         $('#welcome').hide();
      }
      //console.log(my_hosp_detail_result+' 즐겨찾기 결과 확인');
      if(my_hosp_detail_result=='1'){
         //console.log('111111');
         $('#my_hospital').attr("src", '../js/star.png');
      }
      
      $('#my_hospital').click(function(){
         
         $.get('my_pha_del', {
            'user' : user,
            'detail_MyHp_select_source' : detail_MyHp_select_source,
            'name' : name,
            'url': url
         }, function(data) {
            if(data=='1'){
               $('#my_hospital').attr("src", '../js/star.png');
               
            }else{
               $('#my_hospital').attr("src", '../js/star0.png');
               
            }
         });
         
      });
   });
   </script>

	<div id="staticMap"></div>

	<jsp:include page="./shareRt.jsp"></jsp:include>

	<div>
		<h3>기본정보</h3>
		<div id="basic">
			<h3>
				<small id="field"></small>
			</h3>
			<div>
				<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
				주소 : ${addr }
			</div>
			<div>
				<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
				전화번호 : ${tel }
			</div>
			<div id="navi"></div>
		</div>
		<hr>
		<div id="detail">
			<h3>진료/영업시간</h3>
			<div id="emg"></div>
			<table id="time" class="table table-bordered">
				<tr>
					<th>요일</th>
					<th>시간</th>
				</tr>
			</table>
		</div>
		<hr>
	</div>
	<div id="review">
   		<h3>리뷰/평점 <small>(${cnt })</small></h3>
   		<h4>평점 : ${avg } 점</h4>
	   		<div class="star-input">
				<span class="input">
			    	<input type="radio" name="star-input" value="0.5" id="p0.5">
			    	<label for="p0.5">0.5</label>
			    	<input type="radio" name="star-input" value="1" id="p1">
			    	<label for="p1">1</label>
			    	<input type="radio" name="star-input" value="1.5" id="p1.5">
			    	<label for="p1.5">1.5</label>
			    	<input type="radio" name="star-input" value="2" id="p2">
			    	<label for="p2">2</label>
			    	<input type="radio" name="star-input" value="2.5" id="p2.5">
			    	<label for="p2.5">2.5</label>
			    	<input type="radio" name="star-input" value="3" id="p3">
			    	<label for="p3">3</label>
			    	<input type="radio" name="star-input" value="3.5" id="p3.5">
			    	<label for="p3.5">3.5</label>
			    	<input type="radio" name="star-input" value="4" id="p4">
			    	<label for="p4">4</label>
			    	<input type="radio" name="star-input" value="4.5" id="p4.5">
			    	<label for="p4.5">4.5</label>
			    	<input type="radio" name="star-input" value="5" id="p5">
			    	<label for="p5">5</label>
			  	</span>
			  	<output for="star-input"><b id="score">0</b>점</output>						 
			</div>
			<div>
				<c:if test="${sessionScope.id eq null }">
					<textarea style="width: 100%" readonly="readonly">로그인 후 이용 가능한 서비스 입니다
					</textarea>
				</c:if>
				<c:if test="${sessionScope.id ne null }">
					<textarea id="content" name="content" ></textarea>
				</c:if>
			</div>
			<div>
				<button id="btn_reivew" type="button" class="btn btn-default">등록</button>
				<button id="btn_edit" type="button" class="btn btn-default" >수정</button>
				<button id="btn_cancle" type="button" class="btn btn-default" >취소</button>
			</div>
			
			<c:if test="${reviewList ne null }">
				<ul id="reviewList" class="list-group">
				<c:forEach var="review" items="${reviewList }">
					<li class="list-group-item">
						<div>점수:${review.score }</div>
				       	<div>${review.content }</div>
				       	<small>${review.id }  |  ${review.day } </small>
				       	<c:if test="${review.id eq sessionScope.id }">
				       		<button class="btn_delReview  btn btn-default" value="${review.idx }">삭제</button>
				       		<button class="btn_editReview  btn btn-default" value="${review.idx }">수정</button>
				       	</c:if>
				    </li>
				</c:forEach>
				</ul>
			</c:if>
   </div>
   <script type="text/javascript" src="../js/star.js?ver=2"></script>
   <script type="text/javascript">
 		//처음엔 리뷰 수정,취소 버튼 숨기기 
		$(function(){
			$('#btn_edit').hide();
			$('#btn_cancle').hide();
		});		
   
   		var key = '${detail_MyHp_select_source}';
   		//리뷰 등록 ajax
   		$('#btn_reivew').click(function(){
   			$.post('review', {
   				'content' : $('#content').val(),
   				'score' : $('#score').text(),
   				'detail_MyHp_select_source': key,
   				'name' : name,
   				'url' : url
   			}, function(data) {
   				if(data==1){//리뷰 등록 성공
   					window.location.reload();
   				}else{//리뷰 등록 실패
   					alert('리뷰 등록 실패');
   				}
   			});
   		});
   		
   		//리뷰 삭제 ajax
   		$('.btn_delReview').click(function(){
   			$.post('delReview', {
   				'idx':$(this).val()
   			}, function(data) {
   				if(data==1){//리뷰 삭제 성공
   					window.location.reload();
   				}else{//리뷰 등록 실패
   					alert('리뷰 삭제 실패');
   				}
   			});
   		});
   		
   		var idx = "";
   		//리뷰 수정 버튼클릭
   		$('.btn_editReview').click(function(){
   			idx = $(this).val();
   			$('#reviewList').hide();
   			$('#btn_reivew').hide();
   			$('#btn_cancle').show();
   			$('#btn_edit').show();
   		});
   		//리뷰 수정 처리 ajax
   		$('#btn_edit').click(function(){
   			$.post('editReview', {
   				'idx':idx,
   				'content' : $('#content').val(),
   				'score' : $('#score').text()
   			}, function(data) {
   				if(data==1){//리뷰 수정 성공
   					window.location.reload();
   				}else{//리뷰 수정 실패
   					alert('리뷰 수정 실패');
		   			$('#reviewList').show();
		   			$('#btn_reivew').show();
		   			$('#btn_cancle').hide();
		   			$('#btn_edit').hide();
   				}
   			});
   		});
   		//리뷰 취소
   		$('#btn_cancle').click(function(){
   			window.location.reload();
   		});
   </script>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=177af53ddad8864dab8498322bdb3f8a"></script>
	<script>    
		// 이미지 지도에서 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(${lat}, ${lon}); 
	
		// 이미지 지도에 표시할 마커입니다
		// 이미지 지도에 표시할 마커는 Object 형태입니다
		var marker = {
		    position: markerPosition,
		    text: '${name}'
		};
	
		var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
		    staticMapOption = { 
		        center: new daum.maps.LatLng(${lat}, ${lon}), // 이미지 지도의 중심좌표
		        level: 3, // 이미지 지도의 확대 레벨
		        marker: marker // 이미지 지도에 표시할 마커 
		    };    
	
		// 이미지 지도를 생성합니다
		var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>

	<script type="text/javascript">
		var RTjson = ${json}.response.body.items.item;
		if(RTjson){
			var field = RTjson.dgidIdName;	//진료과목
			var navi = RTjson.dutyMapimg;	//간이약도
			var emg = RTjson.dutyEryn;		//응급실 운영여부 1/2
			var MonS = RTjson.dutyTime1s;	//월요일 오픈
			var TueS = RTjson.dutyTime2s;	//화요일 오픈
			var WedS = RTjson.dutyTime3s;	//수요일 오픈
			var ThuS = RTjson.dutyTime4s;	//목요일 오픈
			var FriS = RTjson.dutyTime5s;	//금요일 오픈
			var SatS = RTjson.dutyTime6s;	//토요일 오픈
			var SunS = RTjson.dutyTime7s;	//일요일 오픈
			var HoliS = RTjson.dutyTime8s;	//공휴일 오픈
			var MonC = RTjson.dutyTime1c;	//월요일 마감
			var TueC = RTjson.dutyTime2c;	//화요일 마감
			var WedC = RTjson.dutyTime3c;	//수요일 마감
			var ThuC = RTjson.dutyTime4c;	//목요일 마감
			var FriC = RTjson.dutyTime5c;	//금요일 마감
			var SatC = RTjson.dutyTime6c;	//토요일 마감
			var SunC = RTjson.dutyTime7c;	//일요일 마감
			var HoliC = RTjson.dutyTime8c;	//공휴일 마감
			if(field){
				$('#field').append(field); 
			}
			if(navi){
				$('#navi').append(navi); 
			}
			if(emg){
				if(emg=="1") $('#emg').append('응급실 운영함'); 
			}
			if(MonS){
				$('#time').append('<tr><td>월요일</td><td>'+MonS+' ~ '+MonC+'</td></tr>'); 
			}
			if(TueS){
				$('#time').append('<tr><td>화요일</td><td>'+TueS+' ~ '+TueC+'</td></tr>'); 
			}
			if(WedS){
				$('#time').append('<tr><td>수요일</td><td>'+WedS+' ~ '+WedC+'</td></tr>'); 
			}
			if(ThuS){
				$('#time').append('<tr><td>목요일</td><td>'+ThuS+' ~ '+ThuC+'</td></tr>'); 
			}
			if(FriS){
				$('#time').append('<tr><td>금요일</td><td>'+FriS+' ~ '+FriC+'</td></tr>'); 
			}
			if(SatS){
				$('#time').append('<tr><td>토요일</td><td>'+SatS+' ~ '+SatC+'</td></tr>'); 
			}
			if(SunS){
				$('#time').append('<tr><td>일요일</td><td>'+SunS+' ~ '+SunC+'</td></tr>'); 
			}
			if(HoliS){
				$('#time').append('<tr><td>공휴일</td><td>'+HoliS+' ~ '+HoliC+'</td></tr>'); 
			}
			
		}
				
	</script>
	
</body>
</html>