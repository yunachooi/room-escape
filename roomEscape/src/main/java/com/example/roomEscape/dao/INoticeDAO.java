package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.roomEscape.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {
    List<NoticeDTO> getAll();
    void insert(NoticeDTO dto);
    void delete(int noticeId);
}
