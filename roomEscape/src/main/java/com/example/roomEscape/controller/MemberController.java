package com.example.roomEscape.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.roomEscape.dao.IMemberDAO;
import com.example.roomEscape.dto.MemberDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user_info")
public class MemberController {

	@Autowired
	private IMemberDAO memberDao ;
	
	// 마이페이지
	@GetMapping("show_info")
	public String show_info(HttpSession session,
							Model model) {
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		MemberDTO userInfo = memberDao.show_info(loginInfo);
		System.out.println("유저정보:"+userInfo);
		
		
		model.addAttribute("userInfo", userInfo);
		return "/user/login/user_info";
	}
}
