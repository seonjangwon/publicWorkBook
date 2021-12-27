package com.sjw.pwb.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sjw.pwb.dto.CategoryDTO;
import com.sjw.pwb.dto.QuestionDTO;
import com.sjw.pwb.dto.SubjectDTO;

@Repository
public class QuestionRepository {
	@Autowired
	private SqlSessionTemplate sql;

	public void category(CategoryDTO c) {
		sql.insert("question.category", c);
		
	}

	public long c_num(CategoryDTO c) {
		if(sql.selectOne("question.c_num", c)==null) {
			return 0;
		} else {
			return sql.selectOne("question.c_num", c);	
		}
	}

	public List<CategoryDTO> c_findAll() {
		return sql.selectList("question.c_findAll");
	}

	public void subject(SubjectDTO s) {
		sql.insert("question.subject", s);
		
	}

	public long s_num(String s_name) {
		
		return sql.selectOne("question.s_num", s_name);
	}

	public void write(QuestionDTO qdto) {
		sql.insert("question.write", qdto);
		
	}

	public List<SubjectDTO> sList(long c_number) {
		return sql.selectList("question.sList", c_number);
	}

	public List<QuestionDTO> qList(long s_number) {
		return sql.selectList("question.qList", s_number);
	}

	public List<SubjectDTO> findById(String m_id) {
		return sql.selectList("question.findById", m_id);
	}

	public int count() {
		return sql.selectOne("question.count");
	}

	public List<SubjectDTO> s_findAll(Map<String, Integer> sMap) {
		return sql.selectList("question.s_findAll", sMap);
	}

	public void delete(long s_number) {
		sql.delete("question.s_delete", s_number);
	}
}
