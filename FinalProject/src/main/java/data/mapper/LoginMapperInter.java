package data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapperInter {
	public int login(Map<String, String> map);
	public List<Map<String, Object>> getLoginInfo(String userid);
	public int checkKakaoMember(String userid);
	public int checkId(Map<String, String>map);
	public String findId(Map<String, String>map);
	public int checkPassword(Map<String, String> map);
	public void changePassword(Map<String, String> map);
}
