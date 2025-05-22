package com.example.roomEscape.controller;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.roomEscape.dao.INoticeDAO;
import com.example.roomEscape.dto.NoticeDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/notice")
public class NoticeController {

    private final INoticeDAO noticeDao;

    @GetMapping("/list")
    public String list(Model model) {
        List<NoticeDTO> list = noticeDao.getAll();
        model.addAttribute("noticeList", list);
        return "admin/notice/list";
    }

    @GetMapping("/form")
    public String form() {
        return "admin/notice/form";
    }

    @PostMapping("/insert")
    public String insert(HttpServletRequest request, @ModelAttribute NoticeDTO dto) {
        // 제목 앞에 prefix 붙이기
        String prefix = request.getParameter("prefix");
        String title = request.getParameter("title");

        dto.setTitle(prefix + " " + title);  // "[공지] 제목입니다" 또는 "[이벤트] 제목입니다"
        dto.setRegDate(new Date());
        dto.setAdminId("admin");  // 테스트용

        noticeDao.insert(dto);
        return "redirect:/admin/notice/list";
    }
    
    @PostMapping("/enter")
    @ResponseBody
    public String enterEvent(@RequestParam("noticeId") int noticeId, HttpServletRequest request) {
        HttpSession session = request.getSession();

        // 세션에서 응모 횟수 가져오기
        Integer count = (Integer) session.getAttribute("eventCount");
        if (count == null) {
            count = 0;
        }

        if (count >= 3) {
            return "⚠ 이미 3회 응모하셨습니다. 더 이상 참여할 수 없습니다.";
        }

        // 응모 횟수 +1 저장
        session.setAttribute("eventCount", count + 1);
        return "🎉 이벤트 응모가 완료되었습니다! (남은 응모 가능 횟수: " + (2 - count) + ")";
    }




    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id) {
        noticeDao.delete(id);
        return "redirect:/admin/notice/list";
    }
}
