package ssm.mi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ssm.common.utils.BabySession;
import ssm.mi.service.LoginService;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;
import ssm.mi.vo.UserVO;

@Controller
@RequestMapping(value = "/user")
public class LoginController {
   private static final String CONTEXT_PATH = "common";
   Logger log = Logger.getLogger(TMemberController.class);
   
   @Autowired
   private LoginService loginService;
   
// 로그인,회원가입 페이지로 가는 함수. 
   @RequestMapping(value="/loginForm")
   public String loginForm(){
      log.info("loginForm() start");
      String url = "";
      url = "/member/loginForm";            
      log.info("loginForm() end");
      return url;
   }// end of loginForm()

   // 로그인
   @RequestMapping("/loginCheck")
   public String loginCheck(@ModelAttribute UserVO uvo,Model model
         ,HttpServletRequest req){
      log.info("loginCheck() start"); 
      String url = "";
      String authority = uvo.getUserAuthority();
      
      if(authority.equals("S")){       // 학생정보테이블에서 권한 1로 select
         SMemberVO svo = null;
         svo = new SMemberVO();
         String ssId = uvo.getUserId();
         String ssPw = uvo.getUserPw();
         svo.setSsId(ssId);
         svo.setSsPw(ssPw);
         SMemberVO smvo = loginService.sloginCheck(svo);
         if(smvo == null){
            log.info(">>>> smvo null"); 
            model.addAttribute("result","failed");
            String message="아이디나 비밀번호가 틀립니다. 다시 로그인해주세요";
            model.addAttribute("message", message);
            url = "result";
         }else{
            if(smvo.getSsAuthority().equals("Y")){
               log.info(">>>> smvo Authority Y"); 
               model.addAttribute("result","failed");
               String message="가입승인 대기중입니다.";
               model.addAttribute("message", message);
               model.addAttribute("dataS", smvo);
               url = "result";
            }else{
               log.info(">>>> smvo success"); 
               model.addAttribute("result","success");
               String id = smvo.getSsId();
               String no = smvo.getSsNo();
               String au = smvo.getSsAuthority();
               try {
                  //HttpSession session = req.getSession(true);
                  req.getSession().setAttribute("isLogOn","ok");
                  req.getSession().setAttribute("ssLoginOn","isLogOn");
                  BabySession.setSession(req, id, no, au);
               } catch (Exception e) {               
                  // TODO Auto-generated catch block
                  log.info("error.controller >> "+e.getMessage());
               }
               url = "result";   
            }
         }
         
      }else if(authority.equals("T")){ // 선생님정보테이블에서 권한 2,3로 select
         TMemberVO tvo = null;
         tvo = new TMemberVO();
         String ttId = uvo.getUserId();
         String ttPw = uvo.getUserPw();
         tvo.setTtId(ttId);
         tvo.setTtPw(ttPw);
         TMemberVO tmvo = loginService.tLoginCheck(tvo);
         if(tmvo == null){
            model.addAttribute("result","failed");
            String message="아이디나 비밀번호가 틀립니다. 다시 로그인해주세요";
            model.addAttribute("message", message);
            url = "redirect:../main_1.jsp";
         }else{//승인대기
            if(tmvo.getTtAuthority().equals("Y")){
               model.addAttribute("result","failed");
               String message="가입승인 대기중입니다.";
               model.addAttribute("message", message);
               model.addAttribute("dataT", tmvo);
               url = "result";
               //url = "/login/mainForm";
            }else{//로그인성공
               model.addAttribute("result","success");
               String id = tmvo.getTtId();
               String no = tmvo.getTtNo();
               String au = tmvo.getTtAuthority();
               try {
                  req.getSession().setAttribute("isLogOn","ok");
                  req.getSession().setAttribute("ttLoginOn","isLogOn");
                  BabySession.setSession(req, id, no, au);
               } catch (Exception e) {               
                  // TODO Auto-generated catch block
                  log.info("error.controller >> "+e.getMessage());
               }
               url = "result";
            }
         }
      }else if(authority.equals("A")){
         String adId = uvo.getUserId();
         String adPw = uvo.getUserPw();
         
         
      }
      
      
      log.info("loginCheck() end");
      return url;
   }
   
   //로그아웃
   @RequestMapping("/logout")
   public String logout(HttpServletRequest req){
      try {
         BabySession.killSession(req);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return "redirect:../main_1.jsp";
   }
   
   //회원가입폼
   @RequestMapping(value="/joinCheckForm")
   public String joinCheckForm(){
      log.info("joinCheckForm() start");
      String url = "";
      url = "member/joinCheckForm";            
      log.info("joinCheckForm() end");
      return url;
   }// end of joinCheckForm()
}