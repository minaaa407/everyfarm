package kr.co.everyfarm.product;

import java.util.List;

public interface ProductDao {
	
	
	public int listcount();
	public ProductBean info(int ProductBeanno);
	public ProductBean onelist(int p_No);
	public int insert(ProductBean ProductBean);
	public int update(ProductBean ProductBean);
	public int delete(int ProductBeanno);

	
	
	public ProductBean productinfo(String p_No);
}
