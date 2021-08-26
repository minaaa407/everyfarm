package kr.co.everyfarm.admin;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.everyfarm.farmer.FarmerBean;
import kr.co.everyfarm.user.MemberBean;

@Repository
public interface AdminDAO {
	
	List<MemberBean> mlist();

	List<FarmerBean> flist();

	public void ajoin(AdminBean adminBean);

	public AdminBean alogin(AdminBean adminBean);

	public AdminBean findId(AdminBean adminBean);

	public AdminBean findPw(AdminBean adminBean);
	
	public void upPw(AdminBean adminBean);

}
