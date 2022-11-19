package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.spring.domain.BReplyVO;
import com.spring.persistence.BReplyDAO;


@Repository
public class BReplyServiceImpl implements BReplyService {
	
	@Inject
	private BReplyDAO dao;
	
	//댓글조회
	@Override
	public List<BReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}
	
	//댓글작성
		@Override
		public void  writeReply(BReplyVO vo) throws Exception {
			dao.writeReply(vo);
		}
		
		//특정댓글조회
		@Override
		public BReplyVO readReplySelect(int rno) throws Exception {
			return dao.readReplySelect(rno);
		}
		
		//댓글수정
		@Override
		public void replyUpdate(BReplyVO vo) throws Exception {
			dao.replyUpdate(vo);
		}
		
		//댓글삭제
		public void replyDelete(BReplyVO vo) throws Exception {
			dao.replyDelete(vo);
		}
		

}
