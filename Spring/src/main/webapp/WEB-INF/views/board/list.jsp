<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
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

<div id="root">
 <header>
  <%@include file="../include/header.jsp" %>
 </header>
<hr /> 
 <nav>
 	<%@include file="../board/include/navcrud.jsp" %>
 </nav>
<hr />
 <section id="container">
  <h2>글 목록</h2>
  
  <table>
   <tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성일자</th></tr>
   
   <!-- 목록 시작 -->
   <c:forEach items="${list}" var="list">
   <tr>
    <td>${list.bno}</td>
    
    <td><a href ="/board/read?bno=${list.bno}">${list.title}</a></td>
    
    <td>${list.writer}</td>
    
    <td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
   </tr>
   </c:forEach>
   <!-- 목록 끝 -->
   
  </table>

 </section>

<hr />

	<footer>
		<%@include file="include/footer.jsp" %>
	</footer>

</div>

</body>
</html>