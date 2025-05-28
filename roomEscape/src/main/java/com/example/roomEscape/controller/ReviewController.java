package com.example.roomEscape.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.roomEscape.dao.IReviewDAO;
import com.example.roomEscape.dto.MemberDTO;
import com.example.roomEscape.dto.ReviewDTO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private IReviewDAO reviewDao;

	@GetMapping("/show_review") 
	public String show_review(@RequestParam(value="theme_id", required = false)String theme_id,
			Model model) {
		List<ReviewDTO> review_list;
		if(theme_id != null && !theme_id.isEmpty()) {
			review_list = reviewDao.get_review_by_theme_id(theme_id);
			model.addAttribute("review_list", review_list);
			model.addAttribute("theme_id", theme_id);
			System.out.println("테스트중2 ..........."+theme_id);
			
		}else {
			review_list = reviewDao.getAll();
			model.addAttribute("review_list", review_list);
		}
		
		return "/user/board/review/show_review_list";
	}
	
	@GetMapping("/show_review2")
	@ResponseBody
	public List<ReviewDTO> show_review2() {
		List<ReviewDTO> review_list = reviewDao.getAll();
		return review_list;
	}
	
	// 필터 옵션에 맞춘 데이터 반환. 
	@GetMapping("/show_review_option")
    @ResponseBody
    public List<ReviewDTO> show_review_option(@RequestParam("select_value") String select,
                                              @RequestParam(value = "theme_id", required = false) String theme_id) {

        System.out.println("필터 선택: " + select + ", 테마 ID: " + theme_id);

        // 조건 분기
        boolean hasTheme = theme_id != null && !theme_id.isEmpty();

	        switch (select) {
	            case "별점높은순":
	                return hasTheme ?
	                    reviewDao.get_review_ratingDESC_theme_id(theme_id) :
	                    reviewDao.get_review_ratingDESC();
	
	            case "별점낮은순":
	                return hasTheme ?
	                    reviewDao.get_review_rating_theme_id(theme_id) :
	                    reviewDao.get_review_rating();
	
	            case "최신순":
	                return hasTheme ?
	                    reviewDao.get_review_reg_date_theme_id(theme_id) :
	                    reviewDao.get_review_reg_date();
	
	            // ✅ "전체 보기" 또는 잘못된 값일 경우 전체 리스트 반환
	            default:
	                return hasTheme ?
	                    reviewDao.get_review_by_theme_id(theme_id) :
	                    reviewDao.getAll();
	        }
    }
	
	@GetMapping("/write_review")// id 세션값으로 받기 
	public String write_review(@RequestParam("title")String title,
								@RequestParam("theme_id")String theme_id,
								@RequestParam("resv_id")String resv_id,
								HttpSession session,
							  Model model,
							  RedirectAttributes rttr) {
		MemberDTO loginInfo = (MemberDTO)session.getAttribute("loginInfo");
		
		// 예약 내역이 있는지 확인 필요.
		int check_result = reviewDao.check_reservation(loginInfo.getMember_id(),title,theme_id);
		// 있다면 리뷰 작성
		if(check_result == 0 ) {
			rttr.addFlashAttribute("error", "해당 테마를 예약한 이력이 없습니다.");
			return "redirect:/user/res/userReservation";
		}else {
			model.addAttribute("theme_id", theme_id);
			model.addAttribute("title", title);
			model.addAttribute("resv_id", resv_id);
			return "/user/board/review/write_review";
		}
	}
	
	
	@GetMapping("/insert_review")
	public String insert_review(ReviewDTO review,
								Model model) {
		System.out.println("review" + review);
		reviewDao.insert_review(review);
		return "redirect:/user/res/reservationStatus";
	}
	
	
}
