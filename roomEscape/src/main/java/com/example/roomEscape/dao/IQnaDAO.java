package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.QnaAnswerDTO;
import com.example.roomEscape.dto.QnaDTO;

@Mapper
public interface IQnaDAO {

	// QnA 전부 가져오기
	List<QnaDTO> getAllQna();
	// QnA 날짜 최신순으로 가져오기
	List<QnaDTO> getAllQna_desc();
	// 답변 안된 QnA를 qna_id 를 통해 1개 가져오기 
	QnaDTO getOneNeedToAnswer(@Param("qna_id")int qna_id);
	// 답변 완료 직후 in_answered 를 'Y'로 업데이트하기
	void update_is_answered(@Param("qna_id") int qna_id);
	// 유저가 QnA 작성할 때 INSERT 하기 
	void write_qna(@Param("qna")QnaDTO qna);
	// qna_id 로 한개의 qna 가져오기 ( 상세보기 )
	QnaDTO get_one_qna_by_qna_id(@Param("qna_id") int qna_id);
	// QnA user 의 입력대로 수정하기.
	void update_qna(@Param("qna") QnaDTO qna);
	// QnA 삭제
	void delete_qna(@Param("qna") QnaDTO qna);
	// QnA 검색 및 가져오기
	List<QnaDTO> get_search_qna(@Param("type") String type, 
								@Param("keyword") String keyword);
}
