package com.sjw.pwb.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sjw.pwb.dto.CategoryDTO;
import com.sjw.pwb.dto.QuestionDTO;
import com.sjw.pwb.dto.SubjectDTO;
import com.sjw.pwb.service.QuestionService;

@Controller
@RequestMapping(value="/question/*")
public class QuestionController {
	@Autowired
	private QuestionService qs;
	
	// 문제 출제
	@RequestMapping(value="question", method = RequestMethod.GET)
	public String question(Model model) {
		
		List<CategoryDTO> cList = qs.c_findAll();
		
		model.addAttribute("cList", cList);
		
		return "/question/question";
	}
	
	@RequestMapping(value="category", method = RequestMethod.POST)
	public String category(Model model, @ModelAttribute CategoryDTO c) {
		long c_num;
		if(c.getC_number()==0) {
			qs.category(c);
			c_num = qs.c_num(c);
		} else {
			c_num = c.getC_number();
		}
		model.addAttribute("c_num", c_num);
		return "/question/subject";// 과목 출제 페이지로
	}
	
	@RequestMapping(value="subject", method = RequestMethod.POST)
	public String subject(Model model, @ModelAttribute SubjectDTO s) {
		
		// 과목만들고
		qs.subject(s); 
		
		// 과목 번호 가져오고
		long s_num = qs.s_num(s.getS_name()); // 문제 숫자를 바꾸려면 DTO로 quantity값도 가져와야함
		model.addAttribute("s_num", s_num);
		
		return "/question/write";
	}
	
	@RequestMapping(value="write", method = RequestMethod.POST)
	public String write(@ModelAttribute QuestionDTO q) throws IllegalStateException, IOException {
		System.out.println(q.getQList().get(0));
		System.out.println(q.getQList());
		for(int i=0;i<q.getQList().size();i++) {
		System.out.println(i+" "+q.getQList().get(i));
		qs.write(q.getQList().get(i));
		}
		
		return "index"; // 문제 보는 화면으로 가자
	}
	
	
	// 문제 풀기
	@RequestMapping(value="solve", method = RequestMethod.GET)
	public String solve(Model model) {
		List<CategoryDTO> cList =qs.c_findAll();
		model.addAttribute("cList", cList);
		
		return "/question/solve";
	}
	
	@RequestMapping(value="category_select", method = RequestMethod.GET)
	public String category_select(@RequestParam("c_number") long c_number, Model model) {
		List<SubjectDTO> sList = qs.sList(c_number);
		model.addAttribute("sList", sList);
		
		return "/question/select";
	}
	
	@RequestMapping(value="detail", method = RequestMethod.GET)
	public String detail(@RequestParam("s_number") long s_number, Model model) {
		List<QuestionDTO> qList = qs.qList(s_number);
		model.addAttribute("qList", qList);
		
		return "/question/detail";
	}
	
}
