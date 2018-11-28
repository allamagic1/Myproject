<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">
	  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('177af53ddad8864dab8498322bdb3f8a');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    
    
/*     if(code == undefined){
    	webUrll += 'http://localhost:8041/test/hospital/detail?name=${name }&addr=${addr}&tel=${tel}&homepage=${homepage}&ykiho=${ykiho}&sdrCnt=${sdrCnt}&drTotCnt=${drTotCnt}&lat=${lat}&lon=${lon}';
    }else{
    	webUrll += 'http://localhost:8041/test/RT/detail?name=${name }&addr=${addr}&tel=${tel}&ykiho=${ykiho}&lat=${lat}&lon=${lon}&code=${code}';
    }  */ 
    
    function sendLink() {
    	console.log();
      Kakao.Link.sendDefault({
        objectType: 'location',
        address:'${addr }',
        addressTitle: '${name }',
        content: {
          title: '${name }',
          description: '${addr}',
          imageUrl: 'https://image.shutterstock.com/image-vector/caduceus-health-symbol-asclepiuss-wand-260nw-1086341291.jpg',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'http://localhost:8041/test/hospital/detail?name=${name }&addr=${addr}&tel=${tel}&homepage=${homepage}&ykiho=${ykiho}&sdrCnt=${sdrCnt}&drTotCnt=${drTotCnt}&lat=${lat}&lon=${lon}'
            	}
        },
        social: {
          likeCount: 286,
          commentCount: 45,
          sharedCount: 845
        },
        buttons: [
          {
            title: '웹으로 보기',
            link: {
              mobileWebUrl: 'https://developers.kakao.com',
              webUrl: 'http://localhost:8041/test/hospital/detail?name=${name }&addr=${addr}&tel=${tel}&homepage=${homepage}&ykiho=${ykiho}&sdrCnt=${sdrCnt}&drTotCnt=${drTotCnt}&lat=${lat}&lon=${lon}'
              }
          }
        ]
      });
    }
	</script>
	
</html>