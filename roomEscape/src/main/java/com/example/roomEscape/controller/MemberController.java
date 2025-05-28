package com.example.roomEscape.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		}else if("admin".equals(loginInfo.getRole())){
			return "redirect:/admin/main";
			
		}else {
			
//			MemberDTO userInfo = memberDao.show_info(loginInfo);
			model.addAttribute("loginInfo", loginInfo);
			return "/user/login/user_info";
		}
	}
	
	@PostMapping("update_info")
	public String update_info(@RequestParam("pwcheck")String pwcheck,
							MemberDTO member,
							RedirectAttributes rttr) {
		if(member.getPassword().equals(pwcheck)) {
			memberDao.update_info(member);
			rttr.addFlashAttribute("update_info", true);
			return "redirect:/";
		}else {
			rttr.addFlashAttribute("update_info_fail", true);
			return "redirect:/user/to_login";
		}
		
	}
	
}
