package com.bit.test;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionException;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.test.model.Dao;
import com.bit.test.model.entity.VoMyHP;
import com.bit.test.model.entity.VoReview;
import com.bit.test.rest.ApiEMHospital;
import com.bit.test.rest.ApiHosptal;
import com.bit.test.rest.ApiPharmacy;
import com.bit.test.rest.ApiRTHospital;

@Controller
public class HomeController {
	@Autowired
	SqlSession sqlSession;
	HttpSession session;//
	
	//처음
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,HttpServletRequest req) throws IOException {
		boolean loginTF = false;//로그인 여부
		String name="";
		session = req.getSession();

		name = (String) session.getAttribute("name");

		if(name!=null) {
			loginTF = true;
			System.out.println(name+"로그인됨");
		}
		System.out.println(name+" home controller");
		model.addAttribute("sessionname", name);
		model.addAttribute("loginTF", loginTF);
		return "main";
	}


	// main->메뉴 클릭
	@RequestMapping(value = "/ready", method = RequestMethod.GET)
	public String ready(HttpServletRequest req, Model model) throws IOException {
		String homemenu = req.getParameter("homemenu"); 
		model.addAttribute("homemenu", homemenu);
		return "home";
	}

	// 파싱->지도 ajax 통신
	@RequestMapping(value = "/move", method = RequestMethod.GET)
	public void map(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {
		System.out.println("지도파싱 ajax 컨트롤러 들어옴");
		String lat = req.getParameter("lat"); // 위도
		String lon = req.getParameter("lon"); // 경도
		String code = req.getParameter("code"); // 상세 분류 코드

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		// 위도경도->주소
		String[] notpointArray = null;
		String notpoint = req.getParameter("notpoint");// 행정동 주소
		if (notpoint == null) {
		} else {
			notpointArray = notpoint.split(" ");
		}

		for (int i = 0; i < notpointArray.length; i++) {
			System.out.println(notpointArray[i]);
		}

		// 상세분류
		if ("88".equals(code)) {// 달빛어린이 병원(실시간)
			ApiRTHospital RThosp = new ApiRTHospital();
			RThosp.RTMoonLightparsing(lat, lon);
			resp.getWriter().print(RThosp.getRtJSONObj_moon()); // ajax로 json타입 결과데이터 넘기기

		} else if ("77".equals(code)) { // 응급의료센터
			ApiEMHospital emh = new ApiEMHospital();
			emh.parsing(notpointArray);
			resp.getWriter().print(emh.getXmlJSONObj());
		} else if ("99".equals(code)) { // 약국일반
			ApiPharmacy phar = new ApiPharmacy();
			phar.pharBasicParsing(notpointArray);
			resp.getWriter().print(phar.getPharJSONObj());
		} else if ("999".equals(code)) { // 약국실시간
			ApiPharmacy phar = new ApiPharmacy();
			phar.pharRTParsing(lat, lon);
			resp.getWriter().print(phar.getRtPharJSONObj());
		} else { // 나머지 분류
			ApiHosptal hosp = new ApiHosptal();
			hosp.parsing(lat, lon, code);
			resp.getWriter().print(hosp.getXmlJSONObj());
		}

	}

	// 디테일 페이지
	@RequestMapping(value = "/hospital/detail", method = RequestMethod.GET)
	public String hosp_detail(Model model, HttpServletRequest req) throws IOException, SQLException {
		System.out.println("병원 디테일 컨트롤러 들어옴");
		ApiHosptal hosp = new ApiHosptal();
		String ykiho = req.getParameter("ykiho");

		hosp.parsing2(ykiho);
		JSONObject json2 = hosp.getXmlJSONObj2();// 세부정보 json
		hosp.parsing3(ykiho);
		JSONObject json3 = hosp.getXmlJSONObj3();// 진료과목 json
		hosp.parsing4(ykiho);
		JSONObject json4 = hosp.getXmlJSONObj4();// 교통정보 json

		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		String tel = req.getParameter("tel");
		String homepage = req.getParameter("homepage");
		String sdrCnt = req.getParameter("sdrCnt");
		String drTotCnt = req.getParameter("drTotCnt");
		String lat = req.getParameter("lat"); // 위도
		String lon = req.getParameter("lon"); // 경도

		HttpSession hs  = req.getSession();
		String user = (String) hs.getAttribute("id");
		System.out.println(user+" hosp_detail ");

		//디테일 즐겨찾기 확인을 위한 정보 가공
		String[] addrSplit = addr.split(" ");
		String[] telSplit = tel.split("-");
		String detail_MyHp_select_source = addrSplit[0] + addrSplit[1]+ telSplit[telSplit.length-2] + telSplit[telSplit.length-1];
		//System.out.println(detail_MyHp_select_source+" hosp_detail_source");
		if(user!=null) {
			VoMyHP my_hosp_detail_result = sqlSession.getMapper(Dao.class).myhpselect(new VoMyHP(user, detail_MyHp_select_source, null, null));
			//디테일 즐겨찾기 확인을 위해 가공한 정보를 웹 페이지에 전달 by 정보의 수정을 위해서
			model.addAttribute("user", user);
			model.addAttribute("detail_MyHp_select_source",detail_MyHp_select_source);
			//System.out.println(resultsqlsession.getHp()+" "+resultsqlsession.getKey());
			//model.addAttribute("myhpmark", );
			//System.out.println(a);
			//디테일 즐겨찾기 정보를 디비에서 확인 후 정보를 전달
			//0은 정보가 즐겨찾기 정보가 없다
			//1은 정보가 있다.
			if(my_hosp_detail_result==null) {
				model.addAttribute("my_hosp_detail_result", "0");

			}else {
				model.addAttribute("my_hosp_detail_result","1");
			}         
		}else {
			model.addAttribute("my_hosp_detail_result", "0");

		}

		//리뷰,평점 불러오기
		List<VoReview> reviewList = sqlSession.getMapper(Dao.class).selReview(detail_MyHp_select_source);
		double avg = 0;//평균 점수
		int cnt = reviewList.size();//리뷰 개수
		if(cnt>=1) {
			for(int i=0; i<reviewList.size(); i++) {
				avg += Double.parseDouble(reviewList.get(i).getScore());
			}
			avg = (int)((avg/cnt)*100);
			avg = avg/100;
			
		}
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("avg", avg);
		model.addAttribute("cnt", cnt);
		
		model.addAttribute("name", name);
		model.addAttribute("addr", addr);
		model.addAttribute("tel", tel);
		model.addAttribute("homepage", homepage);
		model.addAttribute("sdrCnt", sdrCnt);
		model.addAttribute("drTotCnt", drTotCnt);
		model.addAttribute("lat", lat);
		model.addAttribute("lon", lon);

		model.addAttribute("json2", json2);
		model.addAttribute("json3", json3);
		model.addAttribute("json4", json4);

		return "hosp_detail";
	}


	// 실시간토글버튼 ON - ajax
	@RequestMapping(value = "/realTime", method = RequestMethod.GET)
	public void realTime(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("실시간 컨트롤러 들어옴");
		String lat = req.getParameter("lat"); // 위도
		String lon = req.getParameter("lon"); // 경도

		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		ApiRTHospital RThosp = new ApiRTHospital();
		RThosp.RTparsing(lat, lon);
		resp.getWriter().print(RThosp.getRtJSONObj()); // ajax로 json타입 결과데이터 넘기기
	}

	//실시간병원,약국,달빛,응급,검색 디테일
	@RequestMapping(value = "/RT/detail", method = RequestMethod.GET)
	public String realTime_detail(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException, SQLException {
		System.out.println("RT 디테일 컨트롤러 들어옴");

		String ykiho = req.getParameter("ykiho");
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		String tel = req.getParameter("tel");
		String lat = req.getParameter("lat"); // 위도
		String lon = req.getParameter("lon"); // 경도
		String code = req.getParameter("code"); // 경도

		model.addAttribute("name", name);
		model.addAttribute("addr", addr);
		model.addAttribute("tel", tel);
		model.addAttribute("lat", lat);
		model.addAttribute("lon", lon);
		
		HttpSession hs  = req.getSession();
		String user = (String) hs.getAttribute("id");
		System.out.println(user+" hosp_detail ");

		//디테일 즐겨찾기 확인을 위한 정보 가공
		String[] addrSplit = addr.split(" ");
		String[] telSplit = tel.split("-");
		String detail_MyHp_select_source = addrSplit[0] + addrSplit[1]+ telSplit[telSplit.length-2] + telSplit[telSplit.length-1];
		//System.out.println(detail_MyHp_select_source+" hosp_detail_source");
		if(user!=null) {
			VoMyHP my_hosp_detail_result = sqlSession.getMapper(Dao.class).myhpselect(new VoMyHP(user, detail_MyHp_select_source, null, null));
			//디테일 즐겨찾기 확인을 위해 가공한 정보를 웹 페이지에 전달 by 정보의 수정을 위해서
			model.addAttribute("user", user);
			model.addAttribute("detail_MyHp_select_source",detail_MyHp_select_source);
			//System.out.println(resultsqlsession.getHp()+" "+resultsqlsession.getKey());
			//model.addAttribute("myhpmark", );
			//System.out.println(a);
			//디테일 즐겨찾기 정보를 디비에서 확인 후 정보를 전달
			//0은 정보가 즐겨찾기 정보가 없다
			//1은 정보가 있다.
			if(my_hosp_detail_result==null) {
				model.addAttribute("my_hosp_detail_result", "0");

			}else {
				model.addAttribute("my_hosp_detail_result","1");
			}         
		}else {
			model.addAttribute("my_hosp_detail_result", "0");

		}
		
		//리뷰,평점 불러오기
		List<VoReview> reviewList = sqlSession.getMapper(Dao.class).selReview(detail_MyHp_select_source);
		double avg = 0;//평균 점수
		int cnt = reviewList.size();//리뷰 개수
		if(cnt>=1) {
			for(int i=0; i<reviewList.size(); i++) {
				avg += Double.parseDouble(reviewList.get(i).getScore());;
			}
			avg = (int)((avg/cnt)*100);
			avg = avg/100;
		}

		model.addAttribute("reviewList", reviewList);
		model.addAttribute("avg", avg);
		model.addAttribute("cnt", cnt);

		System.out.println(code);
		if (code.equals("999") || code.equals("99")) { // 약국 디테일로 갈때
			ApiPharmacy phar = new ApiPharmacy();
			phar.detailPharParsing(ykiho);
			JSONObject json = phar.getDetailPharJSONObj();
			model.addAttribute("json", json);
			return "pharmacy_detail";
		} else { // 병원 디테일로 갈때
			ApiRTHospital RThosp = new ApiRTHospital();
			RThosp.detailRTparsing(ykiho);
			JSONObject json = RThosp.getRtJSONObj_detail();
			model.addAttribute("json", json);
			return "RThosp_detail";
		}
	}

	// 검색 페이지 띄우기
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {

		return "search";
	}

	// 검색 버튼 클릭 - ajax
	@RequestMapping(value = "/search/ajax", method = RequestMethod.GET)
	public void search_ajax(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		System.out.println("검색버튼 클릭 컨트롤러 들어옴");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		String HP = req.getParameter("HP");//약국,병원 구분
		String sido = req.getParameter("sido");//시도
		String gugun = req.getParameter("gugun");//구군
		String name = req.getParameter("hosp_name");//약국,병원 이름
		String page = (String) (req.getParameter("page"));//페이지

		System.out.println(sido + " " + gugun + " " + name + " " + page);

		if(HP.equals("hospital")) {//병원일때
			ApiRTHospital RThosp = new ApiRTHospital();
			RThosp.searchParsing(sido, gugun, name, page);
			resp.getWriter().print(RThosp.getRtJSONObj_search()); // ajax로 json타입 결과데이터 넘기기
		}else {//약국일때
			ApiPharmacy phar = new ApiPharmacy();
			phar.searchPharParsing(sido, gugun, name, page);
			resp.getWriter().print(phar.getPharJSONObj_search());
		}

	}
}
