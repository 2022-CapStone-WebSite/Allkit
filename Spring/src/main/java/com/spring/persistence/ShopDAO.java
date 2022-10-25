package com.spring.persistence;

import java.util.List;

import com.spring.domain.CartListVO;
import com.spring.domain.CartVO;
import com.spring.domain.GoodsViewVO;
import com.spring.domain.OrderDetailVO;
import com.spring.domain.OrderListVO;
import com.spring.domain.OrderVO;
import com.spring.domain.ReplyListVO;
import com.spring.domain.ReplyVO;

public interface ShopDAO {
	
	//카테고리 상품 리스트 1차 분류
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;
	
	//카테고리 상품 리스트 2차분류
	public List<GoodsViewVO> list(int cateCode) throws Exception;

	
	//상품 조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	 
	//상품 댓글 작성
	public void registReply(ReplyVO reply) throws Exception;
	
	//상품 댓글 목록
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//상품 댓글 삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	//아이디 체크
	public String idCheck(int repNum) throws Exception;
	
	 
	//상품 댓글 수정
	public void modifyReply(ReplyVO reply) throws Exception;
	  
	//카트 담기
	public void addCart(CartListVO cart) throws Exception;
	
	//카트 리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	
	//카트 삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//주문 정보
	public void orderInfo(OrderVO order) throws Exception;
	//주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
	
	//카트 비우기 
	public void cartAllDelete(String userId) throws Exception;
	
	//주문 목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;
	
	//특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

}
