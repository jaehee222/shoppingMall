<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>악세사리 쇼핑몰</title>

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

	<!-- Custom styles for this template -->
	<link type="text/css" href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
</head>

<body>
	<c:if test="${userForm.isManager == 0}">
		<script>
			alert("권한이 없습니다.");
			location.href = "/bbs/home";
		</script>
	</c:if>
	
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
  		<div class="container">
    		<a class="navbar-brand" href="/bbs/home">악세사리 쇼핑몰</a>
    		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
	    	<div class="collapse navbar-collapse" id="navbarResponsive">
		      	<ul class="navbar-nav ml-auto">   
					<c:if test="${userForm != null && userForm.isManager==1 }">
						<li class="nav-item">
					   		<a class="nav-link" href="/user/userList">회원 관리</a>
						</li>
						<li class="nav-item">
					   		<a class="nav-link" href="/bbs/bbsWrite">제품 등록</a>
						</li>
						<li class="nav-item">
					    	<a class="nav-link" href="/user/Logout">로그아웃</a>
						</li>
					</c:if>
		      	</ul>
	    	</div>
  		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h1 class="my-4">악세사리</h1>
				<br>
     			<div class="menu">
      				<ul class="accordion">
      					<li><a href="#menu1">귀걸이</a>
      						<ul>
				      			<li><a href="/bbs/bbs?category=1&subCategory=1">귀걸이</a></li>
				      			<li><a href="/bbs/bbs?category=1&subCategory=2">피어싱</a></li>
				      			<li><a href="/bbs/bbs?category=1&subCategory=3">귀찌</a></li>
				      			<li><a href="/bbs/bbs?category=1&subCategory=4">이어커프</a></li>
				      		</ul>
				      	</li>
				      	<li><a href="#menu2">목걸이</a>
				      		<ul>
				      			<li><a href="/bbs/bbs?category=2&subCategory=1">목걸이</a></li>
				      			<li><a href="/bbs/bbs?category=2&subCategory=2">초커</a></li>
				      			<li><a href="/bbs/bbs?category=2&subCategory=3">패션 목걸이</a></li>
				      		</ul>
				      	</li>
				      	<li><a href="#menu3">반지</a>
				      		<ul>
				      			<li><a href="/bbs/bbs?category=3&subCategory=1">반지</a></li>
				      			<li><a href="/bbs/bbs?category=3&subCategory=2">레이어드 링</a></li>
				      			<li><a href="/bbs/bbs?category=3&subCategory=3">은반지</a></li>
				      			<li><a href="/bbs/bbs?category=3&subCategory=4">금반지</a></li>
				      		</ul>
				      	</li>
				      	<li><a href="#menu4">팔찌</a>
				      		<ul>
				      			<li><a href="/bbs/bbs?category=4&subCategory=1">팔찌</a></li>
				      			<li><a href="/bbs/bbs?category=4&subCategory=2">가죽 팔찌</a></li>
				      			<li><a href="/bbs/bbs?category=4&subCategory=3">원석 팔찌</a></li>
				      			<li><a href="/bbs/bbs?category=4&subCategory=4">은 팔찌</a></li>
				      		</ul>
				      	</li>
				      	<li><a href="/bbs/bbs?category=5&subCategory=1">발찌</a></li>        		        		
					</ul>
				</div>				
			</div>
			<!-- /.col-lg-3 -->
 
		    <div class="col-lg-9">
		    	<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
				</div>
				<br>
				<table class="table" style="text-align:center;">
					<tr>
						<th colspan=4>회원정보 리스트</th>
					</tr>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>등급</th>
					</tr>
					<tbody id="tbody">
					
					</tbody>
				</table>
				<br>
			</div>
			<!-- /.col-lg-9 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	
	<!-- Footer -->
	<footer class="py-5 bg-dark">
	  <div class="container">
	    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
	  </div>
	  <!-- /.container -->
	</footer>
	
	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/userList.js"></script>
</body>

</html>
