<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 이벤트 등록</title>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%@include file="template/header.jsp" %>

	<div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">EVENT ADD</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="/test/">Home</a></li>
                <li class="breadcrumb-item"><a href="/test/adbbs">event 게시판</a></li>
                <li class="breadcrumb-item active">광고 입력</li>
              </ul>
            </div>
          </div>
        </div>
    </div>
      
      
       <section class="bar pt-0">
            <div class="row">
              <div class="col-md-12">
                <div class="heading text-center">
                  <h2>병원 이벤트 등록</h2>
                </div>
              </div>
              <div class="col-md-8 mx-auto">
                <form method="POST" enctype="multipart/form-data" action="upload">
                  <div class="row">
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="img">사진</label>
                        <input id="img"  type="file" name="img" class="form-control">
                      </div>
                    </div>
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="sub">업체명</label>
                        <input id="sub" type="text" name="sub" class="form-control">
                      </div>
                    </div>
                    <div class="col-sm-12">
                      <div class="form-group">
                        <label for="content">이벤트 설명</label>
                        <textarea id="content" name="content" type="text" class="form-control"></textarea>
                      </div>
                    </div>
                    <div class="col-sm-12 text-center">
                      <button type="submit" class="btn btn-template-outlined">등록</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </section>
		
	<%@include file="template/footer.jsp" %>
</body>
</html>