package com.ecom4.green.user.service;

import java.util.List;
import java.util.Map;

import com.ecom4.green.user.dto.ReviewDTO;

public interface ReviewService {

	
	//review
		int insertReview(ReviewDTO reviewDTO);

		List<ReviewDTO> selectReviewList(String id);
		
		int updateReview(ReviewDTO reviewDTO);



		List<ReviewDTO> selectReviewList(ReviewDTO reviewDTO);

		ReviewDTO selectReview(ReviewDTO review);

		int deleteReview(ReviewDTO reviewDTO);

		int selectReviewTotalCountByMap(Map<String, Object> map);


}
