package ssm.cg.service;

import java.util.List;

import ssm.cg.vo.Edu_ScheduleVO;
import ssm.cg.vo.VisitCounsel_EduRsvVO;


public interface Edu_ScheduleService {

	/* ���� �ð�ǥ ��ȸ, ���� */
	public List<Edu_ScheduleVO> eduScheduleList(Edu_ScheduleVO esvo);
	public int esUpdate(Edu_ScheduleVO esvo);
	public int esRollback(Edu_ScheduleVO esvo);
	
	/* �л� ���� ���� ��ü/ �� ��ȸ, ���/ ���� ������� ���� */
	public List<VisitCounsel_EduRsvVO> eduRsvList(VisitCounsel_EduRsvVO vcvo);
	public Edu_ScheduleVO eduRsvDetail(Edu_ScheduleVO esvo);
	public int vrStatusUpdate(Edu_ScheduleVO esvo);
	
	public int listCnt(VisitCounsel_EduRsvVO vcvo);
	
} // Edu_ScheduleService