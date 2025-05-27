package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.roomEscape.dao.IQnaAnswerDAO;
import com.example.roomEscape.dao.IQnaDAO;
import com.example.roomEscape.dto.MemberDTO;
import com.example.roomEscape.dto.QnaAnswerDTO;
import com.example.roomEscape.dto.QnaDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private IQnaDAO qnaDao;
	
	@Autowired
	private IQnaAnswerDAO qnaanswerDao;
	
	//----------------------------------------
	//관리자용 
	
	// 모든 QnA 받아오기. //관리자용 
	@GetMapping("/show_qna")
	public String showqna(Model model,HttpSession session,RedirectAttributes rttr) {
		MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null || !"admin".equals(member.getRole())) {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
		List<QnaDTO> qna_list = qnaDao.getAllQna();
		model.addAttribute("qna_list", qna_list);
		return "/admin/board/show_qna_list";
		
	}
	
	
	//----------------------------------------------
	// 유저용 
	
	//모든 QnA 받아오기. // 사용자용 
	@GetMapping("/show_qna_user")
	public String show_qna_user (Model model) {
		List<QnaDTO> qna_list = qnaDao.getAllQna_desc();
		model.addAttribute("qna_list", qna_list);
		return "/user/board/qna/show_qna_list";
	}
	
	// Qna 작성 페이지로 이동 
	@GetMapping("/to_write_qna_user")
	public String to_write_qna_user() {
		return "/user/board/qna/write_qna";
	}
	
	// QnA 작성
	@PostMapping("/write_qna_user")
	public String write_qna_user (QnaDTO qna,
									Model model) {
		qnaDao.write_qna(qna);
		return "redirect:/qna/show_qna_user";
	}
	// QnA List 에서 제목 누르면 상세보기 + 답변까지 보기  
	@GetMapping("/show_qna_detail_user")
	public String show_qna_detail_user(@RequestParam("qna_id")int qna_id,
									Model model) {
		QnaDTO qna = qnaDao.get_one_qna_by_qna_id(qna_id);
		model.addAttribute("qna", qna);
		if(qna.getIs_answered().equals("Y")) {
			QnaAnswerDTO qna_answer = qnaanswerDao.get_one_by_qna_id(qna_id);
			model.addAttribute("qna_answer", qna_answer);
		}
		return "/user/board/qna/show_qna_detail";
	}
	
	// 수정 및 삭제 버튼 누르면 form 띄우기 
	@GetMapping("/delete_or_update_qna_user")
	public String delete_or_update_qna (@RequestParam("qna_id")int qna_id,
										Model model	) {
		QnaDTO qna = qnaDao.get_one_qna_by_qna_id(qna_id);
		model.addAttribute("qna", qna);
		return "user/board/qna/delete_or_update_qna";
	}
	
	// QnA 수정 및 삭제 
	@PostMapping("/delete_qna_user")
	public String delete_qna_user (QnaDTO qna,
									@RequestParam("action")String action,
									RedirectAttributes rttr) {
		// 데이터 받아오기
		QnaDTO get_qna_data = qnaDao.get_one_qna_by_qna_id(qna.getQna_id());
		// 입력한 아이디와 비밀번호 확인하기
		boolean checkTorF = get_qna_data.getMember_id().equals(qna.getMember_id()) && get_qna_data.getPassword().equals(qna.getPassword());
		// 틀리면 빠꾸
		if(checkTorF == false) {
			rttr.addFlashAttribute("update_error", true);
			return "redirect:/qna/show_qna_detail_user?qna_id="+qna.getQna_id();
		}
		
		if(action.equals("수정")) {
			// 맞으면 dao 통해서 수정
			qnaDao.update_qna(qna);
			rttr.addFlashAttribute("success", "QnA가 수정되었습니다.");
		}else if(action.equals("삭제")) {
			qnaDao.delete_qna(qna);
			 rttr.addFlashAttribute("success", "QnA가 삭제되었습니다.");
		}
		return "redirect:/qna/show_qna_user" ;
	}
	
	
	
	
}
