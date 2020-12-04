package ssm.cg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cg.vo.OnlineApplication_BoardVO;


public interface OnlineApplication_BoardDAO {
	
	/* ��ü��ȸ, �󼼺��� */
	public List<OnlineApplication_BoardVO> oaBoardList(OnlineApplication_BoardVO oaVo);
	public OnlineApplication_BoardVO oaBoardDetail(OnlineApplication_BoardVO oaVo);
	
	/* �Է�, ����, ���� */
	public int oaBoardInsert(OnlineApplication_BoardVO oaVo);
	public int oaBoardUpdate(OnlineApplication_BoardVO oaVo);	
	public int oaBoardDelete(OnlineApplication_BoardVO oaVo);

	/* ä�� */
	public OnlineApplication_BoardVO oaChaebun(String oaNo);
	
	/* ����¡ */
	public int oaBoardListCnt(OnlineApplication_BoardVO oaVo);
	
	/* ��� */
//	public int pollPush(String ssNo);
	
	//����-�л���ȸ(�¶��λ��)
	public List<OnlineApplication_BoardVO> oaListCLT(OnlineApplication_BoardVO oaVo);
	//����-�亯��� �� ��ȸ(�¶��λ��)
	public List<OnlineApplication_BoardVO> ssOaList(OnlineApplication_BoardVO oaVo);
	
}