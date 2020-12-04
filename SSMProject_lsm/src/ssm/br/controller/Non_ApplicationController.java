package ssm.br.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.br.service.Non_ApplicationService;
import ssm.br.vo.Non_ProgramVO;
import ssm.br.vo.Non_ApplicationVO;

@Controller
@RequestMapping("/non_Application")
public class Non_ApplicationController {
   Logger logger = Logger.getLogger(Non_ApplicationController.class);
   
   @Autowired
   private Non_ApplicationService non_ApplicationService;
   
   @RequestMapping("/non_ApplicationList")
   public String non_ApplicationList (Non_ApplicationVO navo,Model model){
      logger.info("��û�̷¸���Ʈ �̱����");
      navo.setSsNo("S7180001");//���ǰ�������S
      List list = non_ApplicationService.non_ApplicationList(navo);
      logger.info("listSize>>>"+list.size());
      if(list.size()>0){
         model.addAttribute("list",list);
      }
         
      return "br/na_StudentMain";
   }
   
   
   //����Ŭ����
   /*@RequestMapping("/non_ApplicationDetail")
   public String non_ApplicationDetail (HttpServletRequest request,Non_ApplicationVO navo,Model model){
      
      logger.info("request>>>"+request);
      logger.info("requestssno>>"+request.getParameter("ssNo"));
      logger.info("requestnpno>>"+request.getParameter("npNo"));
      List data = non_ApplicationService.non_ApplicationDeatil(navo);
      model.addAttribute("data",data);
      return "/np/non_Application";
   }*/
   @RequestMapping("/non_ApplicationDetail")
   public ResponseEntity<Object> non_ApplicationDetail(@RequestParam("ssNo") String ssNo,@RequestParam("npNo") String npNo,Model model){
      logger.info("�����۽�����");
      logger.info("ssNo>>"+ssNo);
      logger.info("spNo>>"+npNo);
      ResponseEntity<Object> entity = null;
      Non_ApplicationVO navo= new Non_ApplicationVO();
      List list = null;
      try{
         navo.setSsNo(ssNo);
         navo.setNpNo(npNo);
         logger.info("<<<<tttttt>>>"+navo.toString());
         list = non_ApplicationService.non_ApplicationDeatil(navo);
         logger.info(list.get(0).toString());
         if(list !=null && list.size()>0){
            entity = new ResponseEntity<Object>(list,HttpStatus.OK);
         }
      }catch(Exception e){
         e.printStackTrace();
      }
      logger.info("��");
      return entity;
   }
   
   @RequestMapping("/non_ApplicationInsert")
   public String non_ApplicationInsert (HttpServletRequest request,Non_ApplicationVO navo,Model model){
      int result=0;
      String resultStr="";
      logger.info("navoTtttoString>>>"+navo.toString());
      
      try{
         MultipartRequest mr = new MultipartRequest(request,
                                          "C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/file",
                                          10000*10000,
                                          "EUC-KR",
                                          new DefaultFileRenamePolicy());
         logger.info("������");
         String naNo=non_ApplicationService.chaeBun();
         logger.info("ä�������");
         if(naNo.length()==1) naNo="NA000"+naNo;
         if(naNo.length()==2) naNo="NA00"+naNo;
         if(naNo.length()==3)naNo="NA0"+naNo;
         navo.setNaNo(naNo);
         navo.setNpNo(mr.getParameter("npNo"));
         navo.setSsNo(mr.getParameter("ssNo"));
         navo.setNaContents(mr.getParameter("naContents"));
         navo.setNaFile(mr.getFilesystemName("naFile"));
         System.out.println("toString>>>"+navo.toString());
         result = non_ApplicationService.non_ApplicationInsert(navo);
         logger.info("result>>>"+result);
         if(result>0) {
            resultStr="��û���ۼ� ����";
         }else{
            resultStr="��û���ۼ� ����";
         }
      
         model.addAttribute("resultStr",resultStr);
      }catch(Exception e){
         e.printStackTrace();
      }   
      return"br/result";
      
      
   }
   @RequestMapping("/downLoad")
   public String downLoad(@ModelAttribute Non_ProgramVO npvo,HttpServletRequest hsr,Model model ){
      String npFile = hsr.getParameter("fileName");
      logger.info("npFile>>"+npFile);
      model.addAttribute("npFile",npFile);
      return "common/download";
   }
   
   @RequestMapping("/non_ApplicationDelete")
   public String non_ApplicationDelete(@ModelAttribute Non_ApplicationVO navo,Model model){
      logger.info("navoString>>>"+navo.toString());
      int result =0;
      String resultStr="";
      result=non_ApplicationService.non_ApplicationDelete(navo);
      if(result>0) resultStr="�����ϻ��� ����";
      else resultStr="�����ϻ��� ����";
      logger.info(resultStr);
      model.addAttribute("resultStr",resultStr);
      return "br/result";
   }
   @RequestMapping("/non_ApplicationUpdate")
   public String non_ApplicationUpdate (HttpServletRequest request,Non_ApplicationVO navo,Model model){
      int result=0;
      String resultStr="";

      
      try{
         MultipartRequest mr = new MultipartRequest(request,
                                          "C:/ProjectSSM/java142_Luna_SungIll/ProjectSSM/Project_SSM/WebContent/file",
                                          10000*10000,
                                          "EUC-KR",
                                          new DefaultFileRenamePolicy());
         logger.info("����������");

         logger.info("navo����>>>"+mr.getParameter("naNo"));
         logger.info("navo����>>>"+mr.getParameter("naContents"));
         navo.setNaNo(mr.getParameter("naNo"));
         navo.setNaContents(mr.getParameter("naContents"));
         if(mr.getFilesystemName("naFile")!=null&&mr.getFilesystemName("naFile")!=""){
            navo.setNaFile(mr.getFilesystemName("naFile"));   
         }
         System.out.println("toString>>>"+navo.toString());
         result = non_ApplicationService.non_ApplicationUpdate(navo);
         logger.info("result>>>"+result);
         if(result>0) {
            resultStr="��û������ ����";
         }else{
            resultStr="��û������ ����";
         }
      
         model.addAttribute("resultStr",resultStr);
      }catch(Exception e){
         e.printStackTrace();
      }   
      return"br/result";
      
   }
   
   @RequestMapping("/applicationList")
   public String applicationList(@ModelAttribute Non_ApplicationVO nvvo,Model model){
      logger.info("nvvo.toString>>>"+nvvo.toString());
      List list =non_ApplicationService.teacherApplicationList(nvvo);
      model.addAttribute("list",list);
      model.addAttribute("npNo",nvvo.getNpNo());
      return "br/na_TeacherMain";
   }
   
   @RequestMapping("/approval")
   public String approval(@ModelAttribute Non_ApplicationVO nvvo,Model model){
      logger.info("nvvo.toString>>>"+nvvo.toString());
      int result =non_ApplicationService.approval(nvvo);
      List list =non_ApplicationService.teacherApplicationList(nvvo);
      model.addAttribute("list",list);
      model.addAttribute("npNo",nvvo.getNpNo());
      logger.info("��Ʈ�ѷ������Լ��� nvvo.getNpNo()>>>"+nvvo.getNpNo());
      return "br/na_TeacherMain";
   }
   
   @RequestMapping("/approvalCancel")
   public String approvalCancel(@ModelAttribute Non_ApplicationVO nvvo,Model model){
      logger.info("nvvo.toString>>>"+nvvo.toString());
      int result = non_ApplicationService.approvalCancel(nvvo);
      List list =non_ApplicationService.teacherApplicationList(nvvo);
      model.addAttribute("list",list);
      model.addAttribute("npNo",nvvo.getNpNo());
      logger.info("��Ʈ�ѷ� ��������Լ��� nvvo.getNpNo()>>>"+nvvo.getNpNo());
      return "br/na_TeacherMain";
   }
   
}