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
public class KakaoController {
	@Autowired
	SqlSession sqlSession;
	HttpSession session;
	
	//ajax 로 들어와서 db에 저장하고 로그인 처리 
	@ResponseBody
	@RequestMapping(value="kakaologin",method=RequestMethod.POST)
	public String kakaologin(HttpServletRequest req) throws SQLException {
		
		
		String id=req.getParameter("id");
		String pw=req.getParameter("pw");
		String name=req.getParameter("name");
		
		
		HttpSession session=req.getSession();
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		 
		VoUsers users=new VoUsers(id, pw, name);
		
		
		System.out.println(sqlSession.getMapper(Dao.class).signupcek(users));
		
		if(sqlSession.getMapper(Dao.class).signupcek(users)==null) {
			sqlSession.getMapper(Dao.class).signup(users);
		}
		
		return "http://localhost:8080/test/";
	}
}
