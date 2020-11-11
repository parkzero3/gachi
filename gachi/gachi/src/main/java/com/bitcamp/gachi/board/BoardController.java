package com.bitcamp.gachi.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/noticeBoard")
	public String noticeBoard() {
		return "board/noticeBoard";
	}
	
	@RequestMapping("/companyBoard")
	public String companyBoard() {
		
		return "board/companyBoard";
	}
	
}
