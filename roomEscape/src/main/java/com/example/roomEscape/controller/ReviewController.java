package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.roomEscape.dao.IReviewDAO;
import com.example.roomEscape.dto.ReviewDTO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private IReviewDAO reviewDao;

	@GetMapping("/show_review") // 테마에서 오는 해당 테마의 리뷰 보기 ,, 파라미터 받아줘야함
	public String show_review(Model model) {
		List<ReviewDTO> review_list = reviewDao.getAll();
		model.addAttribute("review_list", review_list);
		
		return "/user/board/review/show_review_list";
	}
	
	@GetMapping("/show_review2")
	@ResponseBody
	public List<ReviewDTO> show_review2() {
		List<ReviewDTO> review_list = reviewDao.getAll();
		System.out.println(review_list);
		return review_list;
	}
	
	// 필터 옵션에 맞춘 데이터 반환. 
	@GetMapping("/show_review_option")
	@ResponseBody
	public List<ReviewDTO> show_review_option(@RequestParam("select_value")String select) {
		
		if(select.equals("별점높은순")) {
			List<ReviewDTO> review = reviewDao.get_review_ratingDESC();
			return review ;
			
		} else if(select.equals("별점낮은순")) {
			List<ReviewDTO> review = reviewDao.get_review_rating();
			return review ;
			//최신순
		} else  {
			List<ReviewDTO> review = reviewDao.get_review_reg_date();
			return review ;
			
		} 
	}
	
	@GetMapping("/write_review")// id 세션값으로 받기 
	public String write_review(@RequestParam("member_id")String member_id,
							  @RequestParam("title")String title,
							  Model model) {
		// 예약 내역이 있는지 확인 필요.
		int check_result = reviewDao.check_reservation();
		// 있다면 리뷰 작성
		if(check_result == 1 ) {
			reviewDao.write_review();
		}else {
			
		}
		return "";
	}
	
	
	
	
	
}
