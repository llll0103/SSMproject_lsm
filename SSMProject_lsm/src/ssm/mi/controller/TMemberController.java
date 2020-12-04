package ssm.mi.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.common.utils.ChaebunClass;
import ssm.common.utils.FilePath;
import ssm.mi.service.TMemberService;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

@Controller
@RequestMapping(value = "/tMember")
public class TMemberController {
	private static final String CONTEXT_PATH = "member";
	Logger log = Logger.getLogger(TMemberController.class);
	
	@Autowired
	private TMemberService 	tmemberService;
		
	//���� �������� ��ȸ
	@RequestMapping(value="/joinTMemCheck", method=RequestMethod.POST)
	public String joinTMemCheck(@ModelAttribute TMemberVO tmvo, Model model){
		System.out.println("/joinTMemCheck ȣ�� ����");
		String url = "";
		TMemberVO tvo = tmemberService.joinTMemberCheck(tmvo);//joinCheck���� db���� ��ġȮ��
				
		if(tvo != null){//��ġ ���� ����
			String ttId = tvo.getTtId();
			String ttA = tvo.getTtAuthority(); // ���Խ��� ��������� Ȯ��
			
			if(ttId != null && ttId.length() > 0){			//��ġ�ϴ� �����ְ� �̹� ������ ����
				if(ttA.equals("Y")){
					model.addAttribute("alert","���Խ��� ������Դϴ�.");
					url = "member/signCheck";

				}else{ 
					model.addAttribute("alert","�̹� ���Ե� ȸ���Դϴ�.");    // ���ԵǾ� ������ ���ڿ��� ������ checkForm���� ����
					url="redirect:../main_1.jsp";
				}
			}else{ //��ġ�ϴ� ���� ������ ������ ���� ����
				model.addAttribute("data", tvo);                    // �й�, �̸�, �������, ����, �޴�����ȣ�� ������					
				url = "member/tMembJoinForm"; 
			}
			
		}else{//��ġ�ϴ� ������ ����
			log.info("failed");
			model.addAttribute("mode","failed");//alert�� �޼����� ������
			url="member/joinCheckForm";//joinCheck������ ��ȯ
		}
			
		return url;
	}	
	//���� ���� ��
	@RequestMapping(value="/joinFormTMember", method=RequestMethod.GET)
	public String joinFormTMember(){
		log.info("/joinFormTMember ȣ�� ����");
		return "member/tMemJoinForm";
	}
	
	// ���̵� �ߺ�üũ �Լ�
			@RequestMapping("ajaxIdCheck")
			public ResponseEntity ajaxIdCheck(@RequestParam("ttId") String ttId,Model model){
				log.info("ajaxIdCheck() start");
				log.info("ttId >>> : "+ttId);
				ttId = ttId.toUpperCase().trim();
				log.info("ttId >>> : "+ttId);
				ResponseEntity entity = null;
				TMemberVO tvo = null;
				tvo = new TMemberVO();

				try{
					tvo.setTtId(ttId);
					TMemberVO tmvo = tmemberService.ajaxIdCheck(tvo);
					if(tmvo != null && tmvo.getTtId() != null){
						entity = new ResponseEntity("false",HttpStatus.OK);
					}else{
						entity = new ResponseEntity("true",HttpStatus.OK);
					}
					
				}catch(Exception e){
					log.info("error >>> : "+e.getMessage());
					entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
				}
				
				log.info("ajaxIdCheck() end");
				return entity;
			}// end of ajaxIdCheck()
	
	//���簡��
		@RequestMapping(value="/joinTMember", method=RequestMethod.POST)
		public String joinTMember(@ModelAttribute TMemberVO tvo, Model model, HttpServletRequest request) {
			String uploadPath = FilePath.SSM_FILEPATH;
			int size = 10* 1024*1024;
			String url = "";
			try{
				MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "EUC-KR", new DefaultFileRenamePolicy());
				String ttName =multi.getParameter("ttName");
				String ttGender =multi.getParameter("ttGender");
				String sjtCode =multi.getParameter("sjtCode");				
				String ttId =multi.getParameter("ttId");
				String ttPw =multi.getParameter("ttPw");
				String ttPn =multi.getParameter("ttPn");
				String ttGrade =multi.getParameter("gradeId");
				String ttClass =multi.getParameter("classId");
				String ttEmail =multi.getParameter("ttEmail");
				Enumeration jfiles = multi.getFileNames();
				String ttImage =(String)jfiles.nextElement();			
				String imagefilename = multi.getFilesystemName(ttImage);

				log.info("(log) ttName >>> : " + ttName);
				log.info("(log) ttGender >>> : " + ttGender);
				log.info("(log) classId >>> : " + ttClass);
				log.info("(log) ttGrade1 >>> : " + ttGrade);
				if(ttGrade.equals("01")){ttGrade ="FM";}
				else if(ttGrade.equals("02")){ttGrade ="JR";}
				else{ttGrade ="SR";}
				log.info("(log) ttGrade2 >>> : " + ttGrade);
				TMemberVO ttvo = new TMemberVO();
				ttvo.setTtName(ttName);
				ttvo.setTtPn(ttPn);
				ttvo.setTtId(ttId);
				ttvo.setTtPw(ttPw);
				ttvo.setSjtCode(sjtCode);
				ttvo.setTtGrade(ttGrade);
				ttvo.setTtClass(ttClass);
				ttvo.setTtEmail(ttEmail);
				ttvo.setTtImage(imagefilename);
				
				String resultStr="";
				int result = tmemberService.joinTMember(ttvo);
				log.info("(log)tmemberService.joinTMember(param)>>>" +result );
				
				if(result >0){ 
					resultStr="��� �Ϸ�"; 
					url="forward:/admin/listTMemberY.ssm";
				}else{
					 resultStr = "��Ͻ���";
					 url="member/tMemJoinForm";
				}
				
				log.info("resultStr" + resultStr);
				model.addAttribute("result",resultStr);

				log.info("(log) Controller.insertMember END");
				
				
			}catch(Exception e){
				System.out.println("������ >>> : " + e );
			}
			return url;	
		}//tMeminsert

		
}//controller