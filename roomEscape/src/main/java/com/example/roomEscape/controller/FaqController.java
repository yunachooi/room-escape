package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.roomEscape.dao.IFaqDAO;
import com.example.roomEscape.dao.IQnaDAO;
import com.example.roomEscape.dto.FaqDTO;
import com.example.roomEscape.dto.QnaDTO;
import com.example.roomEscape.service.FaqService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	@Autowired
	private IFaqDAO faqDao;
	
	
	@GetMapping("/")
	public String root() {
		return "/admin/board/index";
	}
	
	//--------------------------------------------------
	//관리자용
	@GetMapping("/show_list")
	public String showlist(Model model) {
		List<FaqDTO> faqList = faqService.getAll();
		model.addAttribute("faqList", faqList);
		System.out.println(faqList);
		return "/admin/board/show_list"; 
	}
	
	@GetMapping("/to_write_faq") // FAQ 작성으로 이동.
	public String toWritefaq() {
		return "/admin/board/write_faq";
	}
	
	@GetMapping("/write_faq")
	public String writefaq(FaqDTO faq,
						Model model,
						HttpSession session) {
		// service 호출하여 관리자인지 아닌지 확인 필요함 . 
		faqDao.writeFaq(faq);
		
		return "redirect:/faq/show_list";
	}
	
	// FAQ Detail Page 
	@GetMapping("/show_detail_faq")
	public String showdetailfaq(@RequestParam("faq_id") String faq_id,
								Model model) {
		FaqDTO faq = faqDao.getFaqByFaqId(faq_id);
		model.addAttribute("faq", faq);
		return "/admin/board/show_detail_faq";
	}
	
	//--------------------------------------------------
	// 사용자용
	
	@GetMapping("/show_list_user")
	public String show_list_user(Model model) {
		List<FaqDTO> faqList = faqService.getAll();
		model.addAttribute("faqList", faqList);
		return "/user/board/faq/show_faq_list"; 
	}
}
