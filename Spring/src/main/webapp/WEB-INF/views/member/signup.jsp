<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>ALLKIT</title>
	<link rel="stylesheet" href="/resources/css/user/member/signup.css">
</head>
<body>
<div id = "root2">
	<header id = "header">
		<div id = "header_box">
			<%@ include file = "/WEB-INF/views/include/header.jsp" %>	
		</div>
	</header>  
</div><br>

<div id = "root">	 
	<br><br><br>
	<section id="container">
	
	 	<aside id="aside">
			<%@ include file="../include/aside.jsp" %>
		</aside>  
			
		<aside id="aside">
			<%@ include file="/WEB-INF/views/include/aside2.jsp" %>
		</aside>
			
		<aside id="aside">
			<%@ include file="/WEB-INF/views/include/aside3.jsp" %>
		</aside>
			
		<aside id="aside">
			<%@ include file="/WEB-INF/views/include/aside4.jsp" %>
		</aside>
			
		<aside id="aside">
			<%@ include file="/WEB-INF/views/include/aside5.jsp" %>
		</aside>
	</section>
	
</div>
	


	
<div id = "root">
	<section id = "container">	

		<div id="container_box">
				
				<section id="content">
				
				<form role="form" method="post" autocomplete="off">
				
					<img src="../resources/images/logo.PNG"  class="rounded mx-auto d-block" alt="..." style="width : 50%; margin-left:25%">  
					<br><br><br>
					<div class="input_area mb-3">
						<label for="userId" class="form-label size">아이디:</label> 
						<input type="email" class="form-control" id="userId"
							name="userId" placeholder="example@email.com" required="required" />
					</div>

					<div class="input_area">
						<label for="userPass" class="form-label size">패스워드:</label> 
						<input type="password"
							 class="form-control" id="userPass" name="userPass" required="required" />
					</div>

					<div class="input_area">
						<label for="userName" class="form-label size">닉네임</label> 
						<input type="text" class="form-control" id="userName"
							name="userName" placeholder="닉네임을 입력해주세요" required="required" />
					</div>

					<div class="input_area">
						<label for="userPhon" class="form-label size">연락처</label> 
						<input type="text" class="form-control" id="userPhon"
							name="userPhon" placeholder="연락처를 입력해주세요" required="required" />
					</div><br>

					<button type="submit" class="btn btn-primary form-control color" id="signup_btn" name="signup_btn">회원가입</button>

				</form>
			</section>
		</div>
	</section>
	
</div>

	<footer id ="footer">
		<div id="footer_box">
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>  
		</div>
	</footer>
	



</body>
</html>
