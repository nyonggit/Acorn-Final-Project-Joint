package com.remind.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.ls.LSInput;

import com.remind.model.AdminDto;
import com.remind.model.BoardDto;
import com.remind.model.DaoInter;
import com.remind.model.EmailDto;
import com.remind.model.EmailSender;
import com.remind.model.MemberDto;
import com.remind.model.ParserDto;
import com.remind.model.WishlistDto;

@Controller
public class AdminController {

	@Autowired
	private DaoInter daoInter;
	
	@RequestMapping(value="loginPage", method = RequestMethod.GET)
	public ModelAndView LoginPage(){
		ModelAndView model = new ModelAndView();
		model.setViewName("adminLogin");
		
		return model;
	}
	
	//세션
	@RequestMapping(value="AdminLogin", method = RequestMethod.POST)
	@ResponseBody
	public String AdminLogin(AdminBean bean, HttpSession session){                                 
		AdminDto dto = daoInter.AdminLogin(bean);				
		String adminlogin = "";
		if(dto != null){
			session.setAttribute("adno", dto.getAd_no());
			adminlogin="success";
			System.out.println(adminlogin);
		}else{
			adminlogin = "fail";
			System.out.println(adminlogin);
		}
		return adminlogin;
	}
	
	//로그아웃
	@RequestMapping(value="adminLogout", method = RequestMethod.GET)
	public String logoutConfirm(HttpSession session){		
		session.removeAttribute("adno");		
		return "adminLogin";
	}
	
	//admin Table 출력
	@RequestMapping(value="showAdminTable", method = RequestMethod.GET)
	public ModelAndView showAdminTable(){                                 
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("showMem",daoInter.showMemberA()); 
		modelAndView.addObject("showBoard", daoInter.showBoardA());
		modelAndView.addObject("randomList", daoInter.eventListA());
		modelAndView.setViewName("adminTable");
		return modelAndView;
	}
	
	//Member 이름 클릭시 게시판 출력 (사용 안함)
	@RequestMapping(value="showPartBoard", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showPartB(@RequestParam("m_no") String m_no){
	      
		List<Map<String, String>> boardlist = new ArrayList<Map<String, String>>();
		Map<String, String> sData = null;
	      
		List<BoardDto> list = daoInter.showPBoard(m_no);
		for(BoardDto s:list){
			sData = new HashMap<String, String>();
		    sData.put("b_no",s.getB_no());
		    sData.put("b_content", s.getB_content());
		    sData.put("b_date", s.getB_date());
		    sData.put("b_like", s.getB_like());
		    sData.put("b_image", s.getB_image());
		    boardlist.add(sData);
		}
	      
		Map<String, Object> boardData = new HashMap<String, Object>();
		boardData.put("boardlist", boardlist);
		return boardData;
	}
	
	//Member 강퇴
	@RequestMapping(value="adminmemberout", method = RequestMethod.POST)
	public ModelAndView memberDrop(@RequestParam("m_no") String m_no){
		
		boolean a = daoInter.Adminmemberout(m_no);
		boolean b = daoInter.outMember(m_no);
		if(b){
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("showMem",daoInter.showMemberA()); 
			modelAndView.addObject("showBoard", daoInter.showBoardA());
			modelAndView.addObject("randomList", daoInter.eventListA());
			modelAndView.setViewName("adminTable");
			return modelAndView;
		}else{
			return null;
		}
	}
	
	//Event Email보네기 
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping(value="send", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> submit(@RequestParam("receiver")String receiver, 
			@RequestParam("subject")String subject, 
			@RequestParam("content")String content) throws Exception{
		
		
		EmailDto email = new EmailDto();
		email.setReceiver(receiver);
		email.setSubject(subject);
		email.setContent(content);
		boolean b = emailSender.sendEmail(email);
		
		Map<String, Object> boardData = new HashMap<String, Object>();
		boardData.put("suc", b);
		return boardData;
	}
	
	
	//admin Table 출력
	@RequestMapping(value="AdminBoardDetail", method = RequestMethod.POST)
	@ResponseBody
	public BoardDto AdminBoardDetail(@RequestParam("b_no") String b_no){                                 
		BoardDto dto = daoInter.showBoardDetail(b_no);
		return dto;
		}
	
	@RequestMapping(value="AdminBoardDelete", method = RequestMethod.POST)
	public ModelAndView deleteSubmit(@RequestParam("b_no") String b_no){
		
		boolean b = daoInter.eraseBoard(b_no);
		if(b){
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("showMem",daoInter.showMemberA()); 
			modelAndView.addObject("showBoard", daoInter.showBoardA());
			modelAndView.addObject("randomList", daoInter.eventListA());
			modelAndView.setViewName("adminTable");
			return modelAndView;
		}else{
			return null;
		}
	}
	
	//MainAdmin Page
	@RequestMapping(value="MainAdmin")
	public ModelAndView MainAdmin(){
		ModelAndView modelAndView = new ModelAndView();
		
		List boardlist = new ArrayList();
		List<MemberDto> list = daoInter.showMemberA();
		for(MemberDto s:list){
		    boardlist.add(s.getM_gender());
		}
		
		int m = 0,w = 0;
		for (int i = 0; i < boardlist.size(); i++) {
			if(Integer.parseInt((String)boardlist.get(i)) == 1){
				m += 1;
			}else{
				w += 1;
			}
		}
		
		modelAndView.addObject("woman", w);
		modelAndView.addObject("man", m);
		modelAndView.addObject("showMem");
		modelAndView.addObject("wishcnt",daoInter.wishlistCnt()); 
		modelAndView.addObject("memcnt", daoInter.memberCnt());
		modelAndView.addObject("boardcnt", daoInter.boardCnt());
		modelAndView.addObject("adminMsg", daoInter.AdminMsg());
		
		//뉴스
		String name = daoInter.articleAdmin().getName().replaceAll("'", "");
		modelAndView.addObject("articleName", name);
		modelAndView.addObject("articleUrl", daoInter.articleAdmin().getUrl());
		
		//주식가격 
		String stock = daoInter.stockAdmin().getPrice().replaceAll(",", "");
		modelAndView.addObject("stock", stock.replace(" ", ""));
		
		modelAndView.setViewName("admin");
		return modelAndView;
	}
	
	@RequestMapping(value="updateAdmin", method = RequestMethod.POST)
	public ModelAndView AdminUpdate(AdminBean bean){
		
		boolean b = daoInter.AdminUpdate(bean);
		if(b){
			ModelAndView modelAndView = new ModelAndView();
			
			List boardlist = new ArrayList();
			List<MemberDto> list = daoInter.showMemberA();
			for(MemberDto s:list){
			    boardlist.add(s.getM_gender());
			}
			
			//남, 여 비율
			int m = 0,w = 0;
			for (int i = 0; i < boardlist.size(); i++) {
				if(Integer.parseInt((String)boardlist.get(i)) == 1){
					m += 1;
				}else{
					w += 1;
				}
			}
			
			modelAndView.addObject("woman", w);
			modelAndView.addObject("man", m);
			modelAndView.addObject("showMem");
			modelAndView.addObject("wishcnt",daoInter.wishlistCnt()); 
			modelAndView.addObject("memcnt", daoInter.memberCnt());
			modelAndView.addObject("boardcnt", daoInter.boardCnt());
			modelAndView.addObject("adminMsg", daoInter.AdminMsg());
			
			//뉴스
			String name = daoInter.articleAdmin().getName().replaceAll("'", "");
			modelAndView.addObject("articleName", name);
			modelAndView.addObject("articleUrl", daoInter.articleAdmin().getUrl());
			
			//주식가격 
			String stock = daoInter.stockAdmin().getPrice().replaceAll(",", "");
			modelAndView.addObject("stock", stock.replace(" ", ""));
			
			modelAndView.addObject("updateCheck", 1);
			modelAndView.setViewName("admin");
			
			return modelAndView;
		}else{
			return null;
		}
	}

	@RequestMapping(value="selectAdmin", method = RequestMethod.POST)
	@ResponseBody
	public AdminDto showAdmin(@RequestParam("ad_no") String ad_no){
		AdminDto dto = daoInter.showAdmin(ad_no);
		
		return dto;
	}
	
	@RequestMapping(value="updateMsg", method = RequestMethod.POST)
	public ModelAndView AdMsgUpdate(AdminBean bean){
		boolean b = daoInter.AdminMsgUpdate(bean);
		if(b){
			ModelAndView modelAndView = new ModelAndView();
			List boardlist = new ArrayList();
			List<MemberDto> list = daoInter.showMemberA();
			for(MemberDto s:list){
			    boardlist.add(s.getM_gender());
			}
			
			//남, 여 비율
			int m = 0,w = 0;
			for (int i = 0; i < boardlist.size(); i++) {
				if(Integer.parseInt((String)boardlist.get(i)) == 1){
					m += 1;
				}else{
					w += 1;
				}
			}
			
			modelAndView.addObject("woman", w);
			modelAndView.addObject("man", m);
			modelAndView.addObject("showMem");
			modelAndView.addObject("wishcnt",daoInter.wishlistCnt()); 
			modelAndView.addObject("memcnt", daoInter.memberCnt());
			modelAndView.addObject("boardcnt", daoInter.boardCnt());
			modelAndView.addObject("adminMsg", daoInter.AdminMsg());
			
			//뉴스
			String name = daoInter.articleAdmin().getName().replaceAll("'", "");
			modelAndView.addObject("articleName", name);
			modelAndView.addObject("articleUrl", daoInter.articleAdmin().getUrl());
			
			//주식가격 
			String stock = daoInter.stockAdmin().getPrice().replaceAll(",", "");
			modelAndView.addObject("stock", stock.replace(" ", ""));
			
			modelAndView.addObject("MsgUpdateChk", 1);
			modelAndView.setViewName("admin");
			
			return modelAndView;
		}else{
			return null;
		}
	}
	
	//프로젝트 팀 보기 페이지 이동
	@RequestMapping(value="ourteam")
	public ModelAndView ourTeam(){
		ModelAndView view = new ModelAndView();
		view.setViewName("ourteam");
		return view;
	}
	
	//주식가격 
	@RequestMapping(value="stockchages")		
	@ResponseBody
	public Map<String, Object> stockchanges(){
		Map<String, Object> list = new HashMap<String, Object>();
		String str = daoInter.stockAdmin().getPrice().replaceAll(",", "");
		
		list.put("stocks", str);
		//System.out.println(str + " 여기도 주가 확인");
		return list;
	}
	
	
	
}
