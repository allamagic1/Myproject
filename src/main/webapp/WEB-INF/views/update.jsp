<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
   
   <section class="bar pt-0">
            <div class="row">
              <div class="col-md-12">
                <div class="heading text-center">
                  <h2>게시물 수정</h2>
                </div>
              </div>
              <div class="col-md-8 mx-auto">
                <form action="update" method="post">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="img">제목</label>
                        <input type="text" name="sub" class="form-control" value="${sub }">
                      </div>
                    </div>
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="sub">내용</label>
                        <textarea rows="13" type="text" name="content" class="form-control">${content }</textarea>
                         <input type="hidden" name="idx" value="${idx }">
                      </div>
                    </div>
                    <div class="col-sm-12 text-center">
                      <button type="submit" class="btn btn-template-outlined">수정</button>
                      <button type="reset" class="btn btn-template-outlined">취소</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
     </section>
   
   <%@include file="template/footer.jsp" %>
</body>
</html>