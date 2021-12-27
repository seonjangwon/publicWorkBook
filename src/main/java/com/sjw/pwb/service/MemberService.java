package com.sjw.pwb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sjw.pwb.dto.MemberDTO;
import com.sjw.pwb.dto.PageDTO;
import com.sjw.pwb.repository.MemberRepository;

@Service
public class MemberService {

	@Autowired
	private MemberRepository mr;
	@Autowired
	private HttpSession session;

	public void signup(MemberDTO m) {
		mr.signup(m);

	}

	public String idch(String m_id) {
		String result = mr.idch(m_id);

		if (result == null)
			return "no";
		else
			return "ok";
	}

	public String login(MemberDTO m) {
		MemberDTO login = mr.login(m);
		if (login == null) {
			return "/member/signin";
		} else {
			session.setAttribute("loginDTO", login);
			return "index";
		}
	}

	public void update(MemberDTO m) {
		mr.update(m);

	}

	public String pwch(MemberDTO m) {
		String result = mr.pwch(m);

		if (result == null) {
			return "no";
		} else {
			return "ok";
		}
	}

	private static final int PAGE_LIMIT = 3;
	private static final int BLOCK_LIMIT = 3;

	public PageDTO paging(int page) {
		int memberCount = mr.count();
		int maxPage = (int) (Math.ceil((double) memberCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;
		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageDTO p = new PageDTO();
		p.setPage(page);
		p.setMaxPage(maxPage);
		p.setStartPage(startPage);
		p.setEndPage(endPage);

		return p;
	}

	public List<MemberDTO> pagingList(int page) {
		int startpage = (page - 1) * PAGE_LIMIT;
		Map<String, Integer> mMap = new HashMap<String, Integer>();
		mMap.put("start", startpage);
		mMap.put("limit", PAGE_LIMIT);

		return mr.pagingList(mMap);
	}

	public void m_delete(String m_id) {
		mr.m_delete(m_id);

	}
}
