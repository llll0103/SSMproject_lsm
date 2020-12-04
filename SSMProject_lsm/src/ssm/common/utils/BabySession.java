package ssm.common.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public abstract class BabySession {

	/**
	* �������̵� ������ ������ �����̸��� ����.
	* 
	*/
	private static final String USERID  = "USERID";
	private static final String USERNO  = "USERNO";
	private static final String USERAUTHORIRY = "USERAUTHORIRY";
	/***
	* kill Session, ���ǿ� ��� ������ ��� �����.
	* 
	* @param     req       servlet request.
	* @return    servlet request�� null�̸� false�� �����ϰ�, 
	*            �ƴϸ� ���ǿ� ��� ������ ��� ����� true�� ����.
	* @exception Exception.
	*/
	public static boolean killSession(final HttpServletRequest req) 
		throws Exception
	{
		if (req == null) return false;
		
		try
		{
			HttpSession Session = req.getSession(true);
			Session.invalidate();
		}
		catch(Exception e)
		{
			throw e;
		}
		
		return true;
	}
	
	/***
	* �������̵� ������ ���ǿ� ��´�.
	* 
	* @param     ssmReq       servlet request.
	* @param     userID     �������̵�.
	* @return    servlet request�� null�̰ų�, �������̵��� ���� ������ 
	*            false�� �����ϰ�, �ƴϸ� �������̵� ������ ���ǿ� ��� true�� ����.
	* @exception Exception.
	*/
	public static boolean setSession(final HttpServletRequest req,
							         final String userID,final String userNO, final String userAuthority) 
		throws Exception
	{
		System.out.println("BabySesstion setSessiont START>>> ");
		if (req == null) return false;
		if (userID  == null || userID.trim().length() == 0) return false;
		if (userNO  == null || userNO.trim().length() == 0) return false;
		if (userAuthority == null || userAuthority.trim().length() == 0) return false;
		HttpSession session = req.getSession(true);
		
		try
		{	
			
			session.setAttribute(USERID, userID);
			session.setAttribute(USERNO, userNO);
			session.setAttribute(USERAUTHORIRY, userAuthority);
			session.setMaxInactiveInterval(60*60*10);
		}
		catch(Exception e)
		{
			throw e;
		}
		System.out.println("BabySesstion setSessiont END>>> ");
		return true;
	}
	
	/***
	* �������̵� ������ ���ǿ��� �����´�.
	* 
	* @param     hReq       servlet request.
	* @return    servlet request�� null�̸� �� ���ڿ�("")�� �����ϰ�, 
	*            �ƴϸ� ������ ������ �ִ� �������̵� ����.
	* @exception Exception.
	*/
	public static String getSessionID(final HttpServletRequest req) 
		throws Exception
	{
		if (req == null) return "";
		String strSessionID;
		
		HttpSession session = req.getSession(false);
		
		try
		{	
			strSessionID = (String)session.getAttribute(USERID);			
		}
		catch(Exception e)
		{
			throw e;
		}
		
		return strSessionID;
	}
	public static String getSessionNO(final HttpServletRequest req) 
			throws Exception
		{
			if (req == null) return "";
			String strSessionNO;
			
			HttpSession session = req.getSession(false);
			
			try
			{	
				strSessionNO = (String)session.getAttribute(USERNO);			
			}
			catch(Exception e)
			{
				throw e;
			}
			
			return strSessionNO;
		}
	public static String getSessionAU(final HttpServletRequest req) 
			throws Exception
		{
			if (req == null) return "";
			String strSessionAU;
			
			HttpSession session = req.getSession(false);
			
			try
			{	
				strSessionAU = (String)session.getAttribute(USERAUTHORIRY);			
			}
			catch(Exception e)
			{
				throw e;
			}
			
			return strSessionAU;
		}
}
