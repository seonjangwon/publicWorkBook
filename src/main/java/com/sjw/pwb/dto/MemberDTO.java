package com.sjw.pwb.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private long m_number;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_email;
	private String m_phone;
	private MemberType m_type;
	
	
	
	
}

//enum Membertype {
//	teacher, student, admin
//}