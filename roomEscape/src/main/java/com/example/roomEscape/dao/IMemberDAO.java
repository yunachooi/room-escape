package com.example.roomEscape.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.roomEscape.dto.MemberDTO;

@Mapper
public interface IMemberDAO {

	void insert(MemberDTO member);

	Object selectById(String member_id);
	
}
