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
<%    
	int cartNum = Integer.parseInt(request.getParameter("cartNum"));
%>

	<c:set var="cartNum" value="<%=cartNum%>"/> <!-- 장바구니 페이지 -->

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
	
	<!-- Custom styles for this template -->
	<link type="text/css" href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
</head>

<body>
	<c:if test="${userForm == null}">
		<script>
			alert("권한이 없습니다.");
			location.href = "/bbs/home";
		</script>
	</c:if>
	
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg bg-light navbar-light fixed-top">
  		<div class="container">
    		<a class="navbar-brand" href="/bbs/home">♥ACCESSORY♥</a>
    		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      			<span class="navbar-toggler-icon"></span>
    		</button>
	    	<div class="collapse navbar-collapse" id="navbarResponsive">
		      	<ul class="navbar-nav ml-auto">
		      		<c:if test="${userForm == null }">          
						<li class="nav-item">
		  					<a class="nav-link" href="/user/login">로그인
		    					<span class="sr-only">(current)</span>
		  					</a>
						</li>
						<li class="nav-item">
		  					<a class="nav-link" href="/user/join">회원가입</a>
						</li>          
					</c:if>
					<c:if test="${userForm != null && userForm.isManager==0 }">
		 				<li class="nav-item">
		   					<a class="nav-link" href="/user/userView?userID=${userForm.userID}">내정보</a>
		 				</li>
		 				<li class="nav-item">
		   					<a class="nav-link" href="/cart/cartBbs?cartNum=1">장바구니</a>
						</li>
						<li class="nav-item">
		    				<a class="nav-link" href="/order/orderBbs?orderNum=1">주문조회</a>
						</li>
						<li class="nav-item">
		    				<a class="nav-link" href="/user/Logout">로그아웃</a>
						</li>
					</c:if>          
					<c:if test="${userForm != null && userForm.isManager==1 }">
						<li class="nav-item">
					   		<a class="nav-link" href="/user/userList?userNum=1">회원 관리</a>
						</li>
						<li class="nav-item">
					   		<a class="nav-link" href="/order/userOrder?userOrderNum=1">주문 관리</a>
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
				<br>
				<h1 class="my-4"><img class="d-block img-fluid" width="300" height="100" src="${pageContext.request.contextPath}/resources/img/로고.JPG"></h1>
				<br>
     			<div class="menu">
      				<ul class="accordion">
      					<li><a href="#menu1">귀걸이</a>
      						<ul>
				      			<li><a href="/bbs/bbs?category=1&subCategory=1&num=1">귀걸이</a></li>
				      			<li><a href="/bbs/bbs?category=1&subCategory=2&num=1">피어싱</a></li>
				      			<li><a href="/bbs/bbs?category=1&subCategory=3&num=1">귀찌</a></li>
				      			<li><a href="/bbs/bbs?category=1&subCategory=4&num=1">이어커프</a></li>
				      		</ul>
				      	</li>
				      	<li><a href="#menu2">목걸이</a>
				      		<ul>
				      			<li><a href="/bbs/bbs?category=2&subCategory=1&num=1">목걸이</a></li>
				      			<li><a href="/bbs/bbs?category=2&subCategory=2&num=1">초커</a></li>
				      			<li><a href="/bbs/bbs?category=2&subCategory=3&num=1">패션 목걸이</a></li>
				      		</ul>
				      	</li>
				      	<li><a href="#menu3">반지</a>
				      		<ul>
				      			<li><a href="/bbs/bbs?category=3&subCategory=1&num=1">반지</a></li>
				      			<li><a href="/bbs/bbs?category=3&subCategory=2&num=1">은반지</a></li>
				      			<li><a href="/bbs/bbs?category=3&subCategory=3&num=1">금반지</a></li>
				      		</ul>
				      	</li>
				      	<li><a href="#menu4">팔찌</a>
				      		<ul>
				      			<li><a href="/bbs/bbs?category=4&subCategory=1&num=1">팔찌</a></li>
				      			<li><a href="/bbs/bbs?category=4&subCategory=2&num=1">가죽 팔찌</a></li>
				      			<li><a href="/bbs/bbs?category=4&subCategory=3&num=1">원석 팔찌</a></li>
				      			<li><a href="/bbs/bbs?category=4&subCategory=4&num=1">은 팔찌</a></li>
				      		</ul>
				      	</li>
					</ul>
				</div>				
			</div>
			<!-- /.col-lg-3 -->
 
		    <div class="col-lg-9">
		    	<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
			</div>
			<h2>${userForm.userID}님의 장바구니 목록 입니다♥</h2>
			<br><form name="checkBoxForm">
					<table class="table" style="text-align:center;">
						<tr>
							<th colspan=7>장바구니</th>
						</tr>
						<tr>
							<td>상품 선택</td>
							<td>이미지</td>
							<td>제품 정보</td>
							<td>가격</td>
							<td>수량</td>
							<td>합계</td>
							<td>선택</td>
						<tbody id = tbody>
						</tbody>
						<tr>
							<td colspan=7 style="text-align:right;">총 상품 금액 : <input name="total_sum" type="text" size="20" readonly></td>
						</tr>
						<tr align="center">
							<td colspan=7><button type="button" onclick="javascript:CheckOrder(checkBoxForm);">선택 상품 주문</button>
							&emsp;<button type="button" onclick="javascript:AllOrder(checkBoxForm);">전체 상품 주문</button></td>
						</tr>
					</table>
				<input type="hidden" id="cartNum" name="cartNum"    value="${cartNum}"/> <!-- 페이지 -->
				<input type="hidden" id="userID" name="userID"    value="${userForm.userID}"/> <!-- 현재 유저 -->
				</form>
				<!-- 페이징 -->
				<div class="page_wrap" id=tPaging>
				
				</div>		
			</div>
			<!-- /.col-lg-9 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	
	<!-- Footer -->
	<footer class="py-5 bg-light">
	  <div class="container">
	    <p class="m-0 text-center text-dark">Copyright &copy; Accessory ShoppingMall 2020</p>
	  </div>
	  <!-- /.container -->
	</footer>
	
	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/cartBbs.js"></script>
</body>

</html>
