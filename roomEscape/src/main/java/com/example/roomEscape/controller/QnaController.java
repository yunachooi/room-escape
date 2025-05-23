package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.roomEscape.dao.IQnaDAO;
import com.example.roomEscape.dto.QnaDTO;

@Controller
@RequestMapping("qna")
public class QnaController {

	@Autowired
	private IQnaDAO qnaDao;
	
	// 모든 QNA 받아오기.
	@GetMapping("/show_qna")
	public String showqna(Model model) {
		List<QnaDTO> qna_list = qnaDao.getAllQna();
		model.addAttribute("qna_list", qna_list);
		return "/admin/board/show_qna_list";
		
	}
	
}
