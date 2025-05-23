package com.example.roomEscape.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.roomEscape.dto.EventDTO;

@Mapper
public interface IEventDAO {
	
    void insert(EventDTO event);
    
    List<EventDTO> selectAll();
    
    EventDTO selectById(int event_id);
    
    void update(EventDTO event);
    
    void delete(int event_id);
    
}