package com.spring.controller;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.domain.PageMaker;
import com.spring.domain.BReplyVO;
import com.spring.domain.SearchCriteria;
import com.spring.service.BoardService;
import com.spring.service.BReplyService;  

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	BoardService service;

	@Inject
	BReplyService RepService;

	// 글 작성 get
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite(HttpSession session, Model model) throws Exception {
		logger.info("get write");
		
//		Object loginInfo = session.getAttribute("member");
//		
//		if(loginInfo == null) {
//			model.addAttribute("msg", "login_error");
//		}
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member == null) {
			model.addAttribute("msg", "login_error");
		}
	}

	// 글 작성 post
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo, HttpSession session,Model model) throws Exception {
		logger.info("post write");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		

		vo.setUserId(member.getUserId());	
		service.write(vo); 
		
		
		return "redirect:/board/listSearch";
	}

	// 글 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info("get list");

		List<BoardVO> list = service.list();
		model.addAttribute("list", list);
	}

	// 글 조회
// @RequestMapping(value = "/read", method = RequestMethod.GET)
// public void getRead(@RequestParam("bno") int bno, Model model) throws Exception {
//  logger.info("get read");
//  
//  BoardVO vo = service.read(bno);
//  
//  model.addAttribute("read", vo);
// }
	
	// 글 수 정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(HttpSession session,@RequestParam("bno") int bno,Model model)
			throws Exception {
		logger.info("get modify");

		
//		Object loginInfo = session.getAttribute("member"); 
//		
//		if(loginInfo == null) {
//			model.addAttribute("msg", "login_error");
//		}
//	
//	    
//			BoardVO vo = service.read(bno);  
//			model.addAttribute("modify", vo);
	  

		BoardVO vo = service.read(bno);  

		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = service.idCheck(vo.getBno());
		
		if(member == null) {
			model.addAttribute("msg","login_error");
		}
		model.addAttribute("modify", vo);
		
		
	}
	
	// 글 수정 POST 

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo, HttpSession session, @ModelAttribute("scri") SearchCriteria scri,
							RedirectAttributes rttr) throws Exception {
		logger.info("post modify"); 
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = service.idCheck(vo.getBno());
		
		if(member.getUserId().equals(userId)){	
			vo.setUserId(member.getUserId());
			service.update(vo);
		}
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/board/listSearch";
		
//		service.update(vo);
//
//		rttr.addAttribute("page", scri.getPage());
//		rttr.addAttribute("perPageNum", scri.getPerPageNum());
//		rttr.addAttribute("searchType", scri.getSearchType());
//		rttr.addAttribute("keyword", scri.getKeyword());
//
//		return "redirect:/board/listSearch";
		
		
	} 
	

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("get delete");

		model.addAttribute("delete", bno);
		model.addAttribute("scri", scri);

	}
	


	// 글 삭제 POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(BoardVO vo,HttpSession session,@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {
		logger.info("post delete");

		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = service.idCheck(vo.getBno());
		
		if(member.getUserId().equals(userId)) {
			vo.setUserId(member.getUserId());
			service.delete(vo);  
		}
		


		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/listSearch";
	}
	

	// 글 목록 + 페이징
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("get list page");

		List<BoardVO> list = service.listPage(cri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}

	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public void listSearch(@ModelAttribute("scri") SearchCriteria scri, Model model,
			@RequestParam(value = "searchType", required = false, defaultValue = "t") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
			) throws Exception {
		logger.info("get list search");

		List<BoardVO> list = service.listSearch(scri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		
		scri.setSearchTypeKeyword(searchType, keyword);
		
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countSearch(scri));
		model.addAttribute("pageMaker", pageMaker);
	}  

	// 글 조회
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void getRead(@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("get read");

		BoardVO vo = service.read(bno);
		model.addAttribute("read", vo);
		model.addAttribute("scri", scri);  

		List<BReplyVO> repList = RepService.readReply(bno);
		model.addAttribute("repList", repList);
	}



	// 댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(BReplyVO vo,HttpSession session,Model model,SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply write");

		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setRuserId(member.getUserId());
		RepService.writeReply(vo);

		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/read";
	}

	// 댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(BReplyVO vo,HttpSession session, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply update");

		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = service.idCheck(vo.getBno());
		
		if(member.getUserId().equals(userId)) {
			vo.setRuserId(member.getUserId());
			RepService.replyUpdate(vo);
		}
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/read";
	}

	// 댓글 삭제 POST
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(BReplyVO vo,HttpSession session, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("reply delete");

		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = service.idCheck(vo.getBno());
		
		if(member.getUserId().equals(userId)) {
			vo.setRuserId(member.getUserId());
			RepService.replyDelete(vo);
		}

		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/board/read";
	}

	// 댓글 수정 GET
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.GET)
	public void getReplyUpdate(@RequestParam("rno") int rno, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("reply update");

		BReplyVO vo = null;

		vo = RepService.readReplySelect(rno);

		model.addAttribute("readReply", vo);
		model.addAttribute("scri", scri);
	}

	// 댓글 수정 GET
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public void getReplyDelete(@RequestParam("rno") int rno, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {
		logger.info("reply delete");

		BReplyVO vo = null;

		vo = RepService.readReplySelect(rno);

		model.addAttribute("readReply", vo);
		model.addAttribute("scri", scri);
	}

}