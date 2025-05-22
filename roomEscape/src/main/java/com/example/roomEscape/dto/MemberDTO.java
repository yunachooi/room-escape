package com.example.roomEscape.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private String member_id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private String reg_date;
	private String role;
}
