//지도에 표시된 마커들을 리스트에 추가하는 함수
function addList(item) {
	$('.list-group').empty();

	for (var i = 0; i < MAX; i++) {
		var name = item[i].yadmNm; // 이름
		var addr = item[i].addr; // 주소
		var tel = item[i].telno; // 전화번호
		var ykiho = item[i].ykiho; // 요양기호
		var drTotCnt = item[i].drTotCnt;// 의사총수
		var sdrCnt = item[i].sdrCnt;// 전문의수
		var homepage; // 홈페이지
		var lat = item[i].YPos; // 위도
		var lon = item[i].XPos; // 경도
		if (item[i].hospUrl) {
			homepage = item[i].hospUrl;
		}
		var param = "?name=" + name + "&addr=" + addr + "&tel=" + tel
				+ "&homepage=" + homepage + "&ykiho=" + ykiho + "&sdrCnt="
				+ sdrCnt + "&drTotCnt=" + drTotCnt + "&lat=" + lat + "&lon="
				+ lon;
		$('.list-group').last().append(
				'<li class="list-group-item" id="' + i
						+ 'list"><a target="_blank" href="hospital/detail' + param
						+ '" class="list-group-item-heading">' + name
						+ '</a><span style="color:gray"> ('
						+ item[i].distance.toFixed(0)
						+ 'm)</span></br><p class="list-group-item-text">'
						+ addr + '</br>' + tel + '</p></li>');
	}
}

function addListRT(item, sel) {

	if ("search" != sel) {
		$('.list-group').empty();
	}

	for (var i = 0; i < MAX; i++) {
		var name = item[i].dutyName; // 이름
		var addr = item[i].dutyAddr; // 주소
		var tel = item[i].dutyTel1; // 전화번호
		var ykiho = item[i].hpid; // 요양기호
		/*
		 * var drTotCnt = item[i].drTotCnt;//의사총수 
		 * var sdrCnt =item[i].sdrCnt;//전문의수 
		 * var homepage; //홈페이지
		 */
//		if (item[i].hospUrl) {
//			homepage = item[i].hospUrl;
//		}
		
		var lat = ""; // 위도
		var lon = ""; // 경도
		if ("77"==sel || "search"==sel||"99"==sel) {// 응급,검색,약국
			lat = item[i].wgs84Lat;
			lon = item[i].wgs84Lon;
		} else {
			lat = item[i].latitude;
			lon = item[i].longitude;
		}
		if(!sel) sel='';
		var param = "?name=" + name + "&addr=" + addr + "&tel=" + tel
				+ "&ykiho=" + ykiho + "&lat=" + lat + "&lon=" + lon+"&code="+sel;
		var dist = (item[i].distance) * 1000;
		$('.list-group').last().append(
				'<li class="list-group-item" id="' + i
						+ 'list"><a target="_blank" href="RT/detail' + param
						+ '" class="list-group-item-heading">' + name
						+ '</a><span style="color:gray" class="dist"> (' + dist
						+ 'm)</span></br><p class="list-group-item-text">'
						+ addr + '</br>' + tel + '</p></li>');
		
		if(sel=="search"){
			$('.dist').hide();
		}
	}
}