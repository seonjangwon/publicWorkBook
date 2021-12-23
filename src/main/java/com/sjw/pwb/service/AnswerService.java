package com.sjw.pwb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjw.pwb.dto.AnswerDTO;
import com.sjw.pwb.dto.MyscoreDTO;
import com.sjw.pwb.dto.ReviewDTO;
import com.sjw.pwb.repository.AnswerRepository;

@Service
public class AnswerService {
	@Autowired
	private AnswerRepository ar;

	public void submit(AnswerDTO answerDTO) {
		ar.submit(answerDTO);
		
	}

	public long q_score(AnswerDTO answerDTO) {
		return ar.q_score(answerDTO);
	}

	public long q_quantity(long s_number) {
		return ar.q_quantity(s_number);
	}

	public void myscore(MyscoreDTO ms) {
		ar.myscore(ms);
	}

	public void review(ReviewDTO r) {
		ar.review(r);
	}

	public List<MyscoreDTO> findById_ms(String m_id) {
		return ar.findById_ms(m_id);
	}
}
