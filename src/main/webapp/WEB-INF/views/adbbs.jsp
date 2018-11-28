<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>병원 이벤트</title>
<!-- Bootstrap core CSS -->
<!-- <link href="/test/css/bootstrap.css" rel="stylesheet"> -->
<!-- Custom CSS for the 'Thumbnail Gallery' Template -->
<link href="/test/css/2-col-portfolio.css" rel="stylesheet">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%@include file="template/header.jsp" %>
	
	<div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">EVENT</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="/test/">Home</a></li>
                <li class="breadcrumb-item active">event 게시판</li>
              </ul>
            </div>
          </div>
        </div>
    </div>
	
	<div id="content">
        <div class="container">
          <section class="bar">
            <div class="row">
              <div class="col-md-12">
                <div class="heading">
                  <h3>병원 이벤트</h3>
                  <a id="addadmove" class="btn btn-outline-primary" href="addad">광고 입력</a>
                </div>
              </div>
            </div>
            <div  id="ad" class="row portfolio text-center">
              <c:forEach var="bean" items="${alist }">
	              <div class="col-md-4">
	                <div class="box-image">
	                  <div class="image"><img src="/test/img/${bean.img }" alt="" class="img-fluid">
	                    <div class="overlay d-flex align-items-center justify-content-center">
	                      <div class="content">
	                        <div class="name">
	                          <h3><a href="adbbs_detail?idx=${bean.idx }" class="color-white">${bean.sub }</a></h3>
	                        </div>
	                        <div class="text">
	                          <p class="d-none d-sm-block">${bean.content }</p>
	                          <p class="buttons"><a href="adbbs_detail?idx=${bean.idx }" class="btn btn-template-outlined-white">View</a><a href="#" class="btn btn-template-outlined-white">Website</a></p>
	                        </div>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </div>
              </c:forEach>
            </div>
          </section>
        </div>
      </div>
	
   
	<%@include file="template/footer.jsp" %>

   <!-- JavaScript -->
    <script type="text/javascript">
        //관리자만 입력페이지로 갈 수 있게 
      	$(function() {
            var id = '${sessionScope.id}';
            console.log(id+'  adbbs.jsp  ');
            if (id == 'admin@bit.com') {
               $('#addadmove').show();
            } else {
               $('#addadmove').hide();
            }
         });
    </script>
  
   <script type="text/javascript">
   var list;
   var idx;
    $(document).ready(function () {
         $(document).scroll(function() {
           var maxHeight = $(document).height();
           var currentScroll = $(window).scrollTop() + $(window).height();
             if(idx==null){
                idx= $('#idx').val();
                idx=parseInt(idx)+6;
             }
           if (maxHeight <= currentScroll) {
         var ad = document.getElementById('ad');
         if(idx!="null"){
            $.ajax({
             type : "get",
             url : "adlist",
             data : {
                'idx' : idx
             },
             success : function(data) {
                list=JSON.parse(data);
                if(list.length>5){
                   idx=list[5].idx;
                }else{
                   idx='null';
                }
                console.log(list.length);
                
                for(var i=0; i<list.length; i++){
                var msg='<div class="col-lg-6 col-md-6 portfolio-item">';
                msg=msg+'<a href="#project-one"><img class="img-responsive" src="/test/img/'+list[i].img+'"></a>';
                msg=msg+'<h3><a href="#project-one">'+list[i].sub+'</a></h3>';
                msg=msg+'<p>'+list[i].content+'</p>';
                msg=msg+'<input type="hidden" value="'+list[i].idx+'" id="idx">';
                msg=msg+'</div>';
                $('#ad').append(msg);
                }
             }
            });//ajax end
         }
           }
         })
       });
    </script>
</body>
</html>