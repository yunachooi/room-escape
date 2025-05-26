package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.roomEscape.dao.IThemeDAO;
import com.example.roomEscape.dto.ThemeDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final IThemeDAO iThemeDAO;

    @GetMapping("/")
    public String home(Model model) {
        List<ThemeDTO> themes = iThemeDAO.selectAll();
        model.addAttribute("themeList", themes);
        return "index";
    }
}
