<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<html>
<head>
	<title>ALLKIT</title>
 
	<style>
		li.cus{font-size:20px;}  
		li.call{font-size:30px;}   
		li.bold{font-weight:bold;}
		
		ul{
		   list-style:none;  
		   }
   
   /* 헤더부분 크기 조절 */
/* 	   .container-fluid{
	   height:55px;
	   } */
	      
	   
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
			  
		div#root { width:900px; margin:0 auto; height:auto;   }
		div#root2 { width:100%; margin:0 auto; }
		div#root3{display:inline-block; padding:0.5rem calc((100vw - 1000px) / 2);  } /* 패딩을 이용한 가운데 정렬 */ 
		div#root4{display:inline-block; width:100px; }   
		div#root5 { display:inline-block; width:100%; } 		
		div#root6{display:flex; width:200px; height:200px; align-items:center; justify-content:center; }
		
		
		
		header#header {}
		nav#nav {}
		section#container { }
		section#content { float:right; width:100%; padding:5% }
		aside#aside { float:left; width:180px; }
		section#container::after { content:""; display:block; clear:both; }	

		
		/* ---------- */
		
		/* header#header div#header_box { text-align:center; padding:30px 0; } */
		header#header div#header_box { text-align:center;}
		header#header div#header_box h1 { font-size:50px; }
		header#header div#header_box h1 a { color:#000; }
		
		nav#nav div#nav_box { font-size:14px; padding:10px; text-align:right; }
		nav#nav div#nav_box li { display:inline-block; margin:0 10px; }
		nav#nav div#nav_box li a { color:#333; }
		
		section#container { }  
		
	  

 	     
 	  
        h2 { font-size:20px; text-align:center; float:center; font-weight:bold; padding:0.5rem calc((100vw - 1000px) / 2);   }
        h4 { font-size:20px; text-align:center; float:center; font-weight:bold; padding:0.5rem calc((100vw - 1000px) / 2);   }
       
		aside#aside li { font-size:20px; text-align:center; float:center; font-weight:bold;  z-index:1;  }
		aside#aside li a { color:#000; display:block; padding:10px 0;  }
		aside#aside li a:hover { text-decoration:none; background:#eee; }
		
		aside#aside li { position:relative; }
		aside#aside li:hover { background:#eee; } 
		
		/* 이거 값 설정하면 카테고리 마우스 올릴때 하부 카테고리 위치 조정가능  */		
		aside#aside li > ul.low { display:none; position:absolute; top:50px; left:0px;}
		aside#aside li:hover > ul.low { display:block; }   
		aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
		aside#aside li:hover > ul.low li a:hover { background:#fff;}
		aside#aside li > ul.low li { width:170px; }  


		/* 마진탑 늘어날수록 아래로 붙고 페이지 스크롤이 늘어남 */
		footer#footer { margin-top:10%; border-radius:50px 50px 0 0; }
		footer#footer div#footer_box { padding:0 50px; }
		footer#footer { background:#000; padding:20px; }
		
		
	
	</style>    


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
				<%@ include file="/WEB-INF/views/include/aside.jsp" %>    
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
	</section>
</div>

<div id = "root3">		
<section id="container">	
<div id="container_box">
			<table class = "tb">
				<thead>
					<tr> 
						<th>제품</th>
						<th>이름</th>
						<th>카테고리</th>
						<th>가격(원)</th>
						<th>수량</th> 
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
					<tr>
						<td>
							<img src="${list.gdsThumbImg}">
						</td>
						<td>
							<a href="/shop/view?n=${list.gdsNum}">${list.gdsName}</a>
						</td>
						<td>
						<%-- ${list.cateCode} --%>
						  ${list.cateName}
						</td> 
						<td>
							<fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>원
						</td>
						<td>${list.gdsStock}개</td>						
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
<!-- 				<div> -->
<!-- 				 <ul> -->
<%-- 				  <c:if test="${pageMaker.prev}"> --%>
<%-- 				   <li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li> --%>
<%-- 				  </c:if>  --%>
				 
<%-- 				  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx"> --%>
<%-- 				   <li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li> --%>
<%-- 				  </c:forEach>  --%>
				    
<%-- 				  <c:if test="${pageMaker.next && pageMaker.endPage > 0}"> --%>
<%-- 				   <li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li> --%>
<%-- 				  </c:if>  --%>
<!-- 				 </ul> -->
<!-- 				</div> -->
				
				     

			
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
