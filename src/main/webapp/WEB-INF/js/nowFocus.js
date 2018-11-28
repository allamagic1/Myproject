//현재 위치 받아와서 파싱
function nowFocus() {

	// 이전 마커 감추기
	if (markers != null)
		hideMarkers();

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다
	if (navigator.geolocation) { // 사용할 수 있을 때

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			clat = position.coords.latitude, // 위도
			clon = position.coords.longitude; // 경도

			var locPosition = new daum.maps.LatLng(clat, clon) // 마커가 표시될 위치를
			// geolocation으로
			// 얻어온 좌표로 생성합니다
			
			centerMarker = new daum.maps.Marker({//지도 중심마커
				map : map, // 마커를 표시할 지도
				position : locPosition, // 마커를 표시할 위치
				image : markerImage//마커이미지
			});
			centerMarker.setMap(map);
			map.setCenter(locPosition);
			
			geo();// ajaxFunc.js
			

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'
	}

}// nowFocus() end
