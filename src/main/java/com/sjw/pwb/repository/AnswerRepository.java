package com.sjw.pwb.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sjw.pwb.dto.AnswerDTO;
import com.sjw.pwb.dto.MyscoreDTO;
import com.sjw.pwb.dto.ReviewDTO;

@Repository
public class AnswerRepository {
	
	@Autowired
	private SqlSessionTemplate sql;

	public void submit(AnswerDTO answerDTO) {
		sql.insert("answer.submit", answerDTO);
		
	}

	public long q_score(AnswerDTO answerDTO) {
		long q_score;
		if(sql.selectOne("answer.q_score", answerDTO)==null)
			q_score = 0;
		else
			q_score = sql.selectOne("answer.q_score", answerDTO);
		return q_score;
	}

	public long q_quantity(long s_number) {
		return sql.selectOne("answer.s_quantity", s_number);
	}

	public void myscore(MyscoreDTO ms) {
		sql.insert("answer.myscore", ms);
	}

	public void review(ReviewDTO r) {
		sql.insert("answer.review", r);
	}

	public List<MyscoreDTO> findById_ms(String m_id) {
		return sql.selectList("answer.findById_ms", m_id);
	}

	public List<ReviewDTO> s_review(long s_number) {
		return sql.selectList("answer.s_review", s_number);
	}

	public double r_avg(long s_number) {
		return sql.selectOne("answer.r_avg", s_number);
	}
}
