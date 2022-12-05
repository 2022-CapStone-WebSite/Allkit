package com.spring.persistence;

import java.util.List;

import com.spring.domain.CartListVO;
import com.spring.domain.CartVO; 
import com.spring.domain.Criteria;
import com.spring.domain.GoodsVO;
import com.spring.domain.GoodsViewVO;
import com.spring.domain.OrderDetailVO;
import com.spring.domain.OrderListVO;
import com.spring.domain.OrderVO;
import com.spring.domain.ReplyListVO;
import com.spring.domain.ReplyVO;
import com.spring.domain.SearchCriteria;
import com.spring.domain.SelectVO;
import com.spring.domain.UpdateReplyVO;


public interface ShopDAO {
	
	//카테고리 상품 리스트 1차 분류
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception;
	
//	public List<GoodsViewVO> list(int cateCode, int cateCodeRef,Criteria cri) throws Exception;
	
	//카테고리 상품 리스트 2차분류
	public List<GoodsViewVO> list(int cateCode) throws Exception; 
	
//	public List<GoodsViewVO> list(int cateCode, Criteria cri) throws Exception; 

	
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
	
	//주문목록페이징
	public List<OrderVO> listPageOrder(Criteria cri) throws Exception;
	
	//주문목록갯수
	public int listCountOrder() throws Exception;
	
	//주문목록검색
	public List<OrderVO> listSearchOrder(SearchCriteria scri) throws Exception;
	  
	//검색 결과 갯수
	public int countSearchOrder(SearchCriteria scri) throws Exception;

	
	//특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	/* 평점 평균 구하기 */
	public Double getRatingAverage(int gdsNum);
	
	/* 평점 평균 반영하기 */
	public int updateRating(UpdateReplyVO vo);
	
	
	
	//평점순 상품 정보
	public List<SelectVO> likeSelect(); 
	
	//낮은가격순 상품 정보
	public List<SelectVO> lowPrice(); 
	
	//높은가격순 상품 정보
	public List<SelectVO> highPrice(); 
	   
        
	   
	  public int listcount() throws Exception;	    
	  public List<GoodsViewVO> listSearch(SearchCriteria scri) throws Exception;
	  public int countSearch(SearchCriteria scri) throws Exception;
	    

	  
	 
}
