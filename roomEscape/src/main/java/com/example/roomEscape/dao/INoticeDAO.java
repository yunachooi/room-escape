package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {
    List<NoticeDTO> getAll();
    void insert(NoticeDTO dto);
    void delete(int noticeId);
    NoticeDTO selectById(int noticeId); 
    
 // 페이징 관련 추가
    List<NoticeDTO> getPaged(@Param("offset") int offset, @Param("limit") int limit);
    int getTotalCount();
}
