package com.example.roomEscape.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ThemeFlatDTO {
	private String TITLE;
    private String TYPE_NAME;
    private boolean IS_BOOKED;
    private String TIME_LABEL;
    private LocalDate RESV_DATE;
    private int RESV_ID;
}