package ssm.cg.service;

import ssm.cg.vo.Visit_CommentVO;

public interface Visit_CommentService {

		/* ����� �Է�, ����, ���� */
		public int vcInsert(Visit_CommentVO vvo);
		public int vcUpdate(Visit_CommentVO vvo);
		public int vcDelete(Visit_CommentVO vvo);
		
		/* ä�� */
		public Visit_CommentVO vcChaebun(Visit_CommentVO vvo);
}
