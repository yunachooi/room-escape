package com.example.roomEscape.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.roomEscape.dto.ReservationDTO;

@Mapper
public interface IReservationDAO {
	List<ReservationDTO> reservationSelect();
	List<ReservationDTO> findReservationName(@Param("NAME") String NAME);
}
