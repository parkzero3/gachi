package com.bitcamp.gachi.board;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@RequestMapping("/noticeBoard")
	public ModelAndView noticeBoard() {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		List<NoticeBoardVO> list = dao.noticeBoardAllRecord();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("board/noticeBoard");
		return mav;
	}

	@RequestMapping("/noticeBoardDetail")
	public ModelAndView noticeBoardDetail(int no) {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		NoticeBoardVO vo = dao.noticeBoardSelect(no);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("board/noticeBoardDetail");
		return mav;
	}

	// 이벤트 리스트
	@RequestMapping("/eventBoard")
	public ModelAndView eventBoard() {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		List<EventBoardVO> list = dao.eventBoardAllRecord();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("board/eventBoard");
		return mav;
	}

	@RequestMapping("/eventBoardDetail")
	public ModelAndView eventBoardDetail(int no, String event) {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		EventBoardVO vo = dao.eventBoardSelect(no);
		vo.setEvent_category(event);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("board/eventBoardDetail");
		return mav;
	}

	@RequestMapping("/eventBoardEnd")
	public ModelAndView eventBoardEnd() {
		BoardDaoImp dao = sqlSession.getMapper(BoardDaoImp.class);
		List<EventBoardVO> list = dao.endEventBoardAllRecord();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("board/eventBoardEnd");
		return mav;
	}

	@RequestMapping("/companyBoard")
	public String companyBoard() {

		return "board/companyBoard";
	}

	@RequestMapping("/serviceCenterBoard")
	public String serviceCenterBoard() {
		return "board/serviceCenterBoard";
	}

	@RequestMapping("/serviceCenterBoard_TopFAQ")
	public String serviceCenterBoard_TopFAQ() {
		return "board/serviceCenterBoard_TopFAQ";
	}

	@RequestMapping("/serviceCenterBoard_order")
	public String serviceCenterBoard_order() {
		return "board/serviceCenterBoard_order";
	}

	@RequestMapping("/serviceCenterBoard_refund")
	public String serviceCenterBoard_refund() {
		return "board/serviceCenterBoard_refund";
	}

	@RequestMapping("/serviceCenterBoard_class")
	public String serviceCenterBoard_class() {
		return "board/serviceCenterBoard_class";
	}

	@RequestMapping("/serviceCenterBoard_etc")
	public String serviceCenterBoard_etc() {
		return "board/serviceCenterBoard_etc";
	}

	@RequestMapping("/deliveryBoard")
	public String deliveryBoard() {
		return "board/deliveryBoard";
	}

	@RequestMapping("/introCreate")
	public String introCreate() {
		return "board/introCreate";
	}

	@RequestMapping("/introCreateDetail")
	public String introCreateDetail() {
		return "board/introCreateDetail";
	}

}
