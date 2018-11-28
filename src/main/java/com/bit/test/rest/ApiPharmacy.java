package com.bit.test.rest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.XML;

/*전국 약국 정보 조회 서비스 Api*/
public class ApiPharmacy {

	private JSONObject pharJSONObj;//약국목록 조회
	private JSONObject RtPharJSONObj;//약국위치정보 조회(실시간)
	private JSONObject detailPharJSONObj;//약국 상세정보
	private JSONObject pharJSONObj_search;//약국 검색
	
	public JSONObject getPharJSONObj() {
		return pharJSONObj;
	}
	public void setPharJSONObj(JSONObject pharJSONObj) {
		this.pharJSONObj = pharJSONObj;
	}
	public JSONObject getRtPharJSONObj() {
		return RtPharJSONObj;
	}
	public void setRtPharJSONObj(JSONObject rtPharJSONObj) {
		RtPharJSONObj = rtPharJSONObj;
	}
	public JSONObject getDetailPharJSONObj() {
		return detailPharJSONObj;
	}
	public void setDetailPharJSONObj(JSONObject detailPharJSONObj) {
		this.detailPharJSONObj = detailPharJSONObj;
	}
	public JSONObject getPharJSONObj_search() {
		return pharJSONObj_search;
	}
	public void setPharJSONObj_search(JSONObject pharJSONObj_search) {
		this.pharJSONObj_search = pharJSONObj_search;
	}
	
	
	// 약국 목록정보 조회 - operation1
	public void pharBasicParsing(String[] notpoint) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=mVuXPgyIJRP7yT3vIZK5ZpG2e1Gcoeg0Ilq4iDo3p1yJbMbYrGhhF8uwrKv5n2B9d0jYmaEq27twuh6IunEKfA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(notpoint[0], "UTF-8")); /*주소(시도)*/
        urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(notpoint[1], "UTF-8")); /*주소(시군구)*/
//        urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*월~일요일, 공휴일: 1~8*/
//        urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode("삼성약국", "UTF-8")); /*기관명*/
//        urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); /*순서*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*목록 건수*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        //xml을 json형태로 바꾸기
        pharJSONObj = XML.toJSONObject(sb.toString());
        String stringjson = pharJSONObj.toString();
        System.out.println("약국정보"+stringjson);
	}
	
	//약국 위치정보 조회(실시간) - operation2
	public void pharRTParsing(String lat,String lon) throws IOException {

		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyLcinfoInqire"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=mVuXPgyIJRP7yT3vIZK5ZpG2e1Gcoeg0Ilq4iDo3p1yJbMbYrGhhF8uwrKv5n2B9d0jYmaEq27twuh6IunEKfA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("WGS84_LON","UTF-8") + "=" + URLEncoder.encode(lon, "UTF-8")); /*병원경도*/
	        urlBuilder.append("&" + URLEncoder.encode("WGS84_LAT","UTF-8") + "=" + URLEncoder.encode(lat, "UTF-8")); /*병원위도*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        
	        //xml을 json형태로 바꾸기
	        RtPharJSONObj = XML.toJSONObject(sb.toString());
	        String stringjson = RtPharJSONObj.toString();
	        System.out.println("실시간약국"+stringjson);
	}
	
	//약국별 기본정보 조회(상세페이지) - operation3
	public void detailPharParsing(String hpid) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyBassInfoInqire"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=mVuXPgyIJRP7yT3vIZK5ZpG2e1Gcoeg0Ilq4iDo3p1yJbMbYrGhhF8uwrKv5n2B9d0jYmaEq27twuh6IunEKfA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("HPID","UTF-8") + "=" + URLEncoder.encode(hpid, "UTF-8")); /*기관ID*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*목록 건수*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        //xml을 json형태로 바꾸기
        detailPharJSONObj = XML.toJSONObject(sb.toString());
        String stringjson = detailPharJSONObj.toString();
        System.out.println("약국 디테일"+stringjson);
	}
	
	// 약국검색 - operation1
	public void searchPharParsing(String sido, String gugun, String name, String page) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyListInfoInqire"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=mVuXPgyIJRP7yT3vIZK5ZpG2e1Gcoeg0Ilq4iDo3p1yJbMbYrGhhF8uwrKv5n2B9d0jYmaEq27twuh6IunEKfA%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); /*주소(시도)*/
		urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(gugun, "UTF-8")); /*주소(시군구)*/
		//	        urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*월~일요일, 공휴일: 1~8*/
			        urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode(name, "UTF-8")); /*기관명*/
		//	        urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); /*순서*/
			        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*목록 건수*/
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();

		//xml을 json형태로 바꾸기
		pharJSONObj_search = XML.toJSONObject(sb.toString());
		String stringjson = pharJSONObj_search.toString();
		System.out.println("약국검색"+stringjson);
	}
}
