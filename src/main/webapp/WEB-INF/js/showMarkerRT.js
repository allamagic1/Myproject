//실시간 여러개 마커 표시 함수
function showMarkerRT(data, sel) {
	result = data;

	// 받아온 데이터가 1개일때 받아온 데이터를 배열화 하기 위한 작업
	if (result.response.body.items.item.length != undefined) {// item이 배열
		item = result.response.body.items.item;
	} else {// item이 1개
		item = new Array();
		item.push(result.response.body.items.item);
	}


	if (sel == "77" || sel=="99") {// 응급,약국 json에 거리 추가
		for (var i = 0; i < item.length; i++) {
			var distance = getDistanceFromLatLonInKm(clat, clon,
					item[i].wgs84Lat, item[i].wgs84Lon);
			distance = distance.toFixed(3);
			item[i].distance = distance.toString();
		}
	}

	// 받아온 데이터가 1개 보다 많을 때만 sorting한다
	if (result.response.body.items.item.length != undefined) {
		// item배열을 거리순으로 정렬
		item.sort(function(a, b) {
			console.log('sorting');
			return parseFloat(a.distance) - parseFloat(b.distance);

		});
	}
	
	//받아온 item 개수가 40개 미만이면 MAX값을 바꾼다
    if(item.length<40){
       MAX=item.length;
    }else{
       MAX=40;
    }
	
	addListRT(item, sel);
	// 마커를 표시할 위치와 title 객체 배열입니다
	positions = new Array();
	for (var i = 0; i < MAX; i++) {
		if ("77" == sel || "99"==sel) {
			positions.push({
				title : item[i].dutyName,

				latlng : new daum.maps.LatLng(item[i].wgs84Lat,
						item[i].wgs84Lon)
			});
		} else {
			positions.push({
				title : item[i].dutyName,

				latlng : new daum.maps.LatLng(item[i].latitude,
						item[i].longitude)
			});
		}

	}

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	overlays = new Array();

	var bounds = new daum.maps.LatLngBounds(); // 화면 크기 조정을 위한 객체

	for (var i = 0; i < positions.length; i++) {

		bounds.extend(positions[i].latlng);// 화면조정을 위해서 해당 객체에 좌표들을 저장한다.

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new daum.maps.Size(24, 35);

		// 마커 이미지를 생성합니다
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions[i].latlng,
			image : markerImage1
		// 마커를 표시할 위치
		// title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		// 마커 이미지
		});
		markers.push(marker);
		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다
		//
		var content = '<div class="wrap">' + '    <div class="info">'
				+ '        <div class="title">'
				+ positions[i].title
				+ '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <div class="close" onclick="closeOverlay('
				+ i
				+ ')" title="닫기"></div>'
				+ '        </div>'
				+ '        <div class="body">'
				+ '            <div class="desc">'
				+ '                <div class="iaddress">'
				+ item[i].dutyAddr
				+ '</div>'
				+ '                 <div class="itelno">'
				+ item[i].dutyTel1
				+ '</div>'
				+ '                 <div class="idistance">'
				+ item[i].distance
				+ '(km)</div></div><div class="search00">'
				+ '               <div class="search0"><div style="width:100%;" class="img0"><img style="align:center;" src="./js/road.png"/></div>'
				+ '<a href="http://map.daum.net/link/to/'
				+ positions[i].title
				+ ','
				+ positions[i].latlng.jb
				+ ','
				+ positions[i].latlng.ib
				+ '">길찾기</a></div>'
				+ '               <div class="search1"><div style="width:100%;" class="img0"><img style="align:center;" src="./js/view.png"/></div>'
				+ '<a href="http://map.daum.net/link/to/'
				+ positions[i].title
				+ ','
				+ positions[i].latlng.jb
				+ ','
				+ positions[i].latlng.ib
				+ '">로드뷰</a></div>'
				+ '               <div class="search2"><div style="width:100%;" class="img0"><img style="align:center;" src="./js/share.png"/></div>'
				+ '<a href="http://map.daum.net/link/to/'
				+ positions[i].title
				+ ','
				+ positions[i].latlng.jb
				+ ','
				+ positions[i].latlng.ib
				+ '">공유</a></div>'
				+ '            </div></div>'
				+ '    </div>'
				+ '</div>';

		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new daum.maps.CustomOverlay({
			content : content,
			map : map,
			position : positions[i].latlng
		});
		overlays.push(overlay);

		overlay.setMap(null);

		// 리스트에 마우스 올리면 인포윈도우가 뜨는 함수 호출
		list_info(i);

		// 마커에 클릭이벤트 달기
		daum.maps.event.addListener(marker, 'click', makeClickListener(overlay,
				i, marker));

		// 겹쳐있는 마커에 마우스를 올렸을때 겹친 개수 띄우기
		sameMarker(map, marker, i);
	}

	if(centerMarker){
   	 	bounds.extend(centerMarker.getPosition());//중심 마커도 bounds에 포함시키기
    }
	console.log('RTsetbound 실행');
	map.setBounds(bounds);// positions의 좌표들이 들어있는 객체들이 보두 보이게하기위한 마지막 단계
}// showMarkerRT() end
