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
		
		if(loginInfo == null ) {
			return "redirect:/user/to_login";
		}else {
			
//			MemberDTO userInfo = memberDao.show_info(loginInfo);
			model.addAttribute("loginInfo", loginInfo);
			return "/user/login/user_info";
		}
	}
}
