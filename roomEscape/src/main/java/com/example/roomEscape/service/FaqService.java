package com.example.roomEscape.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.roomEscape.dao.IFaqDAO;
import com.example.roomEscape.dto.FaqDTO;

@Service
public class FaqService {
	
	@Autowired
	private IFaqDAO faqDao;

	public List<FaqDTO> getAll() {
		List<FaqDTO> faqList = faqDao.getAll();
		return faqList;
	}
	
}
