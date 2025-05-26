package com.example.roomEscape.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.roomEscape.dao.IReservationDAO;
import com.example.roomEscape.dao.IThemeFlatDAO;
import com.example.roomEscape.dto.ReservationDTO;

@Controller
@RequestMapping("/admin/res")
public class AdminReservationController {
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
	@ResponseBody
	public Map<String, Object> getChartData(@RequestParam("find_date") String findDate) {
	    System.out.println("find_date..." + findDate);

	    List<ReservationDTO> list = reservationDao.getMonthlyBranchReservationCount(findDate);
	    System.out.println(list);

	    List<String> labels = new ArrayList<>();
	    List<Integer> data = new ArrayList<>();

	    for (ReservationDTO dto : list) {
	        labels.add(dto.getBRANCH_NAME());
	        data.add(dto.getRESERVATION_COUNT());
	    }

	    Map<String, Object> result = new HashMap<>();
	    result.put("labels", labels);
	    result.put("data", data);

	    return result;
	}

}
