package com.example.roomEscape.dto;

import java.util.Date;

import lombok.Data;
@Data
public class QnaDTO {


	private int qna_id;
	private String title;
	private String content;
	private String password;
	private Date reg_date;
	private String member_id;
	private String is_answered ;
	
	
}
