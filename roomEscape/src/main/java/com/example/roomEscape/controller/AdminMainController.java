package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.roomEscape.dao.IFaqDAO;
import com.example.roomEscape.dto.FaqDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminMainController {

	@Autowired IFaqDAO faqDao;
	
	@GetMapping("/main")
	public String main() {
		return "/admin/main";
	}
	
	@PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 종료
        return "redirect:/"; // 로그인 페이지 또는 메인 페이지로 리다이렉트
    }
	
	@GetMapping("/faq/form")
	public String faqForm(@RequestParam(value = "faq_id", required = false) String faq_id, Model model) {
	    if (faq_id != null) {
	        FaqDTO faq = faqDao.getFaqByFaqId(faq_id);
	        model.addAttribute("faq", faq);
	    }
	    return "admin/board/faq_form";
	}
	
	@GetMapping("/faq/list")
	public String faqList(Model model) {
	    List<FaqDTO> faqList = faqDao.getAll();
	    model.addAttribute("faqList", faqList);
	    return "admin/board/faq_list";
	}
}
