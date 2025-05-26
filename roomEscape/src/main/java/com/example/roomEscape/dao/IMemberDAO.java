package com.example.roomEscape.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.MemberDTO;

@Mapper
public interface IMemberDAO {

	void insert(MemberDTO member);

	Object selectById(String member_id);
	
	MemberDTO show_info(@Param("user") MemberDTO loginInfo);
}
