<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>ALLKIT</title>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>




<link rel="stylesheet" href="/resources/css/user/shop/default.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />






<style>
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
</style>
  
 

<script>  

    function replyList(){
        var gdsNum = ${view.gdsNum};
        $.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
	
            var str = "";
            $(data).each(function(){
	            console.log(data);
                //날짜 데이터를 보기 쉽게 변환  

                var repDate = new Date(this.repDate);
                repDate = repDate.toLocaleDateString("ko-US")
				stars = "<span class=\"ratings\" data-rate=\"3\">";
				for(let i = 0; i< this.ratingAvg; i++){ // ratingAvg가 숫자가 아니면 parseInt 통해서 숫자로 변환
					stars += "<i class=\"fas fa-star\" style=\"color:#F05522\" ></i>";
				}  
				stars += "</div>";

                str += "<li data-repNum='" + this.repNum + "'>"
                    + "<div class='userInfo'>"
                    + "<span class='userName'>" + this.userName + " "
                    + "<span class='date'>" + repDate + " "
                    + "</div>" 
					+ "<span class='ratingAvg'>" + stars
                    + "<span class='ratingAvg'>" + this.ratingAvg 
					+ "</span>"  
					+ "</span>" 
                    + "<div class='replyContent'>" + this.repCon + "</div>"                   
                    + "<c:if test='${member != null}'>"                               
                    +"<div class='replyFotter'>"
                    +"<button type='button' class='modify' data-repNum='" + this.repNum +"'>수정</button>"
                    +"<button type='button' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
                    +"</div>"
                    + "</c:if>"  
                    + "</li>";            

            });
            $("section.replyList ol").html(str);
    });

	
}
</script>


</head>
<body>
	<div id="root2">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
	</div>
	<br>

	<div id="root">

		<br>
		<br>
		<br>
		<section id="container">
			<aside id="aside">
				<%@ include file="../include/aside.jsp"%>
			</aside>

			<aside id="aside">
				<%@ include file="/WEB-INF/views/include/aside2.jsp"%>
			</aside>

			<aside id="aside">
				<%@ include file="/WEB-INF/views/include/aside3.jsp"%>
			</aside>

			<aside id="aside">
				<%@ include file="/WEB-INF/views/include/aside4.jsp"%>
			</aside>

			<aside id="aside">
				<%@ include file="/WEB-INF/views/include/aside5.jsp"%>
			</aside>

			<br>
			<br>
			<br>
			<br>
		</section>
	</div>

	<div id="root2">
		<hr>
		<br>
	</div>
	<div id="root">
		<section id="container">
			<div id="container_box">

				<section id="content">

					<form role="form" method="post">
						<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
					</form>

					<div class="goods">
						<div class="goodsImg">
							<img src="${view.gdsImg}">
						</div>

						<div class="goodsInfo">
							<p class="gdsName">
								<span>상품명</span>${view.gdsName}</p>
							<hr>

							<p class="cateName">
								<span>카테고리</span>${view.cateName}</p>
							<hr>

							<p class="gdsPrice">
								<span>가격 </span>
								<fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
								원
							</p>
							<hr>

							<p class="gdsStock">
								<span>재고 </span>
								<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" />
								개
							</p>
							<hr>

							<c:if test="${view.gdsStock !=0 }">


								<p class="cartStock">
									<span>구입 수량 </span>
									<button type="button" class="plus">+</button>
									<input type="number" class="numBox" min="1"
										max="${view.gdsStock}" value="1" readonly="readonly" />
									<button type="button" class="minus">-</button>
								<hr>

								<!--+ 버튼을 누르면 수량이 증가하되, 상품의 전체 수량보다 커지지 않음  -->
								<script>
				    $(".plus").click(function(){
				     var num = $(".numBox").val();
				     var plusNum = Number(num) + 1;
				              
				     if(plusNum >= ${view.gdsStock}) {  
				      $(".numBox").val(num);  
				     } else {
				      $(".numBox").val(plusNum);            
				     }
				    });  
				    
				    $(".minus").click(function(){  
				     var num = $(".numBox").val();
				     var minusNum = Number(num) - 1;
				     
				     if(minusNum <= 0) {
				      $(".numBox").val(num);
				     } else {  
				      $(".numBox").val(minusNum);            
				     }  
				    });
				   </script>

								<!-- 	</p>   -->

								<p class="gdsKcal">
									<span>칼로리 </span>
									<fmt:formatNumber pattern="###,###,###" value="${view.gdsKcal}" />
									kcal
								</p>
								<hr>



								<p class="addToCart">
									<button type="button" class="addCart_btn">장바구니에 담기</button>
									<script>
				 		$(".addCart_btn").click(function(){
				 			var gdsNum = $("#gdsNum").val();
				 			var cartStock = $(".numBox").val();
				 			
				 			var data = {
				 					gdsNum : gdsNum,
				 					cartStock : cartStock
				 			};
				 			
				 			$.ajax({
				 				url : "/shop/view/addCart",
				 				type : "post",
				 				data : data,
				 				success : function(result){
				 					if(result == 1)
				 						{
				 						alert("카트에 담았습니다.");
					 					$(".numBox").val("1");	
				 						}else{
				 							alert("로그인 하세요")
				 							$(".numBox").val("1");
				 						}
				 					
				 				},
				 				error : function(){
				 					alert("카트 담기 실패");
				 				}
				 				
				 			});
				 		});  
				 	</script>

								</p>

							</c:if>

							<c:if test="${view.gdsStock == 0 }">
								<p>품절 되었습니다.</p>
							</c:if>

						</div>

						<div class="gdsDes">${view.gdsDes}</div>
					</div>

					<br>
					<br>




					<div id="reply">

						<c:if test="${member == null }">
							<p>
								댓글을 작성시<a href="/member/signin"> 로그인 </a> 을 해주세요
							</p>
						</c:if>

						<c:if test="${member != null }">


							<section class="replyForm">
								<form role="form" method="post" autocomplete="off" name="myform"
									id="myform">


									<input type="hidden" name="gdsNum" id="gdsNum"
										value="${view.gdsNum }">


									<h2>평점주기</h2>
									<div class="make_star">
										<select name="ratingAvg" id="ratingAvg">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
										</select>
										<div class="ratings" data-rate="3">
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i> <i class="fas fa-star"></i> <i
												class="fas fa-star"></i>
										</div>
									</div>





									<script>
							 
							$(function(){

								var rating = $('.review .rating');

								rating.each(function(){
										var targetScore = $(this).attr('data-rate');
									  console.log(targetScore);
										$(this).find('svg:nth-child(-n + ' + targetScore + ')').css({color:'#F05522'});

								});

								var userScore = $('#ratingAvg');
								userScore.change(function(){
									var userScoreNum = $(this).val();
									console.log(userScoreNum);
									$('.make_star svg').css({color:'#000'});
									$('.make_star svg:nth-child(-n + ' + userScoreNum + ')').css({color:'#F05522'});
									});
									
									$('.make_star svg').click(function(){
										var targetNum = $(this).index() + 1;
										console.log(targetNum);
										$('.make_star svg').css({color:'#000'});
									  $('.make_star svg:nth-child(-n + ' + targetNum + ')').css({color:'#F05522'});
										
									})
								});		 
							</script>
									<div class="input_area">
										<textarea name="repCon" id="repCon"></textarea>
									</div>

									<div class="input_area">

										<button type="button" id="reply_btn">작성</button>
											<script>
											   $("#reply_btn").click(function(){
											    
											    var formObj = $(".replyForm form[role='form']");
											    var gdsNum = $("#gdsNum").val();
											    var repCon = $("#repCon").val();
											   	var ratingAvg = $("#ratingAvg").val()					   
											    
											    var data = {
											      gdsNum : gdsNum,
											      repCon : repCon,
											      ratingAvg : ratingAvg							    
											      };
											    
											    $.ajax({
											     url : "/shop/view/registReply",
											     type : "post",
											     data : data,
											     success : function(){
											      replyList(); 
											      $("#repCon").val("");
				
											     }
											    });
											   });
										</script>

									</div>
								</form>

							</section>

						</c:if>


						<section class="replyList">
							<ol>

							</ol>

							<script>
	
						  	replyList();
						  </script>

							<script>
						   $(document).on("click", ".modify", function(){
							 /* $(".replyModal").attr("style", "display:block;");  */
							 $(".replyModal").fadeIn(200);
							 
							 var repNum = $(this).attr("data-repNum");
							 var repCon = $(this).parent().parent().children(".replyContent");
 
							 
							 $(".modal_repCon").val(repCon);
		
							 $(".modal_modify_btn").attr("data-repNum", repNum);
							 
						   });
						  
						   $(document).on("click", ".delete", function(){
						    
							var deletConfirm = confirm("삭제 하시겠습니까?");
							
							if(deletConfirm){
								/* gdsNum 이 없을경우 어떤 댓글삭제시 어떤 상품인지를 알 수가 없다.*/
								var gdsNum = $("#gdsNum").val();
								var data = {repNum : $(this).attr("data-repNum"),
											gdsNum : gdsNum			
								};  
							     
							    $.ajax({ 
							     url : "/shop/view/deleteReply",
							     type : "post",
							     data : data,
							     success : function(result){
							       if(result == 1){
							    	   replyList();
							       }else{
							    	   alert("작성자 본인만 삭제 가능합니다.")
							       } 
							     },
							     error : function(){
							    	 alert("로그인 해주세요")  
							     }
							    });
							}
						    
						   });
						 
						</script>


						</section>

					</div>

				</section>

			</div>
		</section>



	</div>

	<div class="replyModal">

		<div class="modalContent">

			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>

			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancel">취소</button>
			</div>

		</div>

		<div class="modalBackground"></div>

	</div>

	<script>
$(".modal_cancel").click(function(){
	/* $(".replyModal").attr("style","display:none;"); */
	$(".replyModal").fadeOut(200);
});
</script>

	<script>
$(".modal_modify_btn").click(function(){
	   var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	   
	   if(modifyConfirm) {
	    var data = {
	       repNum : $(this).attr("data-repNum"),
	       repCon : $(".modal_repCon").val()
	      };  // ReplyVO 형태로 데이터 생성
	    
	    $.ajax({
	     url : "/shop/view/modifyReply",
	     type : "post",
	     data : data,
	     success : function(result){
	      
	      if(result == 1) {
	       replyList();
	       $(".replyModal").fadeOut(200);
	      } else {
	       alert("작성자 본인만 할 수 있습니다.");         
	      }
	     },
	     error : function(){
	      alert("로그인하셔야합니다.")
	     }
	    });
	   }
	   
	});

</script>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>     
  
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
</body>
</html>
