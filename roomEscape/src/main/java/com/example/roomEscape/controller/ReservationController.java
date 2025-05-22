package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.roomEscape.dao.IReservationDAO;
import com.example.roomEscape.dto.ReservationDTO;

@Controller
public class ReservationController {
	@Autowired
	IReservationDAO reservationDao;

	@GetMapping("/")
	public String root() {
		return "index";
	}

	@GetMapping("/reservation")
	public String reservation(Model model) {
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
}
