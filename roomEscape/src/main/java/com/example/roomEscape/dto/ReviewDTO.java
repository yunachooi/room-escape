package com.example.roomEscape.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {

	private int review_id;
	private int rating;
	private String content;
	private Date reg_date;
	private int theme_id;
	private String member_id;
	private int resv_id;
	
}
