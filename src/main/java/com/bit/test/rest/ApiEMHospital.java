package com.bit.test.rest;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;
import org.json.XML;

/*응급 의료정보 조회 서비스 Api*/
public class ApiEMHospital {
	 private JSONObject xmlJSONObj;//응급의료기관 json
     
     public JSONObject getXmlJSONObj() {
        return xmlJSONObj;
     }

     public void setXmlJSONObj(JSONObject xmlJSONObj) {
        this.xmlJSONObj = xmlJSONObj;
     }

     //응급의료기관 목록정보 조회 - operation3
     public void parsing(String[] notpoint) throws IOException {
          StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInfoInqireService/getEgytListInfoInqire"); /*URL*/
          urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=PgbrZbF6FsHGZkmsm3RZiZKKDN3XlTCOa1YljTPVOwIuAyuGhrs71G%2BaEyMmKDXmaf1ZATu3uPbMCaJMjsxuUg%3D%3D"); /*Service Key*/
          urlBuilder.append("&" + URLEncoder.encode("Q0","UTF-8") + "=" + URLEncoder.encode(notpoint[0], "UTF-8")); /*주소(시도)*/
          urlBuilder.append("&" + URLEncoder.encode("Q1","UTF-8") + "=" + URLEncoder.encode(notpoint[1], "UTF-8")); /*주소(시군구)*/
//          urlBuilder.append("&" + URLEncoder.encode("QT","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*월~일요일(1~7), 공휴일(8)*/
//          urlBuilder.append("&" + URLEncoder.encode("QZ","UTF-8") + "=" + URLEncoder.encode("A", "UTF-8")); /*CODE_MST의'H000' 참조(A~H, J~O, Q)*/
//          urlBuilder.append("&" + URLEncoder.encode("QD","UTF-8") + "=" + URLEncoder.encode("D000", "UTF-8")); /*CODE_MST의'D000' 참조(D000~D029)*/
//          urlBuilder.append("&" + URLEncoder.encode("QN","UTF-8") + "=" + URLEncoder.encode("(사)삼성생명공익재단 삼성서울병원", "UTF-8")); /*기관명*/
//          urlBuilder.append("&" + URLEncoder.encode("ORD","UTF-8") + "=" + URLEncoder.encode("NAME", "UTF-8")); /*순서*/
//          urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
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
          xmlJSONObj = XML.toJSONObject(sb.toString());
          String stringjson = xmlJSONObj.toString();
          System.out.println("응급"+stringjson);
      }
}
