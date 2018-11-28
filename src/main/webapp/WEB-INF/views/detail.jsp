<%@page import="com.bit.test.model.entity.VoComment"%>
<%@page import="com.bit.test.model.entity.VoBBS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HEALTH INFO DETAI</title>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
#detail{
   margin: auto;
}
#detail-content{
   /* height: 300px; */
   padding: 60px;   
}
#btns{
   float: right;
}
</style>
</head>
<body>
   <%@include file="template/header.jsp" %>
   
   <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">HEALTH INFO DETAIL</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="/test/">Home</a></li>
                <li class="breadcrumb-item active">건강정보 게시판</li>
              </ul>
            </div>
          </div>
        </div>
    </div>
   
      <div id="content">
        <div class="container">
          <section class="bar no-padding-bottom">
            <div class="row">
              <div id="detail" class="col-md-10">
                <div class="heading">
                  <h2>${bean.sub }</h2>&nbsp;&nbsp;&nbsp;
                  <%if(session.getAttribute("id")!=null){ %>
               <c:if test="${mybbs.id eq null}">
               <button type="button" class="btn btn-warning" id="mybbsAdd" onclick="addfunc(id,idx);">즐겨찾기 추가</button>
               </c:if>
               <c:if test="${mybbs.id eq id}">
               <button type="button" class="btn btn-warning" id="mybbsDel" onclick="delfunc(id,idx);">즐겨찾기 해제</button>
               </c:if>
             <%} %>
                </div>
                <span>${bean.day}</span></br>
                <span><i class="fa fa-user"></i>  작성자 ${bean.id}&nbsp;&nbsp;|&nbsp;&nbsp;조회수 ${bean.hit}</span>
                <hr>
                <div id="detail-content">
                <span class="lead no-mb">${bean.content}</span>
                </div>
                 <hr>
                 <!-- 수정 삭제는 글쓴이만 가능함  -->
            <%
            if(session.getAttribute("id")!=null){
            VoBBS bbs=(VoBBS)request.getAttribute("bean");
               if(bbs.getId().equals(session.getAttribute("id"))){
            %>
            <div id="btns">
               <a href="update?idx=${bean.idx}&sub=${bean.sub}&content=${bean.content}" class="btn btn-sm btn-outline-primary">수정</a>
               <a href="list" class="btn btn-sm btn-outline-primary">목록</a>
               <form action="delete?idx=${bean.idx }" method="post" style="display: inline-block;">
                  <input type="submit" value="글삭제" class="btn btn-sm btn-outline-primary">
               </form>
            </div> 
            <%}
            }%>
            <div>
            <%if(session.getAttribute("id")!=null){ %>
            <form action="comment?idx=${bean.idx }&id=<%=session.getAttribute("id") %>" method="post">
               <div class="input-group">
                     <input style="border: 1px black solid" name="comment" type="text" class="form-control" placeholder="댓글 작성"><span class="input-group-btn">
                     <button type="submit" class="btn btn-template-main">작성</button></span>
                   </div>
            </form>
            <%} %>
            <c:forEach var="comment" items="${comments }">
               <div style="display: inline-block;"><i class="fa fa-user"></i> ${comment.id }</div>
               <c:set var="name" value="${comment.id }"/>
               <c:if test="${name eq id}">
               <form action="commentDelete?key=${comment.key }&idx=${bean.idx }" method="post" style="display: inline-block;">
                  <button type="submit" class="btn btn-sm btn-outline-dark">댓글삭제</button>
               </form>
               </c:if>
               <div>${comment.content }</div>
               <hr>
            </c:forEach>
            </div>
              </div>
            </div>
          </section>
        </div>
      </div>

   <%@include file="template/footer.jsp" %>
   
   
   <!-- 즐겨찾기 부분 JS -->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script type="text/javascript">
   var doc = document;
   //add버튼
   var add = doc.getElementById('mybbsAdd');
   //del 버튼
   var del = doc.getElementById('mybbsDel');
   
   var id='${id}';
   var idx=${bean.idx}
   //ajax add 버튼
   function addfunc(id,idx){
    $.ajax({
      type : "POST",
      url : "addmyBBS",
      data : {
         'id' : id,
         'idx': idx
      },
      success : function(data) {
         location.reload();
      },
   });
   }
   
   //ajax del 버튼
   function delfunc(id,idx){
       $.ajax({
         type : "POST",
         url : "delmyBBS",
         data : {
            'id' : id,
            'idx': idx
         },
         success : function(data) {
            location.reload();
         },
      });
      }
   </script>
</body>
</html>