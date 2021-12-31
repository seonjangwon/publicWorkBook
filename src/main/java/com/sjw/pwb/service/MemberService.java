package com.sjw.pwb.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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

		if (result != null)
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

	public String getAccessToken (String auth_code) { 
		String access_token = ""; 
		String refresh_token = ""; 
		String reqURL = "https://kauth.kakao.com/oauth/token"; 
		try { URL url = new URL(reqURL); HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
		// POST 요청을 위해 기본값이 false인 setDoOutput을 true로 
		conn.setRequestMethod("POST"); conn.setDoOutput(true); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream())); 
		StringBuilder sb = new StringBuilder(); 
		sb.append("grant_type=authorization_code"); 
		sb.append("&client_id=5156cbc6620cde3e4649044a00f0dd0d"); 
		sb.append("&redirect_uri=http://localhost:8087/member/kakaologin"); 
		sb.append("&code=" + auth_code); 
		bw.write(sb.toString()); 
		bw.flush(); 
		// 결과 코드가 200이라면 성공 
		int responseCode = conn.getResponseCode(); System.out.println("responseCode : " + responseCode); 
		//요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기 
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
		String line = ""; 
		String result = ""; 
		while ((line = br.readLine()) != null) { 
			result += line; 
			} 
		System.out.println("response body : " + result); 
		//Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성 
		JsonParser parser = new JsonParser(); 
		JsonElement element = parser.parse(result); 
		access_token = element.getAsJsonObject().get("access_token").getAsString(); 
		refresh_token = element.getAsJsonObject().get("refresh_token").getAsString(); 
		System.out.println("access_token : " + access_token); 
		System.out.println("refresh_token : " + refresh_token); 
		br.close(); 
		bw.close(); 
		} catch (IOException e) { e.printStackTrace(); 
		} return access_token; 
		}
	
	public HashMap<String, String> getUserInfo (String access_token) { 
		HashMap<String, String> userInfo = new HashMap<String, String>(); 
		String reqURL = "https://kapi.kakao.com/v2/user/me"; 
		try{ 
			URL url = new URL(reqURL); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
			conn.setRequestMethod("POST"); 
			conn.setRequestProperty("Authorization", "Bearer " + access_token); 
			int responseCode = conn.getResponseCode(); 
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8")); 
			String line = ""; 
			String result = ""; 
			while ((line = br.readLine()) != null) { 
				result += line; 
				} 
			JsonParser parser = new JsonParser(); 
			JsonElement element = parser.parse(result); 
			String id = element.getAsJsonObject().get("id").getAsString(); 
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject(); 
			String nickname = properties.getAsJsonObject().get("nickname").getAsString(); 
			userInfo.put("id", id); 
			userInfo.put("name", nickname); 
			br.close(); 
			} 
		catch (IOException e) { 
			e.printStackTrace(); 
			} 
		return userInfo; 
		}
	public void logout(String access_Token) { 
		String reqURL = "https://kapi.kakao.com/v1/user/logout"; 
		try { 
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
			conn.setRequestMethod("POST"); 
			conn.setRequestProperty("Authorization", "Bearer " + access_Token); 
			int responseCode = conn.getResponseCode(); 
			System.out.println("responseCode : " + responseCode); 
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
			String result = ""; 
			String line = ""; 
			while ((line = br.readLine()) != null) { 
				result += line; } System.out.println(result); 
				} 
		catch (IOException e) { 
				e.printStackTrace(); 
				} 
		}
	public void unlink(String access_Token) { 
		String reqURL = "https://kapi.kakao.com/v1/user/unlink"; 
		try { 
			URL url = new URL(reqURL); 
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); 
			conn.setRequestMethod("POST"); 
			conn.setRequestProperty("Authorization", "Bearer " + access_Token); 
			int responseCode = conn.getResponseCode(); 
			System.out.println("responseCode : " + responseCode); 
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream())); 
			String result = ""; 
			String line = ""; 
			while ((line = br.readLine()) != null) { 
				result += line; 
				} 
			System.out.println(result); 
			} 
		catch (IOException e) { 
			e.printStackTrace(); 
			} 
		}


		
	

	
	
}
