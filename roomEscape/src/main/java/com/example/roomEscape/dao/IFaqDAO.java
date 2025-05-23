package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.FaqDTO;

@Mapper
public interface IFaqDAO {

	List<FaqDTO> getAll();

	void writeFaq(@Param("faq") FaqDTO faq);

	FaqDTO getFaqByFaqId(@Param("faq_id") String faq_id);

}
