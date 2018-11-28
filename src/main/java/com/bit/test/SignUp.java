package com.bit.test;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.test.model.Dao;
import com.bit.test.model.entity.VoUsers;




@Controller
public class SignUp {
	@Autowired
	SqlSession sqlSession;
	HttpSession session;
	
	
	//회원가입 입력폼
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signup() {
		return "signup";
	}
	
	//ajax 통해서 회원가입 처리 후 로그인
	@ResponseBody
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signup(HttpServletRequest req) throws  Exception {
		String id=req.getParameter("email");
		String name=req.getParameter("name");  
		String pw=req.getParameter("password");
		
		//회원가입한 정보를 세션에 담아서 로그인처리
		session=req.getSession();
    	session.setAttribute("id", id);
    	session.setAttribute("pw", pw);
    	session.setAttribute("name", name);
		VoUsers users=new VoUsers(id,pw,name);
		

		
		sqlSession.getMapper(Dao.class).signup(users);
		return "http://localhost:8080/test/";
	}
	
	//이메일 중복체크
	@ResponseBody
	@RequestMapping(value = "signupcek", method = RequestMethod.POST)
	public String signupcek(HttpServletRequest req) throws SQLException {
		String email=req.getParameter("email");
		System.out.println(email);
		String result="";
		
		VoUsers users=new VoUsers(email,null,null);
		if(sqlSession.getMapper(Dao.class).signupcek(users)!=null) {
			result="fail";
			return result;
		}
		result="success";
		return result;
	}
	
}
