package com.bit.test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.test.model.Dao;
import com.bit.test.model.entity.VoMyHP;

@Controller
public class OtherController {
	@Autowired
	SqlSession sqlSession;
	HttpSession session;
	
	//일반 병원 디테일 즐겨찾기
	@RequestMapping(value = "hospital/my_hos_del", method = RequestMethod.GET)
	public void my_hos_del(HttpServletRequest req, Model model, HttpServletResponse resp)
			throws IOException, SQLException {
		System.out.println("my_hos_del controller enter!!!!!!!!!!!!");
		String user = req.getParameter("user");
		String name = req.getParameter("name");
		String url = req.getParameter("url");
		String detail_MyHp_select_source = req.getParameter("detail_MyHp_select_source");
		// System.out.println(user+" "+detail_MyHp_select_source+" 2222222222222222");
		int result_my_hos_del = sqlSession.getMapper(Dao.class)
				.myhpdel(new VoMyHP(user, detail_MyHp_select_source, null, null));
		if (result_my_hos_del == 0) {
			// System.out.println("00000000000000000000");
			sqlSession.getMapper(Dao.class).myhpadd(new VoMyHP(user, detail_MyHp_select_source, name, url));
			resp.getWriter().print(1);
		} else {

			// System.out.println("1111111111111111111111111111");
			resp.getWriter().print(0);
		}
	}
	//일반/실시간 약국 디테일 즐겨찾기
	@RequestMapping(value = "RT/my_pha_del", method = RequestMethod.GET)
	public void my_pha_del(HttpServletRequest req, Model model, HttpServletResponse resp)
			throws IOException, SQLException {
		System.out.println("my_hos_del controller enter!!!!!!!!!!!!");
		String user = req.getParameter("user");
		String name = req.getParameter("name");
		String url = req.getParameter("url");
		String detail_MyHp_select_source = req.getParameter("detail_MyHp_select_source");

		System.out.println(user + " " + detail_MyHp_select_source + " " + name + " 2222222222222222");
		int result_my_hos_del = sqlSession.getMapper(Dao.class)
				.myhpdel(new VoMyHP(user, detail_MyHp_select_source, null, null));
		if (result_my_hos_del == 0) {
			System.out.println("00000000000000000000");
			sqlSession.getMapper(Dao.class).myhpadd(new VoMyHP(user, detail_MyHp_select_source, name, url));
			resp.getWriter().print(1);
		} else {

			System.out.println("1111111111111111111111111111");
			resp.getWriter().print(0);
		}
	}
	//응급,달빛,검색,실시간병원 기타 등등 디테일 즐겨찾기
	@RequestMapping(value = "RT/my_rt_del", method = RequestMethod.GET)
	public void my_rt_del(HttpServletRequest req, Model model, HttpServletResponse resp)
			throws IOException, SQLException {
		System.out.println("my_rt_del controller enter!!!!!!!!!!!!");
		String user = req.getParameter("user");
		String name = req.getParameter("name");
		String url = req.getParameter("url");
		String detail_MyHp_select_source = req.getParameter("detail_MyHp_select_source");

		System.out.println(user + " " + detail_MyHp_select_source + " " + name + " 2222222222222222");
		int result_my_hos_del = sqlSession.getMapper(Dao.class)
				.myhpdel(new VoMyHP(user, detail_MyHp_select_source, null, null));
		if (result_my_hos_del == 0) {
			System.out.println("00000000000000000000");
			sqlSession.getMapper(Dao.class).myhpadd(new VoMyHP(user, detail_MyHp_select_source, name, url));
			resp.getWriter().print(1);
		} else {

			System.out.println("1111111111111111111111111111");
			resp.getWriter().print(0);
		}
	}
}
