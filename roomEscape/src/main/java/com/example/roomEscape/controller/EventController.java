package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.roomEscape.dao.IEventDAO;
import com.example.roomEscape.dao.INoticeDAO;
import com.example.roomEscape.dto.EventDTO;
import com.example.roomEscape.dto.NoticeDTO;

@Controller
@RequestMapping("/user/notice")
public class EventController {

    @Autowired private IEventDAO eventDAO;
    @Autowired private INoticeDAO noticeDAO;
    
    // 공지사항, 이벤트 목록
    @GetMapping("/list")
    public String eventList(Model model) {
    	List<NoticeDTO> noticeList = noticeDAO.getAll(); 
        List<EventDTO> eventList = eventDAO.selectAll();    
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("eventList", eventList);
        return "user/notice/list"; // 공지사항과 공유되는 탭 리스트 뷰
    }

    // 이벤트 상세보기
    @GetMapping("/event_detail")
    public String eventDetail(@RequestParam("event_id") int id, Model model) {
        EventDTO event = eventDAO.selectById(id);
        model.addAttribute("event", event);
        return "user/notice/event_detail";
    }
    
    // 공지사항 상세보기
    @GetMapping("/notice_detail")
    public String noticeDetail(@RequestParam("notice_id") int noticeId, Model model) {
        NoticeDTO notice = noticeDAO.selectById(noticeId);
        model.addAttribute("notice", notice);
        return "user/notice/notice_detail";
    }
} 
