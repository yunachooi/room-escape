package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.roomEscape.dao.IBranchDAO;
import com.example.roomEscape.dao.IThemeDAO;
import com.example.roomEscape.dao.IThemeTypeDAO;
import com.example.roomEscape.dto.ThemeDTO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user/theme")
public class ThemeViewController {

    private final IThemeDAO themeDAO;
    private final IBranchDAO branchDAO;
    private final IThemeTypeDAO themeTypeDAO;

    @GetMapping("/list")
    public String listThemes(  
        @RequestParam(name = "branch_id", required = false) Integer branch_id,
        @RequestParam(name = "type_id", required = false) Integer type_id,
        @RequestParam(name = "theme_level", required = false) String theme_level,
        @RequestParam(name = "people", required = false) Integer people,
        @RequestParam(name = "id", required = false) Integer id,
        Model model
    ) {
        List<ThemeDTO> themes;

        if (id != null) {
            ThemeDTO theme = themeDAO.selectById(id);
            themes = theme != null ? List.of(theme) : List.of();
        } else {
            themes = themeDAO.getFilteredThemes(branch_id, type_id, theme_level, people);
        }

        model.addAttribute("themeList", themes);
        model.addAttribute("branches", branchDAO.selectAll());
        model.addAttribute("types", themeTypeDAO.selectAll());

        return "user/theme/list";
    }

    @GetMapping("/detail")
    @ResponseBody
    public ThemeDTO themeDetail(@RequestParam("theme_id") int theme_id) {
        return themeDAO.selectById(theme_id);
    } 
}
