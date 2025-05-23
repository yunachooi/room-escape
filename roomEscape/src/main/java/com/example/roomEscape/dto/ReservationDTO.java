package com.example.roomEscape.dto;

import lombok.Data;

@Data
public class ReservationDTO {
	private String member_name;
	private String branch_name;
	private String resv_date;
	private String time_label;
	private int num_people;
	private String request_msg;
	private String member_id; 

}
