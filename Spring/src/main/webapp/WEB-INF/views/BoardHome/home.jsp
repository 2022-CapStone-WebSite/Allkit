<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>ALLKit 게시판</title>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!-- CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적 테마 -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
 <header>
  <%@include file="../include/header.jsp" %>  
 </header> 

 <nav>
 	<%@include file="../board/include/navcrud.jsp" %>      
 </nav>
 <hr />

	<!-- 내용 추가 -->
	<c:if test="${member == null}">
		<form role="form" method="post" autocomplete="off"
			action="/member/login">
			
			<div class="form-group">
				<label for="userId" class="col-sm-2 control-label">아이디</label> 
				<input type="text" id="userId" name="userId" class="form-control" />
			</div>
			
			<div class="form-group">
				<label for="userPass" class="col-sm-2 control-label">비밀번호</label> 
				<input type="password" id="userPass" name="userPass" class="form-control" />
			</div>
			
			<p>
				<button type="submit">로그인</button>
			</p>
			
			<p>
				<a href="/member/register">회원가입</a>
			</p>
			 
		</form>
	</c:if>
	
	<c:if test="${msg == false}">
		<p style="color:#f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주십시오.</p>
	</c:if>
	
	<c:if test="${member != null}">
		<p>${member.userName}님환영합니다.</p>
		
		<a href="member/modify">회원정보 수정</a>,  <a href="member/withdrawal">회원탈퇴</a>, 
		<a href="member/logout">로그아웃</a>
	</c:if>
	
	<hr />

		<footer>
			<%@include file="../include/footer.jsp"%>
		</footer>  

</body>
</html>
