package com.example.roomEscape.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.roomEscape.dao.IMemberDAO;
import com.example.roomEscape.dto.MemberDTO;

@Controller
@RequestMapping("/user")
public class RegistController {

    @Autowired private IMemberDAO memberDAO;

    @GetMapping("/regist")
    public String regist() {
        return "/admin/user/regist";
    }

    @PostMapping("/regist")
    public String register(@ModelAttribute MemberDTO member) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(); // ① 인코더 생성
        member.setPassword(encoder.encode(member.getPassword()));    // ② 비밀번호 암호화

        member.setRole("USER");
        memberDAO.insert(member); // ③ 암호화된 비밀번호 저장

        return "redirect:/admin/user/login";
    }


    @ResponseBody
    @GetMapping("/checkId")
    public boolean checkId(@RequestParam("member_id") String member_id) {
        return memberDAO.selectById(member_id) == null;
    }
}
