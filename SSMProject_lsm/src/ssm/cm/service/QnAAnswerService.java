package ssm.cm.service;

import java.util.List;

import ssm.cm.vo.QnAAnswerVO;

public interface QnAAnswerService {

	public List<QnAAnswerVO> qaList(String qbNo);
	public int qaInsert(QnAAnswerVO qvo);
	public QnAAnswerVO qaChaebun();
	public int qaUpdate(QnAAnswerVO qvo);
	public int qaDelete(String qaNo);
	
}
