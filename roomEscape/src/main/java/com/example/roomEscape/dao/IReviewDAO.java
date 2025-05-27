package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.ReviewDTO;

@Mapper
public interface IReviewDAO {

	List<ReviewDTO> getAll();
	//평점 높은순
	List<ReviewDTO> get_review_ratingDESC();
	//평점 낮은순
	List<ReviewDTO> get_review_rating();
	//최신순
	List<ReviewDTO> get_review_reg_date();
	// 리뷰 theme_id 에 따라 가져오기
	List<ReviewDTO> get_review_by_theme_id(@Param("theme_id") String theme_id);
	
	//리뷰 작성하기
	void write_review();
	// 리뷰 작성이 가능한 사용자인지 예약 확인
	int check_reservation(@Param("member_id")String member_id, 
						  @Param("title")String title, 
						  @Param("theme_id") String theme_id);
	
	void insert_review(@Param("review") ReviewDTO review);
	
	int check_write_review(@Param("review")ReviewDTO review);
	
	int checkReviewExists(@Param("resv_id") int resv_id);
	// 특정 테마 평점높은순 
	List<ReviewDTO> get_review_ratingDESC_theme_id(@Param("theme_id") String theme_id);
	// 특정 테마 평점낮은순
	List<ReviewDTO> get_review_rating_theme_id(@Param("theme_id") String theme_id);
	// 특정 테마 최신순
	List<ReviewDTO> get_review_reg_date_theme_id(@Param("theme_id") String theme_id);

}
