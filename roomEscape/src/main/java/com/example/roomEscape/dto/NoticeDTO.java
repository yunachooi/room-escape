package com.example.roomEscape.dto;

import java.util.Date;
import lombok.Data;

@Data
public class NoticeDTO {
	private int noticeId;
	private String title;
	private String content;
	private Date regDate;
	private String adminId;
}
