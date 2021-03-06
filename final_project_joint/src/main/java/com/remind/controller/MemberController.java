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
import com.remind.model.EmailDto;
import com.remind.model.EmailSender;
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
	@RequestMapping(value="join", method = RequestMethod.GET)
	public ModelAndView join(){
		ModelAndView view = new ModelAndView();
		view.setViewName("sign-up");
		return view;
	}
	
	//회원가입시 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="email_join_check", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public String emailjoincheck(@RequestParam("email_join_check") String m_email_check){
		/*MemberDto dto = daoInter.email_join_check(m_email_check);*/
		int check = daoInter.email_join_check(m_email_check);
		//System.out.println(dto.getM_email());
		/*if (dto.getM_email() != null){*/
		if (check > 0){
			return "<p style='color:red;'>이미 가입되어 있는 이메일 입니다!</p>";
		}else{
			return "<p style='color:green;'>가입이 가능한 이메일 입니다.</p>";
		}
	}
	
	
	//회원가입 (가입처리)
	@RequestMapping(value="join", method= RequestMethod.POST)
	public ModelAndView join(MemberBean bean){
		bean.setM_bdate(bean.getYear()+ "-" + bean.getMonth() + "-" + bean.getDay());
		boolean b = daoInter.joinMember(bean);
		if(b){
			MemberDto dto = daoInter.memberDetail(bean.getM_name());
			
			AnniversaryBean bean2 = new AnniversaryBean();
			bean2.setA_date(bean.getM_bdate());
			bean2.setA_detail("생일");
			bean2.setA_mno(dto.getM_no());
			daoInter.insertAnniversary(bean2);
			ModelAndView view = new ModelAndView();
			
			return new ModelAndView("sign-in");
			//return "redirect:/sign-in";
		}
		else return new ModelAndView("err");
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
	
	//친구검색
	@RequestMapping(value="searching",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, String>> search2(@RequestParam("name") String name){
		System.out.println(name);
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
		return dataList;
	}
	
	@RequestMapping(value="out", method= RequestMethod.POST)
	public String out(@RequestParam("m_no") String m_no){
		boolean b = daoInter.outMember(m_no);
		if(b) return "redirect:/index.jsp";
		else return "redirect:/error.jsp";
	}
	
	//내 정보 업데이트
	@RequestMapping(value="updateInfo", method=RequestMethod.GET)
	public ModelAndView updateMember(@RequestParam("m_no") String m_no){
		MemberDto dto = daoInter.showMemberDetail(m_no);
		return new ModelAndView("updateform","dto",dto);
	}	
	
	@RequestMapping(value="updateInfo", method = RequestMethod.POST)
	public String updateSubmit(MemberBean bean,@RequestParam("hiddenName") String imgName){
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
	public ModelAndView showFriendinfo(@RequestParam("m_no")String m_no, HttpSession session){
		String m_no2 = (String)session.getAttribute("mno");
		ModelAndView view = new ModelAndView();
		MemberDto dto = daoInter.showMemberDetail(m_no);
		view.addObject("myinfo", dto);
		List<FollowDto> mylist = daoInter.showMyFollower(m_no);
		view.addObject("mylist", mylist);
		List<FollowDto> ilist = daoInter.showIFollow(m_no);
		view.addObject("ilist", ilist);
		List<BoardDto> list = daoInter.showMyMain(m_no);
		view.addObject("board",list);
		List<FollowDto> follow = daoInter.showIFollow(m_no2);
		boolean flw = false;
		for(FollowDto f:follow){
			if(f.getF_mno().equals(m_no)){
				flw = true;
				break;
			}
		}
		view.addObject("follow",flw);
		view.setViewName("mywall");
		return view;
	}
	//팔로우 친구정보 보기 
	@RequestMapping(value="friendinfo", method = RequestMethod.GET)
	public ModelAndView showFriendinfo2(@RequestParam("m_no")String m_no, HttpSession session){
		String m_no2 = (String)session.getAttribute("mno");
		
		ModelAndView view = new ModelAndView();
		MemberDto dto = daoInter.showMemberDetail(m_no);
		view.addObject("myinfo", dto);
		List<FollowDto> mylist = daoInter.showMyFollower(m_no);
		view.addObject("mylist", mylist);
		List<FollowDto> ilist = daoInter.showIFollow(m_no);
		view.addObject("ilist", ilist);
		List<BoardDto> list = daoInter.showMyMain(m_no);
		view.addObject("board",list);
		List<FollowDto> follow = daoInter.showIFollow(m_no2);
		boolean flw = false;
		for(FollowDto f:follow){
			System.out.println("fmno" + f.getF_mno() + " mno" + m_no);
			if(f.getF_mno().equals(m_no)){
				flw = true;
				break;
			}
			System.out.println(flw);
		}
		view.addObject("follow",flw);
		view.setViewName("mywall");
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
	
	//비밀번호 변경(정상적인 변경)
	@RequestMapping(value="passChange", method = RequestMethod.POST)
	public ModelAndView passChange(MemberBean bean){
		ModelAndView view = new ModelAndView();
		boolean b = daoInter.ChangePass(bean);
		String str = "success";
		if(b){
			view.addObject("suc", b);
			view.setViewName("redirect:/myaccount") ;
		}else{
			view.setViewName("redirect:/error.jsp");
		}
		return view;
	}
	
	
	//비밀번호 분실 Email보내기 
	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping(value="sendPassChange", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView submit(@RequestParam("m_email")String m_email) throws Exception{
		ModelAndView view = new ModelAndView();
		m_email = m_email.trim();		
		int check = daoInter.lostPass(m_email);
		
		
		if (check > 0){
			String subject ="RE:MIND에서 분실하신 비밀번호 재설정";
			String pass = String.valueOf((Math.floor(Math.random()*1000000)));
			String content = "<html><p>사용하실 임시 비밀번호는 " + pass + "입니다.</p><br>"
					+ "<a href='http://localhost:8080/controller/login'>이곳을</a>눌러 로그인하십시오.</html>";
			
			MemberBean bean = daoInter.lostPassMember(m_email);
			//String m_no = bean.getM_no();
			bean.setM_password(pass);
			daoInter.ChangePass(bean);
			
			EmailDto email = new EmailDto();
			email.setReceiver(m_email);
			email.setSubject(subject);
			email.setContent(content);
			boolean b = emailSender.sendEmail(email);
		}	
		view.setViewName("sign-in");		
		return view;
		
	}
}




