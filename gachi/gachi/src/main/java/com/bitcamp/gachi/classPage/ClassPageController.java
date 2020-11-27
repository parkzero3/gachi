package com.bitcamp.gachi.classPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.gachi.admin.AllVO;

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
	
	@RequestMapping("/classPage")
	public String class1go() {
		return "classPage/classPage1";
	}
	@RequestMapping("/classPage2")
	public String class2go() {
		return "classPage/classPage2";
	}
	@RequestMapping("/classPage3")
	public String class3go() {
		return "classPage/classPage3";
	}
	@RequestMapping("/classView")
	public String classMain() {
		return "classPage/classView";
	}
	@RequestMapping("/classList")
	public ModelAndView classList(HttpServletRequest req) {
		ClassPageDaoImp dao = sqlSession.getMapper(ClassPageDaoImp.class);
		String category = req.getParameter("category");
		List<AllVO> list = dao.classPageAllRecord(category);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("classPage/classList");
		return mav;
	}

}
