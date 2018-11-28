package com.bit.test;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.test.model.Dao;
import com.bit.test.model.entity.VoReview;

@Controller
public class ReviewController {
	@Autowired
	SqlSession sqlSession;
	HttpSession session;
	
	//리뷰 불러오기는 HomeController 디테일 페이지 컨트롤러에!

	//일반병원 리뷰 등록
	@RequestMapping(value="hospital/review", method=RequestMethod.POST)
	public void addReview(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		session = req.getSession();
		String id = (String) session.getAttribute("id");
		String key = req.getParameter("detail_MyHp_select_source");
		String content = req.getParameter("content");
		String score = req.getParameter("score");
		String name = req.getParameter("name");
		String url = req.getParameter("url");
		
		int result = sqlSession.getMapper(Dao.class).addReview(new VoReview(0, id, key, score, content, null, name, url));
		if(result == 1) {
			System.out.println("리뷰등록 성공");
			resp.getWriter().print(1);
		}else {
			System.out.println("리뷰등록 실패");
			resp.getWriter().println(0);
		}
	}
	
	//실시간병원,약국, 기타 리뷰 등록
	@RequestMapping(value="RT/review", method=RequestMethod.POST)
	public void addReview_RT(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		session = req.getSession();
		String id = (String) session.getAttribute("id");
		String key = req.getParameter("detail_MyHp_select_source");
		String content = req.getParameter("content");
		String score = req.getParameter("score");
		String name = req.getParameter("name");
		String url = req.getParameter("url");
		
		int result = sqlSession.getMapper(Dao.class).addReview(new VoReview(0, id, key, score, content, null, name, url));
		if(result == 1) {
			System.out.println("리뷰등록 성공");
			resp.getWriter().print(1);
		}else {
			System.out.println("리뷰등록 실패");
			resp.getWriter().println(0);
		}
	}
	
	//일반병원 리뷰 삭제
	@RequestMapping(value="hospital/delReview", method=RequestMethod.POST)
	public void delReview(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx"));
		int result = sqlSession.getMapper(Dao.class).deleteReview(idx);
		if(result == 1) {
			System.out.println("리뷰삭제 성공");
			resp.getWriter().print(1);
		}else {
			System.out.println("리뷰삭제 실패");
			resp.getWriter().println(0);
		}
	}
	
	//실시간병원,약국, 기타 리뷰 삭제
	@RequestMapping(value="RT/delReview", method=RequestMethod.POST)
	public void delReview_RT(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx"));
		int result = sqlSession.getMapper(Dao.class).deleteReview(idx);
		if(result == 1) {
			System.out.println("리뷰삭제 성공");
			resp.getWriter().print(1);
		}else {
			System.out.println("리뷰삭제 실패");
			resp.getWriter().println(0);
		}
	}
	
	//일반병원 리뷰 수정
	@RequestMapping(value="hospital/editReview", method=RequestMethod.POST)
	public void editReview(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx"));
		String content = req.getParameter("content");
		String score = req.getParameter("score");
		int result = sqlSession.getMapper(Dao.class).editReview(new VoReview(idx, null, null, score, content, null, null, null));
		if(result == 1) {
			System.out.println("리뷰 수정 성공");
			resp.getWriter().print(1);
		}else {
			System.out.println("리뷰 수정 실패");
			resp.getWriter().println(0);
		}
	}
	//실시간병원,약국,기타 리뷰 수정
	@RequestMapping(value="RT/editReview", method=RequestMethod.POST)
	public void editReview_RT(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
		int idx = Integer.parseInt(req.getParameter("idx"));
		String content = req.getParameter("content");
		String score = req.getParameter("score");
		int result = sqlSession.getMapper(Dao.class).editReview(new VoReview(idx, null, null, score, content, null, null, null));
		if(result == 1) {
			System.out.println("리뷰 수정 성공");
			resp.getWriter().print(1);
		}else {
			System.out.println("리뷰 수정 실패");
			resp.getWriter().println(0);
		}
	}
	
}
