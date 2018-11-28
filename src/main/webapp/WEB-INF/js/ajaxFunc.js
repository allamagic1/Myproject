//move ajax 통신 함수
//좌표로 주소를 얻어서 보냄
function ajaxm() {
	var notpoint = '';
	var geocoder = new daum.maps.services.Geocoder();
	geocoder.coord2RegionCode(clon, clat, function(result) {
		for (var i = 0; i < result.length; i++) {
			// 행정동의 region_type 값은 'H' 이므로
			// console.log(result[i].address_name);
			if (result[i].region_type === 'H') {
				notpoint += result[i].address_name;
			}
		}
		$.get('move', {
			'lat' : clat,
			'lon' : clon,
			'notpoint' : notpoint,
			'code' : $('#what').val()
		}, function(data) {
			var items = data.response.body.items;
			if (items != "") {
				if ($('#what').val()=='88'||$('#what').val()=='77'|| $('#what').val()=='99'|| $('#what').val()=='999') {
					// 달빛어린이:88, 응급:77, 약국:99, 실시간약국:999
					var sel = $('#what').val();
					showMarkerRT(data, sel);
				} else {
					showMarker(data);
				}
			} else {
				$('.list-group').empty();
			}
		}, "json");
	});
}// ajaxm() end

// realTime ajax 통신 함수
function ajaxr() {
	$.get('realTime', {
		'lat' : clat,
		'lon' : clon,
	}, function(data) {
		var items = data.response.body.items;
		if (items != "") {
			showMarkerRT(data);
		} else {
			$('.list-group').empty();
		}
	}, "json");
}// ajaxr() end

//실시간 on/off 확인해서 ajax 파싱받아오기
function geo() {

	var realTime = $('input[id="RTon"]').prop('checked');
	if (realTime == true && $('#what').val()=="000") {// 실시간 off일때
		// 실시간 병원 파싱 ajax'realTime'
		ajaxr();
	} else {
		// ajax로 지도의 중심 좌표를 보내고 결과값을 받아옴
		ajaxm();
	}

}// geo() end


// 실시간 토글버튼 이벤트 함수
function real() {

	$('input[type="radio"]').change(function() {
		var realTime = $('input[id="RTon"]').prop('checked');
		hideMarkers();
	
		if (realTime == false) {	// 실시간 off일때
			$('#what').children().eq(0).prop('selected', 'selected');//분류선택없애기
			// ajax로 지도의 중심 좌표를 보내고 결과값을 받아옴
			ajaxm();
		} else {					// 실시간 on 일때
			$('#what optgroup:eq(3)').children().eq(1).prop('selected', 'selected');//실시간병원이 default
			// 실시간 병원 파싱 ajax
			ajaxr();
		}
	});// 실시간 토글 change 이벤트 end

}// real() end


// 상세분류 셀렉트박스 이벤트 함수
function select() {

	$('#what').change(function() {
		console.log('code:' + $(this).val());
		hideMarkers();
		
		if($(this).val()=="000"||$(this).val()=="88"||$(this).val()=="999"){//분류-실시간
			$('input[id="RTon"]').prop('checked','checked');//실시간토글on으로 바꾸기
		}else{
			$('input[id="RToff"]').prop('checked','checked');//실시간토글off로 바꾸기
		}
		if($(this).val()=="000"){//실시간 병원
			ajaxr();
		}else{
			ajaxm();
		}
		
	});// 분류 셀렉트박스 이벤트 end

}// select() end


// 상단메뉴 클릭 이벤트 함수
function click() {
	//응급,달빛,약국,실시간
	$('.ajaxMenu').click(function(e) {
		e.preventDefault();
		hideMarkers();
		var code = "";
		if(($(this).attr('id')) == 'realTime'){		// 실시간
			$('input[id="RTon"]').prop('checked','checked');
			$('#what optgroup:eq(3)').children().eq(1).prop('selected', 'selected');//실시간병원이 default
			code = "000";
			ajaxr();
		}else{
			$('input[id="RToff"]').prop('checked','checked');
			if (($(this).attr('id')) == 'emergency') {// 응급
				$('#what optgroup:eq(1)').children().eq(0).prop('selected', 'selected');
				code = "77";
			} else if(($(this).attr('id')) == 'moonlight'){// 달빛
				$('#what optgroup:eq(3)').children().eq(0).prop('selected', 'selected');
				code = "88";
			} else if(($(this).attr('id')) == 'pharmacy'){// 약국
				$('#what').children().eq(1).prop('selected', 'selected');
				code = "99";
			}
			ajaxm();
		}
		
	});// 상단메뉴 클릭이벤트 end

	//검색을 누르면 셋팅 초기화시키기 위한 이벤트
	$('#search').click(function(){
		$('input[id="RToff"]').prop('checked','checked');//실시간off
		$('#what').children().eq(0).prop('selected', 'selected');//분류선택없애기
	});
}// click() end
