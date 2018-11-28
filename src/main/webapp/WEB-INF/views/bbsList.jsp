<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>건강정보 게시판</title>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style type="text/css">
table{
	text-align: center;
}

#write_btn{
	float: right;
}

#paging{
	margin: auto;
}
#title{
	display: inline-block;
	float: left;
}
#search{
	display:inline-block;
	width: 30%;
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
              <h1 class="h2">Health Info</h1>
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
          <div class="row bar mb-0">
          <div class="col-md-12">
             <div id="title" class="heading">
				<h3>건강정보 게시판</h3>
			 </div>
			 <div id="search">
				<form>
					<div class="input-group">
					<select name="select">
						<option value="sub">제목</option>
						<option value="content">내용</option>
					</select>
	                  <input name="text" type="text" placeholder="Search" class="form-control"><span class="input-group-btn">
	                  <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button></span>
	                </div>
				</form>
			 </div>
          </div>
            <div id="customer-orders" class="col-md-12">
              <div class="box mt-0 mb-lg-0">
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>No.</th>
                        <th>작성일</th>
                        <th width="40%">제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="bean" items="${alist }">
                      <tr>
                        <th>${bean.idx }</th>
                        <td>${bean.day }</td>
                        <td  width="40%"><a href="detail?idx=${bean.idx }">${bean.sub }</a></td>
                        <td>${bean.id }</td>
                        <td>${bean.hit }</td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
            </div>
            <div class="row">
                <div id="paging">
	                <ul class="pagination pagination-sm">
	                	<li class="page-item"><a href="#" class="page-link">«</a></li>
						<c:forEach var="i" begin="1" end="${count }">
	                        <li class="page-item"><a href="list?page=${i}&text=${text}&select=${select}" class="page-link">${i }</a></li>
						</c:forEach>
	                	<li class="page-item"><a href="#" class="page-link">»</a></li>
	                </ul>
                </div>
            </div>
                <div>
                <%
					if (session.getAttribute("id") != null) {
				%>
				<a id="write_btn"  href="add"  class="btn btn-template-main">글쓰기</a>
				<%
					}
				%>
                </div>
				
            </div>
          </div>
        </div>
      </div>
      
      
	
	<%@include file="template/footer.jsp" %>
</body>
</html>