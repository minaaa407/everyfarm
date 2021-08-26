package kr.co.everyfarm.admin;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminDAO {

	public void ajoin(AdminBean adminBean);

	public AdminBean alogin(AdminBean adminBean);

	public AdminBean findId(AdminBean adminBean);

	public AdminBean findPw(AdminBean adminBean);

}
