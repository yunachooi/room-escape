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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.roomEscape.dao.IReservationDAO;
import com.example.roomEscape.dao.IThemeFlatDAO;
import com.example.roomEscape.dto.ReservationDTO;
import com.example.roomEscape.dto.ThemeFlatDTO;

@Controller
public class ReservationController {
	@Autowired
	IReservationDAO reservationDao;
	@Autowired
    private IThemeFlatDAO themeFlatDAO;


	@GetMapping("/")
	public String root() {
		System.out.println("root...");
		return "index";
	}

	@GetMapping("/reservation")
	public String reservation(Model model) {
		System.out.println("reservation...");
		List<ReservationDTO> list = reservationDao.reservationSelect();
		System.out.println(list);

		model.addAttribute("list", list);
		return "/admin/reservation/reservation";
	}

	@PostMapping("/reservation")
	public String findTheReservation(@RequestParam("NAME") String NAME, Model model) {
		System.out.println("FindTheReservation... " + NAME);

		List<ReservationDTO> list = reservationDao.findReservationName(NAME);
		System.out.println("FindReservationName... " + list);

		model.addAttribute("list", list);
		return "/admin/reservation/reservation";
	}
	
	@GetMapping("/reservationChart")
	public String reservationChartPage(Model model) {
	    System.out.println("reservationChartPage...");
	    
	    List<ReservationDTO> list = reservationDao.reservationSelect();
	    model.addAttribute("list", list);
	    return "/admin/reservation/reservation";
	}

	@GetMapping("/chart-data")
	public @ResponseBody Map<String, Object> getChartData(@RequestParam("find_date") String findDate) {
	    System.out.println("getChartData...");
		
	    List<String> labels = Arrays.asList("강남점", "홍대점", "잠실점");
	    List<Integer> data = Arrays.asList(12, 19, 7);

	    Map<String, Object> result = new HashMap<>();
	    result.put("labels", labels);
	    result.put("data", data);

	    return result;
	}
	
	@GetMapping("/userReservation")
	public String userReservation(
	        @RequestParam(value="find_date", required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate find_date,
	        @RequestParam(value="branch", required = false) String branch,
	        Model model) {

	    System.out.println("userReservation called with find_date=" + find_date + ", branch=" + branch);

	    if (find_date == null) {
	        find_date = LocalDate.now();
	    }
	    if (branch == null || branch.isEmpty()) {
	        branch = "강남점";
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
	    @RequestParam("title") String title,
	    @RequestParam("theme_type") String theme_type,
	    @RequestParam("time") String time,
	    @RequestParam(value = "date", required = false) String date,
	    @RequestParam(value = "branch", required = false) String branch, Model model) {

	    if (date == null) date = LocalDate.now().toString();
	    if (branch == null) branch = "강남점";

	    System.out.println("reservationInfo..." + title + "..." + date + "..." + branch + "..." + theme_type + "..." + time);
	    
	    model.addAttribute("title", title);
	    model.addAttribute("theme_type", theme_type);
	    model.addAttribute("time", time);
	    model.addAttribute("date", date);
	    model.addAttribute("branch", branch);

	    return "/user/reservation/reservationInfo";
	}
	
	@GetMapping("/reservationStatus")
	public String reservationStatus() {
		System.out.println("reservationStatus...");
		return "/user/reservation/reservationStatus";
	}
}
