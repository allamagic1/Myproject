package com.bit.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.test.model.Dao;
import com.bit.test.model.entity.VoUsers;

@Controller
public class NaverController {
	
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value="navercallback", method=RequestMethod.GET)
	String navercallback(HttpServletRequest req) throws UnsupportedEncodingException {
		String token = null;
	    String clientId = "iI8MG8h75yLI392SGQep";//네이버키
	    String clientSecret = "N7r02K8IcC";//네이버 시크릿키
	    String code = req.getParameter("code");
	    String state = req.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080/test/navercallback", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.print("responseCode="+responseCode);
	      if(responseCode==200) { // 통신성공
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 통신 실패
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	    	//통신 성공했을시 토큰 값 뽑아오기
	    	JSONObject obj=new JSONObject(res.toString());
	    	token=obj.getString("access_token");
	    	//System.out.println(res.toString());

	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    //토큰값 받으면 유저정보를 뽑기위해 naverInfo 호출
		return naverInfo(token,req);
	}
	@RequestMapping(value="naverInfo", method=RequestMethod.GET)
	String naverInfo(String token,HttpServletRequest req) {
        String header = "Bearer " + token;
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { //성공
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 실패
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();

            //토큰값을 통해서 얻어낸 유저정보
            JSONObject obj=new JSONObject(response.toString());
            String id = obj.getJSONObject("response").getString("email");
            String pw = obj.getJSONObject("response").getString("id");
            String name = obj.getJSONObject("response").getString("name");
	    	HttpSession session=req.getSession();
	    	
	    	
	    	//네이버 유저정보 새션에 세팅
	    	session.setAttribute("id", id);
	    	session.setAttribute("pw", pw);
	    	session.setAttribute("name", name);
	    	//DB에 값이 있으면 로그인처리 없으면 DB에 저장 후 로그인처리
	    	try {
	    	VoUsers users=new VoUsers(id, pw, name);
	    	sqlSession.getMapper(Dao.class).signup(users);
	    	}catch (Exception e) {
	    		return "redirect:/list";
			}
	    	
        	} catch (Exception e) {
            System.out.println(e);
        	}
		return "redirect:/list";
	}
}
