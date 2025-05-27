package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.roomEscape.dao.IBranchDAO;
import com.example.roomEscape.dao.IThemeDAO;
import com.example.roomEscape.dao.IThemeTypeDAO;
import com.example.roomEscape.dto.MemberDTO;
import com.example.roomEscape.dto.ThemeDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/theme")
public class ThemeController {

    @Autowired private IThemeDAO themeDAO;
    @Autowired private IBranchDAO branchDAO;
    @Autowired private IThemeTypeDAO themeTypeDAO;

    // 테마 리스트
    @GetMapping("/list")
    public String listThemes(Model model,HttpSession session,RedirectAttributes rttr) {
    	MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null || member.getRole() != "admin") {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
        List<ThemeDTO> themes = themeDAO.selectAll();
        model.addAttribute("themes", themes);
        return "admin/theme/list";
    }

    // 등록 / 수정 폼
    @GetMapping("/form")
    public String showForm(@RequestParam(value = "theme_id", required = false) Integer theme_id, Model model,HttpSession session,RedirectAttributes rttr) {
    	MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null || member.getRole() != "admin") {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
        if (theme_id != null) {
            ThemeDTO theme = themeDAO.selectById(theme_id);
            model.addAttribute("theme", theme);
            model.addAttribute("mode", "edit");
        } else {
            model.addAttribute("theme", new ThemeDTO());
            model.addAttribute("mode", "create");
        }

        // 지점 목록, 유형 목록 불러오기
        model.addAttribute("branches", branchDAO.selectAll());
        model.addAttribute("types", themeTypeDAO.selectAll());

        return "admin/theme/form";
    }

    // 테마 등록
    @PostMapping("/insert")
    public String insertTheme(@ModelAttribute ThemeDTO theme,HttpSession session,RedirectAttributes rttr) {
    	MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null || member.getRole() != "admin") {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
    	themeDAO.insert(theme);
        return "redirect:/admin/theme/list";
    }

    // 테마 수정
    @PostMapping("/update")
    public String updateTheme(@ModelAttribute ThemeDTO theme,HttpSession session,RedirectAttributes rttr) {
    	MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null || member.getRole() != "admin") {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
    	themeDAO.update(theme);
        return "redirect:/admin/theme/list";
    }

    // 테마 삭제
    @PostMapping("/delete")
    public String deleteTheme(@RequestParam("theme_id") int theme_id,HttpSession session,RedirectAttributes rttr) {
    	MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null || member.getRole() != "admin") {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
    	themeDAO.delete(theme_id);
        return "redirect:/admin/theme/list";
    }
}
