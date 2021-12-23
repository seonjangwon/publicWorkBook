package com.sjw.pwb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sjw.pwb.dto.MemberDTO;
import com.sjw.pwb.dto.MemberType;
import com.sjw.pwb.dto.MyscoreDTO;
import com.sjw.pwb.dto.PageDTO;
import com.sjw.pwb.dto.QuestionDTO;
import com.sjw.pwb.dto.ReviewDTO;
import com.sjw.pwb.dto.SubjectDTO;
import com.sjw.pwb.service.AnswerService;
import com.sjw.pwb.service.MemberService;
import com.sjw.pwb.service.QuestionService;

@Controller
@RequestMapping(value="/member/*")
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private QuestionService qs;
	@Autowired
	private AnswerService as;
	@Autowired
	private HttpSession session;
	
	//회원가입
	@RequestMapping(value="signup", method = RequestMethod.GET)
	public String signup() {
		return "/member/signup";
	}
	
	@RequestMapping(value="t_signup", method = RequestMethod.GET)
	public String t_signup_page() {
		return "/member/t_signup";
	}
	
	@RequestMapping(value="s_signup", method = RequestMethod.GET)
	public String s_signup_page() {
		return "/member/s_signup";
	}
	
	@RequestMapping(value="signup", method = RequestMethod.POST)
	public String signup(@ModelAttribute MemberDTO m) {
		ms.signup(m);
		return "index";
	}
	
	@RequestMapping(value="idch", method = RequestMethod.POST)
	@ResponseBody
	public String idch(@RequestParam("m_id") String m_id) {
		
		String result = ms.idch(m_id);
		
		return result;
	}
	
	// 로그인
	@RequestMapping(value="signin", method = RequestMethod.GET)
	public String login_page() {
		return "/member/signin";
	}
	
	@RequestMapping(value="login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO m) {
		String result = ms.login(m);
		return result;
	}
	
	// 로그아웃
	@RequestMapping(value="signout", method = RequestMethod.GET)
	public String logout() {
		session.invalidate();
		return "index";
	}
	
	// 마이 페이지
	@RequestMapping(value="t_mypage", method = RequestMethod.GET)
	public String t_mypage() {
		return "/member/t_mypage";
	}
	
	@RequestMapping(value="s_mypage", method = RequestMethod.GET)
	public String s_mypage() {
		return "/member/s_mypage";
	}
	
	
	// 수정 페이지
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String update_page() {
		return "/member/update";
	}
	
	// 비밀번호 체크
	@RequestMapping(value="pwch", method = RequestMethod.POST)
	@ResponseBody
	public String pwch(@ModelAttribute MemberDTO m) {
		
		return ms.pwch(m);
	}
	
//	@SuppressWarnings("unlikely-arg-type") // 이건 왜 쓰냐
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(@ModelAttribute MemberDTO m) {
		ms.update(m);
		
		logout();
		login(m);
		
		if(m.getM_type().equals(MemberType.teacher)) {//이게 될지 모르겠는데 해봐야지
			return "redirect:/member/t_mypage";
		}else {
			return "redirect:/member/s_mypage";
		}
	}
	
	
	// 관리자 페이지
	@RequestMapping(value="admin", method = RequestMethod.GET)
	public String admin() {
		return "/member/admin";
	}
	
	@RequestMapping(value="m_findAll", method = RequestMethod.GET)
	public String m_findAll(Model model, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		PageDTO p = ms.paging(page);
		List<MemberDTO> mList = ms.pagingList(page);
		
		model.addAttribute("page", p);
		model.addAttribute("mList", mList);
		
		return"/member/m_findAll";
	}
	
	@RequestMapping(value="m_delete", method = RequestMethod.GET)
	public String m_delete(@RequestParam("page") int page, @RequestParam("m_id") String m_id ) {
		
		ms.m_delete(m_id);
		
		return "redirect:/member/m_findAll?page="+page;
	}
	
	@RequestMapping(value="q_findAll", method = RequestMethod.GET)
	public String q_findAll(Model model, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		
		PageDTO p = qs.paging(page);
		List<QuestionDTO> sList = qs.s_findAll(page);
//		List<List<ReviewDTO>> rList = as.findById_r();
		
		model.addAttribute("sList", sList);
//		model.addAttribute("rList", rList);
		model.addAttribute("page", p);
		
		return "/member/q_findAll";
	}
	
	@RequestMapping(value="q_delete", method = RequestMethod.GET)
	public String q_delete(@RequestParam("s_number") long s_number, @RequestParam("page") int page) {
		
		qs.delete(s_number);
		
		return "/member/q_findALL?page="+page;
	}
	
	
	// 내 문제 보기
	@RequestMapping(value="t_myquestion", method = RequestMethod.GET)
	public String t_myquestion(Model model, @RequestParam("m_id") String m_id) {
		
		List<SubjectDTO> sList = qs.findById(m_id);
		
		model.addAttribute("sList", sList);
		
		return "/member/t_myquestion";
	}
	
	
	// 내가 푼 문제
	@RequestMapping(value="s_myanswer", method = RequestMethod.GET)
	public String s_myanswer(Model model, @RequestParam("m_id") String m_id) {
		
		List<MyscoreDTO> msList = as.findById_ms(m_id);
		
		model.addAttribute("msList", msList);
		
		return "/member/s_myanswer";
	}
	
	
	// 네이버 로그인
	@RequestMapping(value="navercallback", method = RequestMethod.GET)
	public String naverlogin() {
		
		
		return "index";
	}

}
