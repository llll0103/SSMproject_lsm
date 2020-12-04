package ssm.cd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;










import ssm.cd.service.TestTeacherService;
import ssm.cd.vo.TestTeacherVO;
import ssm.mi.vo.SMemberVO;
import ssm.mi.vo.TMemberVO;

@Controller
@RequestMapping("testTeacher")
public class TeacherController {
   @Autowired
   private TestTeacherService testTeacherService;
   
   Logger logger = Logger.getLogger(TeacherController.class);
   
   
   /*@RequestMapping("/listStudent")
   public String listStudent (@ModelAttribute TestTeacherVO ttvo,Model model){
      
      logger.info("처음들어온 값들>>>"+ttvo.toString());
      //반과 학번을 끌고가기위해 만든 변수
      String saveGrade="";
      String saveClass="";
      String saveName="";
      saveGrade=ttvo.getSsGrade();
      saveClass=ttvo.getSsClass();
      saveName=ttvo.getSsName();
      logger.info("saveGrade>>>"+saveGrade);
      logger.info("saveClass>>>"+saveClass);
      logger.info("saveName>>>"+saveName);
      
      

      //리스트사이즈가 널일시(처음 화면을 실행시)실행
      if(ttvo.getListSize()==null){
         logger.info("listSize()값이 null입니다 10으로 초기화합니다");
         ttvo.setListSize("10");
      }
      
      //페이지개수가 널일시 (처음 화면 실행시)실행
      if(ttvo.getPageNo()==null){
         logger.info("pageNo()값이 null입니다 1으로 초기화합니다");
         ttvo.setPageNo("1");
      }
      
      
      
      boolean bFlag = ttvo.getSsGrade()==null;
      boolean bFlag2= ttvo.getSsClass()==null;
      logger.info("bFlab>>>" +bFlag);//처음만투르 나머지 false여야함
      logger.info("bFlab2>>>" +bFlag2);
      if(ttvo.getSsGrade()==null && ttvo.getSsClass()==null){
         logger.info("save Grade,Class \"00\"으로 초기화합니다");
         saveGrade = "DD";
         saveClass = "DD";   
      }
      model.addAttribute("loadName",saveName);
      model.addAttribute("loadGrade",saveGrade);
      model.addAttribute("loadClass",saveClass);
      
      if("DD".equals(ttvo.getSsGrade())){
         logger.info("dd가 서비스로들어갈때 null로 바뀝니다");
         ttvo.setSsGrade("");
      }
         
      if("DD".equals(ttvo.getSsClass())){
         logger.info("dd가 쿼리로들어갈때 null로 바뀝니다");
         ttvo.setSsClass("");
      }
      logger.info("쿼리직전 값들>>>"+ttvo.toString());
      List<TestTeacherVO> list = testTeacherService.listStudent(ttvo);
      logger.info("서비스결과로 나온값개수>>>"+list.size());
      
      if(list.size() > 0){
         model.addAttribute("list",list);
         
      }else{
         logger.info("모델에 담은거 없어연");
      }
      model.addAttribute("listSize",ttvo.getListSize());
      
      return "cd/test_Teacher";
   }*/
   
   @RequestMapping("/listStudent")
   public String listStudent (@ModelAttribute TMemberVO tvo,Model model,HttpSession session){
      
      System.out.println("리스트스튜던트 왔음");
      
      //세션적용 
      String userNO = (String)session.getAttribute("USERNO");
      tvo.setTtNo(userNO);
      
      //자기반 학년 반 가져옴
      tvo = testTeacherService.myclass(tvo);
      System.out.println("마이 클래스가져옴");
      
      //학년 반해당 학생 20명 리스트 가져옴
      List<SMemberVO> mystudent=testTeacherService.mystudent(tvo); 
      System.out.println("마이스튜던트 가져옴");
      
      //리스트 jsp에 보냄
      model.addAttribute("mystudent", mystudent);
      
      return "cd/test_Teacher_";
   }
   
   
}