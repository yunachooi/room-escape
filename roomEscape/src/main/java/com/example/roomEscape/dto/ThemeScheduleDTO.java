package com.example.roomEscape.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ThemeScheduleDTO {
	private int schedule_id;
	private int theme_id;
	private Date resv_date;
	private int slot_id;
	private String is_booked;
}
