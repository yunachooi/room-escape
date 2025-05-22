package com.example.roomEscape.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ThemeScheduleDTO {
	private int scheduleId;
	private int themeId;
	private Date resvDate;
	private int slotId;
	private String isBooked;
}
