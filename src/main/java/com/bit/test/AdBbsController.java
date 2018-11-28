package com.bit.test;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.test.model.Dao;
import com.bit.test.model.entity.VoAdBBS;
import com.bit.test.model.entity.VoMyAdBBS;
import com.bit.test.model.entity.VoMyBBS;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdBbsController {
   @Autowired
   SqlSession sqlSession;
   HttpSession session;
   

   // 리스트
   @RequestMapping(value = "adbbs", method = RequestMethod.GET)
   public String adbbs(Model model,HttpServletRequest req) throws SQLException {
	   session = req.getSession();
	   String id = (String) session.getAttribute("id");
	   model.addAttribute("id", id);
	   model.addAttribute("alist", sqlSession.getMapper(Dao.class).adlist());
	   return "adbbs";
   }
   
   
   //리스트 ajax
   @ResponseBody
   @RequestMapping(value = "adlist", method = RequestMethod.GET, produces = "application/text; charset=utf8")
   public String adlist(Model model, HttpServletRequest req) throws SQLException, JsonProcessingException, UnsupportedEncodingException {
      req.setCharacterEncoding("UTF-8");
      String json=null;
      if(!req.getParameter("idx").equals("null")) {
         int idx=Integer.parseInt(req.getParameter("idx"));
         json= new ObjectMapper().writeValueAsString(sqlSession.getMapper(Dao.class).adlistplus(new VoAdBBS(idx, null, null, null)));
      }
      
      return json;
   }
   
   
   // 입력폼
   @RequestMapping(value = "addad", method = RequestMethod.GET)
   public String adadd() {
      return "addad";
   }

   
   // 업로드 처리
   @RequestMapping(value = "upload", method = RequestMethod.POST)
   public String upload(@RequestParam("sub") String sub,@RequestParam("content") String content,@RequestParam("img") MultipartFile upfile, Model model) throws SQLException {
      SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
      
      String origin=time.format(new Date(System.currentTimeMillis()))+upfile.getOriginalFilename();
      String path="C:\\spring_workspace\\test2\\src\\main\\webapp\\WEB-INF\\views\\img\\"+origin;
      File file=new File(path);
      sqlSession.getMapper(Dao.class).adAdd(new VoAdBBS(0, origin, sub, content));
      
      try {
         upfile.transferTo(file);
      } catch (IllegalStateException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      return "redirect:/adbbs";
   }
   
   // 디테일 페이지
   @RequestMapping(value = "adbbs_detail", method = RequestMethod.GET)
   public String bbsDetail(Locale locale, Model model, HttpServletRequest req) throws SQLException {
      int idx = Integer.parseInt(req.getParameter("idx"));

      session = req.getSession();
      String id = (String) session.getAttribute("id");
      model.addAttribute("id", id);
      model.addAttribute("bean", sqlSession.getMapper(Dao.class).selectOne_adbbs(idx));
      if (session.getAttribute("id") != null) {
         model.addAttribute("myAdbbs",
               sqlSession.getMapper(Dao.class).myAdBBS(new VoMyAdBBS((String) session.getAttribute("id"), idx)));
      }
      return "adbbs_detail";
   }
 	
 	//즐겨 찾기 추가
 	@RequestMapping(value ="addmyAdBBS",method=RequestMethod.POST)
 	public String addmyAdBBS(HttpServletRequest req) throws Exception {
 		req.setCharacterEncoding("UTF-8");
 		int idx=Integer.parseInt(req.getParameter("idx"));
 		session=req.getSession();
 		sqlSession.getMapper(Dao.class).addMyAdBBS(new VoMyAdBBS((String) session.getAttribute("id"), idx));
 		return "redirect:/adbbs_detail?idx="+idx;
 	}

 	//즐겨 찾기 해제
 	@RequestMapping(value ="delmyAdBBS",method=RequestMethod.POST)
 	public String delmyAdBBS(HttpServletRequest req) throws Exception {
 		req.setCharacterEncoding("UTF-8");
 		int idx=Integer.parseInt(req.getParameter("idx"));
 		session=req.getSession();
 		sqlSession.getMapper(Dao.class).delMyAdBBS(new VoMyAdBBS((String) session.getAttribute("id"), idx));
 		return "redirect:/adbbs_detail?idx="+idx;
 	}
 	
 	//광고 삭제
    @RequestMapping(value = "delAdBBS", method = RequestMethod.GET)
    public String delAdBBS(HttpServletRequest req) throws Exception {
       req.setCharacterEncoding("UTF-8");
       int idx = Integer.parseInt(req.getParameter("idx"));
       System.out.println(idx+": adbbscontroller delbbs idx ");
       session = req.getSession();
       //sqlSession.getMapper(Dao.class).delMyAdBBS(new VoMyAdBBS((String) session.getAttribute("id"), idx));
       sqlSession.getMapper(Dao.class).AdBbsdel(new VoAdBBS(idx));
       return "redirect:/adbbs";
    }
}