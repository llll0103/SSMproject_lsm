package ssm.cm.controller;

import java.util.List;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import ssm.cm.chaebun.SchedulNoticeChaebun;
import ssm.cm.service.SchedulNoticeService;
import ssm.cm.vo.SchedulNoticeVO;

@Controller
@RequestMapping(value="/schedulnotice")
public class SchedulNoticeController {

	@Autowired
	private SchedulNoticeService schedulnoticeservice;
	
	//�б������Խ��������̵�
	@RequestMapping(value="sncalendar")
	public String sncalendar(){
		return "cm/sn/sncalendar";
	}
	
	//����Ʈ �ҷ����°�(select)
	@ResponseBody
	@RequestMapping(value="snlistajax")
	public JSONArray snlistajax(@ModelAttribute SchedulNoticeVO svo){
		//������ xml���� ��������
		List<SchedulNoticeVO> snlist = schedulnoticeservice.snlistajax();
		
		JSONArray jArr = new JSONArray();

		//JSONArray��  list�� ��´�
		for(int i = 0; i < snlist.size(); i++){
			JSONObject jObj =  new JSONObject();
			
			jObj.put("title", snlist.get(i).getSnTitle());
			jObj.put("start", snlist.get(i).getSnStartdate());
			
			//ǮĶ���� ���� �ؼ��� ����  ���嵥��Ʈ�� 1�� ���ؼ� ���
			String end =snlist.get(i).getSnEnddate();
			String yy = end.substring(0, 4);
			String mm = end.substring(5, 7);
			int dd = Integer.parseInt(end.substring(8), 10)+1;
			String dd_ = Integer.toString(dd);
			if(dd<10){
				dd_ ="0"+dd_;
			}
			end = yy+"-"+mm+"-"+dd_;
			jObj.put("end",end);
			jObj.put("no", snlist.get(i).getSnNo());
			
			jArr.add(jObj);
		}
		
        return jArr;
	}
	
	//������ �Է�(insert)
	@RequestMapping(value="snInsert")
	public String snInsert(@ModelAttribute SchedulNoticeVO svo){
		
		String sResult ="";
		
		//ä����
		SchedulNoticeVO svo_ =schedulnoticeservice.snChaebun(); 
		String no =svo_.getSnNo();
		svo.setSnNo(SchedulNoticeChaebun.snchaebun(no));
		
		int result = schedulnoticeservice.snInsert(svo);
		
		boolean bResult = result > 0;
		
		if(bResult) sResult="/schedulnotice/sncalendar.ssm";
			
		return "redirect:"+sResult ;

	
	}
	
	//�� ����
	@RequestMapping(value="snUpdate")
	public String snUpdate(@ModelAttribute SchedulNoticeVO svo){
		String url = "";
		
		int result = schedulnoticeservice.snUpdate(svo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/schedulnotice/sncalendar.ssm";
			
		return "redirect:/schedulnotice/sncalendar.ssm" ;
	
	}
	
	//�� ����
	@RequestMapping(value="snDelete")
	public String snDelete(@ModelAttribute SchedulNoticeVO svo){
		String url = "";
		
		int result = schedulnoticeservice.snDelete(svo);
		
		boolean bResult = result > 0;
		
		if(bResult) url="/schedulnotice/sncalendar.ssm";
			
		return "redirect:/schedulnotice/sncalendar.ssm" ;

	
	}
	
}
