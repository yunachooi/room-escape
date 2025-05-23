package com.example.roomEscape.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QnaAnswerDTO {

	private int qna_id;
	private String answer;
	private Date reg_date;
	private String admin_id;
}
