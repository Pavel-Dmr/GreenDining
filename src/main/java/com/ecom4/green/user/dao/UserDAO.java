package com.ecom4.green.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.dto.CartDTO;
import com.ecom4.green.user.dto.QnaDTO;

@Mapper
public interface UserDAO
{

        int insertAddress(AddressDTO addressDTO);

        List<AddressDTO> selectAddressList(@Param("user_id") String id);

        int updateAddress(AddressDTO addressDTO);

        int deleteAddress(AddressDTO addressDTO);

        //review
        int insertReview(ReviewDTO reviewDTO);


        //	List<ReviewDTO> selectReviewList(int id);
        List<ReviewDTO> selectReviewList(ReviewDTO reviewDTO);

        int updateReview(ReviewDTO reviewDTO);

        int deleteReview(ReviewDTO reviewDTO);

        //QnA ----------------------------------------------------------------
        int insertQna(QnaDTO qnaDTO);

        List<QnaDTO> selectQnaList(QnaDTO qnaDTO);

        QnaDTO selectQnaDetail(@Param("id") int qna_id);

        int updateQna(QnaDTO qnaDTO);

        int deleteQna(QnaDTO qnaDTO);

        QnaDTO qnaUp(QnaDTO qnaDto);


        AddressDTO selectAddress(@Param("map") Map<String, Object> map);

        UserDTO getOrderUser(String userId);

        AddressDTO getOrderAddress(@Param("address_id") int address_id);

        int getAddressIdByOrderId(@Param("order_id") int order_id);

        AddressDTO selectAddressById(@Param("address_id") int addressId);
}
