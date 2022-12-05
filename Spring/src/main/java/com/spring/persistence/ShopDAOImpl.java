package com.spring.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

  
@Repository
public class ShopDAOImpl implements ShopDAO {
	  

	@Inject
	private SqlSession sql; 
	

	
	
	//매퍼
	private static String namespace = "com.spring.mappers.shopMapper";
	
	
	//카테고리 상품 리스트 1차 분류
	@Override 
	public List<GoodsViewVO> list(int cateCode, int cateCodeRef) throws Exception{
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef);
	
	  
		
		return sql.selectList(namespace + ".list_1" , map);  
	}  
	
	
//	@Override 
//	public List<GoodsViewVO> list(int cateCode, int cateCodeRef,Criteria cri) throws Exception{
//	
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("cateCode", cateCode);
//		map.put("cateCodeRef", cateCodeRef);
//		map.put("cri",cri);  
//	
//	   
//		 
//		return sql.selectList(namespace + ".list_1" , map);  
//	}
	
	
	
	
	//카테고리 상품 리스트 2차분류
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception{

		   
		return sql.selectList(namespace + ".list_2", cateCode);  
	}
	   
	
//	@Override
//	public List<GoodsViewVO> list(int cateCode,Criteria cri) throws Exception{
//
//		HashMap<String, Object> maps = new HashMap<String, Object>();
//		
//		maps.put("cateCode", cateCode);
//		maps.put("cri",cri);    
//		
//		return sql.selectList(namespace + ".list_2", maps);  
//	}
	  
	
	//상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception{
		return sql.selectOne("com.spring.mappers.adminMapper"
				+ ".goodsView", gdsNum);  
	}
	
	//상품 댓글 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception{
		
	
		sql.insert(namespace + ".registReply", reply);  
	
	} 
	 
	//상품 댓글 목록
	@Override
	public List<ReplyListVO> replyList(int gdsNum) throws Exception{
		return sql.selectList(namespace + ".replyList", gdsNum);  
	}
	
	//상품 댓글 삭제
	@Override
	public void deleteReply(ReplyVO reply) throws Exception{
		sql.delete(namespace + ".deleteReply", reply);
	
	}
	
	//아이디 체크
	@Override
	public String idCheck(int repNum) throws Exception{
		return sql.selectOne(namespace + ".replyUserIdCheck", repNum);
	}
	
	//상품 댓글 수정
	@Override
	public void modifyReply(ReplyVO reply) throws Exception{
		sql.update(namespace + ".modifyReply", reply);
	}

	//카트 담기   
	@Override  
	public void addCart(CartListVO cart) throws Exception{
		sql.insert(namespace + ".addCart", cart);
	}
	
	//카트 리스트
	@Override
	public List<CartListVO> cartList(String userId) throws Exception{
		return sql.selectList(namespace + ".cartList", userId);
	}
	
	//카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception{
		sql.delete(namespace + ".deleteCart", cart);
	}
	
	//주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception{
		
		sql.insert(namespace + ".orderInfo", order);
	}
	//주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception{
		sql.insert(namespace + ".orderInfo_Details", orderDetail);
		
	}
	
	//카트 비우기 
	@Override
	public void cartAllDelete(String userId) throws Exception{
		sql.delete(namespace + ".cartAllDelete",userId);  
	}
	
	//주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception{
		return sql.selectList(namespace + ".orderList", order);
	}
	
	//주문목록페이징
	@Override
	public List<OrderVO> listPageOrder(Criteria cri) throws Exception{
		return sql.selectList(namespace + ".listPageOrder",cri);
	}
	
	//주문목록갯수
	@Override
	public int listCountOrder() throws Exception{
		return sql.selectOne(namespace + ".listCountOrder");
	}
	
	//주문목록검색
	@Override
	public List<OrderVO> listSearchOrder(SearchCriteria scri) throws Exception{
		return sql.selectList(namespace +".listSearchOrder", scri);
	}
	  
	//검색 결과 갯수
	public int countSearchOrder(SearchCriteria scri) throws Exception{
		return sql.selectOne(namespace + ".countSearchOrder",scri);
	}
		
	
	//특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception{
		return sql.selectList(namespace + ".orderView", order);
	}
	
	  
	
	/*
	 * @Override public int count() throws Exception{ return sql.selectOne(namespace
	 * + ".count"); }
	 * 
	 * 
	 * @Override public List<GoodsViewVO> listPage(int displayPost, int postNum)
	 * throws Exception {
	 * 
	 * HashMap<String, Integer> data = new HashMap<String, Integer>();
	 * 
	 * data.put("displayPost", displayPost); data.put("postNum", postNum);
	 * 
	 * return sql.selectList(namespace + ".listPage", data); }
	 */
	 
	
	
	

	    
	 
	@Override 
	public int listcount() throws Exception{
		return sql.selectOne(namespace + ".listCount");    
	}
	    
	     
	@Override
	  public List<GoodsViewVO> listSearch(SearchCriteria scri) throws Exception{
		return sql.selectList(namespace + ".listSearch", scri);
	}
	  
	@Override
	  public int countSearch(SearchCriteria scri) throws Exception{
		return sql.selectOne(namespace + ".countSearch", scri);
	}
	

	
	/* 평점 평균 구하기 */
	public Double getRatingAverage(int gdsNum) {
		return sql.selectOne(namespace + ".getRatingAverage", gdsNum);
		
	}
	
	/* 평점 평균 반영하기 */
	public int updateRating(UpdateReplyVO vo) {
		return sql.update(namespace + ".updateRating", vo);  
		
	}
	
	
   
	//평점순 상품 정보
	@Override
	public List<SelectVO> likeSelect(){
		return sql.selectList(namespace + ".likeSelect");     
	}
	
	//낮은가격순 상품 정보
	@Override
	public List<SelectVO> lowPrice(){
		return sql.selectList(namespace + ".lowPrice");     
	}
	
	//높은가격순 상품 정보
	@Override
	public List<SelectVO> highPrice(){
		return sql.selectList(namespace + ".highPrice");     
	}
	   
	       
	 

	
	
	
	
  
	
}
