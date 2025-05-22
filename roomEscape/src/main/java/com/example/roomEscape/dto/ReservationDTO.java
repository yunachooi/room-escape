package com.example.roomEscape.dto;

import lombok.Data;

@Data
public class ReservationDTO {
	private int resv_id;
	private int num_people;
	private String request_msg;
	private String resv_date;
	private String member_id;
	private int schedule_id;
}
