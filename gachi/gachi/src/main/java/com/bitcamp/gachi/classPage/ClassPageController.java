package com.bitcamp.gachi.classPage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.AllVO;
import com.bitcamp.gachi.admin.PagingVO;
import com.bitcamp.gachi.admin.QnaVO;
import com.bitcamp.gachi.mypage.OrderListVO;
import com.bitcamp.gachi.mypage.UserInfoDaoImp;
import com.google.gson.JsonObject;

@Controller
public class ClassPageController {
	SqlSession sqlSession;	
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/classList")
	public ModelAndView classList(HttpServletRequest req, HttpSession ses,ClassPageVO vo) throws Exception{
		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		ModelAndView mav = new ModelAndView();

		String category = req.getParameter("category");
		String nowPageTxt=req.getParameter("nowPage");
		if(nowPageTxt!=null) {//페이지 번호를 request한 경우
			vo.setNowPage(Integer.parseInt(nowPageTxt));
			}
		if(category==null) {
			int totalRecord=dao.classBoardAllRecordCount(vo);

			vo.setTotalRecord(totalRecord);
			System.out.println("카테0 총데이터 수="+vo.getTotalRecord());
		}
		if(category!=null) {
			int totalRecord = dao.classPageCategoryRecordCount(vo);
			vo.setTotalRecord(totalRecord);
			System.out.println("카테x 총데이터 수="+vo.getTotalRecord());
		}		
		System.out.println("vo="+vo.getCategory());
		List<AllVO> list = dao.classPageAllRecord(vo);

		UserInfoDaoImp uDao = sqlSession.getMapper(UserInfoDaoImp.class);
		
		String msg="";//좋아요 업데이트시 취소, 선택 알게 해주는 문자

		if(ses.getAttribute("logStatus")!=null) {//로그인 상태
			String userid=(String)ses.getAttribute("userid");
			if(req.getParameter("good_add")!=null) {//좋아요 추가
				msg="add";
				String goodCode = req.getParameter("good_add");
				uDao.wishListAdd(userid, goodCode);
				uDao.goodClassUpdate(goodCode, msg);			
			}
			if(req.getParameter("good_del")!=null) {//좋아요 삭제
				msg="del";
				String goodCode = req.getParameter("good_del");
				uDao.wishListDel(userid, goodCode);	
				uDao.goodClassUpdate(goodCode, msg);			
			}
			//좋아요 클래스
			List<OrderListVO> cgoodList = uDao.classWishList(userid);
			mav.addObject("cgoodList", cgoodList);	
		}
		mav.addObject("list", list);
		mav.addObject("pvo",vo);
		mav.setViewName("classPage/classList");
		return mav;
	}
	@RequestMapping("/classView")
	public ModelAndView classMain(HttpServletRequest req, HttpSession ses) {
		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		String code = req.getParameter("code");
		System.out.println("code= "+code);
		AllVO vo = dao.classView(code);
		List<AllVO> reviewList = dao.reviewList(code);
		List<QnaVO> qnaList = dao.qnaList(code);
		UserInfoDaoImp uDao = sqlSession.getMapper(UserInfoDaoImp.class);
		
		ModelAndView mav = new ModelAndView();
		
		String msg="";
		if(ses.getAttribute("logStatus")!=null) {//로그인 상태
			String userid=(String)ses.getAttribute("userid");
			if(req.getParameter("good_add")!=null) {//좋아요 추가
				msg="add";
				String goodCode = req.getParameter("good_add");
				uDao.wishListAdd(userid, goodCode);
				uDao.goodClassUpdate(goodCode, msg);		
			}
			if(req.getParameter("good_del")!=null) {//좋아요 삭제
				msg="del";
				String goodCode = req.getParameter("good_del");
				uDao.wishListDel(userid, goodCode);	
				uDao.goodClassUpdate(goodCode, msg);			
			}

			//좋아요 클래스
			OrderListVO goodVo = uDao.wishOneRecord(userid, code);
			mav.addObject("goodVo", goodVo);	
		}
		
		mav.addObject("reviewList", reviewList);
		mav.addObject("qnaList", qnaList);
		mav.addObject("vo", vo);
		mav.setViewName("classPage/classView");
		return mav;
	}
	//클래스 수강평 작성
	@RequestMapping(value="/reviewFormOk", method=RequestMethod.POST)
	@ResponseBody
	public int qnaFormOk(AllVO vo, HttpSession ses, HttpServletRequest req, PagingVO pvo) {
		vo.setIp(req.getRemoteAddr());
		vo.setUserid((String) ses.getAttribute("userid"));
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setGrade(req.getParameter("grade"));

		String code = req.getParameter("code");
		vo.setCode(code);
		System.out.println("code= "+code);
		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		int result = dao.insertReview(vo);
//		return "redirect:classView?code="+code+"&nowPage="+pvo.getNowPage();
		return result;
	}
	//클래스 수강평 수정
	@RequestMapping(value="/reviewUpdateFormOk", method=RequestMethod.POST)
	@ResponseBody
	public void reviewUpdateFormOk(AllVO vo, HttpSession ses, HttpServletRequest req, PagingVO pvo) {
		String userid = (String)ses.getAttribute("userid");
		vo.setUserid(userid);
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setGrade(req.getParameter("grade"));
		vo.setNum(Integer.parseInt(req.getParameter("num")));

		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		dao.updateReview(vo);
	}
	//클래스 질문답변 작성
	@RequestMapping(value="/qnaFormOk", method=RequestMethod.POST)
	public String qnaFormOk(AllVO vo, HttpServletRequest req, HttpSession ses, PagingVO pvo) {
		String userid = (String)ses.getAttribute("userid");
		vo.setUserid(userid);
		vo.setCode(req.getParameter("code"));
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setIp(req.getRemoteAddr());
		
		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		dao.insertQna(vo);
		
		
		return "redirect:classView";
	}
	//클래스 질문답변 수정
	@RequestMapping(value="/qnaUpdateFormOk", method=RequestMethod.POST)
	@ResponseBody
	public void qnaUpdateFormOk(AllVO vo, HttpServletRequest req, HttpSession ses, PagingVO pvo) {
		String userid = (String)ses.getAttribute("userid");
		vo.setUserid(userid);
		vo.setSubject(req.getParameter("subject"));
		vo.setContent(req.getParameter("content"));
		vo.setNum(Integer.parseInt(req.getParameter("num")));
		
		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		int result = dao.updateQna(vo);
	}
	
	//클래스 View에서 검색
	@RequestMapping("/qnaSearch")
	public void qnaSearch(AllVO vo, HttpServletRequest req) {
		vo.setCode(req.getParameter("code"));
		vo.setSearchKey(req.getParameter("searchKey"));
		vo.setSearchWord(req.getParameter("searchWord"));
		System.out.println("code= "+req.getParameter("code"));
		System.out.println("Key= "+req.getParameter("searchKey"));
		System.out.println("Word= "+req.getParameter("searchWord"));
		
		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		dao.qnaListSearch(vo);
		
	}
	
	@RequestMapping(value="/clientImgUpload",method=RequestMethod.POST)
	@ResponseBody
	public JsonObject imageUpload(HttpServletRequest req,@RequestParam MultipartFile upload,
			@RequestParam("type") String type) {
		HttpSession session=req.getSession();
		String path = null;
		if(type.equals("classView")) {
			path=session.getServletContext().getRealPath("/upload/classView");
		}else if(type.equals("eventWrite")){
			path=session.getServletContext().getRealPath("/upload/event_img");
		}
		JsonObject json=new JsonObject();
		OutputStream ops=null;
		try {
			ops=new FileOutputStream(new File(path,upload.getOriginalFilename()));
			ops.write(upload.getBytes());
			json.addProperty("uploaded",1);
			json.addProperty("filename",upload.getOriginalFilename());
			json.addProperty("url",path+upload.getOriginalFilename());
			ops.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	
	

}
