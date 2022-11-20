<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALLKit 게시판</title>
<!-- 제이쿼리 -->
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<!-- CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적 테마 -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<style>
		li.cus{font-size:20px;}    
		li.call{font-size:30px;}   
		li.bold{font-weight:bold;}

		
		div.pm{margin:0 50%; }      
	  
		body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }  
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		h1, h2, h3, h4, h5, h6 { margin:0; padding:0;  }
		
		h2.bold{font-weight:bold;}
		span.bold{font-weight:bold; font-size:25px;}
		span{font-size:20px; color:black; }   
		
		ul, lo, li { margin:0; padding:0; list-style:none; }  
	
		/* ---------- */
		/*헤더 부분은 페이지 전체를 꽉 채워야 하기때문에 따로 클래스를 줘서 스타일을 입힘  */ 
	
		div#root { width:900px; margin:0 auto; height:auto;   }
		div#root2 { width:100%; margin:0 auto; }
		div#root3{display:inline-block; padding:0.5rem calc((100vw - 1000px) / 2);  } /* 패딩을 이용한 가운데 정렬 */ 
		div#root4{display:inline-block; width:100px; }    
		div#root5 { display:inline-block; width:100%; } 		
		div#root6{display:flex; width:200px; height:200px; align-items:center; justify-content:center; }
		  
		h4.log , a.log{padding:0.5rem calc((100vw - 1000px) / 2);}
		     
		  
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


	
		   
       button.b{background-color:#555555; color:white;}  
	
	</style>
</head>

<body>
		<header>
			<%@include file="../include/header.jsp"%>
		</header><br><br>
		
	<div id = "root">	

	<br>
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
	</div><br><br><br><br><br><br><br><br> 
	
	
		
		

	<div class="container">

 
		<section>

			<c:if test="${msg != 'login_error'}">
			 
				<form role="form" method="post" autocomplete="off">

					<div class="form-group">
						<label for="title" class="col-sm-2 control-label">글 제목</label>
						<!-- <input type="text" id="title" name="title" /> -->
						<input type="text" id="title" name="title" class="form-control" />
					</div>

					<div class="form-group"> 
						<!-- <label for="content">글 내용</label>
					<textarea id="content" name="content"></textarea> -->

						<label for="content" class="col-sm-2 control-label">글 내용</label>
						<textarea id="content" name="content" class="form-control"
							style="resize: none; overflow: scroll; height: 200px"></textarea>
					</div>

					<div class="form-group">
						<label for="writer" class="control-label">작성자</label> <input
							type="text" id="writer" name="writer" class="form-control"
							value="${member.userName}" readonly="readonly" />
					</div>

					<p>
						<button type="submit" class = "b" id="write">작성</button>
					</p>
				</form> 
			</c:if>

			<c:if test="${msg == 'login_error'}">
				<h4 class = "log">회원만 작성가능합니다.</h4> 
				&nbsp &nbsp<a class = "log" href="/board/listSearch">뒤로가기</a> 

			</c:if>

		</section>

		<hr />




	</div>
 
	<footer> 

			<%@include file="/WEB-INF/views/include/footer2.jsp" %>  

	</footer>

</body>
</html>