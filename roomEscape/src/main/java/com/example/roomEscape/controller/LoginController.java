package com.example.roomEscape.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.roomEscape.dao.ILoginDAO;
import com.example.roomEscape.dto.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class LoginController {

	@Autowired
	private ILoginDAO loginDao;
	
	@GetMapping("/")
	public String root() {
		return "index"; 
	}
	
	@GetMapping("/to_login")
	public String login() {
		return "/admin/user/login";
	}

	// 로그인 ID,PW 확인 및 로그인 정보 저장
	@PostMapping("/login")
	public String login(@RequestParam("id") String member_id,
						@RequestParam("pw") String password,
						HttpServletRequest request,
						Model model,
						RedirectAttributes rttr) {
		
		if( member_id == null || password == null ) {
			rttr.addFlashAttribute("login_error1", true);
			return "redirect:/user/admin/user/to_login";
		}
		
		MemberDTO member = loginDao.loginCheck(member_id);
		
		if(member != null) {
			BCryptPasswordEncoder  encoder = new BCryptPasswordEncoder();
			
			if (encoder.matches(password, member.getPassword())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginInfo",member);
				System.out.println("test 확인 중 어드민 확인 :"  + member.getRole());
				return "redirect:/user/";
			}
		}
		rttr.addFlashAttribute("login_error2", true);
		return "redirect:/user/admin/user/to_login";
	}
}
