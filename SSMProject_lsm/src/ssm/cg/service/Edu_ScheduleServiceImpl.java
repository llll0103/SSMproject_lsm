package ssm.cg.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.cg.dao.Edu_ScheduleDAO;
import ssm.cg.vo.Edu_ScheduleVO;
import ssm.cg.vo.VisitCounsel_EduRsvVO;

@Service
@Transactional
public class Edu_ScheduleServiceImpl implements Edu_ScheduleService {

	
	Logger logger = Logger.getLogger(Edu_ScheduleService.class);
	
	@Autowired
	private Edu_ScheduleDAO edu_ScheduleDAO;
	
	/* ���� �ð�ǥ ��ȸ, ���� */
	@Override
	public List<Edu_ScheduleVO> eduScheduleList(Edu_ScheduleVO esvo) {
		
		logger.info("(log)Service.eduScheduleList() start >>>");
		
		List<Edu_ScheduleVO> timeList = edu_ScheduleDAO.eduScheduleList(esvo);
		
		logger.info("(log)timeList : " + timeList);
		
		logger.info("(log)Service.eduScheduleList() end <<<");
		
		return timeList;
	}

	@Override
	public int esUpdate(Edu_ScheduleVO esvo) {
		
		logger.info("(log)Service.esUpdate() start >>>");
		
		int result = edu_ScheduleDAO.esUpdate(esvo);
		
		logger.info("(log)Service.esUpdate() end <<<");
		
		return result;
	}
	
	// ��� �Ұ��� ���� �� �ð�ǥ �������� ����
	@Override
	public int esRollback(Edu_ScheduleVO esvo) {
		
		logger.info("(log)Service.esRollback() start >>>");
		logger.info(">>> : "+esvo);
		int result = edu_ScheduleDAO.esRollback(esvo);
		logger.info("<<< : "+result);
		logger.info("(log)Service.esRollback() end <<<");
		
		return result;
	}

	
	/* �л� ���� ���� ��ü/ �� ��ȸ, ���/ ���� ������� ���� */
	@Override
	public List<VisitCounsel_EduRsvVO> eduRsvList(VisitCounsel_EduRsvVO vcvo) {
		
		logger.info("(log)Service.eduRsvList() start >>>");
		
		logger.info("(log)startRow : " + vcvo.getStartRow());
		logger.info("(log)endRow : " + vcvo.getEndRow());
		
		List<VisitCounsel_EduRsvVO> eduRsv = edu_ScheduleDAO.eduRsvList(vcvo);
		
		logger.info("(log)Service.eduRsvList() end <<<");
		return eduRsv;
	}

	@Override
	public Edu_ScheduleVO eduRsvDetail(Edu_ScheduleVO esvo) {
		
		logger.info("(log)Service.eduRsvDetail() start >>>");
		
		Edu_ScheduleVO resultVO = edu_ScheduleDAO.eduRsvDetail(esvo);
		
		logger.info("(log)Service.eduRsvDetail() end <<<");
		
		return resultVO;
	}

	@Override
	public int vrStatusUpdate(Edu_ScheduleVO esvo) {
		logger.info("(log)Service.vrStatusUpdate() start >>>");
		
		int result = edu_ScheduleDAO.vrStatusUpdate(esvo);
		
		logger.info("(log)Service.vrStatusUpdate() end <<<");
		
		return result;
	}

	@Override
	public int listCnt(VisitCounsel_EduRsvVO vcvo) {
		
		logger.info("(log)Service.listCnt() start >>>");
		
		int result = edu_ScheduleDAO.listCnt(vcvo);
		
		logger.info("(log)Service.listCnt() end <<<");
		
		return result;
	}

} // Edu_ScheduleServiceImpl
