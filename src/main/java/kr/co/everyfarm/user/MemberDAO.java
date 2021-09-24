package kr.co.everyfarm.user;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	public List<MemberBean> mlist();

	public void mjoin(MemberBean memberBean);

	public void kakaoJoin(MemberBean memberBean);

	public void naverJoin(MemberBean memberBean);

	public MemberBean mlogin(MemberBean memberBean);

	public MemberBean slogin(String m_Id);

	public void mail(EmailBean emailBean);

	public void mailNumber(EmailBean emailBean);

	public int checkId(String m_Id);

	public MemberBean findId(MemberBean memberBean);

	public MemberBean findPw(MemberBean memberBean);

	public void upPw(MemberBean memberBean);

	public void mUpdate(MemberBean memberbean);

	public void mDelete(MemberBean memberbean);

	public void uDelete(List<String> delete);

	public MemberBean userInfo(String userID);

	public MemberBean mInfo(MemberBean memberBean);

	public void mAddrUpdate(MemberBean memberbean);

	public void mNameUpdate(MemberBean memberbean);

	public void mPwdUp(MemberBean memberbean);
	
	public void mTelUp(MemberBean memberBean);
	
	public void userAdd(MemberBean memberbean);
	
}
