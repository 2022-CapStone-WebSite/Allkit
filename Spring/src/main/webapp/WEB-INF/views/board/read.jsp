<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<title>ALLKit 게시판</title>
<style>

	
		div#root { width:900px; margin:0 auto; height:auto;   }
		div#root2 { width:100%; margin:0 auto; }
		div#root3{display:inline-block; padding:0.5rem calc((100vw - 1000px) / 2);  } /* 패딩을 이용한 가운데 정렬 */ 

		  

		    
		  
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
		

       
       	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }  
		a { color:#05f; text-decoration:none; }
		a:hover { text-decoration:underline; }
		
		
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

</head>
<body>

	<!-- <div id="root"> -->
	<div id = "root2">
		<header> 
			<%@include file="../include/header.jsp"%>       
		</header>
 	 </div>   <br><br>
 	 
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
	
	
 	 
 	 
	<div class="container">



		<!--  <section id="container">-->
		<section>   

		<c:if test="${member != null }">
				<c:if test="${member.verify == 9}">
			<form role="form" method="post" autocomplete="off">
				<input type="hidden" id="page" name="page" value="${scri.page }"
					readonly="readonly " /> <input type="hidden" id="perPageNum"
					name="perPageNum" value="${scri.perPageNum }" readonly="readonly " />

				<input type="hidden" id="searchType" name="searchType"
					value="${scri.searchType }" readonly="readonly " /> <input
					type="hidden" id="keyword" name="keyword" value="${scri.keyword }"
					readonly="readonly " />

				<div class="form-group">
					<label for="bno" class="col-sm-2 control-label">글 번호 :
						${read.bno}</label><br />
				</div>
				
			<div class="form-group">
			&nbsp&nbsp&nbsp	<label class="control-label">작성 날짜</label> <span><fmt:formatDate
						value="${read.regDate}" pattern="yyyy-MM-dd" /></span>
			</div>
			 
			 
			

			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">글 제목</label> <input
					type="text" id="title" name="title" class="form-control"
					value="${read.title}" readonly="readonly" />
			</div>

			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">글 내용</label>
				<textarea id="content" name="content" class="form-control"
					style="resize: none; overflow: scroll; height: 200px"
					readonly="readonly">${read.content}</textarea>
			</div>

			<div class="form-group">
				<label for="writer" class="control-label">작성자</label> <input
					type="text" id="writer" name="writer" class="form-control"
					value="${read.writer}" readonly="readonly" />
			</div>



		  
			<p>
				 

				
						
  				<button type="button" id="list_btn" class="btn btn-black b">목록</button>
				<button type="button" id="modity_btn" class="btn b">수정</button>
				<button type="button" id="delete_btn" class="btn b">삭제</button>
					
					
		
				  
	  
			
				<hr/>   
				
 
			</form>
			</c:if>
		</c:if>
		
		
				<c:if test="${member == null }">
			<form role="form" method="post" autocomplete="off">
				<input type="hidden" id="page" name="page" value="${scri.page }"
					readonly="readonly " /> <input type="hidden" id="perPageNum"
					name="perPageNum" value="${scri.perPageNum }" readonly="readonly " />

				<input type="hidden" id="searchType" name="searchType"
					value="${scri.searchType }" readonly="readonly " /> <input
					type="hidden" id="keyword" name="keyword" value="${scri.keyword }"
					readonly="readonly " />

				<div class="form-group">
					<label for="bno" class="col-sm-2 control-label">글 번호 :
						${read.bno}</label><br />
				</div>
			
			<div class="form-group"><hr>
				&nbsp&nbsp&nbsp<label class="control-label">작성 날짜</label> <span><fmt:formatDate
						value="${read.regDate}" pattern="yyyy-MM-dd" /></span>
			</div>
			

			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">글 제목</label> <input
					type="text" id="title" name="title" class="form-control"
					value="${read.title}" readonly="readonly" />
			</div>

			<div class="form-group">
				<label for="content" class="col-sm-2 control-label">글 내용</label>
				<textarea id="content" name="content" class="form-control"
					style="resize: none; overflow: scroll; height: 200px"
					readonly="readonly">${read.content}</textarea>
			</div>

			<div class="form-group">
				<label for="writer" class="control-label">작성자</label> <input
					type="text" id="writer" name="writer" class="form-control"
					value="${read.writer}" readonly="readonly" />
			</div>
 
					
  				<button type="button" id="list_btn" class="btn btn-black b">목록</button>
		
				<hr/>   
			
 
			</form>
			</c:if>

		
		
		    

		
			
			
				<script>
					// 폼을 변수에 저장
					var formObj = $("form[role='form']");

					//목록 버튼 클릭
					$("#list_btn")
							.click(
									function() {
										self.location = "/board/listSearch?"
												+ "page=${scri.page}&perPageNum=${scri.perPageNum}"
												+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";

									});

					// 수정 버튼 클릭
					$("#modity_btn").click(function() {

						formObj.attr("action", "/board/modify");
						formObj.attr("method", "get");
						formObj.submit();

					});

					// 삭제 버튼 클릭
					$("#delete_btn").click(function() {

						formObj.attr("action", "/board/delete");
						formObj.attr("method", "get");
						formObj.submit();

					});
				</script>
			</p>
			
  
			
			 

			<!-- 게시물 끝 -->
			<div id="reply">
				<ol class="replyList">
					<c:forEach items="${repList}" var="repList">
						<li>
							<p>
								<span class="glyphicon glyphicon-user"></span> ${repList.writer}
								(
								<fmt:formatDate value="${repList.regDate}" pattern="yyyy-MM-dd" />
								)
							</p>

							<p class="bg-info">${repList.content}</p>
	
			<c:if test="${member != null}">
			
				<c:if test="${member.verify == 9}">
					
							<div class="form-group">
								<button type="button" class="replyUpdate btn btn-warning btn-xs b"
									data-rno="${repList.rno}">수정</button>
								<button type="button" class="replyDelete btn btn-danger btn-xs b"
									data-rno="${repList.rno}">삭제</button>
				</c:if>
			</c:if>

								<script>
									$(".replyUpdate")
											.click(
													function() {
														self.location = "/board/replyUpdate?bno=${read.bno}"
																+ "&page=${scri.page}"
																+ "&perPageNum=${scri.perPageNum}"
																+ "&searchType=${scri.searchType}"
																+ "&keyword=${scri.keyword}"
																+ "&rno="
																+ $(this)
																		.attr(
																				"data-rno");
													});

									$(".replyDelete")
											.click(
													function() {
														self.location = "/board/replyDelete?bno=${read.bno}"
																+ "&page=${scri.page}"
																+ "&perPageNum=${scri.perPageNum}"
																+ "&searchType=${scri.searchType}"
																+ "&keyword=${scri.keyword}"
																+ "&rno="
																+ $(this)
																		.attr(
																				"data-rno");
													});
								</script>
							</div>
						</li>
					</c:forEach>
				</ol>

				<!-- 댓글 작성하는 폼 -->
				<section class="replyForm">
					<form role="form" method="post" autocomplete="off">

						<input type="hidden" id="bno" name="bno" value="${read.bno}"
							readonly="readonly" /> <input type="hidden" id="page"
							name="page" value="${scri.page}" readonly="readonly" /> <input
							type="hidden" id="perPageNum" name="perPageNum"
							value="${scri.perPageNum}" readonly="readonly" /> <input
							type="hidden" id="searchType" name="searchType"
							value="${scri.searchType}" readonly="readonly" /> <input
							type="hidden" id="keyword" name="keyword" value="${scri.keyword}"
							readonly="readonly" />

						<div class="form-group">
							<label for="writer" class="col-sm-1 control-label">작성자</label>
							<div class="col-sm-11">
								<input type="text" id="writer" name="writer" value="${member.userName}"
									class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label for="content" class="col-sm-1 control-label">댓글 내용</label>
							<div class="col-sm-11">
								<textarea id="content" name="content" class="form-control"
									style="resize: none; overflow: scroll; height: 100px"></textarea>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2-col-sm-10">
								<button type="button" class="repSubmit btn  b">작성</button>
							</div>

							<script> 
								var formObj = $(".replyForm form[role='form']");

								$(".repSubmit").click(function() {
									formObj.attr("action", "replyWrite");
									formObj.submit();
								});
							</script>
						</div>
					</form>
				</section>
			</div>


		</section>

		<hr />

	</div>  
		<footer>
			<%@include file="/WEB-INF/views/include/footer2.jsp" %>  
		</footer> 
		
</body>
</html>