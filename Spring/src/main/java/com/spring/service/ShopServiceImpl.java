package com.spring.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.spring.domain.CartListVO;
import com.spring.domain.CartVO;
import com.spring.domain.GoodsViewVO;
import com.spring.domain.MemberVO;
import com.spring.domain.OrderDetailVO;
import com.spring.domain.OrderListVO;
import com.spring.domain.OrderVO;
import com.spring.domain.ReplyListVO;
import com.spring.domain.ReplyVO;
import com.spring.persistence.MemberDAO;
import com.spring.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {
	   
	@Inject
	private ShopDAO dao;
	   
	//카테고리별 상품 리스트
	public List<GoodsViewVO> list(int cateCode, int level) throws Exception{
		int cateCodeRef = 0;
		
		if(level == 1) {
			
			cateCodeRef = cateCode;
			return dao.list(cateCode,cateCodeRef);
		}else
		{
			return dao.list(cateCode);
		}
	}
	
	//상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return dao.goodsView(gdsNum);  
	}
 
	//상품 댓글 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception{
		dao.registReply(reply);  
	}
	
	//상품 댓글 목록
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return dao.replyList(gdsNum);   
	}
	
	//상품 댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception{
		dao.deleteReply(reply);
	}
	
	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception{
		return dao.idCheck(repNum);
	}
	
	//상품 댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception{
		dao.modifyReply(reply);
	}
	  
	//카트 담기
	@Override
	public void addCart(CartListVO cart) throws Exception{
		dao.addCart(cart);  
	}
	
	//카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception{
		return dao.cartList(userId);
	}
	
	//카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception{
		dao.deleteCart(cart);
	}
	
	//주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception{
			
		dao.orderInfo(order);
	}
	//주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception{
		dao.orderInfo_Details(orderDetail);
			
	}
		
	//카트 비우기 
	@Override
	public void cartAllDelete(String userId) throws Exception{
		dao.cartAllDelete(userId);
	}
	
	//주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception{
		return dao.orderList(order);
	}
	
	//특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return dao.orderView(order);
	}
	
		
}
