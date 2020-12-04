package ssm.cg.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ssm.cg.paging.Paging;
import ssm.cg.service.Edu_ScheduleService;
import ssm.cg.vo.Edu_ScheduleVO;
import ssm.cg.vo.VisitCounsel_EduRsvVO;

@Controller
@RequestMapping(value="/eduSchedule", method=RequestMethod.GET)
public class Edu_ScheduleController {

   Logger logger = Logger.getLogger(Edu_ScheduleController.class);
   
   @Autowired
   private Edu_ScheduleService edu_ScheduleService;

   // 상담창구 메인으로 이동
   @RequestMapping(value="esMain")
   public String esMain(){
      return "cg/visit/esCalendar";
   }
   
   // 시간표 출력 ajax
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping(value = "/esList", method=RequestMethod.POST)
   public JSONArray esList(@ModelAttribute Edu_ScheduleVO esvo, Model model, HttpSession session){
      
      logger.info("(log)Controller.eduScheduleList() start >>>");
      
      // 세션
      String user = (String)session.getAttribute("USERNO");
      esvo.setTtNo(user);
      
      List<Edu_ScheduleVO> timeList = edu_ScheduleService.eduScheduleList(esvo);
      
      logger.info("(log)timeList : " + timeList);
      
      // json객체, 배열 생성
      JSONObject jObj = new JSONObject();
      JSONArray jArr = new JSONArray();
      
      ArrayList<Edu_ScheduleVO> aTimeList = (ArrayList<Edu_ScheduleVO>)timeList;

      for(int i = 0; i < aTimeList.size(); i++){
         jObj = new JSONObject();
         
         // 교사번호
         jObj.put("groupId", aTimeList.get(i).getTtNo());
         
         // 상담일정 번호(pk)
         jObj.put("id", aTimeList.get(i).getEsNo());
         
         // 상담시간
         jObj.put("title", aTimeList.get(i).getVrTime());
         
         // 날짜
         jObj.put("start", aTimeList.get(i).getVrDate());
         
         // 상담불가시간 표시
         if(aTimeList.get(i).getEsDeleteyn().equals(aTimeList.get(i).getVrTime())){
            jObj.put("groupId", "-"+aTimeList.get(i).getTtNo());
            jObj.put("color", "#4b7786");
            jObj.put("title", aTimeList.get(i).getVrTime());
         } else {
            // 승인상태별 글씨, 배경 색상설정
        	 
            if(aTimeList.get(i).getVrStatus().equals("0")){jObj.put("color", "#88d2d2");}
            if(aTimeList.get(i).getVrStatus().equals("대기")){jObj.put("color", "#aaa");}
            if(aTimeList.get(i).getVrStatus().equals("승인")){jObj.put("color", "#d05656");}
//            if(aTimeList.get(i).getVrStatus().equals("취소")){jObj.put("color", "white");}
            if(aTimeList.get(i).getVrStatus().equals("완료")){jObj.put("color", "#a0a0a0");}
         }
         
         // 예약상태가 설정 되어있을때만 description 추가
         if(!aTimeList.get(i).getVrStatus().equals("0"))
         jObj.put("description", aTimeList.get(i).getVrStatus());
         
         jArr.add(jObj);
      }
      
      logger.info("(log)jsonArr.size() : " + jArr.size());
      logger.info("(log)Controller.eduScheduleList() end >>>");
      
      return jArr;
   } 
   
   // 교사가 시간표 수정
   @ResponseBody
   @RequestMapping(value = "/esUpdate", method=RequestMethod.POST)
   public String esUpdate(@RequestBody Edu_ScheduleVO esvo, Model model){
      
      logger.info("(log)Controller.esUpdate() start >>>");
      String resultStr = "";
      int result = 0;
      
      logger.info("(log)time : " + esvo.getEsTime());
      logger.info("(log)id : " + esvo.getEsNo());
      logger.info("(log)groupId : " + esvo.getTtNo());
      logger.info("(log)start : " + esvo.getVrDate());
      
      // 시간 -> 공통코드
      String time = esvo.getEsTime();
      if(time.equals("07:15~08:15")) esvo.setEsTime("01");
      if(time.equals("12:20~13:20")) esvo.setEsTime("02");
      if(time.equals("16:40~17:40")) esvo.setEsTime("03");
      if(time.equals("19:00~20:00")) esvo.setEsTime("04");
      if(time.equals("20:00~21:00")) esvo.setEsTime("05");
      if(time.equals("21:00~22:00")) esvo.setEsTime("06");
      
      // 확인
      logger.info("(log)-time : " + esvo.getEsTime());
      boolean update = esvo.getTtNo().indexOf("-") > -1;
      System.out.println("update : "+update);
      
      // 교사코드에 따라 분기
      if(!update) {
    	  // 상담시간 닫음
         result = edu_ScheduleService.esUpdate(esvo);
      } else {
    	 // 닫힌 시간 열기
         result = edu_ScheduleService.esRollback(esvo);}
      
      boolean bResult = result != 0;
      
      logger.info("(log)bResult : " + bResult);
      
      if(bResult) resultStr = "SUCCESS";
      else resultStr = "ERROR";
      
      
      logger.info("(log)Controller.esUpdate() end <<<");
      
      return resultStr;
   }
   
   /* 학생 예약 내역 전체/ 상세 조회, 상담/ 예약 진행상태 변경 */
   @RequestMapping(value="eduRsvList", method=RequestMethod.POST)
   public String eduRsvList(@ModelAttribute VisitCounsel_EduRsvVO vcvo, Model model, HttpSession session){
      
      logger.info("(log)Controller.eduRsvList() start >>>");

      //  세션
      String user = (String)session.getAttribute("USERNO");
      vcvo.setTtNo(user);
      
      Paging.setPage(vcvo);
      
      
      logger.info("(log)startRow : " + vcvo.getStartRow());
      logger.info("(log)endRow : " + vcvo.getEndRow());
      
      if(vcvo.getOrderSc() == null){vcvo.setOrderSc("DESC");}
      
      List<VisitCounsel_EduRsvVO> eduRsv = edu_ScheduleService.eduRsvList(vcvo);
      
      
      int total = edu_ScheduleService.listCnt(vcvo);
      
      logger.info("(log)total : " + total);
      logger.info("(log)page : " + vcvo.getPage());
      
      logger.info("(log)keyword : " + vcvo.getKeyword());
      logger.info("(log)search : " + vcvo.getSearch());
      
      model.addAttribute("RsvList", eduRsv);
      model.addAttribute("pageSize", vcvo.getPageSize());
      model.addAttribute("page", vcvo.getPage());
      model.addAttribute("data", vcvo);
      model.addAttribute("total", total);
      
      logger.info("(log)Controller.eduRsvList() end <<<");
      
      return "cg/visit/vrTeacher/eduVrList";
   }
   
   @SuppressWarnings("unchecked")
   @ResponseBody
   @RequestMapping(value="esRsvDetail", method=RequestMethod.POST)
   public Object esRsvDetail(@RequestBody Edu_ScheduleVO esvo, Model model, HttpSession session){
      
      logger.info("(log)Controller.esRsvDetail() start >>>");
      
      // 세션
      String user = (String)session.getAttribute("USERNO");
      esvo.setTtNo(user);
      
      logger.info("(log)vrNo : " + esvo.getVrNo());
      
      Edu_ScheduleVO resultVO = edu_ScheduleService.eduRsvDetail(esvo);
      
      logger.info("(log)vrNo : " + resultVO.getVrNo());
      logger.info("(log)ssNo : " + resultVO.getSsNo());
      logger.info("(log)vrField : " + resultVO.getVrField());
      logger.info("(log)vrTime : " + resultVO.getVrTime());
      logger.info("(log)vrDate : " + resultVO.getVrDate());
      logger.info("(log)vcComments : " + resultVO.getVcComments());
      logger.info("(log)vrStatus : " + resultVO.getVrStatus());
      logger.info("(log)vrContents : " + resultVO.getVrContents());

      JSONObject jObj = new JSONObject();
      
      jObj.put("vrNo", resultVO.getVrNo());
      jObj.put("ssNo", resultVO.getSsNo());
      jObj.put("vrDate", resultVO.getVrDate());
      jObj.put("vrField", resultVO.getVrField());
      jObj.put("vrTime", resultVO.getVrTime());
      jObj.put("vrStatus", resultVO.getVrStatus());
      jObj.put("vrContents", resultVO.getVrContents());
      jObj.put("vcComments", resultVO.getVcComments());
      
      
      model.addAttribute("esvo", resultVO);
      
      logger.info("(log)Controller.esRsvDetail() end <<<");
      
      return jObj;
   }
   
   @ResponseBody
   @RequestMapping(value="vrStatusUpdate", method=RequestMethod.POST)
   public String vrStatusUpdate(@RequestBody Edu_ScheduleVO esvo, HttpSession session){
      
      logger.info("(log)Controller.vrStatusUpdate() start >>>");

      // 세션
      String user = (String)session.getAttribute("USERNO");
      esvo.setTtNo(user);;
      
      String resultStr = "";
      int result = 0;
      
      logger.info("(log)vrNo : " + esvo.getVrNo());
      logger.info("(log)vrTime : " + esvo.getVrTime());
      logger.info("(log)vrDate : " + esvo.getVrDate());
      logger.info("(log)vrStatus : " + esvo.getVrStatus());
      
      // 시간 -> 공통코드
      String time = esvo.getVrTime();
      if(time.equals("07:15~08:15")) esvo.setVrTime("01");
      if(time.equals("12:20~13:20")) esvo.setVrTime("02");
      if(time.equals("16:40~17:40")) esvo.setVrTime("03");
      if(time.equals("19:00~20:00")) esvo.setVrTime("04");
      if(time.equals("20:00~21:00")) esvo.setVrTime("05");
      if(time.equals("21:00~22:00")) esvo.setVrTime("06");
      
      result = edu_ScheduleService.vrStatusUpdate(esvo);
      boolean bResult = result != 0;
     
      if(bResult) resultStr = "SUCCESS";
      else resultStr = "ERROR";
      
      logger.info("(log)Controller.vrStatusUpdate() end <<<");
      
      return resultStr;
   }
   
   
} // VisitCounsel_ScheduleController