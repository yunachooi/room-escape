package com.example.roomEscape.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationDTO {
	private String MEMBER_NAME;
	private String BRANCH_NAME;
	private Date RESV_DATE;
	private String TIME_LABEL;
	private int NUM_PEOPLE;
	private String REQUEST_MSG;
	private String MEMBER_ID;
	private String THEME_TITLE;
	private String THEME_TYPE;
	private Integer SCHEDULE_ID;
	private Integer RESV_ID;
	private String PHONE;
	private int THEME_ID;
    private int RESERVATION_COUNT;
    private int isReviewed;
}
