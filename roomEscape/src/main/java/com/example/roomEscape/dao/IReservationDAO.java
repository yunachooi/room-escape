package com.example.roomEscape.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.example.roomEscape.dto.ReservationDTO;

@Mapper
public interface IReservationDAO {
	List<ReservationDTO> reservationSelect();

	List<ReservationDTO> findReservationName(@Param("name") String NAME);

	String findMemberIdByName(@Param("name") String NAME);

	int findScheduleId(@Param("RESV_DATE") String RESV_DATE,
	                   @Param("TIME_LABEL") String TIME_LABEL,
	                   @Param("TITLE") String THEME_TITLE,
	                   @Param("NAME") String BRANCH_NAME,
	                   @Param("TYPE_NAME") String THEME_TYPE);

	void insertReservation(@Param("NUM_PEOPLE") int NUM_PEOPLE,
	                       @Param("REQUEST_MSG") String REQUEST_MSG,
	                       @Param("RESV_DATE") String RESV_DATE,
	                       @Param("MEMBER_ID") String MEMBER_ID,
	                       @Param("SCHEDULE_ID") int SCHEDULE_ID);

	void updateScheduleBooked(@Param("SCHEDULE_ID") int SCHEDULE_ID);
}
