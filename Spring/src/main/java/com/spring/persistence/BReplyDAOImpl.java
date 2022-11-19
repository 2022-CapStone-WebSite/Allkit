package com.spring.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.domain.BReplyVO;

@Repository
public class BReplyDAOImpl implements BReplyDAO {

	//마이바티스
		@Inject
		private SqlSession sql;
		  
		//매퍼
		private static String namespace = "com.spring.mappers.replyMapper";
		
		//댓글 조회
		@Override
		public List<BReplyVO> readReply(int bno) throws Exception {
			return sql.selectList(namespace + ".readReply", bno);
		}
		
		//댓글작성
		@Override
		public void  writeReply(BReplyVO vo) throws Exception {
			sql.insert(namespace + ".writeReply", vo);
		}
		
		//특정댓글조회
		@Override
		public BReplyVO readReplySelect(int rno) throws Exception {
			return sql.selectOne(namespace + ".readReplySelect", rno);
		}
		
		//댓글수정
		@Override
		public void replyUpdate(BReplyVO vo) throws Exception {
			sql.update(namespace + ".updateReply", vo);
		}
		
		//댓글삭제
		public void replyDelete(BReplyVO vo) throws Exception {
			sql.delete(namespace + ".deleteReply", vo);
		}
		
		
}
