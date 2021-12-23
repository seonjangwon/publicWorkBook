package com.sjw.pwb.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sjw.pwb.dto.CategoryDTO;
import com.sjw.pwb.dto.PageDTO;
import com.sjw.pwb.dto.QuestionDTO;
import com.sjw.pwb.dto.SubjectDTO;
import com.sjw.pwb.repository.QuestionRepository;

@Service
public class QuestionService {
	@Autowired
	private QuestionRepository qr;

	public void category(CategoryDTO c) {
		qr.category(c);
		
	}

	public long c_num(CategoryDTO c) {
		
		return qr.c_num(c);
	}

	public List<CategoryDTO> c_findAll() {
		
		return qr.c_findAll();
	}

	public void subject(SubjectDTO s) {
		qr.subject(s);
		
	}

	public long s_num(String s_name) {
		
		return qr.s_num(s_name);
	}

	public void write(QuestionDTO qdto)throws IllegalStateException, IOException {
		MultipartFile q_file =qdto.getQ_file();
		
		String q_filename = q_file.getOriginalFilename();
		
		q_filename = System.currentTimeMillis()+"-"+q_filename;
		
		String savePath = "D:\\development\\source\\Spring\\PublicWorkBook\\src\\main\\webapp\\resources\\upload\\"+q_filename;
		
		if(!q_file.isEmpty()) {
			q_file.transferTo(new File(savePath));
		}
		
		qdto.setQ_filename(q_filename);
		
		qr.write(qdto);
		
	}

	public List<SubjectDTO> sList(long c_number) {
		return qr.sList(c_number);
	}

	public List<QuestionDTO> qList(long s_number) {
		return qr.qList(s_number);
	}

	public List<SubjectDTO> findById(String m_id) {
		return qr.findById(m_id);
	}
	
	private static final int PAGE_LIMIT = 3;
	private static final int BLOCK_LIMIT = 3;
	
	public PageDTO paging(int page) {
		int questionPage = qr.count();
		int maxPage = (int)(Math.ceil((double)questionPage/PAGE_LIMIT));
		int startPage = ((((int)(Math.ceil((double)questionPage/BLOCK_LIMIT)))-1)*BLOCK_LIMIT+1);
		int endPage = startPage + BLOCK_LIMIT-1;
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		PageDTO p = new PageDTO();
		p.setPage(page);
		p.setMaxPage(maxPage);
		p.setStartPage(startPage);
		p.setEndPage(endPage);
		
		return p;
	}

	public List<QuestionDTO> s_findAll(int page) {
		int startPage = (page-1)*PAGE_LIMIT;
		Map<String, Integer> sMap = new HashMap<String, Integer>();
		sMap.put("start", startPage);
		sMap.put("limit", PAGE_LIMIT);
		
		return qr.s_findAll(sMap);
	}

	public void delete(long s_number) {
		qr.delete(s_number);
	}
}
