package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.SearchCriteria;
import com.spring.persistence.BoardDAO;

@Repository
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
	}
	
	//게시물 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override    
	public BoardVO read(int bno) throws Exception {
			dao.boardHit(bno);
		return dao.read(bno);  
	}
	
	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}
	
	//삭제
	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}
		
	//목록
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}
	
	//목록 + 페이징
	  @Override
	  public List<BoardVO> listPage(Criteria cri) throws Exception {
		  return dao.listPage(cri);
	  }
	  
	//게시물 총 갯수
	  public int listCount() throws Exception {
		  return dao.listCount();
	  }
	   
	//목록 + 페이징 + 검색
	  @Override
	  public List<BoardVO> listSearch(SearchCriteria scri) throws Exception {
		  return dao.listSearch(scri);
	  }
	  
	//검색 결과 갯수
	  @Override
	  public int countSearch(SearchCriteria scri) throws Exception {
		  return dao.countSearch(scri);
	  }
	
}
