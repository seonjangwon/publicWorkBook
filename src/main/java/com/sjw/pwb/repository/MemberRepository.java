package com.sjw.pwb.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sjw.pwb.dto.MemberDTO;

@Repository
public class MemberRepository {
	
	@Autowired
	private SqlSessionTemplate sql;

	public void signup(MemberDTO m) {
		sql.insert("member.signup", m);
		
	}

	public String idch(String m_id) {
		
		return sql.selectOne("member.idch", m_id);
	}

	public MemberDTO login(MemberDTO m) {
		
		return sql.selectOne("member.login", m);
	}

	public void update(MemberDTO m) {
		sql.update("member.update", m);
		
	}

	public String pwch(MemberDTO m) {
		
		return sql.selectOne("member.pwch", m);
	}

	public int count() {
		return sql.selectOne("member.count");
	}

	public List<MemberDTO> pagingList(Map<String, Integer> mMap) {
		
		return sql.selectList("member.paging", mMap);
	}

	public void m_delete(String m_id) {
		sql.delete("member.m_delete",m_id);
		
	} 
}
