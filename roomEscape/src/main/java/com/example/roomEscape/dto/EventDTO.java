package com.example.roomEscape.dto;

import java.util.Date;

import lombok.Data;

@Data
public class EventDTO {
	private int event_id;
	private String title;
	private String content;
	private String start_date;
	private String end_date;
	private String is_active;
	private Date reg_date;
}
