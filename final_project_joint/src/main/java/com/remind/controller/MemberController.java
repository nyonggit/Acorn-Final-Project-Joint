package com.remind.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.remind.model.AnniversaryDto;
import com.remind.model.BoardDto;
import com.remind.model.DaoInter;
import com.remind.model.FollowDto;

import com.remind.model.MemberDto;

@Controller
//@SessionAttributes("mno")
public class MemberController {
	@Autowired
	private DaoInter daoInter;
	
	
	@RequestMapping(value="login",method = RequestMethod.GET)
	public String login(BoardBean bean){		
		return "sign-in";
	}
	
	//내 메인페이지
	@RequestMapping(value="showMyMain", method = RequestMethod.GET)
	public ModelAndView showMyMain(@RequestParam("b_mno") String b_mno){
		return new ModelAndView("myMain","myboard",daoInter.showMyMain(b_mno));
	}

	//회원가입 (페이지로 이동) 11/22 17:28 추가
	@RequestMapping(value="join", method= RequestMethod.GET)
	public ModelAndView join(){
		ModelAndView view = new ModelAndView();
		view.setViewName("sign-up");
		return view;
	}
	
	
	//회원가입 (가입처리)
	@RequestMapping(value="join", method= RequestMethod.POST)
	public String join(MemberBean bean){
		
		bean.setM_bdate(bean.getYear()+ "-" + bean.getMonth() + "-" + bean.getDay());
		boolean b = daoInter.joinMember(bean);
		if(b){
			MemberDto dto = daoInter.memberDetail(bean.getM_name());
			AnniversaryBean bean2 = new AnniversaryBean();
			bean2.setA_date(bean.getM_bdate());
			bean2.setA_detail("생일");
			bean2.setA_mno(dto.getM_no());
			daoInter.insertAnniversary(bean2);
			return "redirect:/index.jsp";
		}
		else return "redirect:/error.jsp";
	}
	
	//회원탈퇴
	@RequestMapping(value="out", method = RequestMethod.GET)
	public ModelAndView outConfirm(@RequestParam("m_no") String m_no){
		return new ModelAndView("deleteconfirm","m_no",m_no);
	}
	
	@RequestMapping(value="searching",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> search(@RequestParam("name") String name){
		
		List<MemberDto> list = daoInter.searchMember(name);
		List<Map<String, String>> dataList = new ArrayList<Map<String,String>>();
		Map<String, String> data = null;
		for(MemberDto s : list){
			data = new HashMap<String,String>();
			data.put("m_image",s.getM_image());
			data.put("m_email", s.getM_email());
			
			data.put("m_name", s.getM_name());
			data.put("m_no", s.getM_no());
			dataList.add(data);
		}
		Map<String, Object> searchData = new HashMap<String, Object>();
		searchData.put("datas", dataList);
		
		return searchData;
			
	}
	
	@RequestMapping(value="out", method= RequestMethod.POST)
	public String out(@RequestParam("m_no") String m_no){
		boolean b = daoInter.outMember(m_no);
		if(b)
			return "redirect:/index.jsp";
		else return "redirect:/error.jsp";
	}
	//내 정보 업데이트
	@RequestMapping(value="updateInfo", method=RequestMethod.GET)
	public ModelAndView updateMember(@RequestParam("m_no") String m_no){
		MemberDto dto = daoInter.showMemberDetail(m_no);
		return new ModelAndView("updateform","dto",dto);
	}	
	@RequestMapping(value="updateInfo", method = RequestMethod.POST)
	public String updateSubmit(MemberBean bean,@RequestParam("hiddenName")String imgName){
		System.out.println(imgName);
		MultipartFile uploadfile = bean.getFileUp();
		System.out.println(uploadfile);
		if (uploadfile != null) {
            String fileName = uploadfile.getOriginalFilename();
            System.out.println(fileName);
            bean.setM_image(fileName);
            try {
                // 1. FileOutputStream 사용
                // byte[] fileData = file.getBytes();
                // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
                // output.write(fileData);
                 
                // 2. File 사용
                File file = new File("N:/web/profileimg/" + fileName);
                
                uploadfile.transferTo(file);
            } catch (Exception e) {
            	bean.setM_image(imgName);
                System.out.println("파일 업로드 err : " + e);
            } // try - catch
        }else{
        	bean.setM_image(imgName);
        }
        // 데이터 베이스 처리를 현재 위치에서 처리
		bean.setM_bdate(bean.getYear()+ "-" + bean.getMonth() + "-" + bean.getDay());
		boolean b = daoInter.updateMember(bean);
		
		if(b){return "redirect:/myaccount";}
		else return "redirect:/error.jsp";
			
	}
	
	//로그인
	@RequestMapping(value="loginsub", method = RequestMethod.POST)
	@ResponseBody
	public String login(MemberBean bean, HttpSession session){
		MemberDto dto = daoInter.login(bean);
		System.out.println(bean.getM_email());
		String result = "";
		if(dto!= null){
			session.setAttribute("mno", dto.getM_no());		
			result="success";
			  //+ dto.getM_no()
		}else{
			result = "fail";
			
		}
		return result;
	}
	
	//로그아웃
	@RequestMapping(value="logout", method = RequestMethod.GET)
	public String logoutConfirm(HttpSession session){		
		session.removeAttribute("mno");		
		return "index";
	}
	
	//내 정보 보기
	@RequestMapping(value="friendinfo", method = RequestMethod.POST)
	public ModelAndView showFriendinfo(@RequestParam("m_no")String m_no){
		//System.out.println("들어옴?");
		//System.out.println("m_no"+ m_no);
		ModelAndView view = new ModelAndView();
		MemberDto dto = daoInter.showMemberDetail(m_no);
		view.addObject("myinfo", dto);
		List<FollowDto> mylist = daoInter.showMyFollower(m_no);
		view.addObject("mylist", mylist);
		List<FollowDto> ilist = daoInter.showIFollow(m_no);
		view.addObject("ilist", ilist);
		List<BoardDto> list = daoInter.showMyMain(m_no);
		view.addObject("board",list);
		view.setViewName("myaccount");
		return view;
	}
	
	//내 게시물 보기 POST
	@RequestMapping(value="mywall", method = RequestMethod.POST)
	public ModelAndView showMyinfo(@RequestParam("m_no")String m_no){
		ModelAndView view = new ModelAndView();
		if(m_no == null || m_no ==""){
			view.setViewName("sign-in");
			return view;
		}
		MemberDto dto = daoInter.showMemberDetail(m_no);		
		view.addObject("myinfo", dto);
		List<FollowDto> mylist = daoInter.showMyFollower(m_no);
		view.addObject("mylist", mylist);
		List<FollowDto> ilist = daoInter.showIFollow(m_no);
		view.addObject("ilist", ilist);
		List<BoardDto> list = daoInter.showMyMain(m_no);
		view.addObject("board",list);
		view.setViewName("mywall");
		return view;
		
	}
	//내 게시물 보기 GET
	@RequestMapping(value="mywall", method = RequestMethod.GET)
	public ModelAndView showMyinfo2(HttpSession session){
		String m_no = (String)session.getAttribute("mno"); 
		ModelAndView view = new ModelAndView();
		if(m_no == null || m_no ==""){
			view.setViewName("sign-in");
			return view;
		}
		MemberDto dto = daoInter.showMemberDetail(m_no);
		view.addObject("myinfo", dto);
		List<FollowDto> mylist = daoInter.showMyFollower(m_no);
		view.addObject("mylist", mylist);
		List<FollowDto> ilist = daoInter.showIFollow(m_no);
		view.addObject("ilist", ilist);
		List<BoardDto> list = daoInter.showMyMain(m_no);
		view.addObject("board",list);
		view.setViewName("mywall");
		return view;
	}
	
	//My Account Get방식
	@RequestMapping(value="myaccount", method = RequestMethod.GET)
	public ModelAndView myAccountGet(HttpSession session){
		String m_no = (String)session.getAttribute("mno"); 
		ModelAndView view = new ModelAndView();
		if(m_no == null || m_no ==""){
			view.setViewName("sign-in");
			return view;
		}
		MemberDto dto = daoInter.showMemberDetail(m_no);
		view.addObject("myinfo", dto);
		List<FollowDto> mylist = daoInter.showMyFollower(m_no);
		view.addObject("mylist", mylist);
		List<FollowDto> ilist = daoInter.showIFollow(m_no);
		view.addObject("ilist", ilist);
		List<AnniversaryDto> showAnni = daoInter.showAnniversary(m_no);
		view.addObject("showAnni", showAnni);
		view.setViewName("myaccount");
		return view;
	}
	
	//My Account Post방식
	@RequestMapping(value="myaccount", method = RequestMethod.POST)
	public ModelAndView myAccountPost(@RequestParam("m_no")String m_no){
		ModelAndView view = new ModelAndView();		
		if(m_no == null || m_no ==""){
			view.setViewName("sign-in");
			return view;
		}
		MemberDto dto = daoInter.showMemberDetail(m_no);		
		view.addObject("myinfo", dto);
		List<FollowDto> mylist = daoInter.showMyFollower(m_no);
		view.addObject("mylist", mylist);
		List<FollowDto> ilist = daoInter.showIFollow(m_no);
		view.addObject("ilist", ilist);
		List<BoardDto> list = daoInter.showMyMain(m_no);
		view.addObject("board",list);
		List<AnniversaryDto> showAnni = daoInter.showAnniversary(m_no);
		view.addObject("showAnni", showAnni);
		view.setViewName("myaccount");
		return view;
	}
	
}
