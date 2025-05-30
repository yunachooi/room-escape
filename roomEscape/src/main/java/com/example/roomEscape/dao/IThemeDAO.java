package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.ThemeDTO;

@Mapper
public interface IThemeDAO {
	
    List<ThemeDTO> selectAll();
    
    ThemeDTO selectById(int theme_id);
    
    void insert(ThemeDTO theme);
    
    void update(ThemeDTO theme);
    
    void delete(int theme_id);

    List<ThemeDTO> getFilteredThemes(
    	    @Param("branch_id") Integer branch_id,
    	    @Param("type_id") Integer type_id,
    	    @Param("theme_level") String theme_level,
    	    @Param("people") Integer people
    	);
    
    List<ThemeDTO> getThemesByRating();
    List<ThemeDTO> getThemesByReviewCount();

}

