package com.example.roomEscape.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

	@GetMapping("/user/board/index")
	public String board_index() {
		return "/user/board/index";
	}
	
}
