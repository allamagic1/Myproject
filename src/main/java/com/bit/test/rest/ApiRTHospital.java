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

/*병의원 찾기 서비스 Api*/
public class ApiRTHospital {
	
	private JSONObject RtJSONObj;//실시간 병원 json
	private JSONObject RtJSONObj_detail;//병원,약국 디테일
	private JSONObject RtJSONObj_moon;//실시간 달빛어린이병원
	private JSONObject RtJSONObj_search;//병‧의원 목록정보 - 검색


	public JSONObject getRtJSONObj_moon() {
		return RtJSONObj_moon;
	}
	public void setRtJSONObj_moon(JSONObject rtJSONObj_moon) {
		RtJSONObj_moon = rtJSONObj_moon;
	}
	public JSONObject getRtJSONObj_detail() {
		return RtJSONObj_detail;
	}
	public void setRtJSONObj_detail(JSONObject rtJSONObj_detail) {
		RtJSONObj_detail = rtJSONObj_detail;
	}
	public JSONObject getRtJSONObj() {
		return RtJSONObj;
	}
	public void setRtJSONObj(JSONObject rtJSONObj) {
		RtJSONObj = rtJSONObj;
	}
	public JSONObject getRtJSONObj_search() {
		return RtJSONObj_search;
	}
	public void setRtJSONObj_search(JSONObject rtJSONObj_search) {
		RtJSONObj_search = rtJSONObj_search;
	}

	//실시간 병원 파싱(병의원 위치정보 조회) - operation2
	public void RTparsing(String lat,String lon) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=mVuXPgyIJRP7yT3vIZK5ZpG2e1Gcoeg0Ilq4iDo3p1yJbMbYrGhhF8uwrKv5n2B9d0jYmaEq27twuh6IunEKfA%3D%3D"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("WGS84_LON","UTF-8") + "=" + URLEncoder.encode(lon, "UTF-8")); /*경도*/
	    urlBuilder.append("&" + URLEncoder.encode("WGS84_LAT","UTF-8") + "=" + URLEncoder.encode(lat, "UTF-8")); /*위도*/
	    urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("40", "UTF-8")); /*목록건수*/
//	    urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
        RtJSONObj = XML.toJSONObject(sb.toString());
        String stringjson = RtJSONObj.toString();
        System.out.println("실시간병원"+stringjson);
	}
	
	// 병‧의원별 기본정보 조회  - operation3
	public void detailRTparsing(String hpid) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlBassInfoInqire"); /*URL*/
           urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=PgbrZbF6FsHGZkmsm3RZiZKKDN3XlTCOa1YljTPVOwIuAyuGhrs71G%2BaEyMmKDXmaf1ZATu3uPbMCaJMjsxuUg%3D%3D"); /*Service Key*/
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
           RtJSONObj_detail = XML.toJSONObject(sb.toString());
           String stringjson = RtJSONObj_detail.toString();
           System.out.println("병의원 상세"+stringjson);
   }
	
	//실시간 달빛어린이병원 파싱 - operation5
	public void RTMoonLightparsing(String lat,String lon) throws IOException {
	       StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getBabyLcinfoInqire"); /*URL*/
	           urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=PgbrZbF6FsHGZkmsm3RZiZKKDN3XlTCOa1YljTPVOwIuAyuGhrs71G%2BaEyMmKDXmaf1ZATu3uPbMCaJMjsxuUg%3D%3D"); /*Service Key*/
	           urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
//	           urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	           urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*한 페이지 결과 수*/
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
	           RtJSONObj_moon = XML.toJSONObject(sb.toString());
	           String stringjson = RtJSONObj_moon.toString();
	           System.out.println("실시간 달빛"+stringjson);
	       }
	
	
	//병‧의원 목록정보 조회 파싱 - operation1
	//검색페이지 - 병원검색
	public void searchParsing(String sido, String gugun, String name, String page) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=PgbrZbF6FsHGZkmsm3RZiZKKDN3XlTCOa1YljTPVOwIuAyuGhrs71G%2BaEyMmKDXmaf1ZATu3uPbMCaJMjsxuUg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8")); /*주소(시도)*/
        urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(gugun, "UTF-8")); /*주소(시군구)*/
//        urlBuilder.append("&" + URLEncoder.encode("QZ","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*CODE_MST의'H000' 참조(B:병원, C:의원)*/
//        urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode("D001", "UTF-8")); /*CODE_MST의'D000' 참조(D001~D029)*/
//        urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*월~일요일(1~7), 공휴일(8)*/
        urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode(name, "UTF-8")); /*기관명*/
//        urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); /*순서*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*페이지 번호*/
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*목록 건수*/
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
        RtJSONObj_search = XML.toJSONObject(sb.toString());
        String stringjson = RtJSONObj_search.toString();
        System.out.println("병원검색"+stringjson);
	}
	
	
}
