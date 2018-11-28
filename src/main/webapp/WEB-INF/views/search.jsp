<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>검색</title>
<style type="text/css">
select {
   float: left;
   display: inline-block;
   width: 250px;
   height: 45px;
   font-size: 15px;
}
.list-group {
	height: 450px;
	overflow: auto;
}
</style>
</head>
<body>
	<%@include file="template/header.jsp" %>

	<script type="text/javascript" src="./js/loading.js?ver=1"></script>
   	<script type="text/javascript">
   	//AJAX 통신 시작
   	$( document ).ajaxStart(function() {
       //마우스 커서를 로딩 중 커서로 변경
       /* $('html').css("cursor", "wait");  */
       /* $('#loading').hide(); */
       wrapWindowByMask();
   	});
   	//AJAX 통신 종료
   	$( document ).ajaxStop(function() {
       //마우스 커서를 원래대로 돌린다
      //$('#loading').show();
       closeWindowByMask();
   	}); 
   	</script> 
   	
   	<div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">SEARCH</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="/test/">Home</a></li>
                <li class="breadcrumb-item active">SEARCH</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
   	
	<div id="select">
		<select name="HP" id="HP">
			<option value="hospital" >병원</option>
			<option value="pharmacy">약국</option>
		</select>
		<select name="sido" id="sido"><option value="">-시도-</option></select>

		<select name="gugun" id="gugun"><option value="">-시군구-</option></select>
	</div>
	<div class="form-group">
		<input type="text" class="form-control" id="hosp_name" placeholder="병원이름">
	</div>
	<button id="searchB" class="btn btn-default">검색</button>
	
	<div class="list-group">
		<!-- <li class="list-group-item">
       <h4 class="list-group-item-heading"></h4>
     </li> -->
	</div>
    <button id="more" class="btn btn-primary">더보기</button>
	
	<script type="text/javascript" src="./js/addList.js?ver=6"></script>
	<script type="text/javascript" src="./js/sojaeji.js?ver=11"></script>
	<script type="text/javascript">
		//selectbox로 주소 선택할때 함수 
		new sojaeji("search",
					$("#sido option:selected").val(),
					$("#gugun option:selected").val()
					);
	</script>
	<script type="text/javascript">
		var MAX;
		var totalCnt;
		var page=1;
		
		$(document).ready(function(){
			$('#more').hide();
			
			$('#HP').change(function(){
				if($(this).val()=='pharmacy'){
					$('#hosp_name').attr('placeholder','약국 이름을 입력하세요');
				}else if($(this).val()=='hospital'){
					$('#hosp_name').attr('placeholder','병원 이름을 입력하세요');
				}
			});
			
			//검색 버튼 클릭 이벤트
			$('#searchB').click(function(){
				$('.list-group').empty();
				$.get('search/ajax',{
					'HP' : $('#HP').val(),
					'sido': $('#sido').val(), 
					'gugun': $('#gugun').val(),
					'hosp_name' : $('#hosp_name').val(),
					'page' : 1
					},function(data){
						totalCnt = data.response.body.totalCount;
						if(totalCnt>10){
							$('#more').show();
						}
						var items = data.response.body.items;
						if (items != "") {
							//받아온 데이터가 1개일때 받아온 데이터를 배열화 하기 위한 작업
					         if(items.item.length!=undefined){//item이 배열일때
					            item =items.item;
					         }else{//item이 1개일때
					            item = new Array();
					            item.push(items.item);
					         }
					         MAX=item.length;
							var sel="search";
							addListRT(item,sel);
						}else{
							$('.list-group').empty();
						}
					}, "json");
			});//검색버튼 이벤트 end
			
			//더보기 버튼 클릭 이벤트
			$('#more').click(function(){
				page += 1;
				totalCnt -= 10;
				$.get('search/ajax',{
					'HP' : $('#HP').val(),
					'sido': $('#sido').val(), 
					'gugun': $('#gugun').val(),
					'hosp_name' : $('#hosp_name').val(),
					'page' : page
					},function(data){
						if(totalCnt>10){
							$('#more').show();
						}else{
							$('#more').hide();
						}
						var items = data.response.body.items;
						if (items != "") {
							//받아온 데이터가 1개일때 받아온 데이터를 배열화 하기 위한 작업
					         if(items.item.length!=undefined){
					            item = items.item;
					         }else{
					            item = new Array();
					            item.push(items.item);
					         }
					        MAX=item.length;
							var sel = "search";
							//리스트 스크롤 처리
							var length_scroll = ($('.list-group-item').length)-2;
                    		var before_last_offset = $('.list-group-item').eq(length_scroll).offset();//더보기 버튼을 누르기 전의 마지막 아이템의 위치를 저장
		                     addListRT(item, sel);
		                     var top_scroll = $('.list-group').scrollTop();
		                     $('.list-group').animate({scrollTop : top_scroll+before_last_offset.top}, 400);
						}else{
							//데이터없을때
						}
					}, "json");
			});//더보기 버튼 클릭 이벤트
		});//documetn.ready() end
			
		
		
	</script>
	
	<%@include file="template/footer.jsp" %>
</body>
</html>