package com.bit.test;


import java.sql.SQLException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.test.model.Dao;
import com.bit.test.model.entity.VoBBS;
import com.bit.test.model.entity.VoComment;
import com.bit.test.model.entity.VoMyBBS;

@Controller
public class BbsController {
   @Autowired
   SqlSession sqlSession;
   HttpSession session;

   //리스트 페이지
   @RequestMapping(value = "list", method = RequestMethod.GET)
   public String bbsList(Model model,HttpServletRequest req) throws SQLException, Exception {
      session=req.getSession();

      req.setCharacterEncoding("UTF-8");
      int start=1;
      int end=10;
      int tot=sqlSession.getMapper(Dao.class).allCount();
      int count=tot/10+1;
      if(req.getParameter("page")!=null) {
         int page=Integer.parseInt(req.getParameter("page"));
         start=page*10-9;
         end=start+10;
      }
      //검색후에 리스트 페이지 호출
      if(req.getParameter("text")!=null && !(req.getParameter("text").equals(""))) {
         req.setCharacterEncoding("UTF-8");
         String text=req.getParameter("text");
         req.setCharacterEncoding("UTF-8");
         String select=req.getParameter("select");
         start=1;
         end=11;

         tot=sqlSession.getMapper(Dao.class).selectCount(select,text);
         count=tot/10+1;

         if(req.getParameter("page")!=null && !(req.getParameter("page").equals(""))) {
            int page=Integer.parseInt(req.getParameter("page"));
            start=page*10-9;
            end=start+10;
         }
         model.addAttribute("count",count);
         model.addAttribute("alist",sqlSession.getMapper(Dao.class).select(select,text,start,end));
         model.addAttribute("text",req.getParameter("text"));
         model.addAttribute("select", req.getParameter("select"));
         return "bbsList";
      }


      model.addAttribute("count",count);
      model.addAttribute("alist",sqlSession.getMapper(Dao.class).selectList(start,end));

      return "bbsList";
   }
   //디테일 페이지
   @RequestMapping(value = "detail", method = RequestMethod.GET)
   public String bbsDetail(Locale locale, Model model, HttpServletRequest req) throws SQLException {
      int idx=Integer.parseInt(req.getParameter("idx"));

      HttpSession session=req.getSession();
      //조회수
      if(session.getAttribute(req.getParameter("idx"))==null) {
         sqlSession.getMapper(Dao.class).hitup(idx);
         session.setAttribute(req.getParameter("idx"), idx);
      }
      System.out.println(sqlSession.getMapper(Dao.class).commentList(idx));
      model.addAttribute("bean",sqlSession.getMapper(Dao.class).selectOne(idx));
      model.addAttribute("comments",sqlSession.getMapper(Dao.class).commentList(idx));
      if(session.getAttribute("id")!=null) {
         model.addAttribute("mybbs",sqlSession.getMapper(Dao.class).myBBS(new VoMyBBS((String) session.getAttribute("id"), idx)));
      }
      return "detail";
   }
   //게시판 글 입력폼
   @RequestMapping(value = "add", method = RequestMethod.GET)
   public String add(Locale locale, Model model) throws SQLException {
      return "add";
   }

   //게시판 글작성후 DB처리
   @RequestMapping(value = "add", method = RequestMethod.POST)
   public String bbsAdd(Locale locale, Model model,HttpServletRequest req) throws SQLException, Exception {
      req.setCharacterEncoding("UTF-8");
      String id=(String) session.getAttribute("id");
      String sub=req.getParameter("sub");
      String content =req.getParameter("content");
      VoBBS bean=new VoBBS(id, 0, sub, content, 0,null);
      model.addAttribute("alist",sqlSession.getMapper(Dao.class).insertOne(bean));
      return "redirect:/list";
   }
   //게시판 글 삭제
   @RequestMapping(value = "delete", method = RequestMethod.POST)
   public String deleteOne(Model model,HttpServletRequest req) throws SQLException, Exception {
      int idx=Integer.parseInt(req.getParameter("idx"));
      sqlSession.getMapper(Dao.class).commentDeleteAll(idx);
      sqlSession.getMapper(Dao.class).bbsdel(new VoMyBBS(null, idx));
      sqlSession.getMapper(Dao.class).deleteOne(idx);
      return "redirect:/list";
   }

   //수정폼
   @RequestMapping(value = "update", method = RequestMethod.GET)
   public String update(Model model,HttpServletRequest req) throws SQLException {
      String idx = (String) req.getParameter("idx");
      String sub = (String) req.getParameter("sub");
      String content = (String) req.getParameter("content");
      model.addAttribute("idx", idx);
      model.addAttribute("sub", sub);
      model.addAttribute("content", content);
      return "update";
   }
   //수정폼 입력후 DB처리
   @RequestMapping(value = "update", method = RequestMethod.POST)
   public String updateOne(Locale locale, Model model,HttpServletRequest req) throws SQLException, Exception {
      req.setCharacterEncoding("UTF-8");
      String content=req.getParameter("content");
      String sub=req.getParameter("sub");
      int idx=Integer.parseInt(req.getParameter("idx"));
      VoBBS bean=new VoBBS(null, idx, sub, content, 0,null);
      sqlSession.getMapper(Dao.class).updateOne(bean);
      return "redirect:/list";
   }
   //댓글 입력
   @RequestMapping(value="comment",method=RequestMethod.POST)
   public String commentAdd(HttpServletRequest req) throws Exception {
      req.setCharacterEncoding("UTF-8");

      session=req.getSession();
      int idx=Integer.parseInt(req.getParameter("idx"));
      String id=(String) session.getAttribute("id");
      String comment=req.getParameter("comment");

      VoComment comments=new VoComment(0, comment, idx, id);
      sqlSession.getMapper(Dao.class).commentAdd(comments);
      return "redirect:/detail?idx="+idx;
   }
   //댓글 삭제
   @RequestMapping(value="commentDelete",method=RequestMethod.POST)
   public String commentDelete(HttpServletRequest req) {
      int idx=Integer.parseInt(req.getParameter("idx"));
      int key=Integer.parseInt(req.getParameter("key"));

      sqlSession.getMapper(Dao.class).commentDelete(key);
      return "redirect:/detail?idx="+idx;
   }


   //즐겨 찾기 추가
   @RequestMapping(value ="addmyBBS",method=RequestMethod.POST)
   public String addmyBBS(HttpServletRequest req) throws Exception {
      req.setCharacterEncoding("UTF-8");
      int idx=Integer.parseInt(req.getParameter("idx"));
      session=req.getSession();
      sqlSession.getMapper(Dao.class).addMyBBS(new VoMyBBS((String) session.getAttribute("id"), idx));
      return "redirect:/detail?idx="+idx;
   }

   //즐겨 찾기 해제
   @RequestMapping(value ="delmyBBS",method=RequestMethod.POST)
   public String delmyBBS(HttpServletRequest req) throws Exception {
      req.setCharacterEncoding("UTF-8");
      int idx=Integer.parseInt(req.getParameter("idx"));
      session=req.getSession();
      sqlSession.getMapper(Dao.class).delMyBBS(new VoMyBBS((String) session.getAttribute("id"), idx));
      return "redirect:/detail?idx="+idx;
   }
}