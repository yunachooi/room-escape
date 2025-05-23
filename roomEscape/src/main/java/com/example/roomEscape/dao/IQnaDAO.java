package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.QnaAnswerDTO;
import com.example.roomEscape.dto.QnaDTO;

@Mapper
public interface IQnaDAO {


	List<QnaDTO> getAllQna();

	QnaDTO getOneNeedToAnswer(@Param("qna_id")int qna_id);

	void update_is_answered(@Param("qna_id") int qna_id);
}
