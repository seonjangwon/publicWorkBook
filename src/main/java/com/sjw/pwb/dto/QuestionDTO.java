package com.sjw.pwb.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QuestionDTO {
	private long q_number;
	private long s_number;
	private String m_id;
	private String q_name;
	private MultipartFile q_file;
	private String q_filename;
	private String q_select1;
	private String q_select2;
	private String q_select3;
	private String q_select4;
	private String q_select5;
	private int q_answer;
	private String q_exposition;
	
	private List<QuestionDTO> qList;

	
	
}
