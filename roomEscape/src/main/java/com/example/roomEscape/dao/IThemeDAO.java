package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.roomEscape.dto.ThemeDTO;

@Mapper
public interface IThemeDAO {
	
    List<ThemeDTO> selectAll();
    
    ThemeDTO selectById(int theme_id);
    
    void insert(ThemeDTO theme);
    
    void update(ThemeDTO theme);
    
    void delete(int theme_id);
    
}
