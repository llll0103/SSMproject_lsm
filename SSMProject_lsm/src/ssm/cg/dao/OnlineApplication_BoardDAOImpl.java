package ssm.cg.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.cg.vo.OnlineApplication_BoardVO;

@Repository
public class OnlineApplication_BoardDAOImpl implements OnlineApplication_BoardDAO {

	Logger logger = Logger.getLogger(OnlineApplication_BoardDAO.class);
	@Autowired
	private SqlSession session;
	
	/* ��ü��ȸ, ����ȸ */
	@Override
	public List<OnlineApplication_BoardVO> oaBoardList(OnlineApplication_BoardVO oaVo) {
		
		logger.info("(log)DAO.oaBoardList() start >>>");
		logger.info("(log)DAO.oaBoardList() end <<<");
		return session.selectList("oaBoardList");
	}
	
	@Override
	public OnlineApplication_BoardVO oaBoardDetail(OnlineApplication_BoardVO oaVo) {
		
		return (OnlineApplication_BoardVO) session.selectList("oaBoardDetail");
	} 


	/* �Է�, ����, ���� */

	@Override
	public int oaBoardInsert(OnlineApplication_BoardVO oaVo) {
		
		return session.insert("oaBoardInsert");
	}
	
	@Override
	public int oaBoardUpdate(OnlineApplication_BoardVO oaVo) {
		
		return session.update("oaBoardUpdate");
	}
	
	@Override
	public int oaBoardDelete(OnlineApplication_BoardVO oaVo) {
		
		return session.delete("oaBoardDelete");
	}
	
	/* ä�� */
	@Override
	public OnlineApplication_BoardVO oaChaebun(String oaNo) {
		
		return session.selectOne("oaChaebun");
	}

	/* �Խù� ���� ��ȸ */
	@Override
	public int oaBoardListCnt(OnlineApplication_BoardVO oaVo) {
		
		return (Integer)session.selectOne("oaBoardListCnt");
	}

	/**********************************************************
	// ��� ���� ��ȸ 
	@Override
	public int pollPush(String oaVo) {
		
		return (Integer)session.selectOne("pollPush");
	}
	*/

	//����-�л���ȸ(�¶��λ��)
	@Override
	public List<OnlineApplication_BoardVO> oaListCLT(OnlineApplication_BoardVO oaVo) {
		
		return session.selectList("oaListCLT");
	}
	//����-�亯��� �� ��ȸ(�¶��λ��)
	@Override
	public List<OnlineApplication_BoardVO> ssOaList(OnlineApplication_BoardVO oaVo) {
		
		return session.selectList("ssOaList");
	}

}
