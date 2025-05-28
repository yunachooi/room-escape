package com.example.roomEscape.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminMainController {

	@GetMapping("/main")
	public String main() {
		return "/admin/main";
	}
	
	@PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 종료
        return "redirect:/login"; // 로그인 페이지 또는 메인 페이지로 리다이렉트
    }
}
