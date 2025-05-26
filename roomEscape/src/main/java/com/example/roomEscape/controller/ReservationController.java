package com.example.roomEscape.controller;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.roomEscape.dao.IReservationDAO;
import com.example.roomEscape.dao.IThemeFlatDAO;
import com.example.roomEscape.dto.MemberDTO;
import com.example.roomEscape.dto.ReservationDTO;
import com.example.roomEscape.dto.ThemeFlatDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/res")
public class ReservationController {
	@Autowired
	IReservationDAO reservationDao;
	@Autowired
    private IThemeFlatDAO themeFlatDAO;
	
	@GetMapping("/userReservation")
	public String userReservation(
	        @RequestParam(value="find_date", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate find_date,
	        @RequestParam(value="branch", required = false) String branch,
	        Model model) {

	    System.out.println("find_date..." + find_date + "...branch..." + branch);

	    if (find_date == null) {
	        find_date = LocalDate.now();
	    }

	    if (branch == null || branch.isEmpty()) {
	        branch = "강남점";
	    } else {
	        switch (branch) {
	            case "1":
	                branch = "강남점";
	                break;
	            case "2":
	                branch = "잠실점";
	                break;
	            case "3":
	                branch = "홍대점";
	                break;
	            default:
	                branch = "강남점";
	        }
	    }

	    List<ThemeFlatDTO> list = themeFlatDAO.getThemesFlat(find_date.toString(), branch);

	    Map<String, List<ThemeFlatDTO>> groupedThemes = list.stream()
	        .collect(Collectors.groupingBy(ThemeFlatDTO::getTITLE));

	    model.addAttribute("groupedThemes", groupedThemes);
	    model.addAttribute("selectedDate", find_date);
	    model.addAttribute("selectedBranch", branch);

	    return "/user/reservation/userReservation";
	}

	@GetMapping("/reservationInfo")
	public String reservationInfo(
	    @RequestParam("TITLE") String title,
	    @RequestParam("TYPE_NAME") String themeType,
	    @RequestParam("TIME_LABEL") String time,
	    @RequestParam(value = "RESV_DATE", required = false) String date,
	    @RequestParam(value = "branch", required = false) String branch,
	    Model model, HttpSession session) {
		
		Object loginInfo = session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
            return "redirect:/user/to_login";
        }

	    if (date == null) date = LocalDate.now().toString();
	    if (branch == null) branch = "강남점";

	    System.out.println("reservationInfo..." + title + "..." + date + "..." + branch + "..." + themeType + "..." + time);

	    model.addAttribute("title", title);
	    model.addAttribute("theme_type", themeType);
	    model.addAttribute("time", time);
	    model.addAttribute("date", date);
	    model.addAttribute("branch", branch);

	    return "/user/reservation/reservationInfo";
	}

	@PostMapping("/reservation/submit")
	public String submitReservation(
	        @RequestParam("name") String NAME,
	        @RequestParam("MEMBER_ID") String MEMBER_ID,
	        @RequestParam("participants") int NUM_PEOPLE,
	        @RequestParam("msg") String REQUEST_MSG,
	        @RequestParam("date") String RESV_DATE,
	        @RequestParam("time") String TIME_LABEL,
	        @RequestParam("branch") String BRANCH_NAME,
	        @RequestParam("title") String THEME_TITLE,
	        @RequestParam("theme_type") String THEME_TYPE,
	        @RequestParam("PHONE") String PHONE,
	        HttpSession session,
	        Model model) {

	    int SCHEDULE_ID = reservationDao.findScheduleId(RESV_DATE, TIME_LABEL, THEME_TITLE, BRANCH_NAME, THEME_TYPE);
	    reservationDao.insertReservation(NUM_PEOPLE, REQUEST_MSG, RESV_DATE, MEMBER_ID, SCHEDULE_ID);
	    reservationDao.updateScheduleBooked(SCHEDULE_ID);

	    MemberDTO member = (MemberDTO) session.getAttribute("loginInfo");
	    List<ReservationDTO> list = reservationDao.reservationCheck(member.getMember_id());
	    model.addAttribute("list", list);

	    return "/user/reservation/reservationStatus";
	}
	
	@GetMapping("/reservationStatus")
    public String reservationStatus(HttpSession session, Model model) {
        System.out.println("reservationStatus...");
        Object loginInfo = session.getAttribute("loginInfo");

        if (loginInfo == null) {
            return "redirect:/user/to_login";
        }

        MemberDTO member = (MemberDTO) loginInfo;
        System.out.println("user id..." + member.getMember_id());
        
        List<ReservationDTO> list = reservationDao.reservationCheck(member.getMember_id());
        model.addAttribute("list", list);
        
        return "/user/reservation/reservationStatus";
    }
	
	@GetMapping("/reservation/cancel")
	public String reservationCancel(@RequestParam("RESV_ID") int RESV_ID) {
		System.out.println("cancel..." + RESV_ID);
	    int SCHEDULE_ID = reservationDao.findScheduleIdByResvId(RESV_ID);
	    System.out.println("SCHEDULE_ID..." + SCHEDULE_ID);
	    reservationDao.deleteReservationById(RESV_ID);
	    reservationDao.updateScheduleUnbooked(SCHEDULE_ID);
	    return "redirect:/user/res/reservationStatus";
	}
}
