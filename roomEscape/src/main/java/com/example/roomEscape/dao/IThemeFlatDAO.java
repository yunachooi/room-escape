package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.ThemeFlatDTO;

@Mapper
public interface IThemeFlatDAO {
	 List<ThemeFlatDTO> getThemesFlat(@Param("find_date") String find_date, @Param("branch") String branch);
}
