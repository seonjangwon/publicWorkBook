package com.sjw.pwb.dto;

import lombok.Data;

@Data
public class ReviewDTO {
	private long r_number;
	private long s_number;
	private String m_id;
	private double r_score;
	private String r_contents;
}
