package com.sjw.pwb.dto;

import java.util.List;

import lombok.Data;

@Data
public class AnswerDTO {
	private long a_number;
	private long s_number;
	private long q_number;
	private String m_id;
	private int a_answer;
	
	private List<AnswerDTO> AList;
}
