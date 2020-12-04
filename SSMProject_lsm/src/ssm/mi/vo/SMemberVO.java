package ssm.mi.vo;

import ssm.cd.vo.BasicinpormationVO;
import ssm.cd.vo.CdvalueVO;
import ssm.cd.vo.ValuesettingVO;
import ssm.common.vo.CommonVO;

public class SMemberVO extends CommonVO {

   private String ssNo;          // �й�
   private String ssName;        // �̸�
   private String ssGrade;       // �г�
   private String ssBirth;       // �������(�ֹι�ȣ)
   private String ssBirth2;      // �������(�ֹι�ȣ)
   private String ssGender;      // ����
   private String ssAuthority;   // ����
   private String ssId;          // ID
   private String ssPw;          // PW
   private String ssPw2;         // PW
   private String ssPn;          // �޴�����ȣ
   private String ssEmail;       // �̸����ּ�
   private String ssPostno;      // �����ȣ
   private String ssAddress;     // �ּ�
   private String ssImage;       // ����
   private String ssDeleteYN;    // ��������
   private String ssInsertdate;  // �ۼ���
   private String ssUpdatedate;  // ������S
   
   private String ssClass;
   private String ssNum;
   
   private FmmemberVO fmMembervo;
   private BasicinpormationVO basicInpormationvo;
   private ValuesettingVO valueSettingvo;
   private CdvalueVO cdvaluevo;
   
   
   
   public String getSsClass() {
      return ssClass;
   }
   public void setSsClass(String ssClass) {
      this.ssClass = ssClass;
   }
   public String getSsNum() {
      return ssNum;
   }
   public void setSsNum(String ssNum) {
      this.ssNum = ssNum;
   }
   public String getSsNo() {
      return ssNo;
   }
   public void setSsNo(String ssNo) {
      this.ssNo = ssNo;
   }
   public String getSsName() {
      return ssName;
   }
   public void setSsName(String ssName) {
      this.ssName = ssName;
   }
   public String getSsGrade() {
      return ssGrade;
   }
   public void setSsGrade(String ssGrade) {
      this.ssGrade = ssGrade;
   }
   public String getSsBirth() {
      return ssBirth;
   }
   public void setSsBirth(String ssBirth) {
      this.ssBirth = ssBirth;
   }
   public String getSsBirth2() {
      return ssBirth2;
   }
   public void setSsBirth2(String ssBirth2) {
      this.ssBirth2 = ssBirth2;
   }
   public String getSsGender() {
      return ssGender;
   }
   public void setSsGender(String ssGender) {
      this.ssGender = ssGender;
   }
   public String getSsAuthority() {
      return ssAuthority;
   }
   public void setSsAuthority(String ssAuthority) {
      this.ssAuthority = ssAuthority;
   }
   public String getSsId() {
      return ssId;
   }
   public void setSsId(String ssId) {
      this.ssId = ssId;
   }
   public String getSsPw() {
      return ssPw;
   }
   public void setSsPw(String ssPw) {
      this.ssPw = ssPw;
   }
   public String getSsPw2() {
      return ssPw2;
   }
   public void setSsPw2(String ssPw2) {
      this.ssPw2 = ssPw2;
   }
   public String getSsPn() {
      return ssPn;
   }
   public void setSsPn(String ssPn) {
      this.ssPn = ssPn;
   }
   public String getSsEmail() {
      return ssEmail;
   }
   public void setSsEmail(String ssEmail) {
      this.ssEmail = ssEmail;
   }
   public String getSsPostno() {
      return ssPostno;
   }
   public void setSsPostno(String ssPostno) {
      this.ssPostno = ssPostno;
   }
   public String getSsAddress() {
      return ssAddress;
   }
   public void setSsAddress(String ssAddress) {
      this.ssAddress = ssAddress;
   }
   public String getSsImage() {
      return ssImage;
   }
   public void setSsImage(String ssImage) {
      this.ssImage = ssImage;
   }
   public String getSsDeleteYN() {
      return ssDeleteYN;
   }
   public void setSsDeleteYN(String ssDeleteYN) {
      this.ssDeleteYN = ssDeleteYN;
   }
   public String getSsInsertdate() {
      return ssInsertdate;
   }
   public void setSsInsertdate(String ssInsertdate) {
      this.ssInsertdate = ssInsertdate;
   }
   public String getSsUpdatedate() {
      return ssUpdatedate;
   }
   public void setSsUpdatedate(String ssUpdatedate) {
      this.ssUpdatedate = ssUpdatedate;
   }
   public FmmemberVO getFmMembervo() {
      return fmMembervo;
   }
   public void setFmMembervo(FmmemberVO fmMembervo) {
      this.fmMembervo = fmMembervo;
   }
   public BasicinpormationVO getBasicInpormationvo() {
      return basicInpormationvo;
   }
   public void setBasicInpormationvo(BasicinpormationVO basicInpormationvo) {
      this.basicInpormationvo = basicInpormationvo;
   }
   public ValuesettingVO getValueSettingvo() {
      return valueSettingvo;
   }
   public void setValueSettingvo(ValuesettingVO valueSettingvo) {
      this.valueSettingvo = valueSettingvo;
   }
   public CdvalueVO getCdvaluevo() {
      return cdvaluevo;
   }
   public void setCdvaluevo(CdvalueVO cdvaluevo) {
      this.cdvaluevo = cdvaluevo;
   }
   
   
}