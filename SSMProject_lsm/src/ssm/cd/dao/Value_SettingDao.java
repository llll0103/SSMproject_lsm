package ssm.cd.dao;

import java.util.List;

import ssm.cd.vo.Value_SettingVO;

public interface Value_SettingDao {

	public int saveValueSetting(Value_SettingVO vsvo);

	public int makeChaebun_VS();

	public List loadValueSetting(Value_SettingVO vsvo);

	public int updateValueSetting(Value_SettingVO vsvo);

}
