package com.sjw.pwb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sjw.pwb.dto.AnswerDTO;
import com.sjw.pwb.dto.MyscoreDTO;
import com.sjw.pwb.dto.QuestionDTO;
import com.sjw.pwb.dto.ReviewDTO;
import com.sjw.pwb.service.AnswerService;
import com.sjw.pwb.service.QuestionService;

@Controller
@RequestMapping(value="/answer/*")
public class AnswerController {
	@Autowired
	private AnswerService as;
	@Autowired
	private QuestionService qs;
	
	@RequestMapping(value="submit", method = RequestMethod.POST)
	public String submit(@ModelAttribute AnswerDTO a, Model model) {
		
		for(int i=0;i<a.getAList().size();i++) { // 저장은 했고
			as.submit(a.getAList().get(i));
		}
		
		double score=0.0; // 총점수
		// 1문제당 점수 100/q_qusntity로 계산하자
		double q_score = (double)(100 / as.q_quantity(a.getAList().get(0).getS_number())); 
		System.out.println(q_score);
		// AnswerDTO의 s_number로 QuestionDTO를 리스트에 담아서 가져오고
		// 굳이 리스트로 담아와야 할까...?
		// QuestonDTO의 q_answer와 AnswerDTO의 a_answer를 비교해서 같으면 socre점수에 q_socore점수를 추가
		
		
//		for(int i=0;i<a.getAList().size();i++) { 
//			// AnswerDTO를 보내서 q_number와 a_answer를 QuestionDTO의 q_number와 q_answer과 비교해서 맞으면 q_number를 가져오자
//			long q_num = as.q_score(a.getAList().get(i));
//			if(q_num!=0) {
//				score += q_score;
//			}
//		} // 잠깐만 그럼 해설 출력은...?
		
		// 리스트를 가져와서
		List<QuestionDTO> qList = qs.qList(a.getAList().get(1).getS_number()); 
		// 이거는 틀린 애들 담을 리스트야
		List<QuestionDTO> falseList = new ArrayList<QuestionDTO>();
		// for문으로 비교하고 
		for (int i=0;i<a.getAList().size();i++) {
			if (a.getAList().get(i).getA_answer()==qList.get(i).getQ_answer()) {
				// 점수 추가
				score += q_score;
			} else {
				// 해설 출력 해야하는데 
				falseList.add(qList.get(i));
			}
		}
		// 틀린 애들(리스트)을 모델로 가져가자
		model.addAttribute("falseList", falseList);
		// 점수도 가져가야지
		model.addAttribute("score", score);
		System.out.println(score);
		// 점수DTO
		MyscoreDTO ms = new MyscoreDTO();
		ms.setS_number(a.getAList().get(0).getS_number());
		ms.setM_id(a.getAList().get(0).getM_id());
		ms.setMs_score(score);
		System.out.println(ms);
		as.myscore(ms); // 점수 저장
		
		return "/question/result"; // 결과 페이지로
	}
	
	
	@RequestMapping(value="review", method = RequestMethod.POST)
	public String review(@ModelAttribute ReviewDTO r) {
		System.out.println(r);
		as.review(r);
		
		
		return "index";
	}
	
}
