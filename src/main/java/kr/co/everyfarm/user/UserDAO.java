package kr.co.everyfarm.user;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	public List<MemberBean> mlist();

	public List<MemberBean> flist();
	
	public MemberBean mjoin(MemberBean memberBean);
	
	public MemberBean fjoin(FarmerBean farmerBean);
	
	public MemberBean mlogin(MemberBean memberBean);

	public MemberBean flogin(FarmerBean farmerBean);
	
	
	
	
	
	
	
	// 결제페이지 이용
	public MemberBean userInfo(String userID);

}
