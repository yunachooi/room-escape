package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.roomEscape.dto.BranchDTO;

@Mapper
public interface IBranchDAO {
    List<BranchDTO> getAll();
    BranchDTO getOne(int branchId);
    void insert(BranchDTO branch);
    void update(BranchDTO branch);
    void delete(int branchId);
}
