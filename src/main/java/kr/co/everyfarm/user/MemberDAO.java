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

	public MemberBean klogin(MemberBean memberBean);
	
	public void mail(EmailBean emailBean);

	public void mailNumber(int mailNum);
	
	public int checkId(String m_Id);
	
	public MemberBean findId(MemberBean memberBean);

	public MemberBean findPw(MemberBean memberBean);
	
	public void upPw(MemberBean memberBean);
	
	public void mUpdate(MemberBean memberbean);
	
	public void mDelete(MemberBean memberbean); 
	
	public MemberBean userInfo(String userID);

	public MemberBean mInfo(MemberBean memberBean);
	
}
