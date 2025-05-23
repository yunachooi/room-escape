package com.example.roomEscape.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.roomEscape.dao.IQnaAnswerDAO;
import com.example.roomEscape.dao.IQnaDAO;
import com.example.roomEscape.dto.QnaAnswerDTO;
import com.example.roomEscape.dto.QnaDTO;


@Controller
@RequestMapping("/qna")
public class QnaAnswerController {

	@Autowired
	private IQnaAnswerDAO qnaanswerDao;
	
	@Autowired
	private IQnaDAO qnaDao;

	// QNA List에서 답변하기 버튼 누르면 해당 QNA 보여주기
	@GetMapping("/show_qna_answer")
	public String showqnaanswer(@RequestParam("qna_id")int qna_id,
									Model model) {
		QnaDTO qna = qnaDao.getOneNeedToAnswer(qna_id);
		model.addAttribute("qna", qna);
		return "/admin/board/qna_need_answer";
	}
	
	@PostMapping("/upload_qna_answer")
	public String uploadQnaAnswer(QnaAnswerDTO qna_answer,
									Model model) {
		qnaanswerDao.upload_answer(qna_answer); // 답변 DB 에 등록
		qnaDao.update_is_answered(qna_answer.getQna_id()); // 답변 등록 후 is_answered 'Y'로 변경
		return "redirect:/qna/show_qna";
		
	}
	
	//show_qna_list 에서 답변 상세 보기 
	// JSON 으로 반환
	@GetMapping("/show_qna_detail")
	@ResponseBody
	public QnaAnswerDTO show_qna_detail (@RequestParam("qna_id")int qna_id) {
		return qnaanswerDao.get_one_by_qna_id(qna_id);
	}
}
