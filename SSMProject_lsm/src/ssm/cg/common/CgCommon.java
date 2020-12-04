package ssm.cg.common;

import org.apache.log4j.Logger;

public class CgCommon {
	
	public static String OABOARD_CHAEBUN = "OA";
	static Logger logger = Logger.getLogger(CgCommon.class);
	
	public static String oaChaebun(String oaNo){
		
		logger.info("(log)common.oaChaebun() start >>>");
		logger.info("(log)oaNo : " + oaNo);
		
		String no = oaNo;
		int noLen = no.length();
		
		if(noLen == 1)
			no = "000" + no;
		if(noLen == 2)
			no = "00" + no;
		if(noLen == 3)
			no = "0" + no;
		
		logger.info("(log)common.oaChaebun() end <<<");
		return OABOARD_CHAEBUN+no;
	} // oaChaebun()
	
	public static String oaFieldCode(String oaField){
		
		logger.info("(log)Common.oaFieldCode() start >>>");
		String oaField_ = oaField.toUpperCase();
		logger.info("(log)oaFeild : " + oaField_);
		String field = "";
		boolean fBool = false;
		
		// ����
		fBool = oaField_.equals("CAC");
		if(fBool) field = "����";
		logger.info("(log)oaFeild : " + field);
		// ��Ȱ
		fBool = "LIC".equals(oaField_);
		if(fBool) field = "��Ȱ";
		// ��Ȱ
		fBool = "LEC".equals(oaField_);
		if(fBool) field = "�н�";
		
		logger.info("(log)Common.oaFieldCode() start >>>");
		return field;
	}

} // OnlineApplication_BoardChaebun
