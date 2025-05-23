package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.roomEscape.dto.ThemeTypeDTO;

@Mapper
public interface IThemeTypeDAO {
	
	List<ThemeTypeDTO> selectAll();
	
}
