<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>ALLKIT</title>
	
	<style>
	
		li.cus{font-size:20px;}  
		li.call{font-size:30px;}   
		li.bold{font-weight:bold;} 
	
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
	
		div#root { width:900px; margin:0 auto; height:auto;}
		span#root { width:900px; margin:0 auto; height:auto; text-align:center;   }
		
		div#root2 { width:100%; margin:0 auto; }
		div#root3{display:inline-block; padding:0.5rem calc((100vw - 1000px) / 2);  } /* 패딩을 이용한 가운데 정렬 */ 
		div#root4{display:inline-block; width:100px; }   
		div#root5 { display:inline-block; width:100%; } 		
		div#root6{display:flex; width:200px; height:200px; align-items:center; justify-content:center; }
		
		div#root7 { width:900px; margin:0 auto; height:auto; text-align:center; float: center;    }
		 
		    
		  
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
        h5{font-size:29px; text-align:right; float:right; font-weight:bold; padding:0 30%;} 
       
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
		footer#footer { background:#eee; padding:20px; }
		
		.imgsize{
			object-fit:fill;
		}
		  
		  
		/* 이상품어때요 css */ 
		span#sug2{position:relative; left:13%;}      
		span#sug3{position:relative; left:24%;} 
		 
		span#sug5{position:relative; left:25%;}  
		span#sug6{position:relative; left:47%;} 
  
		  
		span#sug4,span#sug5,span#sug6{font-weight:bold;} 
		
		/* 3분요리 */
		span#min2{position:relative; left:13%;}      
		span#min3{position:relative; left:24%;} 
		 
		span#min5{position:relative; left:23%;}  
		span#min6{position:relative; left:45%;} 
		
		span#min4,span#min5,span#min6{font-weight:bold;}
		
		/* 과일 및 샐러드 코너 */
		span#fruit2{position:relative; left:13%;}      
		span#fruit3{position:relative; left:26%;} 
		 
		span#fruit5{position:relative; left:23%;}  
		span#fruit6{position:relative; left:45%;} 
		
		span#salad2{position:relative; left:13%;}      
		span#salad3{position:relative; left:24%;}  
		     
		span#salad5{position:relative; left:24%;}          
		span#salad6{position:relative; left:46%;} 
		
		
		
		span#fruit4,span#fruit5,span#fruit6,span#salad4,span#salad5,span#salad6{font-weight:bold;}
    
    
	    
		#myInput {	
		  background-image: url('https://www.w3schools.com/css/searchicon.png');
		  background-position: 200px 10px;
		  background-repeat: no-repeat;
		  width: 100%;
		  font-size: 16px;  
		  padding: 12px 400px 12px 400px;
		  border: 1px solid #ddd;
		  margin-bottom: 12px; 
		}  
		
		
		.slick-prev{
			left: 160px;
		    z-index: 1;
		}
		.slick-next{
			right: 160px;
		    z-index: 1;
		}
		
		.slide_divs img{
			margin: auto;
		}
		.slide_div_wraps{
			padding: 15px 0 15px 0;
		    background: #e6e9f6;
		}
		.image_wrap img{
			max-width: 85%;
		    height: auto;
		    display: block;
			margin: auto;    
		}
		
		
		.ls_wrap{
	    margin: 30px 0 30px 0;
	    padding: 0 10px 0 10px;
	    text-align:center;
	    color:#000000;
		}
		.best.cataName{
			text-align: center;
		    font-size: 13px;
		    color: #3e74ab;
		}
		.best.ratingAvge{
			text-align: center;
		    font-size: 13px;
		    color: #e15b6e;
		}
		.best.gdsName{
			text-align: center;
		    color: #333;
		    font-size: 15px;
		    font-weight: bold;
		}
		.best.gdsPrice{
			font-weight: bold;
			font-size: 26px;
			padding-bottom: 10px;
		}


	</style>
	

	     
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
  

</head>
<body> 


<div id = "root2">
	<header id = "header">
		<div id = "header_box">
			<%@ include file = "../include/header.jsp" %>	
		</div>  

	</header>
	

</div>  
<br><br><br><br>
<div id = "root3">
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="검색어를 입력해주세요....." title="Type in a name">

</div><br><br>
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
</div>
<br><br><br><br><br><br>
		<h2 class="bold">낮은가격순</h2>
<br><br>  
<a href="/shop/highPrice"><h5 id="b">높은가격순</h5></a>
<a href="/shop/best"><h5 id="b">베스트</h5></a> 
		
			
<div id = "root7">	 

<br>  
	<c:forEach items="${low }" var = "low">
	<a href = "/shop/view?n=${low.gdsNum}">
	<img src="${low.gdsImg }" class="rounded float-start set" alt="..."  style="width : 30%; margin-right:10px"  >
	</a>    
	<br>  	
	<a href = "/shop/view?n=${low.gdsNum}" ><span id = "sug">${low.gdsName }</span></a>
	<br>  
	<a href = "/shop/view?n=${low.gdsNum }"><span id = "sug4">${low.gdsPrice }원</span></a>
	<br> 	
	<span id = "sug4">평점:${low.ratingAvge}</span>
	<br>
	<span>카테고리 :${low.cateName }</span>
	<br><br><br><br><br><br><br>     
	</c:forEach> 
</div>  
 
	  
			
	<footer id ="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>
	</footer>
	
	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
      

</body>
</html>
