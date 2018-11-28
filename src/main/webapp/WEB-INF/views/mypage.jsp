<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<title>mypage</title>
<style type="text/css">
.myad{
	display: inline-block;
}
#content{
	width: 900px;
	margin: auto;
}

</style>
</head>

<body>

	<%@include file="template/header.jsp" %>

	<div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">MYPAGE</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="/test/">Home</a></li>
                <li class="breadcrumb-item active">MYPAGE</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      
      <div id="content">
        <div class="container">
          <section class="bar">
            <div class="row">
              <div class="col-lg-10">
                <div class="heading text-center">
                  <h3>회원정보</h3>
                </div>
                <div>
	                <p class="lead">ID : ${sessionScope.id }</br>
	                이름 : ${sessionScope.name }</p>
				</div>
              </div>
            </div>
            <h4>즐겨찾기</h4>
            <div class="row">
              <div class="col-lg-10">
                <div id="accordion" role="tablist">
                  <div class="card">
                    <div id="headingOne" role="tab" class="card-header">
                      <h4 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">병원/약국</a></h4>
                    </div>
                    <div id="collapseOne" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion" class="collapse">
                      <div class="card-body">
                        <div class="row">
                          <div class="col-md-8">
								<c:forEach var="bean" items="${HPlist }">
									<a target="_blank" href="${bean.url }">${bean.name }</a>
								</c:forEach>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div id="headingTwo" role="tab" class="card-header">
                      <h4 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsed">건강정보</a></h4>
                    </div>
                    <div id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion" class="collapse">
                      <div class="card-body">
                        <div class="row">
                          <div class="col-md-8">
							<c:forEach var="bean" items="${BBSlist }">
								<a href="detail?idx=${bean.idx }">${bean.sub }</a>
							</c:forEach>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div id="headingThree" role="tab" class="card-header">
                      <h4 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" class="collapsed">이벤트</a></h4>
                    </div>
                    <div id="collapseThree" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion" class="collapse">
                      <div class="card-body">
						<c:forEach var="bean" items="${AdBBSlist }">
							<div class="myad">
            					<a href="adbbs_detail?idx=${bean.idx }"> <img class="img-responsive" src="/test/img/${bean.img }" alt="/test/img/${bean.img }"></a>
            					<h3>${bean.sub }</h3>
            				</div>
						</c:forEach>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <h4>내가 쓴 글</h4>
            <div class="row">
              <div class="col-lg-10">
                <div id="accordion2" role="tablist">
                  <div class="card">
                    <div id="headingOne2" role="tab" class="card-header">
                      <h4 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseOne2" aria-expanded="false" aria-controls="collapseOne2">건강정보 게시판</a></h4>
                    </div>
                    <div id="collapseOne2" role="tabpanel" aria-labelledby="headingOne2" data-parent="#accordion2" class="collapse">
                      <div class="card-body">
                        <div class="row">
                          <div class="col-md-8">
							<table>
								<tr>
									<th>날짜</th>
									<th>제목</th>
									<th>조회수</th>
								</tr>
								<c:forEach var="bean" items="${myBBS }">
								<tr>
									<td>${bean.day }</td>
									<td><a href="/test/detail?idx=${bean.idx }">${bean.sub }</a></td>
									<td>${bean.hit }</td>
								</tr>
								</c:forEach>
							</table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div id="headingTwo2" role="tab" class="card-header">
                      <h4 class="mb-0 mt-0"><a data-toggle="collapse" href="#collapseTwo2" aria-expanded="false" aria-controls="collapseTwo2" class="collapsed">리뷰/평점</a></h4>
                    </div>
                    <div id="collapseTwo2" role="tabpanel" aria-labelledby="headingTwo2" data-parent="#accordion2" class="collapse">
                      <div class="card-body">
                        <div class="row">
                          <div class="col-md-8">
								<table>
									<tr>
										<th>날짜</th>
										<th>내용</th>
									</tr>
									<c:forEach var="bean" items="${myReview }">
									<tr>
										<td>${bean.day }</td>
										<td>
											<a href="${bean.url }">${bean.name }</a></br>
											<span>${bean.score }점 | </span><span>${bean.content }</span>
										</td>
									</tr>
									</c:forEach>
								</table>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
   		</div>
    </div>
	<%@include file="template/footer.jsp" %>
</body>
</html>