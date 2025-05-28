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

	@PostMapping("/login")
	public String login(@RequestParam("id") String member_id,
	                    @RequestParam("pw") String password,
	                    HttpServletRequest request,
	                    Model model,
	                    RedirectAttributes rttr) {

	    if (member_id == null || password == null) {
	        rttr.addFlashAttribute("login_error1", true);
	        return "redirect:/user/to_login";
	    }

	    MemberDTO member = loginDao.loginCheck(member_id);

	    if (member != null) {
	        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	        if (encoder.matches(password, member.getPassword())) {
	            HttpSession session = request.getSession();
	            session.setAttribute("loginInfo", member);

	            // 로그인 전 원래 요청 URL이 있으면 그쪽으로 리다이렉트
	            String redirectUrl = (String) session.getAttribute("redirectAfterLogin");
	            if (redirectUrl != null) {
	                session.removeAttribute("redirectAfterLogin");
	                return "redirect:" + redirectUrl;
	            }

	            if ("admin".equals(member.getRole())) {
	                return "redirect:/admin/main"; // 관리자 메인 페이지
	            }

	            return "redirect:/"; // 일반 사용자 메인 페이지
	        }
	    }

	    rttr.addFlashAttribute("login_error2", true);
	    return "redirect:/user/to_login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate(); 
	    return "redirect:/"; 
	}
	
	@GetMapping("/admin/main")
	public String adminMain() {
	    return "/admin/main";
	}
}
