package com.example.roomEscape.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.roomEscape.dao.IBranchDAO;
import com.example.roomEscape.dto.BranchDTO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/branch")
public class BranchController {

    private final IBranchDAO branchDao;

    @GetMapping("/list")
    public String list(Model model) {
        List<BranchDTO> branches = branchDao.getAll();
        model.addAttribute("branchList", branches);
        return "admin/branch/list";
    }

    @GetMapping("/form")
    public String form(@RequestParam(name = "id", required = false) Integer id, Model model) {
        if (id != null) {
            BranchDTO dto = branchDao.getOne(id);
            model.addAttribute("branchDto", dto);
        }
        return "admin/branch/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BranchDTO dto) {
        // null 체크 먼저
        if (dto.getBranchId() == null) {
            branchDao.insert(dto); // BRANCH_ID는 시퀀스로 생성
        } else {
            branchDao.update(dto);
        }
        return "redirect:/admin/branch/list";
    }


    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id) {
        branchDao.delete(id);
        return "redirect:/admin/branch/list";
    }
}
