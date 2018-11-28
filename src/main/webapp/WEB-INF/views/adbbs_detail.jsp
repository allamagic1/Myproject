<%@page import="com.bit.test.model.entity.VoComment"%>
<%@page import="com.bit.test.model.entity.VoBBS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- 즐겨찾기 부분 JS -->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <%@include file="template/header.jsp"%>

   <div id="heading-breadcrumbs">
      <div class="container">
         <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
               <h1 class="h2">EVENT DETAIL</h1>
            </div>
            <div class="col-md-5">
               <ul class="breadcrumb d-flex justify-content-end">
                  <li class="breadcrumb-item"><a href="/test/">Home</a></li>
                  <li class="breadcrumb-item active">이벤트 디테일</li>
               </ul>
            </div>
         </div>
      </div>
   </div>






   <!-- 즐겨찾기 부분 JS -->
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script type="text/javascript">
      var doc = document;
      //add버튼
      var add = doc.getElementById('mybbsAdd');
      //del 버튼
      var del = doc.getElementById('mybbsDel');

      var id = '${id}';
      var idx = '${bean.idx}';
      //ajax add 버튼
      function addfunc(id, idx) {
         $.ajax({
            type : "POST",
            url : "addmyAdBBS",
            data : {
               'id' : id,
               'idx' : idx
            },
            success : function(data) {
               location.reload();
            },
         });
      }

      //ajax del 버튼
      function delfunc(id, idx) {
         $.ajax({
            type : "POST",
            url : "delmyAdBBS",
            data : {
               'id' : id,
               'idx' : idx
            },
            success : function(data) {
               location.reload();
            },
         });
      }
   </script>


   <script type="text/javascript">
      $(function() {
         var session = '${id}';
         if (session != 'admin@bit.com') {
            $('#delAdbbs').hide();
         } else {
            $('#delAdbbs').show();
         }

      });
   </script>


   <%-- <p>${bean.idx }</p> --%>


   <div id="content">
      <div class="container">
         <section class="bar no-padding-bottom">
            <div class="row">
               <div id="detail" class="col-md-10" style="margin: auto;">
                  <div class="heading">
                     <h2>${bean.sub }</h2>
                     &nbsp;&nbsp;&nbsp;
                     <%
                        if (session.getAttribute("id") != null) {
                     %>
                     <c:if test="${myAdbbs.id eq null}">
                        <button type="button" class="btn btn-warning" id="mybbsAdd" onclick="addfunc(id,idx);">즐겨찾기
                           추가</button>
                     </c:if>
                     <c:if test="${myAdbbs.id eq id}">
                        <button type="button" class="btn btn-warning" id="mybbsDel" onclick="delfunc(id,idx);">즐겨찾기
                           해제</button>
                     </c:if>
                     <%
                        }
                     %>
                     <a id="delAdbbs"   class="btn btn-outline-dark" href="delAdBBS?idx=${bean.idx }">삭제</a>
                  </div>
                  <hr>
                  <div id="detail-content" style="width: 100%;text-align: center;">
                     <img class="img-responsive" src="/test/img/${bean.img }"
                        alt="/test/img/${bean.img }">
                  </div>
                  <hr>
                  <span class="lead no-mb">${bean.content}</span>
                  <hr>
                  
               </div>
            </div>
      </div>
      </section>
   </div>
   </div>

   <%@include file="template/footer.jsp"%>
   <!-- 수정 삭제는 글쓴이만 가능함  -->
   <%-- <%
   if(session.getAttribute("id")!=null){
   VoBBS bbs=(VoBBS)request.getAttribute("bean");
      if(bbs.getId().equals(session.getAttribute("id"))){
   %> 
   <a href="update?idx=${bean.idx }">수정</a>
   <a href="list">목록</a>
   <form action="delete?idx=${bean.idx }" method="post">
      <input type="submit" value="글삭제">
   </form>
   <%}
   }%>
   <div>
   댓글<br>
   <c:forEach var="comment" items="${comments }">
      <div>작성자: ${comment.id }</div>
      <div>글 내용:${comment.content }</div>
      <c:set var="name" value="${comment.id }"/>
      <c:if test="${name eq id}">
      <form action="commentDelete?key=${comment.key }&idx=${bean.idx }" method="post">
      <button>댓글삭제</button>
      </form>
      </c:if>
   </c:forEach>
   </div>
   <%if(session.getAttribute("id")!=null){ %>
   <form action="comment?idx=${bean.idx }&id=<%=session.getAttribute("id") %>" method="post">
   <div>댓글 작성<input type="text" name="comment"><input type="submit" value="작성">
   </div>
   </form>
   <%} %> --%>


</body>
</html>