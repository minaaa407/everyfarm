package kr.co.everyfarm.user;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {
	
	public List<MemberBean> mlist();

	public void mjoin(MemberBean memberBean);

	public void kakaoJoin(MemberBean memberBean);
	
	public MemberBean mlogin(MemberBean memberBean);

	public MemberBean klogin(MemberBean memberBean);
	
	public void mail(MemberBean memberBean);
	
	public int checkId(MemberBean memberBean);
	
	public MemberBean findId(MemberBean memberBean);

	public MemberBean findPw(MemberBean memberBean);
	
	public void upPw(MemberBean memberBean);
	
	public void mUpdate(MemberBean memberbean);
	
	public void mDelete(MemberBean memberbean); 
	
	public MemberBean userInfo(String userID);

	public MemberBean mInfo(MemberBean memberBean);
	
}
