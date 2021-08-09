package kr.co.everyfarm.user;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	public List<MemberBean> mlist();

	public List<MemberBean> flist();
	
	public MemberBean mjoin(MemberBean MemberBean);
	
	public MemberBean fjoin(FarmerBean farmerVO);
	
	public MemberBean mlogin(MemberBean MemberBean);

	public MemberBean flogin(FarmerBean farmerVO);
	
	
	
	
	
	
	
	// 결제페이지 이용
	public MemberBean userInfo(String userID);

}
