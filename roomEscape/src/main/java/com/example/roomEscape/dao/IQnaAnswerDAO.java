package com.example.roomEscape.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.QnaAnswerDTO;

@Mapper
public interface IQnaAnswerDAO {

	void writeAnswer();

	void upload_answer(@Param("ans") QnaAnswerDTO qna_answer);

	QnaAnswerDTO get_one_by_qna_id(@Param("qna_id")int qna_id);


}
