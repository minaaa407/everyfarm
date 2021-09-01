package kr.co.everyfarm.user;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.everyfarm.farmer.FarmerBean;

@Repository
public interface MemberDAO {

	public List<MemberBean> mlist();

	public void mjoin(MemberBean memberBean);

	public void kakaoJoin(MemberBean memberBean);

	public void naverJoin(MemberBean memberBean);

	public MemberBean mlogin(MemberBean memberBean);

	public void mail(EmailBean emailBean);

	public void mailNumber(int e_Num);

	public int checkId(String m_Id);

	public MemberBean findId(MemberBean memberBean);

	public MemberBean findPw(MemberBean memberBean);

	public void upPw(MemberBean memberBean);

	public void mUpdate(MemberBean memberbean);

	public void mDelete(MemberBean memberbean);

	public MemberBean userInfo(String userID);

	public MemberBean mInfo(MemberBean memberBean);

	public void mAddrUpdate(MemberBean memberbean);

	public void mNameUpdate(MemberBean memberbean);

	public void mPwdUp(MemberBean memberbean);
	
	public void userAdd(MemberBean memberbean);

}
