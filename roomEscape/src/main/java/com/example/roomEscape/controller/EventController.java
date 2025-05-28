package com.example.roomEscape.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.roomEscape.dao.IEventDAO;
import com.example.roomEscape.dao.INoticeDAO;
import com.example.roomEscape.dao.IQnaDAO;
import com.example.roomEscape.dto.EventDTO;
import com.example.roomEscape.dto.NoticeDTO;
import com.example.roomEscape.dto.QnaDTO;

@Controller
@RequestMapping("/user/notice")
public class EventController {

    @Autowired private IEventDAO eventDAO;
    @Autowired private INoticeDAO noticeDAO;
    @Autowired private IQnaDAO qnaDAO;
    
    // 공지사항, 이벤트 목록
    @GetMapping("/list")
    public String eventList(Model model) {
    	List<NoticeDTO> noticeList = noticeDAO.getAll(); 
        List<EventDTO> eventList = eventDAO.selectAll();  
        List<QnaDTO> qnaList = qnaDAO.getAllQna();  
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("eventList", eventList);
        return "user/notice/list"; // 공지사항과 공유되는 탭 리스트 뷰
    }
    
    // 이벤트 상세보기
    @GetMapping("/event_detail")
    public String eventDetail(@RequestParam("event_id") int id, Model model) {
        EventDTO event = eventDAO.selectById(id);

        // 날짜 포맷터 준비
        SimpleDateFormat fullFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        SimpleDateFormat dateOnlyFormatter = new SimpleDateFormat("yyyy-MM-dd");

        String regDateFormatted = "";
        String startDateFormatted = "";
        String endDateFormatted = "";

        if (event.getReg_date() != null) {
            regDateFormatted = fullFormatter.format(event.getReg_date());
        }
        if (event.getStart_date() != null) {
            startDateFormatted = dateOnlyFormatter.format(event.getStart_date());
        }
        if (event.getEnd_date() != null) {
            endDateFormatted = dateOnlyFormatter.format(event.getEnd_date());
        }

        model.addAttribute("event", event);
        model.addAttribute("regDateFormatted", regDateFormatted);
        model.addAttribute("startDateFormatted", startDateFormatted);
        model.addAttribute("endDateFormatted", endDateFormatted);
        return "user/notice/event_detail";
    }

    
    // 공지사항 상세보기
    @GetMapping("/notice_detail")
    public String noticeDetail(@RequestParam("notice_id") int noticeId, Model model) {
        NoticeDTO notice = noticeDAO.selectById(noticeId);
        model.addAttribute("notice", notice);
        return "user/notice/notice_detail";
    }
    
    //qna 상세보기
    @GetMapping("/qna_detail")
    public String qnaDetail(@RequestParam("qna_id") int qnaId, Model model) {
        QnaDTO qna = qnaDAO.get_one_qna_by_qna_id(qnaId);
        model.addAttribute("qna", qna);
        return "/user/board/qna/show_qna_detail";	
    }
} 
