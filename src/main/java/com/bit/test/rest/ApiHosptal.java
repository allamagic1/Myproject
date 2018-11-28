package com.bit.test.rest;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Collections;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

import java.io.BufferedReader;
import java.io.IOException;

/*병원정보 서비스 Api, 
 *의료기관별 상세정보 서비스 Api*/
public class ApiHosptal {
	private JSONObject xmlJSONObj;	//병원정보 json 
	private JSONObject xmlJSONObj2;	//세부정보 json - operation2
	private JSONObject xmlJSONObj3; //진료과목 json - operation3
	private JSONObject xmlJSONObj4; //교통정보 json - operation4
	
	public JSONObject getXmlJSONObj() {
		return xmlJSONObj;
	}
	
	public void setXmlJSONObj(JSONObject xmlJSONObj) {
		this.xmlJSONObj = xmlJSONObj;
	}
	
	public JSONObject getXmlJSONObj2() {
		return xmlJSONObj2;
	}
	
	public void setXmlJSONObj2(JSONObject xmlJSONObj2) {
		this.xmlJSONObj2 = xmlJSONObj2;
	}
	
	public JSONObject getXmlJSONObj3() {
		return xmlJSONObj3;
	}

	public void setXmlJSONObj3(JSONObject xmlJSONObj3) {
		this.xmlJSONObj3 = xmlJSONObj3;
	}

	public JSONObject getXmlJSONObj4() {
		return xmlJSONObj4;
	}

	public void setXmlJSONObj4(JSONObject xmlJSONObj4) {
		this.xmlJSONObj4 = xmlJSONObj4;
	}

	//병원정보 파싱함수(기본정보)
	public void parsing(String lat, String lon, String code) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=mVuXPgyIJRP7yT3vIZK5ZpG2e1Gcoeg0Ilq4iDo3p1yJbMbYrGhhF8uwrKv5n2B9d0jYmaEq27twuh6IunEKfA%3D%3D"); /*Service Key*/
//        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*서비스키*/
//        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*한 페이지 결과 수*/
//        urlBuilder.append("&" + URLEncoder.encode("sidoCd","UTF-8") + "=" + URLEncoder.encode("110000", "UTF-8")); /*시도코드*/
//        urlBuilder.append("&" + URLEncoder.encode("sgguCd","UTF-8") + "=" + URLEncoder.encode("110019", "UTF-8")); /*시군구코드*/
//        urlBuilder.append("&" + URLEncoder.encode("emdongNm","UTF-8") + "=" + URLEncoder.encode("사우동", "UTF-8")); /*읍면동명*/
//        urlBuilder.append("&" + URLEncoder.encode("yadmNm","UTF-8") + "=" + URLEncoder.encode("뉴고려병원", "UTF-8")); /*병원명 (UTF-8 인코딩 필요)*/
//        urlBuilder.append("&" + URLEncoder.encode("clCd","UTF-8") + "=" + URLEncoder.encode("11", "UTF-8")); /*종별코드*/
        if(!("00".equals(code))) {
        	if("2010".equals(code)||"2040".equals(code)||"2060".equals(code)||"2080".equals(code)) {
        		urlBuilder.append("&" + URLEncoder.encode("zipCd","UTF-8") + "=" + URLEncoder.encode(code, "UTF-8")); /*2010:종합병원, 2030:병원, 2040:요양병원, 2050:치과, 2060:한방, 2070:의원, 2080:보건기관, 2090:조산원*/
        	}else {
        		urlBuilder.append("&" + URLEncoder.encode("dgsbjtCd","UTF-8") + "=" + URLEncoder.encode(code, "UTF-8")); /*진료과목코드*/
        	}
        }
        urlBuilder.append("&" + URLEncoder.encode("xPos","UTF-8") + "=" + URLEncoder.encode(lon, "UTF-8")); /*경도(소수점 15)*/
        urlBuilder.append("&" + URLEncoder.encode("yPos","UTF-8") + "=" + URLEncoder.encode(lat, "UTF-8")); /*위도(소수점 15)*/
        urlBuilder.append("&" + URLEncoder.encode("radius","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*단위 : 미터(m)*/
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
        //String result="";
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        //xml을 json형태로 바꾸기
        xmlJSONObj = XML.toJSONObject(sb.toString());
        String stringjson = xmlJSONObj.toString();
        System.out.println("병원정보"+stringjson);
    }
	
	//세부정보 파싱 함수 (operation2) - 요일,시간,휴무,응급실,주차
	public void parsing2(String ykiho) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getDetailInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=PgbrZbF6FsHGZkmsm3RZiZKKDN3XlTCOa1YljTPVOwIuAyuGhrs71G%2BaEyMmKDXmaf1ZATu3uPbMCaJMjsxuUg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
//        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("999", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("ykiho","UTF-8") + "=" + URLEncoder.encode(ykiho, "UTF-8")); /*암호화된 요양기호*/
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
        //String result="";
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        //xml을 json형태로 바꾸기
        xmlJSONObj2 = XML.toJSONObject(sb.toString());
        String stringjson = xmlJSONObj2.toString();
        System.out.println(stringjson);
        
    }
	
	
	//진료과목 정보 파싱 함수 (operation 3)
	public void parsing3(String ykiho) throws IOException {
		 StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getMdlrtSbjectInfoList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=mVuXPgyIJRP7yT3vIZK5ZpG2e1Gcoeg0Ilq4iDo3p1yJbMbYrGhhF8uwrKv5n2B9d0jYmaEq27twuh6IunEKfA%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("30", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("ykiho","UTF-8") + "=" + URLEncoder.encode(ykiho, "UTF-8")); /*암호화된 요양기호*/
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
	        xmlJSONObj3 = XML.toJSONObject(sb.toString());
	}
	
	//교통정보 파싱 함수 (operation4)
	public void parsing4(String ykiho) throws IOException {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getTransportInfoList"); /*URL*/
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=mVuXPgyIJRP7yT3vIZK5ZpG2e1Gcoeg0Ilq4iDo3p1yJbMbYrGhhF8uwrKv5n2B9d0jYmaEq27twuh6IunEKfA%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*한 페이지 결과 수*/
		urlBuilder.append("&" + URLEncoder.encode("ykiho","UTF-8") + "=" + URLEncoder.encode(ykiho, "UTF-8")); /*암호화된 요양기호*/
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
        xmlJSONObj4 = XML.toJSONObject(sb.toString());
	}

}