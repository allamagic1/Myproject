package com.bit.test;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.test.model.Dao;
import com.bit.test.model.entity.VoAdBBS;
import com.bit.test.model.entity.VoBBS;
import com.bit.test.model.entity.VoMyAdBBS;
import com.bit.test.model.entity.VoMyBBS;
import com.bit.test.model.entity.VoMyHP;
import com.bit.test.model.entity.VoUsers;

@Controller
public class LoginController {
	@Autowired
	SqlSession sqlSession;
	HttpSession session;
	//로그인 입력폼
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	
	//로그인처리
	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(HttpServletRequest req) throws SQLException {
		String id=req.getParameter("id");
		String password=req.getParameter("password");
		VoUsers users=new VoUsers(id, null, null);
		//id 랑 password 가 일치하면 로그인처리 후 세션에 정보 저장
		if(password.equals(sqlSession.getMapper(Dao.class).login(users).getPw())) {
			session=req.getSession();
			session.setAttribute("id", id);
			String name = sqlSession.getMapper(Dao.class).signupcek(users).getName();
			session.setAttribute("name", name);
			System.out.println(session.getAttribute("name")+"login controller");
			return "success";
		}
		return "fail";
	}
	
	
	//로그아웃
	@RequestMapping(value = "loginout", method = RequestMethod.GET)
	public String loginout(HttpServletRequest req, Model model) {
		session=req.getSession();
		System.out.println((String)(session.getAttribute("name"))+" 로그아웃함");
		session.removeAttribute("name");
		session.removeAttribute("id");
		model.addAttribute("loginTF", false);
		return "main";
	}
	
	
	//마이페이지
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public String mypage(HttpServletRequest req, Model model) throws SQLException{
		session=req.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println(id+" 마이페이지");
		//즐겨찾기한 목록들 불러오기
		model.addAttribute("BBSlist", sqlSession.getMapper(Dao.class).selMyBBS(id));
		model.addAttribute("AdBBSlist", sqlSession.getMapper(Dao.class).selMyADBBS(id));
		model.addAttribute("HPlist", sqlSession.getMapper(Dao.class).selMyHP(id));
		//내가 쓴 게시판 글 불러오기
		model.addAttribute("myBBS", sqlSession.getMapper(Dao.class).mypage_BBS(id));
		//내가 쓴 리뷰 불러오기
		model.addAttribute("myReview",sqlSession.getMapper(Dao.class).mypage_Review(id));
		return "mypage";
	}
	
}
