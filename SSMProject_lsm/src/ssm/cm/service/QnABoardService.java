package ssm.cm.service;

import java.util.List;

import ssm.cm.vo.NoticeBoardVO;
import ssm.cm.vo.QnABoardVO;

public interface QnABoardService {
	public List<QnABoardVO> qblist(QnABoardVO qvo);
	public QnABoardVO qbChaebun(QnABoardVO qvo);
	public int qbInsert(QnABoardVO qvo);
	public QnABoardVO qbDetail(QnABoardVO qvo);
	public int pwdConfirm(QnABoardVO qvo, String ssPw);
	public int qbUpdate(QnABoardVO qvo);
	public int qbDelete(QnABoardVO qvo);
	public void qbViews(QnABoardVO qvo);
}
