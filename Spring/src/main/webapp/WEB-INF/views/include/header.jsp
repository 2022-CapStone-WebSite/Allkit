<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style>
  	.white, .white a {
  
		  color: #fff;
		  font-size:20px;
		}
		  	
  
  </style>


</head>
<body>

<!-- 	<h1 class = "title">
	<a href="/">ALLKIT22</a>    
	</h1> -->


<nav class="navbar navbar-inverse ">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">ALLKIT</a>
    </div>
    
    <!-- <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="#">게시판</a></li>
    </ul> -->
    
    
    <ul class="nav navbar-nav navbar-right">
      <!-- <li><a href="/member/signup"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
      <li><a href="/member/signin"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li> -->
       
      <c:if test="${member == null}">
		   <li>
		    <a href="/member/signin"><span class="glyphicon glyphicon-log-in white "></span>&nbsp로그인</a>
		   </li>
		   <li>
		    <a href="/member/signup"><span class="glyphicon glyphicon-user white"></span>&nbsp회원가입</a>
		   </li>
		</c:if>
		<c:if test="${member != null}">
		
			<c:if test="${member.verify == 9}">
				<li>
				 <a href="/admin/index"><span class="glyphicon glyphicon-user white"></span>&nbsp관리자 화면 ${member.userName}님 환영합니다.</a> 
				</li> 
			</c:if> 
			
			<c:if test="${member.verify != 9 }">
				
				  
				
				<li>
				 <a><span class="glyphicon glyphicon-user white"></span>&nbsp ${member.userName}님 환영합니다.</a> 
				</li> 
				
			</c:if>

		   
		   <li>
		   	<a href="/shop/cartList"><span class="glyphicon glyphicon-shopping-cart white"></span>&nbsp내 카트</a>
		   </li>
		   
		   <li>
		   	<a href="/shop/orderList"><span class="	glyphicon glyphicon-list-alt white"></span>&nbsp주문 목록</a>
		   </li>
		   
		   <li>
		    <a href="/member/signout"><span class="	glyphicon glyphicon-log-out white"></span>&nbsp로그아웃</a>
		   </li>
		</c:if>

    </ul>
  </div>
</nav>


</body>
</html>
