package com.example.roomEscape.controller;

import com.example.roomEscape.dao.IBranchDAO;
import com.example.roomEscape.dao.IThemeDAO;
import com.example.roomEscape.dao.IThemeTypeDAO;
import com.example.roomEscape.dto.ThemeDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user/theme")
public class ThemeViewController {

    private final IThemeDAO themeDAO;
    private final IBranchDAO branchDAO;
    private final IThemeTypeDAO themeTypeDAO;

    @GetMapping("/list")
    public String listThemes(
            @RequestParam(name = "sort", required = false) String sort,
            @RequestParam(name = "branch_id", required = false) Integer branchId,
            @RequestParam(name = "type_id", required = false) Integer typeId,
            @RequestParam(name = "theme_level", required = false) String themeLevel,
            @RequestParam(name = "people", required = false) Integer people,
            @RequestParam(name = "id", required = false) Integer id,
            Model model
    ) {
        List<ThemeDTO> themes = new ArrayList<>();

        if (id != null) {
            ThemeDTO theme = themeDAO.selectById(id);
            if (theme != null) {
                themes.add(theme);
            }
        } else if (branchId != null || typeId != null || themeLevel != null || people != null) {
            themes = themeDAO.getFilteredThemes(branchId, typeId, themeLevel, people);
        } else if ("rating".equals(sort)) {
            themes = themeDAO.getThemesByRating();
        } else if ("popular".equals(sort)) {
            themes = themeDAO.getThemesByReviewCount();
        } else {
            themes = themeDAO.selectAll();
        }

        model.addAttribute("themeList", themes);
        model.addAttribute("branches", branchDAO.selectAll());
        model.addAttribute("types", themeTypeDAO.selectAll());

        return "user/theme/list";
    }

    @GetMapping("/detail")
    @ResponseBody
    public ThemeDTO themeDetail(@RequestParam("theme_id") int themeId) {
        return themeDAO.selectById(themeId);
    }
}
