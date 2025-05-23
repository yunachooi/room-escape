package com.example.roomEscape.dto;

import lombok.Data;

@Data
public class ThemeDTO {
	private int theme_id;
	private String title;
	private String description;
	private String theme_level;
	private int duration;
	private int capacity_min;
	private int capacity_max;
	private String is_active;
	private Integer branch_id;
	private Integer type_id;
	private String branch_name; // 지점 이름
	private String type_name;

}
