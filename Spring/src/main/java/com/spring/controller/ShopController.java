package com.spring.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;  

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.CartListVO;
import com.spring.domain.CartVO;
import com.spring.domain.Criteria;  
import com.spring.domain.GoodsVO;
import com.spring.domain.GoodsViewVO;
import com.spring.domain.MemberVO;
import com.spring.domain.OrderDetailVO;
import com.spring.domain.OrderListVO;
import com.spring.domain.OrderVO;
import com.spring.domain.PageMaker;
import com.spring.domain.ReplyListVO;
import com.spring.domain.ReplyVO;
import com.spring.domain.SearchCriteria;
import com.spring.domain.SelectVO;
import com.spring.service.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Inject
	ShopService service; 
	        
	//베스트 상품
	@RequestMapping(value = "/best", method = RequestMethod.GET)
	public void getbest(Model model) throws Exception {
		logger.info("get best"); 
		model.addAttribute("best",service.likeSelect()); 
  
	} 
	   
	//낮은가격순 상품
	@RequestMapping(value = "/lowPrice", method = RequestMethod.GET)
	public void getlow(Model model) throws Exception {
		logger.info("get low"); 
  
		model.addAttribute("low",service.lowPrice());
	} 
	
	//높은가격순 상품
	@RequestMapping(value = "/highPrice", method = RequestMethod.GET)
	public void gethigh(Model model) throws Exception {
		logger.info("get high"); 
  
		model.addAttribute("high",service.highPrice());
	} 
	
	
	
	//신상품(야매)
	@RequestMapping(value = "/newProduct", method = RequestMethod.GET)
	public void getProduct(Model model) throws Exception {
		logger.info("get Product");
	  
	}  
	
	//고객센터(야매)
	@RequestMapping(value = "/serviceCenter", method = RequestMethod.GET)
	public void getCenter(Model model) throws Exception {
		logger.info("get service");
	   
	}    

	//카테고리별 상품리스트 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int cateCode,
						@RequestParam("l") int level,
						Model model) throws Exception {
		logger.info("get list");
		
		List<GoodsViewVO> list = null;
		list = service.list(cateCode,level);     
   		 
		model.addAttribute("list", list);
  
		  
	} 
	//상품 조회 
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int gdsNum, Model model) throws Exception {
		logger.info("get view");
		
		GoodsViewVO view = service.goodsView(gdsNum);
		model.addAttribute("view", view);
		
//		List<ReplyListVO> reply = service.replyList(gdsNum);
//		model.addAttribute("reply",reply);   
	}
	
	//상품 댓글 작성
//	@RequestMapping(value = "/view", method = RequestMethod.POST)
//	public String registReply(ReplyVO reply, HttpSession session) throws Exception{
//		logger.info("regist reply");
//		
//		MemberVO member = (MemberVO)session.getAttribute("member");
//		reply.setUserId(member.getUserId());
//		
//		service.registReply(reply);
//		
//		return "redirect:/shop/view?n=" + reply.getGdsNum();
//	}
	
	// 상품 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
	public void registReply(ReplyVO reply,HttpSession session,Model model) throws Exception {
	   logger.info("regist reply");
	   
	   MemberVO member = (MemberVO)session.getAttribute("member");
	   reply.setUserId(member.getUserId());	     
	   service.registReply(reply);
	}   
	
	//상품 소감(댓글) 목록
	@ResponseBody
	@RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) throws Exception{
		logger.info("get reply list");
		
		List<ReplyListVO> reply = service.replyList(gdsNum);
		
		return reply;
		
	}
					
	
	// 상품 소감(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyVO reply, HttpSession session) throws Exception{
		logger.info("post delete reply");
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = service.idCheck(reply.getRepNum());
		
		if(member.getUserId().contentEquals(userId)) {
			reply.setUserId(member.getUserId());
			service.deleteReply(reply);
			
			result = 1;
		}
		
		return result;
	}
	
	//상품 댓글 수정
	@ResponseBody
	@RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyVO reply, HttpSession session) throws Exception{
		logger.info("modify reply");
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = service.idCheck(reply.getRepNum());
		
		if(member.getUserId().equals(userId)){	
			reply.setUserId(member.getUserId());
			service.modifyReply(reply);
			result = 1;		
		}
		return result;
	}
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartListVO cart, HttpSession session) throws Exception {
	   
	   int result = 0;
	   
	   MemberVO member = (MemberVO)session.getAttribute("member");
	   
	   if(member != null) {
	    cart.setUserId(member.getUserId());
	    service.addCart(cart);
	    result = 1;
	   }
	   
	   return result;
	}
	
	//카트 목록
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception{
		logger.info("get cart list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		List<CartListVO> cartList = service.cartList(userId);
		
		model.addAttribute("cartList",cartList);
	}  
	
	//카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]")
							List<String> chArr, CartVO cart) throws Exception{
		logger.info("delete cart");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		int result = 0;
		int cartNum = 0;
		
		if(member != null) {
			cart.setUserId(userId);
			
			for(String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);  
				service.deleteCart(cart);
			}
			result = 1;
		}
		
		return result;
	}
	
	// 주문
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
	 logger.info("order");
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");  
	 String userId = member.getUserId();
	 
	 Calendar cal = Calendar.getInstance();
	 int year = cal.get(Calendar.YEAR);
	 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
	 String subNum = "";
	 
	 for(int i = 1; i <= 6; i ++) {
	  subNum += (int)(Math.random() * 10);
	 }
	 
	 String orderId = ymd + "_" + subNum;
	 
	 order.setOrderId(orderId);
	 order.setUserId(userId);
	  
	 service.orderInfo(order);
	 
	 orderDetail.setOrderId(orderId);   
	 service.orderInfo_Details(orderDetail);
	 
	 service.cartAllDelete(userId);
	 
	 return "redirect:/shop/orderList";  
	}
	
	//주문 목록
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception{
		logger.info("get order list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		
		List<OrderVO> orderList = service.orderList(order);
		
		model.addAttribute("orderList",orderList);
	}
	
	//주문 목록 + 페이징
	@RequestMapping(value = "/listPageOrder", method = RequestMethod.GET)
	public void listPageOrder(@ModelAttribute("cri") Criteria cri, HttpSession session,OrderVO order, Model model) throws Exception{
		logger.info("get listPageOrder");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		
		List<OrderVO> listPageOrder = service.listPageOrder(cri);
		model.addAttribute("listPageOrder", listPageOrder);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountOrder());
		model.addAttribute("pageMaker",pageMaker);
	}
	
	
	//주문 목록 + 페이징 + 검색
	@RequestMapping(value = "/listSearchOrder", method = RequestMethod.GET)
	public void listSearchOrder(@ModelAttribute("scri") SearchCriteria scri, HttpSession session,OrderVO order, Model model,
								@RequestParam(value = "searchType", required = false, defaultValue = "t") String searchType,
								@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
								) throws Exception{
		logger.info("get listSearchOrder");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		
		List<OrderVO> listSearchOrder = service.listSearchOrder(scri);
		model.addAttribute("listSearchOrder", listSearchOrder);
		
		PageMaker pageMaker = new PageMaker();
		
		scri.setSearchTypeKeyword(searchType, keyword);
		
		pageMaker.setCri(scri);
     	pageMaker.setTotalCount(service.countSearchOrder(scri)); 
		model.addAttribute("pageMaker",pageMaker);
	}
	

	
	//주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, @RequestParam("n") String orderId,
							OrderVO order, Model model) throws Exception{
		
		logger.info("get order View");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		 
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView",orderView);
	}
	

	
	
	 
	
	
	// 게시물 목록 + 페이징 추가
//	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
//	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
//	 
//	 // 게시물 총 갯수  
//	 int count = service.count();
//	  
//	 // 한 페이지에 출력할 게시물 갯수    
//	 int postNum = 3;      
//	  
//	 // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
//	 int pageNum = (int)Math.ceil((double)count/postNum);
//	  
//	 // 출력할 게시물 
//	 int displayPost = (num - 1) * postNum;
//	 
//	 
//	// 한번에 표시할 페이징 번호의 갯수 
//	 int pageNum_cnt = 5;
//
//	 // 표시되는 페이지 번호 중 마지막 번호
//	 int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
//
//	 // 표시되는 페이지 번호 중 첫번째 번호
//	 int startPageNum = endPageNum - (pageNum_cnt - 1);
//	 
//	// 마지막 번호 재계산
//	 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
//	  
//	 if(endPageNum > endPageNum_tmp) {
//	  endPageNum = endPageNum_tmp;
//	 }
//	 
//	 boolean prev = startPageNum == 1 ? false : true;
//	 boolean next = endPageNum * pageNum_cnt >= count ? false : true;
//	 
//	 
//	    
//	 List list = null; 
//	 list = service.listPage(displayPost, postNum);
//	 model.addAttribute("list", list);   
//	 model.addAttribute("pageNum", pageNum);
//	 
//	// 시작 및 끝 번호
//	 model.addAttribute("startPageNum", startPageNum);
//	 model.addAttribute("endPageNum", endPageNum);
//
//	 // 이전 및 다음 
//	 model.addAttribute("prev", prev);
//	 model.addAttribute("next", next);
//	 
//	// 현재 페이지
//	 model.addAttribute("select", num);
//	 
//	 
//	   
//	}  
	  
	

	 
	
	// 글 목록 + 페이징
//	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
//	public void getlistPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
//	 logger.info("get list page");   
//	   
//	 List<GoodsViewVO> listPage = service.listPage(cri);
//  
//  
//	 model.addAttribute("listPage", listPage);
//	 
//	 PageMaker pageMaker = new PageMaker();
//	 pageMaker.setCri(cri);
//	 pageMaker.setTotalCount(service.listcount());    
//	 model.addAttribute("pageMaker", pageMaker);
//  
// 
//	}
	
	
  
	  
}
