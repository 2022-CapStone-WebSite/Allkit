package com.spring.service;

import java.util.List;

import com.spring.domain.BReplyVO;

public interface BReplyService {
	
	
	// 댓글조회
	public List<BReplyVO> readReply(int bno) throws Exception;
 
	// 댓글작성
	public void writeReply(BReplyVO vo) throws Exception;

	// 특정 댓글 조회
	public BReplyVO readReplySelect(int rno) throws Exception;

	// 댓글 수정
	public void replyUpdate(BReplyVO vo) throws Exception;

	// 댓글 삭제
	public void replyDelete(BReplyVO vo) throws Exception;  

}
