package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.roomEscape.dao.IBranchDAO;
import com.example.roomEscape.dao.IThemeDAO;
import com.example.roomEscape.dao.IThemeTypeDAO;
import com.example.roomEscape.dto.ThemeDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final IThemeDAO iThemeDAO;
    private final IBranchDAO branchDAO;
    private final IThemeTypeDAO themeTypeDAO;

    @GetMapping("/")
    public String home(Model model) {
        List<ThemeDTO> themes = iThemeDAO.selectAll();
        model.addAttribute("themeList", themes);

        // ✅ 이거 추가!
        model.addAttribute("branches", branchDAO.selectAll());
        model.addAttribute("types", themeTypeDAO.selectAll());

        return "index";
    }
}
