package com.example.roomEscape.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.MemberDTO;

@Mapper
public interface ILoginDAO {

	MemberDTO loginCheck(@Param("member_id")String member_id);
}
