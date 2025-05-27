package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.roomEscape.dao.IBranchDAO;
import com.example.roomEscape.dto.BranchDTO;
import com.example.roomEscape.dto.MemberDTO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/branch")
public class BranchController {

    private final IBranchDAO branchDao;

    @GetMapping("/list")
    public String list(Model model,HttpSession session,RedirectAttributes rttr) {
    	MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null || !"admin".equals(member.getRole())) {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
        List<BranchDTO> branches = branchDao.getAll();
        model.addAttribute("branchList", branches);
        return "admin/branch/list";
    }

    @GetMapping("/form")
    public String form(@RequestParam(name = "id", required = false) Integer id, Model model,
    				HttpSession session,RedirectAttributes rttr) {
    	MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null ||!"admin".equals(member.getRole())) {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
    	
    	
    	if (id != null) {
            BranchDTO dto = branchDao.getOne(id);
            model.addAttribute("branchDto", dto);
        }
        return "admin/branch/form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BranchDTO dto,HttpSession session,RedirectAttributes rttr) {
    	MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null || !"admin".equals(member.getRole())) {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
        // null 체크 먼저
        if (dto.getBranchId() == null) {
            branchDao.insert(dto); // BRANCH_ID는 시퀀스로 생성
        } else {
            branchDao.update(dto);
        }
        return "redirect:/admin/branch/list";
    }


    @GetMapping("/delete")
    public String delete(@RequestParam("id") int id,HttpSession session,RedirectAttributes rttr) {
    	MemberDTO member = (MemberDTO)session.getAttribute("loginInfo");
    	if(member == null || !"admin".equals(member.getRole())) {
    		rttr.addFlashAttribute("need_admin", "로그인이 필요한 서비스입니다.");
    		return "redirect:/user/to_login";
    	}
        branchDao.delete(id);
        return "redirect:/admin/branch/list";
    }
}
