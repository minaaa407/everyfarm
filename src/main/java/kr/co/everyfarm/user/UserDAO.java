package kr.co.everyfarm.user;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO {
	
	public List<MemberBean> mlist();

	public List<FarmerBean> flist();
	
	public void mjoin(MemberBean memberBean);
	
	public void fjoin(FarmerBean farmerBean);
	
	public MemberBean mlogin(MemberBean memberBean);

	public FarmerBean flogin(FarmerBean farmerBean);
	
	public void mail(MemberBean memberBean);
	
	public int checkId(MemberBean memberBean);
	
	public MemberBean findId(MemberBean memberBean);

	public MemberBean findPw(MemberBean memberBean);
	
	public void upPw(MemberBean memberBean);
	
	public void mUpdate(MemberBean memberbean);
	
	public void mDelete(MemberBean memberbean);
	
}
