package com.example.roomEscape.dto;

import lombok.Data;

@Data
public class ThemeDTO {
	private int themeId;
	private String title;
	private String description;
	private String themeLevel;
	private int duration;
	private int capacityMin;
	private int capacityMax;
	private String isActive;
}
