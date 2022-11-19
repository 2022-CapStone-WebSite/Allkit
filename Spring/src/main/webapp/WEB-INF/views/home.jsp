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
		 
		span#salad5{position:relative; left:25%;}    
		span#salad6{position:relative; left:50%;} 
		
		
		
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


    
	</style>
	

	     
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	

    

</head>
<body> 


<div id = "root2">
	<header id = "header">
		<div id = "header_box">
			<%@ include file = "include/header.jsp" %>	
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



<div id = "root2">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" >
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	    </ol>  
	
	    <!-- Wrapper for slides -->   
	    <div class="carousel-inner">       
	      <div class="item active">    
	       <a href="/shop/list?c=101&l=2"><img class="imgsize" src="../resources/images/one.PNG" alt="Los Angeles" style="width:100%; height:200px;"></a>
	      </div>
	  
	      <div class="item">    
	        <a href="/shop/list?c=300&l=1"><img class="imgsize" src="../resources/images/two.png" alt="Chicago" style="width:100%; height:200px;"></a>
	      </div>
	        
	      <div class="item">   
	        <a href="/shop/list?c=200&l=1"><img class="imgsize" src="../resources/images/three.png" alt="New york" style="width:100%; height:200px;"></a>
	      </div>
	    </div>  
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right"></span>
	      <span class="sr-only">Next</span>
	    </a>
  </div> 

</div>

<br><br><br><br><br><br>

 

		<h2 class="bold">이 상품 어때요?</h2>
		<h4 class="bold" style="color:gray">조리 간편 및 추천 상품</h4>

<div id = "root">	 

<br>
	
	<a href = "/"><img src="../resources/images/chicken breast.jpg" class="rounded float-start set" alt="..."  style="width : 30%; margin-right:10px"  ></a>  

	<a href = "/shop/view?n=45"><img src="../resources/images/cows.png"  class="rounded mx-auto d-block" alt="..." style="width : 30%; margin-right:10px">   </a>  
  
	<a href = "/"><img src="../resources/images/duck.jpg" class="rounded float-end" alt="..." style="width : 30%; margin-right:10px"> </a>
	<br><br> 
	<a href = "/"><span id = "sug">[올킷]마늘닭가슴살</span></a>
	<a href = "/shop/view?n=45"><span id = "sug2">[올킷]마늘맛소고기</span></a>
	<a href = "/"><span id = "sug3">[올킷]마늘맛오리</span></a>
	<br> 
	<a href = "/"><span id = "sug4">1300원</span></a>
	<a href = "/shop/view?n=45"><span id = "sug5">12000원</span></a>
	<a href = "/"><span id = "sug6">8000원</span></a>
    
	<br><br><br><br><br><br><br><br>  
</div>  

 	
 	<h2 class="bold">3분 요리 </h2>
	<h4 class="bold" style="color:gray">집에서 간편하게 먹을 수 잇는 제품</h4>
 	<br><br>
 
 <div id = "root">
						
	
	
	<a href="/"><img src="../resources/images/easyfood1.jpg" class="rounded float-start" alt="..."  style="width : 30%; margin-right:10px" ></a>
	<a href="/"><img src="../resources/images/easyfood2.jpg"  class="rounded mx-auto d-block" alt="..." style="width : 30%; margin-right:10px" ></a>
	<a href="/"><img src="../resources/images/package.png" class="rounded float-end" alt="..." style="width : 30%; margin-right:10px" ></a>


	<br><br> 
	<a href="/"> <span id = "min">[올킷]간편조리세트</span></a>
	<a href="/"> <span id = "min2">[올킷]간편카레세트</span></a>  
	<a href="/"> <span id = "min3">[올킷]간편양념세트</span></a>
	<br>
	<a href="/"> <span id = "min4">20000원</span></a>
	<a href="/"> <span id = "min5">25000원</span></a>
	<a href="/"> <span id = "min6">27000원</span></a>
	  

	
	<br><br><br><br><br><br><br><br><br><br><br><br>
</div>
	
	<h2 class="bold">과일 및 샐러드 코너 </h2>
	<h4 class="bold" style="color:gray">간단히 물로만 씻으면 끝</h4>
 	<br><br>
 	
	 
<div id = "root">	    
	<a href="/"><img src="../resources/images/fruit.jpg" class="rounded float-start" alt="..."  style="width : 30%; margin-right:10px" ></a>
	<a href="/"><img src="../resources/images/fruit2.png"  class="rounded mx-auto d-block" alt="..." style="width : 30%; margin-right:10px" ></a>
	<a href="/"><img src="../resources/images/fruit3.jpg" class="rounded float-end" alt="..." style="width : 30%; margin-right:10px" ></a>

	<br><br>   
	 <a href="/"><span id = "fruit">[올킷]과일세트1번</span></a>
	 <a href="/"><span id = "fruit2">[올킷]과일세트2번</span></a>
	 <a href="/"><span id = "fruit3">[올킷]과일세트3번</span></a>
	
	<br>
	
	 <a href="/"><span id = "fruit4">39000원</span></a>
	 <a href="/"><span id = "fruit5">42000원</span></a>
	 <a href="/"><span id = "fruit6">33000원</span></a>
	
	
	<br><br><br><br>  
	
	  
	<a href="/"><img src="../resources/images/salad.jpg" class="rounded float-start" alt="..."  style="width : 30%; margin-right:10px;" >1</a>
	<a href="/shop/view?n=49"><img src="../resources/images/salad2.jpg"  class="rounded mx-auto d-block" alt="..." style="width : 30%; margin-right:10px;" >2</a>
	<a href="/"><img src="../resources/images/salad3.png" class="rounded float-end" alt="..." style="width : 30%; margin-right:10px;"  >3</a>
	  
		<br><br>   
		
	 <a href="/"><span id = "salad">[올킷]양상추샐러드</span></a>
	 <a href="/shop/view?n=49"><span id = "salad2">[올킷]소불고기샐러드</span></a>
	 <a href="/"><span id = "salad3">[올킷]콩볶음샐러드</span></a>
	
	<br>
	
	 <a href="/"><span id = "salad4">5000원</span></a>
	 <a href="/shop/view?n=49"><span id = "salad5">6000원</span></a>
	 <a href="/"><span id = "salad6">7000원</span></a>

		
		 
 	<section id="container">
		<div id="container_box">
			
			<section id="content">

			</section>
		 
		</div>
	</section>
	



	
</div>





	<footer id ="footer">
		<div id="footer_box">
			<%@ include file="include/footer.jsp" %>
		</div>
	</footer>
</body>
</html>
