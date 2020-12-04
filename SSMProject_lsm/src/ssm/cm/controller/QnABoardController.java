package ssm.cm.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ssm.cm.chaebun.NoticeBoardChaebun;
import ssm.cm.chaebun.QnABoardChaebun;
import ssm.cm.service.NoticeBoardService;
import ssm.cm.service.QnABoardService;
import ssm.cm.service.SchedulNoticeService;
import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.QnABoardVO;
import ssm.cm.vo.SchedulNoticeVO;

@Controller
@RequestMapping(value="/qnaboard")
public class QnABoardController {
	

	@Autowired
	private QnABoardService qnaboardservice;
	
	//����ȸ
	@RequestMapping(value="qblist")
	public String sblist(@ModelAttribute QnABoardVO qvo, Model model ){
		
		
		int ListSize = 10; 
		
		if(qvo.getListSize()==null){
			qvo.setListSize(ListSize+"");
			qvo.setPageNo("1");
		}

		List qblist=qnaboardservice.qblist(qvo); 
		
		model.addAttribute("qblist",qblist);
		model.addAttribute("listSize",ListSize);
		model.addAttribute("Searchdata",qvo);
		return "cm/qb/qblist";
	}
	
	//���ۼ����̵�
	@RequestMapping(value="qbwirteform")
	public String qbwirteform(){
		
		return "cm/qb/qbwirteform";
	}
	
	//�� �ۼ�
	@RequestMapping(value="qbwirte")
	public String qbinsert(@ModelAttribute QnABoardVO qvo){
		
		System.out.println(qvo.getQbContents()+"<<< ������");
		String url="";
		int result=0;
			
		QnABoardVO qvo_ =qnaboardservice.qbChaebun(qvo); 
		String no =qvo_.getQbNo();
		qvo.setQbNo(QnABoardChaebun.qbchaebun(no));
		
		System.out.println("ss"+ qvo.getSsNo());
		
		result=qnaboardservice.qbInsert(qvo);
		boolean bResult = result > 0;
			
		if(bResult) url="/qnaboard/qblist.ssm";
		
		return "redirect:"+url;
	}
	
	//�� �������� �̵�
	@RequestMapping(value="/qbDetail")
	public String nbDetail(@ModelAttribute QnABoardVO qvo, Model model){
		
		QnABoardVO qbdetail = null;
		qbdetail = qnaboardservice.qbDetail(qvo);
		
		qbdetail.setQbContents(qbdetail.getQbContents().toString().replaceAll("\n","<br>"));
		
		//��ȸ�� �������� +1 �ϴ°�
		qnaboardservice.qbViews(qvo);
		
		model.addAttribute("qbdetail",qbdetail);
		return "cm/qb/qbDetail";
	}
	
	//��й�ȣ Ȯ��
	@ResponseBody
	@RequestMapping(value="/pwdConfirm")
	public String pwdConfirm(@ModelAttribute QnABoardVO qvo, HttpServletRequest request){
		
		String ssPw =request.getParameter("ssPw");
		
		int result = 0;
		result= qnaboardservice.pwdConfirm(qvo, ssPw);
		
		return result+"";
		
	}
	
	//�������� �̵�
	@RequestMapping(value="/qbupdateForm")
	public String updateForm(@ModelAttribute QnABoardVO qvo, Model model){
		
		QnABoardVO updateData =null;
		updateData= qnaboardservice.qbDetail(qvo);
		
		model.addAttribute("updateData",updateData);
		return "cm/qb/qbupdateform";
		
	}
	
	//�ۼ���
	@RequestMapping(value="qbupdate")
	public String nbupdate(@ModelAttribute QnABoardVO qvo){
		
		String url="";
		int result=qnaboardservice.qbUpdate(qvo);
		boolean bResult = result > 0;
			
		if(bResult) url="/qnaboard/qblist.ssm";
		return "redirect:"+url;
	}
	
	//�ۻ���
	@RequestMapping(value="/qbDelete")
	public String nbDelete(@ModelAttribute QnABoardVO qvo){
		String url="";
		int result = 0;
		
		result= qnaboardservice.qbDelete(qvo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/qnaboard/qblist.ssm";
		return "redirect:"+url;
	}
	
	//��й�ȣ Ȯ�� ��
	@RequestMapping(value="/qbPwcheckform")
	public String qbPwcheckform(@ModelAttribute QnABoardVO qvo,Model model){
		
		String QbNo=qvo.getQbNo();
		model.addAttribute("QbNo",QbNo);
		return "cm/qb/qbpwcheckform";
		
	}
	
	
}
