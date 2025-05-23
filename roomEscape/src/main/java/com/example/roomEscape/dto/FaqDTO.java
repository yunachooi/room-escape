package com.example.roomEscape.dto;

import lombok.Data;

@Data

public class FaqDTO {

	private int faq_id;
	private String question;
	private String answer;
	private String admin_id;
}
