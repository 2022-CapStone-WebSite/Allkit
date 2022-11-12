<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
	<title>ALLKIT</title>
	<link rel="stylesheet" href="/resources/css/user/shop/orderView.css" />

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
		
		<br><br><br><br>
		
		
		<div id="container_box">
		
			<section id="content">

			 <div class="orderInfo">
			  <c:forEach items="${orderView}" var="orderView" varStatus="status">
			   
			   <c:if test="${status.first}">
			    <p><span>수령인</span>${orderView.orderRec}</p>
			    <p><span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
			    <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
			   	<p><span>상태</span>${orderView.delivery }</p>
			   
			   </c:if> 
			   
			  </c:forEach>
			 </div>
			 
			 <ul class="orderView">
			  <c:forEach items="${orderView}" var="orderView">     
			  <li>
			   <div class="thumb">
			    <img src="${orderView.gdsThumbImg}" />
			   </div>
			   <div class="gdsInfo">
			    <p>
			     <span>상품명</span>${orderView.gdsName}<br />
			     <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
			     <span>구입 수량</span>${orderView.cartStock} 개<br />
			     <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원                  
			    </p>
			   </div>
			  </li>     
			  </c:forEach>
			 </ul>
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
